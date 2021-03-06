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
#include "Product.h"
#include "Scale.h"
#include "SpecialProductsUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

extern OrderList * orderlist;
extern OrderList * querylist;
extern SoundPlay soundplay;

#define URL_LOGIN               ("http://%s/admin/index.php?route=common/login")
#define URL_LOGIN_OK            ("http://%s/admin/index.php?route=qingyou/login_ok")
#define URL_ORDER_QUERY         ("http://%s/admin/index.php?route=qingyou/order_query")
#define URL_ORDER_STATUS        ("http://%s/admin/index.php?route=qingyou/order_query/status")
#define URL_ORDER_DISTRICTS     ("http://%s/admin/index.php?route=qingyou/order_query/districts")
#define URL_ORDER_COMMIT        ("http://%s/admin/index.php?route=qingyou/order_query/commit")
#define URL_ORDER_SEARCH        ("http://%s/admin/index.php?route=qingyou/order_query/search")
#define URL_ORDER_BALANCE       ("http://%s/admin/index.php?route=qingyou/order_query/balance")
#define URL_ORDER_SETBALANCE    ("http://%s/admin/index.php?route=qingyou/order_query/setbalance")
#define URL_ORDER_ALERT    		("http://%s/admin/index.php?route=qingyou/order_query/alertpay")
#define URL_PAY_QUERY    		("http://%s/admin/index.php?route=qingyou/order_query/payquery")
#define URL_GET_PRODUCT_INFO    ("http://%s/admin/index.php?route=qingyou/cq_product_info")
#define URL_GET_ALL_PRODUCT_INFO    ("http://%s/admin/index.php?route=qingyou/cq_product_info/all")
#define URL_ORDER_SPECIAL        ("http://%s/admin/index.php?route=qingyou/order_query/specials")

void __fastcall THttpThread::Execute()
{
	AnsiString sorder;
    const int TIMEOUT = 20;

	while(Terminated == false) {
		st1 = "订单更新中...";
        st2 = "";
        Synchronize(FreshStatus);
    	st1 = st2 = "";

	    if ( m_bLogin == false ) {
	    	if (Login() == false) {
            	st1 = "登录失败";
                st2 = "等待自动重新登录";
	        	goto wait;
            }
	    }
	
	    sorder = GetOrders();
	    if (sorder != "") {
        	OrderList * newlist = OrderList::ParseOrders(sorder);
            if (newlist == NULL) {
	        	m_bLogin = false;
                st1 = "解析订单数据出错";
                st2 = "等待自动重新登录";
	        }
            else {
	            orderlist->mergeOrderList(newlist, &soundplay);
    	        delete newlist;
	    	    Synchronize(FreshOrders);
            }
	    }
        else {
        	m_bLogin = false;
        	st1 = "读取远程订单失败";
            st2 = "等待自动重新登录";
        }

        /* Get product info
        AnsiString strProductInfo = GetProductInfo();
        if ( strProductInfo != "" )
        {
            if ( ParseProductInfo(strProductInfo) )
            {
                PostMessage(MainOrderForm->Handle, WM_UPDATESCALERBAR, 0, 0);
            }
        }
        else {
            st2 = "读取远程产品价格失败";
        }   */
wait:
        Synchronize(FreshStatus);

        for(int i = 0; i < TIMEOUT; i++) {
        	if (Terminated == true) break;
            if (st1 == "" && st2 == "" || st1 == "状态正常") {
            	st1 = "状态正常";
                st2 = "倒计时秒数：" + AnsiString(TIMEOUT - i);
                Synchronize(FreshStatus);
            }
	        Sleep(1000);
        }
    }

    st1 = "";
    st2 = "停止数据线程，等待手工重新登录";
    Synchronize(FreshStatus);
}

void __fastcall THttpThread::FreshOrders(void)
{
    MainOrderForm->OrderFrame1->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_WAITING);
    MainOrderForm->OrderFrame2->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_PAYING);
    MainOrderForm->OrderFrame3->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_SCALED);
}

