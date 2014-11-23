//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PwdVerify.h"
#include "LoginDlgUnit.h"

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
    AnsiString str;
    
    LoginDlg->ReadConfig();

    if ( EditPwd->Text == LoginDlg->GetPassword() )
    {
        str = "校验成功！";
        ConfirmResult->SetTextBuf(str.c_str());
        ModalResult = mrOk;
    }
    else
    {
        str = "校验失败！";
        ConfirmResult->SetTextBuf(str.c_str());
    }
}
//---------------------------------------------------------------------------
