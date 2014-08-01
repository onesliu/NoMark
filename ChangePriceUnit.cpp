//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChangePriceUnit.h"
#include "DbUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"

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
    TDateTime today = Now();
    ListDate->Caption = today.FormatString( "yyyy-mm-dd" );
    ListName->Text = ListDate->Caption + " 调价单";
    ListDesp->Text = ListName->Text;

    q->Close();
    q->SQL->Text = "delete from tmp_changeprice_goods";
    q->ExecSQL();

    q->SQL->Text = "insert into t_changeprice_list(name) values('"+ ListName->Text +"')";
    q->ExecSQL();

    q->SQL->Text = "select max(idx) as mid from t_changeprice_list";
    q->Open();
    listId = q->FieldByName("mid")->AsInteger;
    q->Close();

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
    if (ModalResult != mrOk) {
        q->SQL->Text = "delete from t_changeprice_list where idx=:listidx";
        q->ParamByName("listidx")->AsInteger = listId;
        q->ExecSQL();
        q->SQL->Text = "delete from t_changeprice_goods where listidx=:listidx";
        q->ParamByName("listidx")->AsInteger = listId;
        q->ExecSQL();
    }
    else {
        q->SQL->Text = "insert into t_changeprice_goods(goodidx,listidx,oldprice,newprice) \
            select goodidx,listidx,oldprice,newprice from tmp_changeprice_goods \
            where newprice is not null";
        q->ExecSQL();

        AnsiString sql;

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

