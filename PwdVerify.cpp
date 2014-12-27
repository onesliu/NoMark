//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PwdVerify.h"
#include "LoginDlgUnit.h"
#include "MessageBoxes.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TPasswordVerify *PasswordVerify;
//---------------------------------------------------------------------------
__fastcall TPasswordVerify::TPasswordVerify(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPasswordVerify::BtnConfirmClick(TObject *Sender)
{
    if ( EditPwd->Text == LoginDlg->GetPassword() )
    {
        ModalResult = mrOk;
    }
    else
    {
        ModalResult = mrCancel;
    }
}
//---------------------------------------------------------------------------
