//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderInfoUnit.h"
#include "ScaleInputUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "MainOrderUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOrderInfoForm *OrderInfoForm;
//---------------------------------------------------------------------------
__fastcall TOrderInfoForm::TOrderInfoForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ShowOrder(Order *order)
{
	this->order = order;
	OrderStatus * os = OrderStatus::getInstance();
	OrderNo->Caption = order->order_id;
    OrderTime->Caption = order->order_createtime;
    Status->Caption = os->getStatus(order->order_status);
    Customer->Caption = order->customer_name;
    Address->Caption = order->shipping_addr;
    Telephone->Caption = order->customer_phone;
    ShippingPhone->Caption = order->shipping_phone;
    ShippingTime->Caption = order->shipping_time;
    Total->Caption = FormatCurrency(order->getOrderTotal());
    RealTotal->Caption = FormatCurrency(order->getOrderRealTotal());
    Comment->Caption = order->comment;

    switch(order->order_status) {
    case OrderStatus::ORDER_STATUS_WAITING:
    	ConfirmBtn->Enabled = true;
    	ConfirmBtn->Caption = "称重完成";
        ConfirmBtn->OnClick = ConfirmBtnClick1;
        StoreSelect->Enabled = true;
        ChangeStoreBtn->Enabled = true;
        break;
    case OrderStatus::ORDER_STATUS_SCALED:
    	ConfirmBtn->Enabled = true;
        ConfirmBtn->Caption = "配送完成";
        ConfirmBtn->OnClick = ConfirmBtnClick2;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
        break;
    default:
    	ConfirmBtn->Enabled = false;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
    }

    ProductList->Items->BeginUpdate();
    ProductList->Items->Clear();
    std::list<Product*>::iterator itr;
    for(itr = order->products.begin(); itr != order->products.end(); ++itr) {
    	Product *p = *itr;
        if (p == NULL) continue;
        AnsiString prefix = "";
        if (p->product_type > 0)
        	prefix = "约";
        TListItem * item = ProductList->Items->Add();
        item->Caption = p->product_name;
        item->SubItems->Add(p->price);
        item->SubItems->Add(AnsiString(p->quantity) + p->perunit);
        item->SubItems->Add(prefix + (p->perweight * p->quantity) + "克");
        item->SubItems->Add(AnsiString(p->realweight) + "克");
        item->SubItems->Add(FormatCurrency(p->realtotal));
        item->Data = p;
    }
    ProductList->Items->EndUpdate();

    ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ProductListDblClick(TObject *Sender)
{
	Product * p = (Product*)ProductList->Selected->Data;
	ScaleInputForm->ShowScale(p);
	ProductList->Selected->SubItems->Strings[3] = AnsiString(p->realweight) + "克";
	ProductList->Selected->SubItems->Strings[4] = AnsiString(FormatCurrency(p->realtotal));
    RealTotal->Caption = FormatCurrency(order->getOrderRealTotal());
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ProductListKeyPress(TObject *Sender,
      char &Key)
{
	if (Key == 0x0d) ProductListDblClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::FormShow(TObject *Sender)
{
	ProductList->SetFocus();	
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ConfirmBtnClick1(TObject *Sender)
{
	if (order->hasScanedOver() == false) {
    	ShowError("还有商品没称重");
        return;
    }

    if ( MainOrderForm->httpThread->CommitOrder(order, order->getScanedOver()) == false) {
    	ShowError("提交到服务器失败");
        return;
    }

    order->commit(order->getScanedOver());
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------
   
void __fastcall TOrderInfoForm::ConfirmBtnClick2(TObject *Sender)
{
    if ( MainOrderForm->httpThread->CommitOrder(order, order->getDelivered()) == false) {
    	ShowError("提交到服务器失败");
        return;
    }

    order->commit(order->getDelivered());
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

