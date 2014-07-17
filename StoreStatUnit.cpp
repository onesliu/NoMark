//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DbUnit.h"
#include "StoreStatUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TStoreStatForm *StoreStatForm;
//---------------------------------------------------------------------------
__fastcall TStoreStatForm::TStoreStatForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TStoreStatForm::FormShow(TObject *Sender)
{
    q->SQL->Text = "select SUM(StorageNumber) as num, SUM(StorageNumber*Cost) as cost from t_goods";
    q->Open();
    TotalNumber->Caption = q->FieldByName("num")->AsString;
    TotalCost->Caption = q->FieldByName("cost")->AsString;
    q->Close();

    MonthSellStat->DataSource->DataSet->Open();
    d->SellStatQuery2->Open();

    PageControl1->ActivePageIndex = 0;
}
//---------------------------------------------------------------------------
void __fastcall TStoreStatForm::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    d->SellStatQuery2->Close();
    MonthSellStat->DataSource->DataSet->Close();
}
//---------------------------------------------------------------------------

