//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MainOrderUnit.h"
#include "CheckoutUnit.h"
#include "LoginDlgUnit.h"
#include <strstream>
#include "json/json.h"
#include "Order.h"
#include "SoundPlay.h"
#include "LoginDlgUnit.h"
#include "CommonUnit.h"
#include "Janitor.h"

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

bool __fastcall TMainOrderForm::ParseOrders(AnsiString str_order)
{
    OrderList * pOrderlist = new OrderList();
    Order *     pOrder = NULL;
    Product *   pProduct = NULL;
    AnsiString  productSubject;

    Janitor g_orderlist(del<OrderList>, pOrderlist);
    try {

    istrstream istr(str_order.c_str());

    Json::Reader reader;
    Json::Value order;
    Json::Value product;

    if ( !reader.parse(istr, order, false) )
    {
        return false;
    }

    for ( unsigned int i=0; i<order.size(); i++ )
    {
        pOrder = new Order;

        pOrder->order_id = UTF8toGBK(order[i]["order_id"].asCString()).ToDouble();
        pOrder->order_status = UTF8toGBK(order[i]["order_status_id"].asCString()).ToInt();
        pOrder->order_createtime = UTF8toGBK(order[i]["order_createtime"].asCString());
        pOrder->order_date = TDateTime(pOrder->order_createtime).FormatString("yyyy-mm-dd");
        pOrder->customer_id = UTF8toGBK(order[i]["customer_id"].asCString()).ToInt();
        pOrder->customer_name = UTF8toGBK(order[i]["customer_name"].asCString());
        pOrder->shipping_name = UTF8toGBK(order[i]["shipping_name"].asCString());
        pOrder->customer_phone = UTF8toGBK(order[i]["customer_phone"].asCString());
        pOrder->shipping_phone = UTF8toGBK(order[i]["shipping_telephone"].asCString());
        pOrder->shipping_addr = UTF8toGBK(order[i]["shipping_addr"].asCString());
        pOrder->shipping_time = UTF8toGBK(order[i]["shipping_time"].asCString());
        pOrder->comment = UTF8toGBK(order[i]["comment"].asCString());
        pOrder->order_status_orign = pOrder->order_status;

        productSubject = "";
        int ordertype = 0;
        for ( unsigned int j=0; j<order[i]["products"].size(); j++ )
        {
            product = order[i]["products"];

            pProduct = new Product;

            pProduct->product_id = UTF8toGBK(product[j]["product_id"].asCString()).ToInt();
            pProduct->product_name = UTF8toGBK(product[j]["product_name"].asCString());
            pProduct->product_type = UTF8toGBK(product[j]["product_type"].asCString()).ToInt();
            pProduct->ean = UTF8toGBK(product[j]["ean"].asCString());
            pProduct->price = UTF8toGBK(product[j]["price"].asCString()).ToDouble();
            pProduct->perprice = UTF8toGBK(product[j]["perprice"].asCString()).ToDouble();
            pProduct->perweight = UTF8toGBK(product[j]["perweight"].asCString()).ToDouble();
            pProduct->perunit = UTF8toGBK(product[j]["perunit"].asCString());
            pProduct->quantity = UTF8toGBK(product[j]["quantity"].asCString()).ToInt();
            pProduct->total = UTF8toGBK(product[j]["total"].asCString()).ToDouble();
            pProduct->realweight = UTF8toGBK(product[j]["realweight"].asCString()).ToDouble();
            pProduct->realtotal = UTF8toGBK(product[j]["realtotal"].asCString()).ToDouble();

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

    } catch(...) {
    	return false;
    }

    return true;
}

//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::MainTimerTimer(TObject *Sender)
{
    if ( LoginDlg->GetLoginStatus() == false ) {
    	if (LoginDlg->Login() == false)
        	return;
    }

    AnsiString sorder = LoginDlg->GetOrders();
    if (sorder != "") {
    	if (ParseOrders(sorder) == false) {
        	LoginDlg->SetLoginStatus(false);
            return;
        }

        OrderFrame1->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_WAITING);
        OrderFrame2->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_PAYING);
        OrderFrame3->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_SCALED);
        OrderFrame4->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_FINISHED);
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

void __fastcall TMainOrderForm::FormShow(TObject *Sender)
{
    if (LoginDlg->ShowModal() != mrOk)
    	Close();
    else {
    	PageControl1->TabIndex = 0;
    	MainTimerTimer(Sender);
    	MainTimer->Enabled = true;
    }
}
//---------------------------------------------------------------------------

