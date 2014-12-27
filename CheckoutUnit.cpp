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
    	ShowError("密码错误");
        return;
    }

    AnsiString ret = MainOrderForm->httpThread->SetBalance();
    if (ret == "") {
    	ShowError("结算出错");
        return;
    }

    if (balance->SetBalance(ret) == false) {
    	ShowError("结算出错");
    }
    else {
    	ShowInfo("结算成功");
        ModalResult = mrOk;
    }
}
//---------------------------------------------------------------------------

void __fastcall TCheckoutForm::ShowBalance(Balance * balance)
{
	this->balance = balance;

    if (balance->last_balance_date == "0") {
		LabelBalanceDateLast->Caption = "尚未进行第一次结算";
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

