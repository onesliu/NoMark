//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UserLoginUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TUserLoginForm *UserLoginForm;
//---------------------------------------------------------------------------
__fastcall TUserLoginForm::TUserLoginForm(TComponent* Owner)
    : TForm(Owner)
{
    UserID = -1;
    DutyID = -1;
}
//---------------------------------------------------------------------------
void __fastcall TUserLoginForm::OkClick(TObject *Sender)
{
    if ( Serial->Text == "" ) Abort();
    bool ret;
    int userid;
    TDateTime n = Now();

    // user login
    if ( type == 1 )
    {
        ret = SelectUser( Serial->Text, UserID );
        if ( ret )
        {
            ExecSQL( AnsiString().sprintf("insert into t_duty(username,dutydate,logintime) \
            values('%s', '%s', '%s')", UserName, n.FormatString("yyyy-mm-dd"), n.FormatString("hh:nn:ss") ) );
            q->SQL->Text = "select max(idx) as id from t_duty";
            q->Open();
            DutyID = q->FieldByName("id")->AsInteger;
            q->Close();
        }
    }

    // user logout
    if ( type == 2 )
    {
        ret = SelectUser( Serial->Text, userid );
        if ( userid != UserID ) ret = false;
        if ( ret )
        {
            ExecSQL( AnsiString().sprintf("update t_duty set logouttime='%s' where idx=%d",
            n.FormatString("hh:nn:ss"), DutyID ) );
        }
    }

    if ( ret == false )
    {
        ShowError( "错误的收银员编号" );
        Serial->Text = "";
        Serial->SetFocus();
        Abort();
    }

    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TUserLoginForm::LogoutTime()
{
    if ( DutyID != -1 )
        ExecSQL( AnsiString().sprintf("update t_duty set logouttime='%s' where idx=%d",
            Now().FormatString("hh:nn:ss"), DutyID ) );
}
//---------------------------------------------------------------------------

bool __fastcall TUserLoginForm::SelectUser( AnsiString serial, int &userid )
{
    bool ret = false;
    try {

        q->SQL->Text = AnsiString().sprintf("select idx,name from t_user where serial='%s'",
            Serial->Text );
        q->Open();
        if ( q->RecordCount > 0 )
        {
            userid = q->FieldByName("idx")->AsInteger;
            UserName = q->FieldByName("name")->AsString;
            ret = true;
        }
        q->Close();

    }
    catch(...) {
        ret = false;
    }

    return ret;
}
//---------------------------------------------------------------------------

bool __fastcall TUserLoginForm::UserLogin()
{
    type = 1;

    Serial->Text = "";
    if ( ShowModal() == mrOk ) return true;
    else return false;
}
//---------------------------------------------------------------------------

bool __fastcall TUserLoginForm::UserLogout()
{
    type = 2;

    Serial->Text = "";
    if ( ShowModal() == mrOk ) return true;
    else return false;
}
//---------------------------------------------------------------------------

