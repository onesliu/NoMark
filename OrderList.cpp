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
        pOrder->iscash = UTF8toGBK(order[i]["iscash"].asCString()).ToInt();
        pOrder->order_status_orign = pOrder->order_status;
        pOrder->costpay = UTF8toGBK(order[i]["costpay"].asCString()).ToDouble();
        pOrder->cashpay = UTF8toGBK(order[i]["cashpay"].asCString()).ToDouble();
        pOrder->ismodify = UTF8toGBK(order[i]["ismodify"].asCString()).ToInt();
        pOrder->order_type = UTF8toGBK(order[i]["order_type"].asCString()).ToInt();

        productSubject = "";
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
            pProduct->weightunit = UTF8toGBK(product[j]["weightunit"].asCString());
            pProduct->quantity = UTF8toGBK(product[j]["quantity"].asCString()).ToInt();
            pProduct->total = UTF8toGBK(product[j]["total"].asCString()).ToDouble();
            pProduct->realweight = UTF8toGBK(product[j]["realweight"].asCString()).ToDouble();
            pProduct->realtotal = UTF8toGBK(product[j]["realtotal"].asCString()).ToDouble();

            if ( pOrder->order_status > OrderStatus::ORDER_STATUS_WAITING )
			    pProduct->finishScan();

            if (pProduct->product_type != 1) {
            	if (pProduct->ean == AnsiString("1")) {
					pProduct->realweight = 0;
                    pProduct->realtotal = 0;
                } else {
		            pProduct->realweight = pProduct->perweight * pProduct->quantity;
    		        pProduct->realtotal = pProduct->perprice * pProduct->quantity;
                }
                pProduct->finishScan();
            }

            pOrder->add_product(pProduct);
            productSubject += pProduct->product_name + " ";
        }

        pOrder->productSubject = productSubject;
        pOrderlist->add(pOrder);
    }

    } catch(...) {
    	return NULL;
    }

    g_orderlist.Dismiss();
    return pOrderlist;
}


