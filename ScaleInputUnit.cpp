//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ScaleInputUnit.h"
#include "MessageBoxes.h"
#include "CashInputUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TScaleInputForm *ScaleInputForm;
//---------------------------------------------------------------------------
__fastcall TScaleInputForm::TScaleInputForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TScaleInputForm::ShowScale(Product * p)
{
	ScalePrice->Clear();
    ScaleWeight->Clear();
    product = p;
    ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TScaleInputForm::OkBtnClick(TObject *Sender)
{
 	try {
    	//输入的ScaleWeight单位是公斤，缓存的product->weight单位是克，product->price是斤的价格
        if (ScalePrice->Text.Length() > 0 && ScaleWeight->Text.Length() > 0) {
	    	product->realtotal = RoundTo(ScalePrice->Text.ToDouble(), -2);
            product->realweight = Floor(ScaleWeight->Text.ToDouble() * 1000);
        }
        else if (ScalePrice->Text.Length() > 0 && ScaleWeight->Text.Length() == 0) {
        	product->realtotal = RoundTo(ScalePrice->Text.ToDouble(), -2);
        	if (product->ean == AnsiString("1")) {
            	product->realweight = 0;
            } else {
	        	product->realweight = Floor(ScalePrice->Text.ToDouble()/product->price * 500);
            }
        }
        else if (ScalePrice->Text.Length() == 0 && ScaleWeight->Text.Length() > 0) {
            product->realweight = ScaleWeight->Text.ToDouble() * 2;
            product->realtotal = RoundTo(product->realweight * product->price, -2);
            product->realweight = Floor(product->realweight*500);
        }
        else {
        	ShowError("请输入正确的重量或价格");
            return;
        }
    } catch(...) {
    	ShowError("请输入正确的重量或价格");
    	return;
    }

    product->finishScan();
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TScaleInputForm::ScalePriceKeyPress(TObject *Sender,
      char &Key)
{
	if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();	
}
//---------------------------------------------------------------------------

void __fastcall TScaleInputForm::ScalePriceChange(TObject *Sender)
{
	if (ScalePrice->Focused() && ScalePrice->Text.Length() > 0) {
    	ScaleWeight->Text = RoundTo(ScalePrice->Text.ToDouble()/product->price/2, -2);
    }
}
//---------------------------------------------------------------------------

void __fastcall TScaleInputForm::ScaleWeightChange(TObject *Sender)
{
	if (ScaleWeight->Focused() && ScaleWeight->Text.Length() > 0) {
    	ScalePrice->Text = RoundTo(ScaleWeight->Text.ToDouble() * product->price * 2, -2);
    }
}
//---------------------------------------------------------------------------

void __fastcall TScaleInputForm::FormShow(TObject *Sender)
{
	if (product->price == 0) {
    	product->price = CashInputForm->ShowCashInput("请输入商品价格：", 1);
    }
    ScalePrice->SetFocus();
}
//---------------------------------------------------------------------------

