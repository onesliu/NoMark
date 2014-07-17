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

    int iGoodNumber, iStorageNumber;

    iGoodNumber = GoodNumber->Text.ToInt();
    iStorageNumber = StorageNumber->Text.ToInt();
    if ( StorageNumberEdit == false && OldGoodNumber != iGoodNumber )
    {
        if ( ShowYesNo("商品进货量被更改,是否把库存量自动增减?") == true )
        {
            iStorageNumber += (iGoodNumber - OldGoodNumber);
        }
    }

    pDS->Edit();

    pDS->FieldByName("name")->Value = GoodName->Text;
    pDS->FieldByName("goodcode")->Value = GoodCode->Text;
    pDS->FieldByName("cost")->Value = Cost->Text;
    pDS->FieldByName("labelprice")->Value = SellPrice->Text;
    pDS->FieldByName("barcode")->Value = BarCode->Text;
    pDS->FieldByName("lowestprice")->Value = LowestPrice->Text;
    pDS->FieldByName("goodnumber")->Value = iGoodNumber;
    pDS->FieldByName("storagenumber")->Value = iStorageNumber;

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
    LowestPrice->Text = pDS->FieldByName("lowestprice")->Value;
    GoodNumber->Text = pDS->FieldByName("goodnumber")->Value;
    StorageNumber->Text = pDS->FieldByName("storagenumber")->Value;

    OldGoodNumber = GoodNumber->Text.ToInt();
    StorageNumberEdit = false;

    } catch(...)
    {
        ShowError( "错误的物品条目" );
    }

    if ( ShowModal() == mrOk ) return true;
    return false;
}
//---------------------------------------------------------------------------

void __fastcall TGoodAttribForm::StorageNumberChange(TObject *Sender)
{
    StorageNumberEdit = true;    
}
//---------------------------------------------------------------------------

