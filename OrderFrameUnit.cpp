//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderFrameUnit.h"
#include "OrderStatus.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOrderFrame *OrderFrame;
using namespace std;
//---------------------------------------------------------------------------
__fastcall TOrderFrame::TOrderFrame(TComponent* Owner)
    : TFrame(Owner)
{
}
//---------------------------------------------------------------------------

void TOrderFrame::FreshOrderList(OrderList * olist, int order_status)
{
    OrderListView->Items->BeginUpdate();
    OrderListView->Items->Clear();

    olist->sortOrderByTime();
    TListItem * item;
    list<Order>::iterator itr;
    OrderStatus * os = OrderStatus::getInstance();
    AnsiString lastShippingtime = "";

    for(itr = olist->orders.begin(); itr != olist->orders.end(); ++itr) {
        if (order_status != 0 && itr->order_status != order_status) continue;
        if (lastShippingtime != "" && itr->shipping_time != lastShippingtime) {
            item = OrderListView->Items->Add();
            item->Caption = "----------------------------------------------------------";
            item->SubItems->Add("----------------------------------------------------------");
            item->SubItems->Add("----------------------------------------------------------");
            item->SubItems->Add("----------------------------------------------------------");
            item->SubItems->Add("----------------------------------------------------------");
            item->SubItems->Add("----------------------------------------------------------");
            item->SubItems->Add("----------------------------------------------------------");
            item->SubItems->Add("----------------------------------------------------------");
        }
        item = OrderListView->Items->Add();
        item->Caption = itr->order_id;
        item->SubItems->Add(itr->comment);
        item->SubItems->Add(os->getStatus(itr->order_status));
        item->SubItems->Add(itr->customer_name);
        item->SubItems->Add(itr->customer_phone);
        item->SubItems->Add(itr->shipping_addr);
        item->SubItems->Add(itr->shipping_time);
        item->SubItems->Add("");
        lastShippingtime = itr->shipping_time;
    }

    OrderListView->Items->EndUpdate();
}
//---------------------------------------------------------------------------

