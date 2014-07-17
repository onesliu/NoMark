//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DbUnit.h"
#include "CommonUnit.h"
#include "base_64.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Td *d;
//---------------------------------------------------------------------------
double MinProfitPercent = 0.9;
AnsiString sPrintLogo, sPrintTail; 
TReduce oReduce;
int TestMode = 0;
//---------------------------------------------------------------------------
__fastcall Td::Td(TComponent* Owner)
    : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Td::DataModuleCreate(TObject *Sender)
{
    AnsiString CurDir = ExtractFilePath(Application->ExeName);

    db->Connected = false;
    if ( TestMode <= 0 )
        db->DatabaseName = "127.0.0.1:" + CurDir + "GOODS.GDB";
    else
    {
        CopyFile( "GOODS.GDB", "TESTGOODS.GDB", FALSE );
        db->DatabaseName = "127.0.0.1:" + CurDir + "TESTGOODS.GDB";
    }

    db->Connected = true;

    if ( d->db->Connected == false ) return;
    q->SQL->Text = "select val from t_const";
    q->Open();
    if ( q->RecordCount > 0 )
    {
        q->First();
        MinProfitPercent = 1 - q->FieldByName("val")->AsFloat;

        q->Next();
        sPrintLogo = q->FieldByName("val")->AsString;

        q->Next();
        sPrintTail = q->FieldByName("val")->AsString;
    }
    q->Close();

    if ( ViewExists("V_SELL_LIST") == false )
    {
        q->SQL->Text = "create view V_SELL_LIST(years,months,totalcost,totalprice,totalprofit) as \
        select extract(year from orderdate)as y, extract(month from orderdate) as m, \
        sum(totalcost) as tc, sum(totalprice) as tp, sum(totalprofit) as tf from t_order_list group by orderdate";
        q->ExecSQL();
    }

    ds_incoming->Prepare();
    ds_incoming->Open();
}
//---------------------------------------------------------------------------

void __fastcall Td::DataModuleDestroy(TObject *Sender)
{
    db->Connected = false;    
}
//---------------------------------------------------------------------------

bool CalcDayTotal( int orderlist )
{
    AnsiString sql1;
    double totalcash = 0.0;
    double totalsell = 0.0;
    double totalcost = 0.0;
    double totalprofit = 0.0;
    double totalincome = 0.0;
    double totalexpenses = 0.0;
    int totalsellnum = 0;
    int totalcancelnum = 0;

    if ( orderlist == 0 ) return false;

    try {
        /*  销售统计：
            1. 当天库现计算：昨日库现余额＋当天所有销售物品售价和－当天所有退货物品售价和＋当天所有收入和－当天所有支出和－银行存款
            2. 当天成本和计算：当天所有销售物品成本和－当天所有被退物品成本和
            3. 当天销售额计算：当天所有销售物品售价和－当天所有被退物品售价和
            4. 当天利润和计算：当天销售额－当天成本和
            5. 当天销售量计算：当天所有销售物品量－当天所有退货量
        */

        double d_sell, d_cancel;
        int d_sell_num = 0;

        d_sell = d_cancel = 0.0;

        sql1.sprintf( "select sum(cost) as tie, inout from t_inout_items where orderlistidx=%d group by inout", orderlist );
        q->SQL->Text = sql1;
        q->Prepare();
        q->Open();
        for ( q->First(); !q->Eof; q->Next() )
        {
            if ( q->FieldByName("inout")->AsInteger == 0 )
                totalincome = q->FieldByName("tie")->AsFloat;
            else
                totalexpenses = q->FieldByName("tie")->AsFloat;
        }
        q->Close();

        // 1. 当天库现计算：昨日库现余额＋当天所有销售物品售价和－当天所有退货物品售价和＋当天所有收入和－当天所有支出和－银行存款
        sql1.sprintf( "select sum(price) as ts, count(idx) as tsn from t_order_goods where orderlistidx=%d", orderlist );
        q->SQL->Text = sql1;
        q->Prepare();
        q->Open();
        if ( q->RecordCount > 0 )
        {
            d_sell = q->FieldByName("ts")->AsFloat;
            d_sell_num = q->FieldByName("tsn")->AsInteger;
        }
        q->Close();

        sql1.sprintf( "select sum(price) as ts from t_order_goods where canceldate=( \
        select orderdate from t_order_list where idx=%d)", orderlist );
        q->SQL->Text = sql1;
        q->Prepare();
        q->Open();
        if ( q->RecordCount > 0 )
            d_cancel = q->FieldByName("ts")->AsFloat;
        q->Close();

        totalcash = d_sell - d_cancel + totalincome - totalexpenses;

        // 2. 当天成本和计算：当天所有销售物品成本和－当天所有被退物品成本和
        // 3. 当天销售额计算：当天所有销售物品售价和－当天所有被退物品售价和
        sql1.sprintf( "select sum(cost) as tc, sum(price) as ts, count(idx) as tcn from t_order_goods \
        where orderlistidx=%d and canceldate is null", orderlist );
        q->SQL->Text = sql1;
        q->Prepare();
        q->Open();
        if ( q->RecordCount > 0 )
        {
            totalcost = q->FieldByName("tc")->AsFloat;
            totalsell = q->FieldByName("ts")->AsFloat;
            totalcancelnum = q->FieldByName("tcn")->AsInteger;
        }
        q->Close();

        // 4. 当天利润和计算：当天销售额－当天成本和
        totalprofit = totalsell - totalcost;
        
        // 5. 当天销售量计算：当天所有销售物品量－当天所有退货量
        sql1.sprintf( "select count(idx) as tcn from t_order_goods \
        where orderlistidx=%d and canceldate is not null", orderlist );
        q->SQL->Text = sql1;
        q->Prepare();
        q->Open();
        if ( q->RecordCount > 0 )
            totalcancelnum = q->FieldByName("tcn")->AsInteger;
        q->Close();

        totalsellnum = d_sell_num - totalcancelnum;

        // 更新到销售列表
        sql1.sprintf( "update t_order_list set totalcash=totalchange+%f-banksave, totalcost=%f, \
        totalprice=%f, totalprofit=%f, totalsellnum=%d, totalcancelnum=%d, totalincome=%f, \
        totalexpenses=%f where idx=%d",
        totalcash, totalcost, totalsell, totalprofit, totalsellnum, totalcancelnum, totalincome,
        totalexpenses, orderlist );
        ExecSQL( sql1 );

    } catch(...) {
        return false;
    }

    return true;
}
//---------------------------------------------------------------------------

