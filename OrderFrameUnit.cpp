//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderFrameUnit.h"
#include "OrderStatus.h"
#include "OrderInfoUnit.h"
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
    this->olist = olist;

    OrderListView->Items->BeginUpdate();
    OrderListView->Items->Clear();

    olist->sortOrderByTime();
    TListItem * item;
    list<Order*>::iterator itr;
    OrderStatus * os = OrderStatus::getInstance();
    AnsiString lastOrderdate = "";

    for(itr = olist->orders.begin(); itr != olist->orders.end(); ++itr) {
        if (order_status != 0 && (*itr)->order_status != order_status) continue;
        if (lastOrderdate != "" && (*itr)->order_date.DateString() != lastOrderdate) {
            item = OrderListView->Items->Add();
            item->Caption = "----------";
            item->SubItems->Add("----------");
            item->SubItems->Add("----------");
            item->SubItems->Add("----------");
            item->SubItems->Add("----------");
            item->SubItems->Add("----------");
            item->SubItems->Add("----------");
            item->SubItems->Add("----------");
        }
        item = OrderListView->Items->Add();
        item->Caption = (*itr)->order_createtime;
        item->SubItems->Add((*itr)->productSubject);
        item->SubItems->Add(os->getStatus((*itr)->order_status));
        item->SubItems->Add((*itr)->customer_name);
        item->SubItems->Add((*itr)->shipping_phone);
        item->SubItems->Add((*itr)->shipping_addr);
        item->SubItems->Add((*itr)->shipping_time);
        item->SubItems->Add("");
        item->Data = *itr;
        lastOrderdate = (*itr)->order_date;
    }

    OrderListView->Items->EndUpdate();
    OrderListView->Columns->BeginUpdate();
    OrderListView->Columns->EndUpdate();
}
//---------------------------------------------------------------------------

void __fastcall TOrderFrame::OrderListViewDblClick(TObject *Sender)
{
    if (OrderListView->Selected == NULL ) return;

    Order * order = (Order*)OrderListView->Selected->Data;
    if (order) {
      	OrderInfoForm->ShowOrder(order);
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderFrame::OrderListViewKeyPress(TObject *Sender,
      char &Key)
{
	if (Key == 0x0d)
    	OrderListViewDblClick(Sender);
}
//---------------------------------------------------------------------------

