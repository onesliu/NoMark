//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MainOrderUnit.h"
#include "CheckoutUnit.h"
#include "LoginDlgUnit.h"
#include "fstream.h"
#include <cassert>
#include "json/json.h"
#include "Order.h"
#include "SoundPlay.h"
#include "LoginDlgUnit.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "OrderFrameUnit"
#pragma resource "*.dfm"

TMainOrderForm *MainOrderForm;
OrderList * orderlist = 0;
OrderList * querylist = 0;
SoundPlay   soundplay;

//---------------------------------------------------------------------------
__fastcall TMainOrderForm::TMainOrderForm(TComponent* Owner)
    : TForm(Owner)
{
    hfcData = new HFC_DATA_S;
    memset(hfcData, 0, sizeof(HFC_DATA_S));
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
    OrderFrame1->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_WAITING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet2Show(TObject *Sender)
{
    OrderFrame2->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_PAYING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet3Show(TObject *Sender)
{
    OrderFrame3->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_SCALED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet4Show(TObject *Sender)
{
    OrderFrame4->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_FINISHED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet5Show(TObject *Sender)
{
    OrderFrame5->FreshOrderList(querylist, 0);
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::BtnQueryClick(TObject *Sender)
{
    OrderFrame5->FreshOrderList(querylist, 0);
}

char* __fastcall TMainOrderForm::UTF8toGBK(string str)
{
    int len = strlen(str.c_str())+1;

    WCHAR * wChar = new WCHAR[len];
    wChar[0] = 0;
    MultiByteToWideChar(CP_UTF8, 0, str.c_str(), len, wChar, len);
    WideCharToMultiByte(CP_ACP, 0, wChar, len, outch, len, 0, 0);
    delete [] wChar;

    char* pchar = (char*)outch;

    return pchar;
}

bool __fastcall TMainOrderForm::GetOrders()
{
    bool res = false;
    
    hfcData->url = QYYCY_URL_DOWNLOAD_ORDERS;
    hfcData->type = TYPES_DOWNLOAD_ORDER;
    hfcData->data.filename = FILE_ORDER_QUERY;
    hfcData->data.buf = NULL;
    res = HFC_Download(hfcData);

    return res;
}

bool __fastcall TMainOrderForm::ParseOrders()
{
    OrderList * pOrderlist = new OrderList();
    Order *     pOrder = NULL;
    Product *   pProduct = NULL;
    AnsiString  str;
    ifstream    ifs;
    AnsiString  productSubject;

    ifs.open(FILE_ORDER_QUERY);
    assert(ifs.is_open());

    Json::Reader reader;
    Json::Value order;
    Json::Value product;

    if ( !reader.parse(ifs, order, false) )
    {
        return false;
    }

    for ( int i=0; i<order.size(); i++ )
    {
        pOrder = new Order;

        pOrder->order_id = ((AnsiString)(UTF8toGBK(order[i]["order_id"].asCString()))).ToDouble();
        pOrder->order_status = ((AnsiString)(UTF8toGBK(order[i]["order_status_id"].asCString()))).ToInt();
        pOrder->order_createtime = (AnsiString)(UTF8toGBK(order[i]["order_createtime"].asCString()));
        pOrder->customer_id = ((AnsiString)(UTF8toGBK(order[i]["customer_id"].asCString()))).ToInt();
        pOrder->customer_name = (AnsiString)(UTF8toGBK(order[i]["customer_name"].asCString()));
        pOrder->shipping_name = (AnsiString)(UTF8toGBK(order[i]["shipping_name"].asCString()));
        pOrder->customer_phone = (AnsiString)(UTF8toGBK(order[i]["customer_phone"].asCString()));
        pOrder->shipping_addr = (AnsiString)(UTF8toGBK(order[i]["shipping_addr"].asCString()));
        pOrder->shipping_time = (AnsiString)(UTF8toGBK(order[i]["shipping_time"].asCString()));
        pOrder->comment = (AnsiString)(UTF8toGBK(order[i]["comment"].asCString()));
        pOrder->order_status_orign = pOrder->order_status;

        productSubject = "";
        int ordertype = 0;
        for ( int j=0; j<order[i]["products"].size(); j++ )
        {
            product = order[i]["products"];

            pProduct = new Product;

            pProduct->product_id = ((AnsiString)(UTF8toGBK(product[j]["product_id"].asCString()))).ToInt();
            pProduct->product_name = (AnsiString)(UTF8toGBK(product[j]["product_name"].asCString()));
            pProduct->product_type = ((AnsiString)(UTF8toGBK(product[j]["product_type"].asCString()))).ToInt();
            pProduct->ean = (AnsiString)(UTF8toGBK(product[j]["ean"].asCString()));
            pProduct->price = ((AnsiString)(UTF8toGBK(product[j]["price"].asCString()))).ToDouble();
            pProduct->quantity = ((AnsiString)(UTF8toGBK(product[j]["quantity"].asCString()))).ToInt();
            pProduct->total = ((AnsiString)(UTF8toGBK(product[j]["total"].asCString()))).ToDouble();
            pProduct->realweight = ((AnsiString)(UTF8toGBK(product[j]["realweight"].asCString()))).ToDouble();
            pProduct->realtotal = ((AnsiString)(UTF8toGBK(product[j]["realtotal"].asCString()))).ToDouble();

            if ( pOrder->order_status > OrderStatus::ORDER_STATUS_WAITING )
			    pProduct->finishScan();

            ordertype += pProduct->product_type;
            pOrder->add_product(pProduct);
            productSubject += pProduct->product_name + " ";
        }

        if ( ordertype == 0 )
            pOrder->order_type = 0; //0:固定客单价订单, 1:变客单价订单
        else
            pOrder->order_type = 1;

        pOrder->productSubject = productSubject;
        pOrderlist->add(pOrder);
    }

    orderlist->mergeOrderList(pOrderlist, &soundplay);
}

//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::MainTimerTimer(TObject *Sender)
{
//    if ( LoginDlg->GetLoginStatus() == false )
//        return;

    bool res = false;
    
#if 1
        hfcData->url = QYYCY_URL_LOGIN;
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
//                m_bLogin = true;
            }
        }
#endif

        res = GetOrders();
        if ( res == false )
        {
            return;
        }
        else
        {
            ParseOrders();

            OrderFrame1->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_WAITING);
            OrderFrame2->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_PAYING);
            OrderFrame3->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_SCALED);
            OrderFrame4->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_FINISHED);
            //
        }
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::FormCreate(TObject *Sender)
{
    orderlist = new OrderList();
    querylist = new OrderList();
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::FormDestroy(TObject *Sender)
{
    if (orderlist) delete orderlist;
    if (querylist) delete querylist;
}
//---------------------------------------------------------------------------