bool StorageUpdate( int goodidx, int count )
{
    try {
        q2->SQL->Text = AnsiString().sprintf("update t_goods set storagenumber=storagenumber+(%d) \
        where idx=%d", count, goodidx );
        q2->Prepare();
        q2->ExecSQL();
    } catch (...) {
        return false;
    }

    return true;
}
//---------------------------------------------------------------------------
/*
void InitBarCodeSet()
{
    memset( BarCodeSet, 0, sizeof(BarCodeSet) );

    try {
        老版本1.0的处理方法：可重用已经作废的条码编号
        d->q2->SQL->Text = "select distinct(barcode) from t_goods";
        d->q2->Prepare();
        d->q2->Open();
        for( d->q2->First(); !d->q2->Eof; d->q2->Next() )
        {
            BarCodeSet[d->q2->FieldByName("barcode")->AsInteger] = true;
        }
        d->q2->Close();


        // 1.1版本的处理方法，从最大的可用编号开始，作废编号无法再用
        int maxbar = 0;
        d->q2->SQL->Text = "select max(barcode) as maxbar from t_goods where barcode like '2%' or barcode like '0%'";
        d->q2->Prepare();
        d->q2->Open();
        d->q2->First();
        if ( !d->q2->Eof )
        {
            maxbar = d->q2->FieldByName("maxbar")->AsString.SubString(3, 6).ToInt();
        }
        d->q2->Close();

        for ( int i = 0; i <= maxbar; i++ )
            BarCodeSet[i] = true;

    } catch (...) {
    }
} */
//---------------------------------------------------------------------------

void TReduce::ReduceUp()
{
    reduce += 0.5;
    if ( reduce >= 10 ) {
        reduce = 10;
        reduce_label = "不打";
    }
    else {
        reduce_label = AnsiString().sprintf( "%.1f", reduce );
    }

    reduce_value = MoneyStr(RoundToInt(label_price * reduce / 10));
}
//---------------------------------------------------------------------------

void TReduce::ReduceDown()
{
    if ( lowest_price <= 0 ) lowest_price = cost / MinProfitPercent;
    double lowest_reduce = lowest_price / label_price * 10;

    reduce -= 0.5;
    if ( reduce < lowest_reduce )
            reduce += 0.5;
    if ( reduce == 10 ) {
        reduce_label = "不打";
    }
    else
    {
        reduce_label = AnsiString().sprintf( "%.1f", reduce );
    }

    reduce_value = MoneyStr(RoundToInt(label_price * reduce / 10));
}
//---------------------------------------------------------------------------

AnsiString MakePassword( const AnsiString & pwd )
{
    return pwd;
}
/*
{
    char sz_pwd[256], sz_pwd2[256];

    if ( pwd == "" ) return "";

    int len = pwd.Length();
    int len2;
    memset(sz_pwd, 0, sizeof(sz_pwd));
    memset(sz_pwd2, 0, sizeof(sz_pwd2));

    for ( int i = 0; i < len; i++ )
    {
        sz_pwd[i] = pwd.c_str()[i] ^ 0xFF;
    }

    len2 = sizeof(sz_pwd2);
    if ( base64_encode(sz_pwd, len, sz_pwd2, (unsigned long*)&len2) != 0 ) return "";
    sz_pwd2[len2] = 0;

    return AnsiString(sz_pwd2);
}
*/
//---------------------------------------------------------------------------

