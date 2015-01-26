//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderInfoUnit.h"
#include "ScaleInputUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "MainOrderUnit.h"
#include "BarcodeUnit.h"

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
        ProductList->Enabled = true;
        break;
    case OrderStatus::ORDER_STATUS_SCALED:
    	ConfirmBtn->Enabled = true;
        ConfirmBtn->Caption = "配送完成";
        ConfirmBtn->OnClick = ConfirmBtnClick2;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
        ProductList->Enabled = false;
        break;
    default:
    	ConfirmBtn->Enabled = false;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
        ProductList->Enabled = false;
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
        item->SubItems->Add(FormatCurrency(p->price) + "/" + p->unit);
        item->SubItems->Add(AnsiString(p->quantity) + p->perunit);
        item->SubItems->Add(prefix + (p->perweight * p->quantity) + p->weightunit);
        item->SubItems->Add(AnsiString(p->realweight) + p->weightunit);
        item->SubItems->Add(FormatCurrency(p->realtotal));
        item->Data = p;
    }
    ProductList->Items->EndUpdate();

    ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ProductListDblClick(TObject *Sender)
{
    if ( ProductList->Selected == NULL ) return;
    
	Product * p = (Product*)ProductList->Selected->Data;
	ScaleInputForm->ShowScale(p);
	ProductList->Selected->SubItems->Strings[3] = AnsiString(p->realweight) + p->weightunit;
	ProductList->Selected->SubItems->Strings[4] = AnsiString(FormatCurrency(p->realtotal));
    RealTotal->Caption = FormatCurrency(order->getOrderRealTotal());
}
//---------------------------------------------------------------------------
/*
 * Used for scanning gun
 */
bool __fastcall  TOrderInfoForm::ScanningGun(char &Key)
{
    if ( Key != 0x0D )
    {
        AnsiString str;
        str.printf("%c", Key);
        m_strKeyInput += str;
    }
    else
    {
        IBarcode barcode_scan, barcode_ean;
        for ( int i=0; i<ProductList->Items->Count; i++ )
        {
            Product *p = (Product*)ProductList->Items->Item[i]->Data;
            
            if ( barcode_scan.parseCode(m_strKeyInput) == false ) return false;
            if ( barcode_ean.parseCode(p->ean) == false ) return false;
            
            if ( barcode_scan.code != barcode_ean.code )
            {
                continue;
            }
            else
            {
                p->realweight = barcode_scan.weight * 2;
                p->realtotal = RoundTo(p->realweight * p->price, -2);
                p->realweight = Floor(p->realweight * 500);
                
                ProductList->Items->Item[i]->SubItems->Strings[3] = AnsiString(p->realweight) + p->weightunit;
                ProductList->Items->Item[i]->SubItems->Strings[4] = AnsiString(FormatCurrency(p->realtotal));
                
                RealTotal->Caption = FormatCurrency(order->getOrderRealTotal());
                
                m_strKeyInput = "";
                
                break;
            }
        }

        m_strKeyInput = "";
    }

    return true;
}

void __fastcall TOrderInfoForm::ProductListKeyPress(TObject *Sender,
      char &Key)
{
    if ( (Key == 0x0D) && ( m_strKeyInput == "") )
    {  
        ProductListDblClick(Sender);
    }
    else
    {
        if ( ((Key >= '0') && (Key <= '9')) || (Key == 0x0D) )
        {
            ScanningGun(Key);
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::FormShow(TObject *Sender)
{
	if (order->order_status == OrderStatus::ORDER_STATUS_WAITING)
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

