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
        str = "У��ɹ���";
        ConfirmResult->SetTextBuf(str.c_str());
        ModalResult = mrOk;
    }
    else
    {
        str = "У��ʧ�ܣ�";
        ConfirmResult->SetTextBuf(str.c_str());
    }
}
//---------------------------------------------------------------------------
