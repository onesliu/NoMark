//---------------------------------------------------------------------------


#pragma hdrstop

#include "HttpThread.h"
#include "Janitor.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "PwdVerify.h"
#include "MainOrderUnit.h"
#include "UrlEncode.h"
#include <strstream>
#include "json/json.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

extern OrderList * orderlist;
extern OrderList * querylist;
extern SoundPlay soundplay;

#define URL_LOGIN       ("http://%s/admin/index.php?route=common/login")
#define URL_LOGIN_OK    ("http://%s/admin/index.php?route=qingyou/login_ok")
#define URL_ORDER_QUERY ("http://%s/admin/index.php?route=qingyou/order_query")
#define URL_ORDER_STATUS ("http://%s/admin/index.php?route=qingyou/order_query/status")
#define URL_ORDER_DISTRICTS ("http://%s/admin/index.php?route=qingyou/order_query/districts")
#define URL_ORDER_COMMIT "http://%s/admin/index.php?route=qingyou/order_query/commit"
#define URL_ORDER_SEARCH "http://%s/admin/index.php?route=qingyou/order_query/search"
#define URL_ORDER_BALANCE "http://%s/admin/index.php?route=qingyou/order_query/balance"
#define URL_ORDER_SETBALANCE "http://%s/admin/index.php?route=qingyou/order_query/setbalance"

void __fastcall THttpThread::Execute()
{
	while(Terminated == false) {
	    if ( m_bLogin == false ) {
	    	if (Login() == false)
	        	return;
	    }
	
	    AnsiString sorder = GetOrders();
	    if (sorder != "") {
        	OrderList * newlist = OrderList::ParseOrders(sorder);
            if (newlist == NULL) {
	        	m_bLogin = false;
	            return;
	        }

            orderlist->mergeOrderList(newlist, &soundplay);
	        Synchronize(FreshOrders);
	    }

        for(int i = 0; i < 10; i++) {
        	if (Terminated == true) break;
	        Sleep(1000);
        }
    }
}

void __fastcall THttpThread::FreshOrders(void)
{
    MainOrderForm->OrderFrame1->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_WAITING);
    MainOrderForm->OrderFrame2->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_PAYING);
    MainOrderForm->OrderFrame3->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_SCALED);
}

bool __fastcall THttpThread::Login()
{
    if ( m_bLogin == false )
    {
        AnsiString ulogin_ok, ulogin, values;
        WideString tu(user);
        UTF8String username = UTF8Encode(tu);
        ulogin_ok.printf(URL_LOGIN_OK, server.c_str());
        ulogin.printf(URL_LOGIN, server.c_str());
        values.printf("username=%s&password=%s&redirect=%s", UrlEncode(username.c_str()).c_str(),
            UrlEncode(password.c_str()).c_str(), UrlEncode(ulogin_ok.c_str()).c_str());

        try {
        lock->Acquire();
        AnsiString ret = http->Post(ulogin, values);
        lock->Release();
        if (ret.Length() > 0) {
        	Json::Reader reader;
		    Json::Value json;

            istrstream istr(ret.c_str());
            if (reader.parse(istr, json, false) == true) {
              	int status = json["status"].asInt();
                token = json["token"].asCString();
                district_id = json["district_id"].asInt();
                if (status == 0) {
					m_bLogin = true;
                }
            }
        }

        // get order status
        ret = GetStatus();
        if (ret.Length() <= 0)
        	m_bLogin = false;
        else {
        	if (OrderStatus::getInstance()->ParseStatus(ret) == false)
            	m_bLogin = false;
        }
        
        } catch(...) {
        }
    }

    return m_bLogin;
}

//---------------------------------------------------------------------------

AnsiString __fastcall THttpThread::GetOrders()
{
	AnsiString url;
    url.printf(URL_ORDER_QUERY, server.c_str());
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
    lock->Release();
    if (ret == "") {
    	m_bLogin = false;
    }
    return ret;
}
//---------------------------------------------------------------------------

bool __fastcall THttpThread::SearchOrders(AnsiString date)
{
	AnsiString url;
    url.printf(URL_ORDER_SEARCH, server.c_str());
    url += "&token=" + token;
    url += "&date=" + date;
    lock->Acquire();
    AnsiString sorder = http->Get(url);
    lock->Release();
    if (sorder == "") {
    	m_bLogin = false;
    }

    if (sorder != "") {
    	OrderList *newlist = OrderList::ParseOrders(sorder);
    	if (newlist == NULL) {
        	return false;
        }
        delete querylist;
        querylist = newlist;
    }
    else
    	return false;

    return true;
}
//---------------------------------------------------------------------------

AnsiString __fastcall THttpThread::GetStatus()
{
	AnsiString url;
    url.printf(URL_ORDER_STATUS, server.c_str());
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
    lock->Release();
    if (ret == "") {
    	m_bLogin = false;
    }
    return ret;
}
//---------------------------------------------------------------------------

AnsiString __fastcall THttpThread::GetDistricts()
{
	AnsiString url;
    url.printf(URL_ORDER_DISTRICTS, server.c_str());
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
    lock->Release();
    if (ret == "") {
    	m_bLogin = false;
    }
    return ret;
}
//---------------------------------------------------------------------------

AnsiString __fastcall THttpThread::GetBalance()
{
	AnsiString url;
    url.printf(URL_ORDER_BALANCE, server.c_str());
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
    lock->Release();
    if (ret == "") {
    	m_bLogin = false;
    }
    return ret;
}
//---------------------------------------------------------------------------
 
AnsiString __fastcall THttpThread::SetBalance()
{
	AnsiString url;
    url.printf(URL_ORDER_SETBALANCE, server.c_str());
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
    lock->Release();
    if (ret == "") {
    	m_bLogin = false;
    }
    return ret;
}
//---------------------------------------------------------------------------

bool __fastcall THttpThread::CommitOrder(Order *order, int order_status)
{
	AnsiString url;
    url.printf(URL_ORDER_COMMIT, server.c_str());
    url += "&token=" + token;

    Json::Value root;
    Json::Value jo;
    Json::Value jp;
    Json::Value arrayp;

    jo["order_id"] = order->order_id;
    jo["order_status"] = order_status;
	jo["total"] = order->getOrderTotal();
    jo["realtotal"] = order->getOrderRealTotal();
    jo["order_type"] = order->order_type;
    jo["order_createtime"] = order->order_createtime.c_str();
    jo["productSubject"] = order->productSubject.c_str();

	std::list<Product*>::iterator itr;
    for(itr = order->products.begin(); itr != order->products.end(); ++itr) {
    	jp["product_id"] = (*itr)->product_id;
        jp["realweight"] = (*itr)->realweight;
        jp["realtotal"] = (*itr)->realtotal;
        arrayp.append(jp);
    }

    jo["products"] = arrayp;
    root.append(jo);
    AnsiString sendstr;
    WideString wjson(root.toStyledString().c_str());
    UTF8String worders = UTF8Encode(wjson);
    sendstr.printf("orders=%s", UrlEncode(worders.c_str()));

    lock->Acquire();
    AnsiString ret = http->Post(url, sendstr);
    lock->Release();
	if (ret.Length() > 0) {
    	Json::Reader reader;
		Json::Value json;

		istrstream istr(ret.c_str());
		if (reader.parse(istr, json, false) == true) {
			int status = json["status"].asInt();
			if (status == 0) {
				return true;
			}
		}
	}
    return false;
}
//---------------------------------------------------------------------------

