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
    double total = 0, realtotal = 0, cash = 0, weixin = 0;

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
        if ((*itr)->iscash > 0) {
        	cashpay = "（到付）";
            cash += (*itr)->getOrderRealTotal();
        }
        else {
        	weixin += (*itr)->getOrderRealTotal();
        }
        item->SubItems->Add(os->getStatus((*itr)->order_status) + cashpay);
        item->SubItems->Add((*itr)->customer_name);
        item->SubItems->Add((*itr)->shipping_name);
        item->SubItems->Add((*itr)->shipping_time);
        item->SubItems->Add((*itr)->shipping_phone);
        item->SubItems->Add((*itr)->shipping_addr);
        item->SubItems->Add("");
        item->Data = *itr;
        lastOrderdate = (*itr)->order_date;

        total += (*itr)->getOrderTotal();
        realtotal += (*itr)->getOrderRealTotal();
    }

    item = OrderListView->Items->Add();
    item->Caption = "----------";
    item->SubItems->Add("合计：");
    item->SubItems->Add(FormatCurrency(total));
    item->SubItems->Add(FormatCurrency(realtotal));
    item->SubItems->Add("微信支付：");
    item->SubItems->Add(FormatCurrency(weixin));
    item->SubItems->Add("到付：");
    item->SubItems->Add(FormatCurrency(cash));
    item->Data = NULL;

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

void __fastcall TOrderFrame::ExportClick(TObject *Sender)
{
	AnsiString file;
	if (SaveDialog->Execute())
    	file = SaveDialog->FileName;
    else {
    	return;
    }

    FILE *fp;
    fp = fopen(file.c_str(), "w");
    if (!fp) {
    	ShowError("文件打开失败");
        return;
    }

	for (int i = 0; i < OrderListView->Items->Count; i++) {
    	AnsiString str = OrderListView->Items->Item[i]->Caption.Trim();
        Order * order = (Order*)OrderListView->Items->Item[i]->Data;

    	if (str.c_str()[0] == '-') continue;
    	fwrite(str.c_str(), str.Length(), 1, fp);
        fwrite(",", 1, 1, fp);

        for (int j = 0; j < OrderListView->Items->Item[i]->SubItems->Count; j++) {
        	str = OrderListView->Items->Item[i]->SubItems->Strings[j].Trim();
        	fwrite(str.c_str(), str.Length(), 1, fp);
            fwrite(",", 1, 1, fp);
        }

        str = (*(order->products.begin()))->quantity;
        fwrite(str.c_str(), str.Length(), 1, fp);
        fwrite("\r\n", 2, 1, fp);
    }

    fclose(fp);

    ShowInfo("导出文件成功");
}
//---------------------------------------------------------------------------

