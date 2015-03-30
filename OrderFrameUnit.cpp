//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderFrameUnit.h"
#include "OrderStatus.h"
#include "OrderInfoUnit.h"
#include "MessageBoxes.h"
#include "MainOrderUnit.h"
#include "CommonUnit.h"
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
    ostatus = order_status;

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
            item->Data = NULL;
        }
        item = OrderListView->Items->Add();
        item->Caption = (*itr)->order_createtime;
        item->SubItems->Add((*itr)->productSubject);
        item->SubItems->Add(FormatCurrency((*itr)->getOrderTotal()));
        item->SubItems->Add(FormatCurrency((*itr)->getOrderRealTotal()));
        AnsiString cashpay = "";
        if ((*itr)->iscash > 0) cashpay = "£¨µ½¸¶£©";
        item->SubItems->Add(os->getStatus((*itr)->order_status) + cashpay);
        item->SubItems->Add((*itr)->customer_name);
        item->SubItems->Add((*itr)->shipping_name);
        item->SubItems->Add((*itr)->shipping_time);
        item->SubItems->Add((*itr)->shipping_phone);
        item->SubItems->Add((*itr)->shipping_addr);
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
        FreshOrderList(olist, ostatus);
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

void __fastcall TOrderFrame::PopupMenu1Popup(TObject *Sender)
{
    if (OrderListView->Selected == NULL ) {
    	CancelOrder->Enabled = false;
        RefundOrder->Enabled = false;
        CashPay->Enabled = false;
        return;
    }

    Order * order = (Order*)OrderListView->Selected->Data;
    if (order == NULL) {
    	CancelOrder->Enabled = false;
        RefundOrder->Enabled = false;
        CashPay->Enabled = false;
    }
	else if (order->order_status_orign <= OrderStatus::ORDER_STATUS_PAYING) {
    	CancelOrder->Enabled = true;
        RefundOrder->Enabled = false;
        CashPay->Enabled = true;
    }
    else if (order->order_status_orign > OrderStatus::ORDER_STATUS_PAYING && order->order_status_orign < OrderStatus::ORDER_STATUS_REFUND) {
    	if (order->iscash > 0) {
        	CancelOrder->Enabled = true;
	        RefundOrder->Enabled = false;
        }
        else {
	    	CancelOrder->Enabled = false;
    	    RefundOrder->Enabled = true;
        }
        CashPay->Enabled = false;
    }
    else {
    	CancelOrder->Enabled = false;
        RefundOrder->Enabled = false;
        CashPay->Enabled = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderFrame::CancelOrderClick(TObject *Sender)
{
    Order * order = (Order*)OrderListView->Selected->Data;

    if (MainOrderForm->httpThread->CancelOrder(order) == true)
	    FreshOrderList(olist, ostatus);
}
//---------------------------------------------------------------------------

void __fastcall TOrderFrame::CashPayClick(TObject *Sender)
{
    Order * order = (Order*)OrderListView->Selected->Data;

    if (MainOrderForm->httpThread->CashPay(order) == true)
	    FreshOrderList(olist, ostatus);
}
//---------------------------------------------------------------------------


void __fastcall TOrderFrame::OrderListViewCustomDrawItem(
      TCustomListView *Sender, TListItem *Item, TCustomDrawState State,
      bool &DefaultDraw)
{
	Order * order = (Order*)Item->Data;
    if (order == NULL) return;
    if (order->ismodify <= 0)
		((TCustomListView*)Sender)->Canvas->Font->Color = clBlue;
    DefaultDraw = true;
}
//---------------------------------------------------------------------------

