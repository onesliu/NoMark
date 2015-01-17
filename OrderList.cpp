//---------------------------------------------------------------------------


#pragma hdrstop

#include "OrderList.h"
#include "Janitor.h"
#include "CommonUnit.h"
#include "UrlEncode.h"
#include <strstream>
#include "json/json.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

OrderList * OrderList::ParseOrders(AnsiString str_order)
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
        return NULL;
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
            pProduct->unit = UTF8toGBK(product[j]["unit"].asCString());
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

    } catch(...) {
    	return NULL;
    }

    g_orderlist.Dismiss();
    return pOrderlist;
}


