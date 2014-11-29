//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderInfoUnit.h"
#include "ScaleInputUnit.h"
#include "CommonUnit.h"
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

