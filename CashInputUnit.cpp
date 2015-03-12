//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "CashInputUnit.h"
#include "MessageBoxes.h"
//---------------------------------------------------------------------
#pragma resource "*.dfm"
TCashInputForm *CashInputForm;
//---------------------------------------------------------------------
__fastcall TCashInputForm::TCashInputForm(TComponent* AOwner)
	: TForm(AOwner)
{
}
//---------------------------------------------------------------------

double __fastcall TCashInputForm::ShowCashInput(AnsiString title, double val)
{
    CashEdit->EditLabel->Caption = title;
    CashEdit->Text = val;
    if (ShowModal() != mrOk)
    	return val;
    return CashEdit->Text.ToDouble();
}

void __fastcall TCashInputForm::CashEditKeyPress(TObject *Sender,
      char &Key)
{
	if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TCashInputForm::FormShow(TObject *Sender)
{
	CashEdit->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TCashInputForm::OKBtnClick(TObject *Sender)
{
	try {
        if (CashEdit->Text.Length() > 0) {
        	CashEdit->Text.ToDouble();
            ModalResult = mrOk;
        }
        else {
        	ShowError("请输入正确的金额");
        }
    } catch(...) {
    	ShowError("请输入正确的金额");
    }
}
//---------------------------------------------------------------------------


