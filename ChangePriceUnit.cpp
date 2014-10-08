//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChangePriceUnit.h"
#include "DbUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "GenerateListNo.h"
#include "qyycy.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChangePriceForm *ChangePriceForm;
//---------------------------------------------------------------------------
__fastcall TChangePriceForm::TChangePriceForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChangePriceForm::FormShow(TObject *Sender)
{
    ChangeGrid->DataSource->DataSet->DisableControls();
    ChangeGrid->DataSource->DataSet->Close();
    ChangeGrid->DataSource->DataSet->Open();
    ChangeGrid->DataSource->DataSet->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TChangePriceForm::CancelClick(TObject *Sender)
{
    if ( ShowYesNo("真的不保存该调价单吗？") == true ) {
        ModalResult = mrCancel;
    }
}
//---------------------------------------------------------------------------

bool __fastcall TChangePriceForm::NewChangePrice()
{
    AnsiString sTmp1, sTmp2;
    GenerateListNo gln;

    TDateTime today = Now();
    ListDate->Caption = today.FormatString( "yyyy-mm-dd" );
    ListName->Text = ListDate->Caption + " 调价单";
    ListDesp->Text = ListName->Text;

    //删除tmp_changeprice_goods表中的所有记录
    q->Close();
    q->SQL->Text = "delete from tmp_changeprice_goods";
    q->ExecSQL();

    //插入新的调价单
    listId = gln.GetMaxListNo(CHANGEPRICE_LIST) + 1;
    sTmp1.sprintf("insert into t_changeprice_list(idx, name, desp) values(%d, '%s', 'desp')", listId, ListName->Text);
    q->SQL->Text = sTmp1;
    q->ExecSQL();

#if 0
    q->SQL->Text = "select max(idx) as mid from t_changeprice_list";
    q->Open();
    listId = q->FieldByName("mid")->AsInteger;
    q->Close();
#endif
    q->SQL->Text = "insert into tmp_changeprice_goods(idx,barcode,name,goodidx,listidx,oldprice) select idx,barcode,name,idx,:listidx,labelprice from t_goods;";
    q->ParamByName("listidx")->AsInteger = listId;
    q->ExecSQL();

    if (ShowModal() == mrOk)
        return true;
    return false;
}
//---------------------------------------------------------------------------

void __fastcall TChangePriceForm::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    int goods_count;
    AnsiString sql;
    
    if ( ModalResult != mrOk ) // 不保存新的调价单
    {
        // 删除新的调价单
        q->SQL->Text = "delete from t_changeprice_list where idx=:listidx";
        q->ParamByName("listidx")->AsInteger = listId;
        q->ExecSQL();

        q->SQL->Text = "delete from t_changeprice_goods where listidx=:listidx";
        q->ParamByName("listidx")->AsInteger = listId;
        q->ExecSQL();
    }
    else
    {
        q->SQL->Text = "insert into t_changeprice_goods(goodidx,listidx,oldprice,newprice) \
            select goodidx,listidx,oldprice,newprice from tmp_changeprice_goods \
            where newprice is not null";
        q->ExecSQL();

        q->Close();
        q->SQL->Text = "SELECT COUNT(*) AS RES FROM t_changeprice_goods";
        q->Open();
        goods_count = q->FieldByName("RES")->AsInteger;

        sql.sprintf("UPDATE t_changeprice_list SET TOTALNUMBER=%d WHERE idx=%d", goods_count, listId);
        q->SQL->Text = sql;
        q->ExecSQL();

        q2->Close();
        q2->SQL->Text = "select goodidx,newprice from tmp_changeprice_goods \
            where newprice is not null";
        q2->Open();
        for (q2->First(); !q2->Eof; q2->Next()) {
            sql.sprintf("update t_goods set labelprice=%f where idx=%d",
                q2->FieldByName("newprice")->AsFloat,
                q2->FieldByName("goodidx")->AsInteger);
            q->SQL->Text = sql;
            q->ExecSQL();
        }
        q2->Close();

        // Write change price list to download_upload_price.txt and inform qyycy.exe
        q->Close();
        q->SQL->Text = "SELECT * FROM t_changeprice_list WHERE IDX=:listidx";
        q->ParamByName("listidx")->AsInteger = listId;
        q->Open();

        AnsiString str;
        str.sprintf("%d|%s|%s|%d|%s", listId,
                                      q->FieldByName("CHANGEDATE")->AsString,
                                      q->FieldByName("NAME")->AsString,
                                      q->FieldByName("TOTALNUMBER")->AsInteger,
                                      q->FieldByName("DESP")->AsString);
        TStringList *list = new TStringList();
        list->Add(str);

        q->Close();
        q->SQL->Text = "SELECT * FROM t_changeprice_goods WHERE LISTIDX = " + IntToStr(listId);
        q->Open();
        for ( q->First(); !q->Eof; q->Next() )
        {
            // Get Product name
            q2->Close();
            q2->SQL->Text = "SELECT * FROM t_goods WHERE IDX = " + q->FieldByName("GOODIDX")->AsString;
            q2->Open();

            str.sprintf("%d|%s|%f|%f", q->FieldByName("GOODIDX")->AsInteger,
                                       q2->FieldByName("NAME")->AsString,
                                       q->FieldByName("OLDPRICE")->AsFloat,
                                       q->FieldByName("NEWPRICE")->AsFloat);
            list->Add(str);
        }
        
        if ( !DirectoryExists(".\\data") )
            CreateDir(".\\data");
            
        list->SaveToFile(FILE_UPLOAD_CHANGE_PRICE);
        delete list;
        list = NULL;
    }
}
//---------------------------------------------------------------------------

void __fastcall TChangePriceForm::OkClick(TObject *Sender)
{
    ChangePriceDataSet->ApplyUpdates();
    ChangePriceDataSet->Transaction->Commit();
    ChangePriceDataSet->Close();
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TChangePriceForm::ChangePriceDataSetBeforeEdit(
      TDataSet *DataSet)
{
    /*
    q->SQL->Text = "select count(*) as cnt from t_changeprice_goods where goodidx=:goodidx and listidx=:listidx";
    q->ParamByName("goodidx")->AsInteger = ChangePriceDataSet->FieldByName("idx")->AsInteger;
    q->ParamByName("listidx")->AsInteger = listId;
    q->Open();
    int cnt = q->FieldByName("cnt")->AsInteger;
    q->Close();

    if (cnt <= 0) {
        q->SQL->Text = "insert into t_changeprice_goods(goodidx,listidx,oldprice,newprice) values(:goodidx,:listidx,:oldprice,:newprice)";
        q->ParamByName("goodidx")->AsInteger = ChangePriceDataSet->FieldByName("idx")->AsInteger;
        q->ParamByName("listidx")->AsInteger = listId;
        q->ParamByName("oldprice")->AsFloat = ChangePriceDataSet->FieldByName("labelprice")->AsFloat;
        q->ParamByName("newprice")->AsFloat = ChangePriceDataSet->FieldByName("labelprice")->AsFloat;
        q->ExecSQL();
    }
    */
}
//---------------------------------------------------------------------------

