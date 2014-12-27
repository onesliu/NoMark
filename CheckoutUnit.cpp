//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CheckoutUnit.h"
#include "PwdVerify.h"
#include "MainOrderUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TCheckoutForm *CheckoutForm;
//---------------------------------------------------------------------------
__fastcall TCheckoutForm::TCheckoutForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCheckoutForm::BtnBalanceClick(TObject *Sender)
{
    if ( PasswordVerify->ShowModal() != mrOk )
    {
    	ShowError("�������");
        return;
    }

    AnsiString ret = MainOrderForm->httpThread->SetBalance();
    if (ret == "") {
    	ShowError("�������");
        return;
    }

    if (balance->SetBalance(ret) == false) {
    	ShowError("�������");
    }
    else {
    	ShowInfo("����ɹ�");
        ModalResult = mrOk;
    }
}
//---------------------------------------------------------------------------

void __fastcall TCheckoutForm::ShowBalance(Balance * balance)
{
	this->balance = balance;

    if (balance->last_balance_date == "0") {
		LabelBalanceDateLast->Caption = "��δ���е�һ�ν���";
    }
    else {
	    LabelBalanceDateLast->Caption = balance->last_balance_date;
    }
    LabelBalanceDateCurr->Caption = balance->current_date;
    LabelBalanceMoney->Caption = FormatCurrency(balance->total);
    LabelBalanceOrderNumber->Caption = balance->count;
    if (balance->count <= 0)
    	BtnBalance->Enabled = false;
    else
    	BtnBalance->Enabled = true;

    ShowModal();
}
//---------------------------------------------------------------------------

