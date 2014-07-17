//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CheckUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TCheckForm *CheckForm;
//---------------------------------------------------------------------------
__fastcall TCheckForm::TCheckForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::FreshCheckList()
{
    GoodIdx = 0;

    SelectGrid->DataSource->DataSet->Close();

    NoneGrid->DataSource->DataSet->DisableControls();
    NoneGrid->DataSource->DataSet->Close();
    NoneGrid->DataSource->DataSet->Open();
    NoneGrid->DataSource->DataSet->Locate("barcode", BarCode->Text, TLocateOptions() << loCaseInsensitive );
    NoneGrid->DataSource->DataSet->EnableControls();

    DiffGrid->DataSource->DataSet->DisableControls();
    DiffGrid->DataSource->DataSet->Close();
    DiffGrid->DataSource->DataSet->Open();

    double diff = 0.0;
    for ( d->CheckDiffSet->First(); !d->CheckDiffSet->Eof; d->CheckDiffSet->Next() )
    {
        diff += d->CheckDiffSet->FieldByName("TotalCost")->AsFloat;
    }
    DiffGrid->DataSource->DataSet->EnableControls();

    DiffGrid->DataSource->DataSet->First();
    DiffGrid->DataSource->DataSet->Locate("barcode", BarCode->Text, TLocateOptions() << loCaseInsensitive );

    TotalDiff->Caption = AnsiString().sprintf("%.2f", diff);

    BarCode->Text = "";
    Number->Text = "";
    BarCode->SetFocus();
}
//---------------------------------------------------------------------------


void __fastcall TCheckForm::NumberKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();

    AnsiString sql;
    bool exists = false;
    if ( Key == 0x0D && GoodIdx > 0 && Number->Text != "" )
    {
        q->Close();
        sql.sprintf("select count(*) as cnt from tmp_check_goods where goodidx=%d", GoodIdx);
        q->SQL->Text = sql;
        q->Open();
        if ( q->FieldByName("cnt")->AsInteger > 0 ) exists = true;
        q->Close();

        if ( exists )
            sql.sprintf("update tmp_check_goods set number=%s where goodidx=%d", Number->Text, GoodIdx );
        else
            sql.sprintf("insert into tmp_check_goods(goodidx,number) values(%d,%s)", GoodIdx, Number->Text);
        q->SQL->Text = sql;
        q->ExecSQL();
        FreshCheckList();
    }
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::CheckSelectSourceDataChange(TObject *Sender,
      TField *Field)
{
    if ( d->CheckSelectSet->FieldByName("barcode")->AsString != "" )
    {
        BarCode->Text = d->CheckSelectSet->FieldByName("barcode")->AsString;
        GoodIdx = d->CheckSelectSet->FieldByName("idx")->AsInteger;
    }
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::SelectGridKeyPress(TObject *Sender, char &Key)
{
    if ( Key == 13 )
        Number->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::FormShow(TObject *Sender)
{
    FreshCheckList();
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::BarCodeKeyPress(TObject *Sender, char &Key)
{
    if ( Key == 0x0D && BarCode->Text != "" )
    {
        d->CheckSelectSet->Close();
        d->CheckSelectSet->SQL->Text = AnsiString().sprintf( "select g.idx,g.name,g.barcode,g.storagenumber,cg.number \
            from t_goods g left join tmp_check_goods cg on g.idx=cg.goodidx where \
            barcode like '%%%s%%' or name like '%%%s%%'", BarCode->Text, BarCode->Text );
        d->CheckSelectSet->Open();
        if ( d->CheckSelectSet->RecordCount > 1 )
        {
            SelectGrid->SetFocus();
        }
        else if ( d->CheckSelectSet->RecordCount <= 0 )
        {
            ShowError("商品不存在");
            d->CheckSelectSet->Close();
            BarCode->SelectAll();
        }
        else if ( d->CheckSelectSet->RecordCount == 1 )
        {
            BarCode->Text = d->CheckSelectSet->FieldByName("barcode")->AsString;
            GoodIdx = d->CheckSelectSet->FieldByName("idx")->AsInteger;
            Number->SetFocus();
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::OkClick(TObject *Sender)
{
    d->trans->Commit();
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::CommitClick(TObject *Sender)
{
    AdjustClick(Sender);
    if ( ShowYesNo("最终入库将把损溢列表中的所有商品库存数量写入数据库，并产生盘点单，确定吗？") == false ) return;
    try {
        d->trans->AutoStopAction = saNone;

        int listid;
        q->SQL->Text = AnsiString().sprintf("insert into t_check_list(desp,totaldiff) \
            values('盘点结束',%s)", TotalDiff->Caption);
        q->ExecSQL();
        q->SQL->Text = "select MAX(idx) as mid from t_check_list";
        q->Open();
        listid = q->FieldByName("mid")->AsInteger;
        q->Close();
        d->CheckDiffSet->DisableControls();
        for ( d->CheckDiffSet->First(); !d->CheckDiffSet->Eof; d->CheckDiffSet->Next() )
        {
            q->SQL->Text = AnsiString().sprintf("insert into t_check_goods(CheckIdx, \
            GoodIdx, Difference, StockNumber, Number) values(%d,%d,%d,%d,%d)", listid,
            d->CheckDiffSet->FieldByName("idx")->AsInteger,
            d->CheckDiffSet->FieldByName("stocknumber")->AsInteger - d->CheckDiffSet->FieldByName("number")->AsInteger,
            d->CheckDiffSet->FieldByName("stocknumber")->AsInteger,
            d->CheckDiffSet->FieldByName("number")->AsInteger );
            q->ExecSQL();
        }
        d->CheckDiffSet->EnableControls();

        d->CheckDiffSet->ApplyUpdates();
        q->SQL->Text = "delete from tmp_check_goods";
        q->ExecSQL();

        d->trans->Commit();
        d->trans->AutoStopAction = saCommit;
    } catch(...) {
        d->trans->Rollback();
        d->trans->AutoStopAction = saCommit;
    }

    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::AdjustClick(TObject *Sender)
{
    if ( ShowYesNo("调整损溢库存将把损溢列表中的所有商品库存量调整为实际盘点数，确定吗？") == false ) return;
    d->CheckDiffSet->DisableControls();
    for ( d->CheckDiffSet->First(); !d->CheckDiffSet->Eof; d->CheckDiffSet->Next() )
    {
        d->CheckDiffSet->Edit();
        d->CheckDiffSet->FieldByName("storagenumber")->Value =
            d->CheckDiffSet->FieldByName("number")->Value;
        d->CheckDiffSet->Post();
    }
    d->CheckDiffSet->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::AddZeroClick(TObject *Sender)
{
    if ( ShowYesNo("将把所有未盘点的商品加入损溢列表，确定吗？") == false ) return;
    q->SQL->Text = "insert into tmp_check_goods(goodidx,number) \
        select g.idx,0 from t_goods g \
        where g.storagenumber > 0 and g.idx not in \
        (select goodidx from tmp_check_goods)";
    q->ExecSQL();
    FreshCheckList();
}
//---------------------------------------------------------------------------

void __fastcall TCheckForm::Button1Click(TObject *Sender)
{
    if ( ShowYesNo("危险操作！将清除之前所有的盘点记录，确定吗？") == false ) return;
    q->SQL->Text = "delete from tmp_check_goods";
    q->ExecSQL();
    FreshCheckList();
}
//---------------------------------------------------------------------------

