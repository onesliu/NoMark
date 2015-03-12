//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderInfoUnit.h"
#include "ScaleInputUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
#include "MainOrderUnit.h"
#include "BarcodeUnit.h"
#include "GPrinterUnit.h"
#include "CashInputUnit.h"

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
    Customer->Caption = order->shipping_name;
    Address->Caption = order->shipping_addr;
    Telephone->Caption = order->customer_phone;
    ShippingPhone->Caption = order->shipping_phone;
    ShippingTime->Caption = order->shipping_time;
    Total->Caption = FormatCurrency(order->getOrderTotal());
    RealTotal->Caption = FormatCurrency(order->getOrderRealTotal());
    CostPayLabel->Caption = FormatCurrency(order->costpay);
    CashPayLabel->Caption = FormatCurrency(order->cashpay);
    Comment->Caption = order->comment;

    switch(order->order_status) {
    case OrderStatus::ORDER_STATUS_WAITING:
        ConfirmBtn->Enabled = true;
        ConfirmBtn->Caption = "称重完成";
        ConfirmBtn->OnClick = ConfirmBtnClick1;
        StoreSelect->Enabled = true;
        ChangeStoreBtn->Enabled = true;
        ProductList->Enabled = true;
        PrintBtn->Enabled = false;
        CancelOrder->Enabled = true;
        CashPay->Enabled = false;
        CashPayBtn->Enabled = false;
        CostPayBtn->Enabled = true;
        break;
    case OrderStatus::ORDER_STATUS_PAYING:
        ConfirmBtn->Enabled = false;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
        ProductList->Enabled = false;
        PrintBtn->Enabled = true;
        CancelOrder->Enabled = true;
        CashPay->Enabled = true;
        CostPayBtn->Enabled = true;
        break;
    case OrderStatus::ORDER_STATUS_SCALED:
        ConfirmBtn->Enabled = true;
        ConfirmBtn->Caption = "配送完成";
        ConfirmBtn->OnClick = ConfirmBtnClick2;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
        ProductList->Enabled = false;
        PrintBtn->Enabled = true;
        if (order->iscash > 0) {
            CancelOrder->Enabled = true;
            CashPayBtn->Enabled = true;
        }
        else {
            CancelOrder->Enabled = false;
            CashPayBtn->Enabled = false;
        }
        CashPay->Enabled = false;
        CostPayBtn->Enabled = true;
        break;
    default:
        ConfirmBtn->Enabled = false;
        StoreSelect->Enabled = false;
        ChangeStoreBtn->Enabled = false;
        ProductList->Enabled = false;
        PrintBtn->Enabled = true;
        CancelOrder->Enabled = false;
        CashPay->Enabled = false;
        CostPayBtn->Enabled = false;
        CashPayBtn->Enabled = false;
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
        item->SubItems->Add(prefix + p->perweight + p->weightunit);
        item->SubItems->Add(prefix + (p->perweight * p->quantity) + p->weightunit);
        item->SubItems->Add(FormatCurrency(p->total));
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
    ProductList->Selected->SubItems->Strings[5] = AnsiString(p->realweight) + p->weightunit;
    ProductList->Selected->SubItems->Strings[6] = AnsiString(FormatCurrency(p->realtotal));
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

            if ( barcode_scan.parseCode(m_strKeyInput) == false )
            {
                m_strKeyInput = "";
                continue;
            }
            if ( barcode_ean.parseCode(p->ean) == false )
            {
                m_strKeyInput = "";
                continue;
            }

            if ( barcode_scan.code != barcode_ean.code )
            {
                continue;
            }
            else
            {
                p->realweight = barcode_scan.weight * 2;
                p->realtotal = RoundTo(p->realweight * p->price, -2);
                p->realweight = Floor(p->realweight * 500);

                ProductList->Items->Item[i]->SubItems->Strings[5] = AnsiString(p->realweight) + p->weightunit;
                ProductList->Items->Item[i]->SubItems->Strings[6] = AnsiString(FormatCurrency(p->realtotal));

                RealTotal->Caption = FormatCurrency(order->getOrderRealTotal());

                p->finishScan();

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

    ShowCostPay();

    if ( MainOrderForm->httpThread->CommitOrder(order, order->getScanedOver()) == false) {
        ShowError("提交到服务器失败");
        return;
    }

    order->commit(order->getScanedOver());
    PrintSell();
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ConfirmBtnClick2(TObject *Sender)
{
	if (order->iscash > 0) {
	    ShowCashPay();

	    if (order->cashpay <= 0) {
    	    ShowError("到付订单必须要输入实际收款金额");
        	return;
	    }

        double offset = order->cashpay - order->getOrderRealTotal();
        if (abs(offset) > 1) {
        	if (ShowYesNo("实收金额与订单金额差距%s，继续吗？", FormatCurrency(abs(offset))) == false)
            	return;
        }
    }

    if ( MainOrderForm->httpThread->CommitOrder(order, order->getDelivered()) == false) {
        ShowError("提交到服务器失败");
        return;
    }

    order->commit(order->getDelivered());
    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::PrintSell()
{
    IPrinter * printer = new GiChengPrinter();

    if (printer->OpenPrinter() == false) {
        return;
    }

    printer->ResetPrinter();

    printer->PrintLogo("菜鸽子");
    int col[4];
    col[0] = 11;
    col[1] = 6;
    col[2] = 6;
    col[3] = 6;

    printer->PrintStr("商品品名", col[0]);
    printer->PrintBin(' ');
    printer->PrintStr("单价", col[1], IPrinter::ALIGN_RIGHT);
    printer->PrintBin(' ');
    printer->PrintStr("数量", col[2], IPrinter::ALIGN_RIGHT);
    printer->PrintBin(' ');
    printer->PrintStr("小计", col[3], IPrinter::ALIGN_RIGHT);
    printer->PrintReturn();

    std::list<Product*>::iterator itr;
    for(itr = order->products.begin(); itr != order->products.end(); ++itr) {
        Product *p = *itr;
        if (p == NULL) continue;
        printer->PrintStr(p->product_name, col[0]);
        printer->PrintBin(' ');
        printer->PrintStr(FormatCurrency(p->price) + "/" + p->unit, col[1], IPrinter::ALIGN_RIGHT);
        printer->PrintBin(' ');
        printer->PrintStr(AnsiString(p->realweight) + p->weightunit, col[2], IPrinter::ALIGN_RIGHT);
        printer->PrintBin(' ');
        printer->PrintStr(FormatCurrency(p->realtotal), col[3], IPrinter::ALIGN_RIGHT);
        printer->PrintReturn();
    }
    printer->PrintReturn();
    printer->PrintItem( "合计金额", FormatCurrency(order->getOrderRealTotal()) );
    printer->PrintCharLine( '-' );
    printer->PrintLine("客户：" + Customer->Caption);
    printer->PrintLine("电话：" + ShippingPhone->Caption);
    printer->PrintLine("地址：" + Address->Caption);
    printer->PrintTail("成都青悠悠电子商务有限公司");

    //printer->KickOut();
end:
    printer->ClosePrinter();
    delete printer;
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::PrintBtnClick(TObject *Sender)
{
    PrintSell();
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::CashPayClick(TObject *Sender)
{
    if (order == 0) return;

    if (MainOrderForm->httpThread->CashPay(order) == true) {
        ModalResult = mrOk;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::CancelOrderClick(TObject *Sender)
{
    if (order == 0) return;

    if (MainOrderForm->httpThread->CancelOrder(order) == true) {
        ModalResult = mrOk;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ShowCostPay()
{
	order->costpay = CashInputForm->ShowCashInput("如果该订单有零星采购，请输入采购金额：", order->costpay);
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::ShowCashPay()
{
	order->cashpay = CashInputForm->ShowCashInput("请输入到付订单实收金额：", order->cashpay);
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::CostPayBtnClick(TObject *Sender)
{
	ShowCostPay();	
}
//---------------------------------------------------------------------------

void __fastcall TOrderInfoForm::CashPayBtnClick(TObject *Sender)
{
	if (order->iscash > 0)
	    ShowCashPay();
}
//---------------------------------------------------------------------------

