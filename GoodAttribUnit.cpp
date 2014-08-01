//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GoodAttribUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TGoodAttribForm *GoodAttribForm;
//---------------------------------------------------------------------------
__fastcall TGoodAttribForm::TGoodAttribForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGoodAttribForm::OkClick(TObject *Sender)
{
    try {

    pDS->Edit();

    pDS->FieldByName("name")->Value = GoodName->Text;
    pDS->FieldByName("goodcode")->Value = GoodCode->Text;

    pDS->Post();

    ModalResult = mrOk;
    
    } catch(...)
    {
        pDS->Cancel();
        ShowError("商品属性输入错误");
    }
}
//---------------------------------------------------------------------------

bool __fastcall TGoodAttribForm::SetGoodItem( TDataSet *pds )
{
    if ( pds == 0 ) return false;
    pDS = pds;

    try {

    GoodName->Text = pDS->FieldByName("name")->Value;
    GoodCode->Text = pDS->FieldByName("goodcode")->Value;
    Cost->Text = pDS->FieldByName("cost")->Value;
    SellPrice->Text = pDS->FieldByName("labelprice")->Value;
    BarCode->Text = pDS->FieldByName("barcode")->Value;

    } catch(...)
    {
        ShowError( "错误的物品条目" );
    }

    if ( ShowModal() == mrOk ) return true;
    return false;
}
//---------------------------------------------------------------------------


