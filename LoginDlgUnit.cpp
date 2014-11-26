//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "LoginDlgUnit.h"
#include "libinifile.h"
#include "Janitor.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "qyycy.h"
#include "PwdVerify.h"
#include "MainOrderUnit.h"
#include "UrlEncode.h"

#define URL_LOGIN       ("http://%s/admin/index.php?route=common/login&username=%s&password=%s&redirect=%s")
#define URL_LOGIN_OK    ("http://%s/admin/index.php?route=qingyou/login_ok")

//---------------------------------------------------------------------
#pragma resource "*.dfm"
TLoginDlg *LoginDlg;

const char * INIFILE = "OrderMobile.ini";
//---------------------------------------------------------------------
__fastcall TLoginDlg::TLoginDlg(TComponent* AOwner)
	: TForm(AOwner)
{
    m_bLogin = false;
}
//---------------------------------------------------------------------

void __fastcall TLoginDlg::ReadConfig()
{
    ini_dom_handle dom = get_dom(0);
    Janitor g_fp( free_dom, dom );

    if (FileExists(INIFILE) == false) {
        return;
    }

    if (load_from(dom, INIFILE) != 0) {
        ShowError("读取配置文件出错");
        return;
    }

    char val[256];
    memset(val, 0, sizeof(val));
    int len = get_value(dom, "Login", "UserName", val);
    if (len == -1) {
        ShowError("读取配置文件出错");
        return;
    }
    User->Text = val;

    memset(val, 0, sizeof(val));
    len = get_value(dom, "Login", "Password", val);
    if (len == -1) {
        ShowError("读取配置文件出错");
        return;
    }
    Password->Text = val;

    memset(val, 0, sizeof(val));
    len = get_value(dom, "Login", "Server", val);
    if (len == -1) {
        ShowError("读取配置文件出错");
        return;
    }
    ServerDomain->Text = val;
}
//---------------------------------------------------------------------

void __fastcall TLoginDlg::SaveConfig()
{
    ini_dom_handle dom = get_dom(NULL);
    Janitor g_fp( free_dom, dom );

    add_section(dom, "Login");
    add_keypair(dom, "Login", "UserName", User->Text.c_str());
    add_keypair(dom, "Login", "Password", Password->Text.c_str());
    add_keypair(dom, "Login", "Server", ServerDomain->Text.c_str());
    save_to(dom, INIFILE);
}
//---------------------------------------------------------------------

void __fastcall TLoginDlg::FormShow(TObject *Sender)
{
    ReadConfig();
}
//---------------------------------------------------------------------------
bool __fastcall TLoginDlg::Login()
{
    if ( m_bLogin == false )
    {
        AnsiString ulogin_ok, ulogin;
        ulogin_ok.printf(URL_LOGIN_OK, ServerDomain->Text.c_str());
        ulogin.printf(URL_LOGIN, ServerDomain->Text.c_str(), User->Text.c_str(),
            Password->Text.c_str(), UrlEncode(ulogin_ok.c_str()).c_str());

        AnsiString ret = http->Get(ulogin);

    }

    return m_bLogin;
}

bool __fastcall TLoginDlg::GetLoginStatus()
{
    return m_bLogin;
}

void __fastcall TLoginDlg::SetLoginStatus(bool status)
{
    m_bLogin = status;
}

AnsiString __fastcall TLoginDlg::GetUsername()
{
    return User->Text;
}

AnsiString __fastcall TLoginDlg::GetPassword()
{
    return Password->Text;
}

void __fastcall TLoginDlg::OKBtnClick(TObject *Sender)
{
    if ( !Login() )
    {
        ShowError("登陆失败！");
    }
    else
    {
        ModalResult = mrOk;
    }
}
//---------------------------------------------------------------------------

void __fastcall TLoginDlg::SpeedButton1Click(TObject *Sender)
{
    ServerDomain->Enabled = !ServerDomain->Enabled;
}
//---------------------------------------------------------------------------