AnsiString GetPassword( const AnsiString & pwd )
{
    char sz_pwd[256];

    if ( pwd == "" ) return "";

    int len;
    memset(sz_pwd, 0, sizeof(sz_pwd));

    if ( base64_decode(pwd.c_str(), pwd.Length(), sz_pwd, (unsigned long*)&len) != 0 ) return "";
    sz_pwd[len] = 0;

    for ( int i = 0; i < len; i++ )
    {
        sz_pwd[i] = sz_pwd[i] ^ 0xFF;
    }

    return AnsiString(sz_pwd);
}
//---------------------------------------------------------------------------

AnsiString BarCode_UPC_E( const AnsiString &code )
{
    AnsiString ret = "";
    
    if ( code.Length() == 6 )
        ret = code;
    if ( code.Length() == 8 )
        ret = code.SubString(2, 6);
    if ( code.Length() == 13 )
    {
        ret = code.SubString(1,12);

        // 逸都加2修正
        if ( ret[1] == '2' && ret[5] == '2' )
            ret = "000" + ret.SubString(6, 3);
    }
    if ( code.Length() == 12 )
    {
        ret = code;

        // 逸都加2修正
        if ( ret[1] == '2' && ret[5] == '2' )
            ret = "000" + ret.SubString(6, 3);
    }

    return ret;
}
//---------------------------------------------------------------------------

void ExecSQL( AnsiString sql )
{
    //ReplaceStr( sql, "'", "''" );
    q->SQL->Text = sql;
    q->Prepare();
    q->ExecSQL();
}
//---------------------------------------------------------------------------

TControl * __fastcall _FindControl( TControl* pControl, AnsiString classname )
{
    for ( pControl = pControl->Parent; pControl != NULL; pControl = pControl->Parent )
    {
        if ( AnsiString(pControl->ClassName()) == classname )
        {
            return pControl;
        }
    }

    return NULL;
}
//---------------------------------------------------------------------------

void Td::FreshAuditGood( AnsiString name )
{
    AnsiString s;

    AuditGoodSet->DisableControls();
    AuditGoodSet->Active = false;
    if ( name != "" )
        s.sprintf( "select * from t_audit_goods where Name1='%s' order by audittime desc", name );
    else
        s = "select * from t_audit_goods order by audittime desc";
    AuditGoodSet->SQL->Text = s;
    AuditGoodSet->Active = true;
    AuditGoodSet->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall Td::CheckGoodSetCalcFields(TDataSet *DataSet)
{
    if ( CheckGoodSetDIFFERENCE->AsInteger >= 0 )
        CheckGoodSetDIFF->AsString = "少" + IntToStr(CheckGoodSetDIFFERENCE->AsInteger);
    else
        CheckGoodSetDIFF->AsString = "多" + IntToStr(-CheckGoodSetDIFFERENCE->AsInteger);
}
//---------------------------------------------------------------------------

bool Td::ViewExists( AnsiString name )
{
    bool ret;

    q->Close();
    q->SQL->Text = "select count(*) as cnt from RDB$VIEW_RELATIONS where RDB$VIEW_NAME = :name";
    q->ParamByName("name")->Value = name.UpperCase();
    q->Open();
    if (q->FieldByName("cnt")->AsInteger > 0)
        ret = true;
    else
        ret = false;
    q->Close();

    return ret;
}
//---------------------------------------------------------------------------

void __fastcall Td::FreshGoodList(AnsiString sql)
{
    if ( sql == "" ) return;

    sql += " order by storagenumber desc,name";

    ds_goods->DisableControls();
    ds_goods->Close();
    ds_goods->SelectSQL->Text = sql;
    ds_goods->Prepare();
    ds_goods->Open();
    ds_goods->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall Td::SellSetCalcFields(TDataSet *DataSet)
{
    if (SellSetTOTALPRICE->AsFloat == 0)
        SellSetRate->AsString = "0%";
    else
        SellSetRate->AsString = MoneyStr(SellSetTOTALPROFIT->AsFloat / SellSetTOTALPRICE->AsFloat * 100) + "%";
}
//---------------------------------------------------------------------------

void __fastcall Td::SellGoodSetCalcFields(TDataSet *DataSet)
{
    if (SellGoodSetPRICE->AsFloat == 0)
        SellGoodSetRATE->AsString = "0%";
    else
        SellGoodSetRATE->AsString = MoneyStr(SellGoodSetPROFIT->AsFloat / SellGoodSetPRICE->AsFloat * 100) + "%";
}
//---------------------------------------------------------------------------

void __fastcall Td::CashSetCalcFields(TDataSet *DataSet)
{
    CashSetTYPE->AsString = (CashSetINOUT->AsInteger==0)?"收入":"支出";    
}
//---------------------------------------------------------------------------

void __fastcall Td::IncomingGoodSetCalcFields(TDataSet *DataSet)
{
    if (IncomingGoodSetATTRIBUTE->AsInteger == 0)
        IncomingGoodSetATTRIB->AsString = "计件商品";
    else
        IncomingGoodSetATTRIB->AsString = "计重商品";
}
//---------------------------------------------------------------------------

