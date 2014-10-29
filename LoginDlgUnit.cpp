//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "LoginDlgUnit.h"
#include "libinifile.h"
#include "Janitor.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
//--------------------------------------------------------------------- 
#pragma resource "*.dfm"
TLoginDlg *LoginDlg;

const char * INIFILE = "OrderMobile.ini";
//---------------------------------------------------------------------
__fastcall TLoginDlg::TLoginDlg(TComponent* AOwner)
	: TForm(AOwner)
{
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
    m_strUsername = val;
    
    memset(val, 0, sizeof(val));
    len = get_value(dom, "Login", "Password", val);
    if (len == -1) {
        ShowError("读取配置文件出错");
        return;
    }
    Password->Text = val;
    m_strPassword = val;
}
//---------------------------------------------------------------------

void __fastcall TLoginDlg::SaveConfig()
{
    ini_dom_handle dom = get_dom(NULL);
    Janitor g_fp( free_dom, dom );

    m_strUsername = User->Text;
    m_strPassword = Password->Text;
    
    add_section(dom, "Login");
    add_keypair(dom, "Login", "UserName", User->Text.c_str());
    add_keypair(dom, "Login", "Password", Password->Text.c_str());
    save_to(dom, INIFILE);
}
//---------------------------------------------------------------------

void __fastcall TLoginDlg::FormShow(TObject *Sender)
{
    ReadConfig();
}
//---------------------------------------------------------------------------

void __fastcall TLoginDlg::OKBtnClick(TObject *Sender)
{
    SaveConfig();
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

AnsiString __fastcall TLoginDlg::GetUsername()
{
    return m_strUsername;
}

AnsiString __fastcall TLoginDlg::GetPassword()
{
    return m_strPassword;
}