void __fastcall THttpThread::FreshStatus()
{
	MainOrderForm->StatusBar->Panels->Items[0]->Text = st1;
	MainOrderForm->StatusBar->Panels->Items[1]->Text = st2;
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

        // get special products
        ret = GetSpecials();
        if (ret.Length() <= 0)
        	m_bLogin = false;
        else {
        	if (SpecialProducts::getInstance()->ParseSpecials(ret) == false)
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

bool __fastcall THttpThread::SearchOrders(AnsiString date, int status, int specialid)
{
	AnsiString url;
    url.printf(URL_ORDER_SEARCH, server.c_str());
    url += "&token=" + token;
    url += "&date=" + date;
    if (status > 0)
    	url += "&status=" + AnsiString(status);
    if (specialid > 0)
    	url += "&special_id=" + AnsiString(specialid);
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

AnsiString __fastcall THttpThread::GetSpecials()
{
	AnsiString url;
    url.printf(URL_ORDER_SPECIAL, server.c_str());
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
    jo["iscash"] = order->iscash;
	jo["total"] = order->getOrderTotal();
    jo["realtotal"] = order->getOrderRealTotal();
    jo["order_type"] = order->order_type;
    jo["order_createtime"] = order->order_createtime.c_str();
    jo["productSubject"] = order->productSubject.c_str();
    jo["costpay"] = order->costpay;
    jo["cashpay"] = order->cashpay;

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

AnsiString __fastcall THttpThread::GetProductInfo(bool all)
{
	AnsiString url;
    if (all)
    	url.printf(URL_GET_ALL_PRODUCT_INFO, server.c_str());
    else
	    url.printf(URL_GET_PRODUCT_INFO, server.c_str());
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

bool __fastcall THttpThread::CancelOrder(Order * order)
{
	if (order == 0) return false;
	if (ShowYesNo("要取消该订单吗？") == false)
    	return false;

    if ( CommitOrder(order, OrderStatus::ORDER_STATUS_CANCEL) == false) {
    	ShowError("提交到服务器失败");
        return false;
    }

    order->commit(OrderStatus::ORDER_STATUS_CANCEL);
    return true;
}
//---------------------------------------------------------------------------

bool __fastcall THttpThread::CashPay(Order * order)
{
	if (order == 0) return false;
	if (ShowYesNo("要改为货到付款吗？") == false)
    	return false;

    order->iscash = 1;

    if ( CommitOrder(order, OrderStatus::ORDER_STATUS_SCALED) == false) {
    	ShowError("提交到服务器失败");
        return false;
    }

    order->commit(OrderStatus::ORDER_STATUS_SCALED);
    return true;
}
//---------------------------------------------------------------------------

bool __fastcall THttpThread::OrderAlert(Order * order)
{
	if (order == 0) return false;

	AnsiString url;
    url.printf(URL_ORDER_ALERT, server.c_str());
    url += "&order_id=" + AnsiString(order->order_id);
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
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

bool __fastcall THttpThread::PayQuery(Order * order)
{
	if (order == 0) return false;

	AnsiString url;
    url.printf(URL_PAY_QUERY, server.c_str());
    url += "&order_id=" + AnsiString(order->order_id);
    url += "&token=" + token;
    lock->Acquire();
    AnsiString ret = http->Get(url);
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

bool __fastcall THttpThread::ParseProductInfo(AnsiString str)
{
    Product *   pProduct = NULL;
    TStringList *list = new TStringList();
    AnsiString  strPLU, strPLUSerialNo, strProductCode, strPrice, strShopNo, strProductName, strProductType;
    
    istrstream istr(str.c_str());

    Json::Reader reader;
    Json::Value  productInfo;
    scale_count = 0;

    if ( !reader.parse(istr, productInfo, false) )
    {
        return false;
    }

    if ( productInfo.size() == 0 )
    {
        return false;
    }
    
    for ( unsigned int i=0; i<productInfo.size(); i++ )
    {
        pProduct = new Product;

        pProduct->plu_serial_no = UTF8toGBK(productInfo[i]["plu_serial_no"].asCString()).ToInt();
        pProduct->product_name  = UTF8toGBK(productInfo[i]["name"].asCString());
        pProduct->ean           = UTF8toGBK(productInfo[i]["ean"].asCString());
        pProduct->price         = UTF8toGBK(productInfo[i]["price"].asCString()).ToDouble();
        pProduct->product_type  = UTF8toGBK(productInfo[i]["product_type"].asCString()).ToInt();

        if (pProduct->product_type != 1 )
        {
            pProduct->product_type = 1;
            strPrice.sprintf("%06d", (int)(pProduct->price * 100));
        }
        else if (pProduct->product_type == 1 )
        {
            pProduct->product_type = 0;
            strPrice.sprintf("%06d", (int)((pProduct->price * 2) * 100));
        }
        strProductType.sprintf("%d", pProduct->product_type);
        strPLUSerialNo.sprintf("%04d", pProduct->plu_serial_no);
        strProductCode.sprintf("00%s", (pProduct->ean).SubString(3, 5));

        strShopNo = (pProduct->ean).SubString(1, 2);
        strProductName = pProduct->product_name;
        // 大华条码包装秤(TMA07)PLU
        strPLU = "1P" +             // 为协议序号	 (固定)
                 strPLUSerialNo +   // 为PLU序号	（0001~4000）
                 "A" +              // 为分隔符
                 strProductCode +   // 为商品代码	（7位）
                 strPrice +         // 为单价		（6位）	单位为:	分/kg
                 strProductType +   // 为称重方式	（1位）	0：称重		1：计件		2：定重
                 "00" +             // 为特殊信息1	（2位）
                 "00" +             // 为特殊信息2	（2位）
                 "00" +             // 为特殊信息3	（2位）
                 "000" +            // 为有效期	    （3位）
                 strShopNo +        // 为店名号	    （2位）
                 "00" +             // 为部门号	    （2位）
                 "0000000000000" +	// 为13位数字代号	（13位）
                 "00000" +          // 为皮重		（5位）单位为:	g
                 "00" +             // 为标签号	（2位）			 
                 "00" +             // 为是否打折  （2位）	 [	00：不按时间段自动调单价，手动不可以调单价；
								    // 01：按时间段自动调单价	，手动不可以调单价；
								    // 02：按时间段自动调单价	，手动可以调单价；]
                 "00" +             // 为第一时间段起始时间 (2位)
                 "00" +             // 为第一时间段结束时间 (2位)
                 "00" +             // 为第一时间段内折掉	 (2位)
                 "00" +             // 为第二时间段起始时间 (2位)
                 "00" +             // 为第二时间段结束时间 (2位)
                 "00" +             // 为第二时间段内折掉	 (2位)
                 "00" + 		    // 为第三时间段起始时间 (2位)
                 "00" + 		    // 为第三时间段结束时间 (2位)
                 "00" + 		    // 为第三时间段内折掉	 (2位)
                 "00" + 		    // 为第四时间段起始时间 (2位)
                 "00" + 		    // 为第四时间段结束时间 (2位)
                 "00" + 		    // 为第四时间段内折掉	 (2位)
                 "##" + 		    // 为分隔符
                 strProductName +  	// 为商品名1	（最多12汉字）
                 "##" +		        // 为分隔符
                 "" +	            // 为商品名2	（最多12汉字）
                 "##" +		        // 为分隔符
                 ""; 	            // 为商品名2	（最多12汉字）

        list->Add(strPLU);
        scale_count++;
    }

    if ( !DirectoryExists(".\\scale") )
        CreateDir(".\\scale");

    list->SaveToFile(".\\scale\\tma07.txt");

    delete list;
    list = NULL;

    return true;
}
//---------------------------------------------------------------------------

