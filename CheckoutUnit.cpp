//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CheckoutUnit.h"
#include "qyycy.h"
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
	AnsiString str;

    HFC_DATA_S *hfcData = new HFC_DATA_S;
    memset(hfcData, 0, sizeof(HFC_DATA_S));

    hfcData->hdl = HFC_Init();
    hfcData->url = QYYCY_URL_LOGIN;
    res = HFC_CanWebsiteVisit(hfcData);
    if ( res == false )
    {
        str = "½áËã£ºÍøÂçÁ¬½ÓÊ§°Ü£¡";
    }
    else
    {
        LoginDlg->ReadConfig();
        
        hfcData->url = QYYCY_URL_LOGIN;
        hfcData->login.name = (LoginDlg->GetUsername()).c_str();
        hfcData->login.pwd = (LoginDlg->GetPassword()).c_str();
        hfcData->url_login_ok = QYYCY_URL_LOGIN_OK;
    	res = HFC_Login(hfcData);
    	if ( res == false )
        {
            str = "½áËã£ºµÇÂ¼Ê§°Ü£¡";
            BalanceResult->SetTextBuf(str.c_str());
        }
		else
		{
            hfcData->url = QYYCY_URL_BALANCE;
            hfcData->type = TYPES_BALANCE;
            hfcData->data.filename = FILE_ORDER_BALANCE;
            hfcData->data.buf = NULL;
			res = HFC_Download(hfcData);
			if ( res == false )
            {
                str = "½áËã£º½áËãÊ§°Ü£¡";
                BalanceResult->SetTextBuf(str.c_str());
            }
			else
			{
                str = "½áËã£º½áËã³É¹¦£¡";
                BalanceResult->SetTextBuf(str.c_str());
			}
		}
    }
    HFC_Release(hfcData);

    delete hfcData;
    hfcData = NULL;

    if ( res == true )
    {
        // Parse file and show them on window
        AnsiString r0, r1, sql;
        TStringList *list = new TStringList();
        TStringList *goods_info_list = new TStringList();
    
        list->LoadFromFile(FILE_ORDER_BALANCE);

        LabelBalanceDateLast->SetTextBuf(list->Strings[0].c_str());
        LabelBalanceDateCurr->SetTextBuf(list->Strings[1].c_str());
        LabelBalanceMoney->SetTextBuf(list->Strings[2].c_str());
        LabelBalanceOrderNumber->SetTextBuf(list->Strings[3].c_str());
    }
}
//---------------------------------------------------------------------------

