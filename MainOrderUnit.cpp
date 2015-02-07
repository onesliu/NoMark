//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MainOrderUnit.h"
#include "CheckoutUnit.h"
#include "LoginDlgUnit.h"
#include <strstream>
#include "json/json.h"
#include "Order.h"
#include "SoundPlay.h"
#include "LoginDlgUnit.h"
#include "CommonUnit.h"
#include "Janitor.h"
#include "MessageBoxes.h"
#include "Scale.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "OrderFrameUnit"
#pragma resource "*.dfm"

TMainOrderForm *MainOrderForm;
OrderList * orderlist = 0;
OrderList * querylist = 0;
SoundPlay   soundplay;

//---------------------------------------------------------------------------
__fastcall TMainOrderForm::TMainOrderForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::CheckoutButtonClick(TObject *Sender)
{
    if ( httpThread->m_bLogin == false )
    {
        ShowError("������ϣ�δ��¼��������");
        return;
    }

	AnsiString bstr = httpThread->GetBalance();
    if (bstr == "") {
    	ShowError("���ܶ�ȡ������Ϣ");
        return;
    }

    Balance * balance = new Balance();
    Janitor g_balance(del<Balance>, balance);
    if (balance->ParseBalance(bstr) == false) {
    	ShowError("���ܶ�ȡ������Ϣ");
        return;
    }
    
    CheckoutForm->ShowBalance(balance);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::LoginButtonClick(TObject *Sender)
{
    LoginDlg->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::TabSheet1Show(TObject *Sender)
{
    OrderFrame1->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_WAITING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet2Show(TObject *Sender)
{
    OrderFrame2->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_PAYING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet3Show(TObject *Sender)
{
    OrderFrame3->FreshOrderList(orderlist, OrderStatus::ORDER_STATUS_SCALED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet5Show(TObject *Sender)
{
	OrderDate->Date = Now();
    OrderFrame5->FreshOrderList(querylist, 0);
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::BtnQueryClick(TObject *Sender)
{
	AnsiString date = OrderDate->Date.DateString();
    if (httpThread->SearchOrders(date) == false) {
    	ShowError("��ѯʧ��");
        return;
    }
    OrderFrame5->FreshOrderList(querylist, 0);
}

//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::FormCreate(TObject *Sender)
{
    orderlist = new OrderList();
    querylist = new OrderList();
    httpThread = new THttpThread(true);
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::FormDestroy(TObject *Sender)
{
	if (httpThread) {
    	if (httpThread->Suspended == false) {
			httpThread->Terminate();
    		httpThread->WaitFor();
        }
    	delete httpThread;
    }
    if (orderlist) delete orderlist;
    if (querylist) delete querylist;
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::FormShow(TObject *Sender)
{
	if (LoginDlg->ReadConfig() == false) {
	    if (LoginDlg->ShowModal() != mrOk)
    		Close();
    }

    PageControl1->ActivePageIndex = 0;
  	httpThread->Resume();
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::OrderDateChange(TObject *Sender)
{
	BtnQuery->Click();	
}
//---------------------------------------------------------------------------


void __fastcall TMainOrderForm::Button1Click(TObject *Sender)
{
    PlaySound("complete.wav", NULL, SND_FILENAME|SND_ASYNC);     
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::UpdateScalerBar(TMessage &msg)
{
	try {
	    TScale s;
    	if (s.SendScale() == true)
		    MainOrderForm->StatusBar->Panels->Items[1]->Text = "ˢ������Ƴɹ���" + AnsiString(httpThread->scale_count) + "����¼";
        else {
            MainOrderForm->StatusBar->Panels->Items[1]->Text = "ˢ������Ƴ���" + s.errmsg;
        }
    } catch(...) {
    	MainOrderForm->StatusBar->Panels->Items[1]->Text = "ˢ������Ƴ���δ֪�쳣";
    }
}
//---------------------------------------------------------------------------


void __fastcall TMainOrderForm::UpdateScaleClick(TObject *Sender)
{
        /* Get product info */
        AnsiString strProductInfo = httpThread->GetProductInfo(true);
        if ( strProductInfo != "" )
        {
            if ( httpThread->ParseProductInfo(strProductInfo) )
            {
                TMessage msg;
                UpdateScalerBar(msg);
            }
            else {
               	MainOrderForm->StatusBar->Panels->Items[1]->Text = "������������ݳ���";
            }
        }
        else {
    	    MainOrderForm->StatusBar->Panels->Items[1]->Text = "��ȡԶ�̲�Ʒ�۸�ʧ��";
        }
}
//---------------------------------------------------------------------------

