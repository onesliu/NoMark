//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "LoginUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLoginForm *LoginForm;
//---------------------------------------------------------------------------
__fastcall TLoginForm::TLoginForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

bool __fastcall TLoginForm::AdminLogin( int level )
{
    Caption = "系统管理员登录";
    NameLabel->Caption = "管理员名称";
    Password->EditLabel->Caption = "登录口令";
    type = 0;

    Name->Items->Clear();
    if ( level >= 0 )
        q->SQL->Text = "select * from t_admin where ulevel = " + IntToStr(level);
    else
        q->SQL->Text = "select * from t_admin";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        Name->Items->Add( q->FieldByName("name")->AsString );
    }
    q->Close();
    Name->ItemIndex = 0;
    Password->Text = "";

    if ( ShowModal() == mrOk ) return true;
    else return false;
}
//---------------------------------------------------------------------------

bool __fastcall TLoginForm::UserLogin()
{
    Caption = "收银员登录";
    NameLabel->Caption = "收银员名称";
    Password->EditLabel->Caption = "登录序列号";
    type = 1;

    Name->Items->Clear();
    q->SQL->Text = "select * from t_user";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        Name->Items->Add( q->FieldByName("name")->AsString );
    }
    q->Close();
    Name->ItemIndex = 0;
    Password->Text = "";

    if ( ShowModal() == mrOk ) return true;
    else return false;
}
//---------------------------------------------------------------------------

bool __fastcall TLoginForm::UserLogout()
{
    Caption = "收银员退出登录";
    NameLabel->Caption = "收银员名称";
    Password->EditLabel->Caption = "登录序列号";
    type = 2;

    Name->Items->Clear();
    q->SQL->Text = "select * from t_user where idx=" + IntToStr(User);
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        Name->Items->Add( q->FieldByName("name")->AsString );
    }
    q->Close();
    Name->ItemIndex = 0;
    Password->Text = "";

    if ( ShowModal() == mrOk ) return true;
    else return false;
}
//---------------------------------------------------------------------------

void __fastcall TLoginForm::OkClick(TObject *Sender)
{
    if ( Name->Text == "" || Password->Text == "" ) Abort();

    AnsiString pwd = MakePassword( Password->Text );
    bool ret = false;

    // admin login
    if ( type == 0 )
    {
        q->SQL->Text = AnsiString().sprintf("select idx from t_admin where name='%s' and pwd='%s'",
            Name->Text, pwd );
        q->Open();
        if ( q->RecordCount > 0 )
        {
            Admin = q->FieldByName("idx")->AsInteger;
            ret = true;
        }
        q->Close();
    }

    // user login
    if ( type == 1 )
    {
        User = 0;
        TDateTime n = Now();

        q->SQL->Text = AnsiString().sprintf("select idx from t_user where name='%s' and pwd='%s'",
            Name->Text, pwd );
        q->Open();
        if ( q->RecordCount > 0 )
        {
            User = q->FieldByName("idx")->AsInteger;
            ret = true;
        }
        q->Close();

        if ( ret )
        {
            ExecSQL( AnsiString().sprintf("insert into t_duty(useridx,dutydate,logintime) \
            values(%d, '%s', '%s')", User, n.FormatString("yyyy-mm-dd"), n.FormatString("hh:nn:ss") ) );
            q->SQL->Text = "select max(idx) as id from t_duty";
            q->Open();
            Duty = q->FieldByName("id")->AsInteger;
            q->Close();
        }
    }

    // user logout
    if ( type == 2 )
    {
        TDateTime n = Now();

        q->SQL->Text = AnsiString().sprintf("select idx from t_user where name='%s' and pwd='%s'",
            Name->Text, pwd );
        q->Open();
        if ( q->RecordCount > 0 ) ret = true;
        q->Close();

        if ( ret )
        {
            ExecSQL( AnsiString().sprintf("update t_duty set logouttime='%s' where idx=%d",
            n.FormatString("hh:nn:ss"), Duty ) );
        }
    }

    if ( ret == false )
    {
        ShowError( "错误的名称或序列号或口令" );
        Password->SetFocus();
        Password->SelectAll();
        Abort();
    }

    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TLoginForm::FormShow(TObject *Sender)
{
    Password->SetFocus();
}
//---------------------------------------------------------------------------

