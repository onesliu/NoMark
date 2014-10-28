//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MainOrderUnit.h"
#include "CheckoutUnit.h"
#include "LoginDlgUnit.h"
#include "fstream.h"
#include <cassert>
#include "json/json.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "OrderFrameUnit"
#pragma resource "*.dfm"

TMainOrderForm *MainOrderForm;
OrderList orderlist;
OrderList querylist;
//---------------------------------------------------------------------------
__fastcall TMainOrderForm::TMainOrderForm(TComponent* Owner)
    : TForm(Owner)
{
    m_bLogin = false;
    
    hfcData = new HFC_DATA_S;
    memset(hfcData, 0, sizeof(hfcData));
    hfcData->hdl = HFC_Init();
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::CheckoutButtonClick(TObject *Sender)
{
    CheckoutForm->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::LoginButtonClick(TObject *Sender)
{
    LoginDlg->ShowModal();    
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::TabSheet1Show(TObject *Sender)
{
    OrderFrame1->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_WAITING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet2Show(TObject *Sender)
{
    OrderFrame2->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_PAYING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet3Show(TObject *Sender)
{
    OrderFrame3->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_SCALED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet4Show(TObject *Sender)
{
    OrderFrame4->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_FINISHED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet5Show(TObject *Sender)
{
    OrderFrame5->FreshOrderList(&querylist, 0);
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::BtnQueryClick(TObject *Sender)
{
    ifstream ifs;
    ifs.open("testjson.json");
    assert(ifs.is_open());
 
    Json::Reader reader;
    Json::Value root;

    if (!reader.parse(ifs, root, false))
    {
        return ;
    }
 
    std::string name = root["name"].asString();
    AnsiString str;
    str = name.c_str();
    int age = root["age"].asInt(); 
}

bool __fastcall TMainOrderForm::GetOrders()
{
    bool res = false;

    hfcData->url = QYYCY_URL_DOWNLOAD_ORDERS;
    hfcData->type = TYPES_NULL;
    hfcData->shopNo = -1;
    hfcData->data.filename = FILE_ORDER_QUERY;
    hfcData->data.buf = NULL;
    res = HFC_Download(hfcData);
    
    return res;
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::MainTimerTimer(TObject *Sender)
{
    bool res = false;

    hfcData->url = QYYCY_URL_LOGIN;
    if ( m_bLogin == false )    // Login
    {
        res = HFC_CanWebsiteVisit(hfcData);
        if ( res == false )
        {
            return;
        }
        else
        {
            hfcData->url = QYYCY_URL_LOGIN;
            hfcData->login.name = LoginDlg->GetUsername().c_str();
            hfcData->login.pwd = LoginDlg->GetPassword().c_str();
            hfcData->url_login_ok = QYYCY_URL_LOGIN_OK;
            res = HFC_Login(hfcData);
            if ( res == false )
            {
                return;
            }
            else
            {
                m_bLogin = true;
            }
        }        
    }
    else
    {
        res = GetOrders();
        if ( res == false )
        {
            m_bLogin = false;
        }
    }
}
//---------------------------------------------------------------------------

