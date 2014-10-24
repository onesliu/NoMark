//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MainOrderUnit.h"
#include "CheckoutUnit.h"
#include "LoginDlgUnit.h"
#include "fstream.h"
#include <cassert>
#include "json/json.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "OrderFrameUnit"
#pragma resource "*.dfm"
TMainOrderForm *MainOrderForm;
OrderList orderlist;
OrderList querylist;
//---------------------------------------------------------------------------
__fastcall TMainOrderForm::TMainOrderForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::ToolButton2Click(TObject *Sender)
{
    CheckoutForm->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::ToolButton1Click(TObject *Sender)
{
    LoginDlg->ShowModal();    
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::TabSheet1Show(TObject *Sender)
{
    OrderFrame1->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_WAITING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet2Show(TObject *Sender)
{
    OrderFrame2->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_PAYING);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet3Show(TObject *Sender)
{
    OrderFrame3->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_SCALED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet4Show(TObject *Sender)
{
    OrderFrame4->FreshOrderList(&orderlist, OrderStatus::ORDER_STATUS_FINISHED);
}
//---------------------------------------------------------------------------
void __fastcall TMainOrderForm::TabSheet5Show(TObject *Sender)
{
    OrderFrame5->FreshOrderList(&querylist, 0);
}
//---------------------------------------------------------------------------

void __fastcall TMainOrderForm::BtnQueryClick(TObject *Sender)
{
    ifstream ifs;
    ifs.open("testjson.json");
    assert(ifs.is_open());
 
    Json::Reader reader;
    Json::Value root;
    
    if (!reader.parse(ifs, root, false))
    {
        return ;
    }
 
    std::string name = root["name"].asString();
    AnsiString str;
    str = name.c_str();
    int age = root["age"].asInt(); 
}
//---------------------------------------------------------------------------

