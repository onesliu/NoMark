//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "LoginDlgUnit.h"
#include "libinifile.h"
#include "Janitor.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "PwdVerify.h"
#include "MainOrderUnit.h"

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

bool __fastcall TLoginDlg::ReadConfig()
{
    ini_dom_handle dom = get_dom(0);
    Janitor g_fp( free_dom, dom );

    if (FileExists(INIFILE) == false) {
        return false;
    }

    if (load_from(dom, INIFILE) != 0) {
        return false;
    }

    char val[256];
    memset(val, 0, sizeof(val));
    int len = get_value(dom, "Login", "UserName", val);
    if (len == -1) {
        return false;
    }
    User->Text = val;
    MainOrderForm->httpThread->user = val;

    memset(val, 0, sizeof(val));
    len = get_value(dom, "Login", "Password", val);
    if (len == -1) {
        return false;
    }
    Password->Text = val;
    MainOrderForm->httpThread->password = val;

    memset(val, 0, sizeof(val));
    len = get_value(dom, "Login", "Server", val);
    if (len == -1) {
        return false;
    }
    ServerDomain->Text = val;
    MainOrderForm->httpThread->server = val;

    return true;
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
	SaveConfig();
    if ( !MainOrderForm->httpThread->Login() )
    {
        ShowError(Handle, "µÇÂ½Ê§°Ü£¡");
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


