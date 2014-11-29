//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CheckoutUnit.h"
#include "PwdVerify.h"
#include "LoginDlgUnit.h"
#include "MessageBoxes.h"

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
    if ( LoginDlg->GetLoginStatus() == false )
    {
        ShowWarning("ÇëÊ×ÏÈµÇÂ½£¡");
        return;
    }

    if ( PasswordVerify->ShowModal() != mrOk )
    {
        return;
    }

	bool res = false;
    if ( res == true )
    {
        // Parse file and show them on window
        AnsiString r0, r1, sql;
        TStringList *list = new TStringList();
        TStringList *goods_info_list = new TStringList();
    
        //list->LoadFromFile(FILE_ORDER_BALANCE);

        LabelBalanceDateLast->SetTextBuf(list->Strings[0].c_str());
        LabelBalanceDateCurr->SetTextBuf(list->Strings[1].c_str());
        LabelBalanceMoney->SetTextBuf(list->Strings[2].c_str());
        LabelBalanceOrderNumber->SetTextBuf(list->Strings[3].c_str());
    }
}
//---------------------------------------------------------------------------

