//---------------------------------------------------------------------------

#include <vcl.h>
#include <vector>
#include <map>
#include <Math.hpp>
#pragma hdrstop

#include "OrderUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
#include "GPrinterUnit.h"
#include "UserLoginUnit.h"
#include "SetChangeUnit.h"
#include "CashSetUnit.h"
#include "ShowChangeUnit.h"
#include "SelectUnit.h"
#include "PrinterUnit.h"
#include "CustomerLedUnit.h"
#include "scale.h"
#include "BarcodeUnit.h"
#include "types.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOrderForm *OrderForm;
using namespace std;

//---------------------------------------------------------------------------
__fastcall TOrderForm::TOrderForm(TComponent* Owner)
    : TForm(Owner)
{
    pControl = 0;
}
//---------------------------------------------------------------------------

void AutoBalance( vector<double> costs, vector<double> &prices, double total )
{
    double dc = 0, dp = 0;
    int i, j;
    int num = costs.size();
    int maxprofit, minprofit;
    int sub;
    double remain;

    if ( costs.size() != prices.size() ) return;

    for ( i = 0; i < num; i++ )
    {
        dc += costs[i];
        dp += prices[i];
    }

    if ( dp == total ) return;
    if ( dp > total )
    {
        //sub = int((dp-total)*10) + 1;
        //remain = (dp-total)-(double(sub)/10)+0.1;
        sub = int(dp-total) + 1;
        remain = dp-total-sub+1;
        for( j = 0; j < sub; j++ )
        {
            maxprofit = 0;
            for ( i = 1; i < num; i++ )
            {
                if ( prices[i]-costs[i] > prices[i-1]-costs[i-1] )
                    maxprofit = i;
            }

            if ( j+1 == sub )
                prices[maxprofit] -= remain;
            else
                //prices[maxprofit] -= 0.1;
                prices[maxprofit] -= 1;
        }
    }

    if ( dp < total )
    {
        //sub = int((total-dp)*10) + 1;
        //remain = (total-dp)-(double(sub)/10)+0.1;
        sub = int(total-dp) + 1;
        remain = total-dp-sub+1;
        for( j = 0; j < sub; j++ )
        {
            minprofit = 0;
            for ( i = 1; i < num; i++ )
            {
                if ( prices[i]-costs[i] < prices[i-1]-costs[i-1] )
                    minprofit = i;
            }

            if ( j+1 == sub )
                prices[minprofit] += remain;
            else
                //prices[minprofit] += 0.1;
                prices[minprofit] += 1;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::NumberKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '+' || Key == '*' || Key == '/' || Key == '-' )
    {
        KeyProcess1( Key );
        Abort();
    }
    //if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();

    AnsiString sql, barcode;
    IBarcode oBar;

    if ( Key == 0x0D )
    {
        if ( oBar.parseCode( Number->Text ) == false )
        {
            barcode = SelectForm->SelectGood( Number->Text, OrderList );
            if ( barcode == "" ) Abort();
            Number->Text = barcode;
            oBar.parseCode( barcode );
        }

        title->Caption = "售货交易单(使用中)";

        sql.sprintf( "select idx,name,labelprice,lowestprice,cost,goodnumber,goodtype from t_goods where barcode like '%%%s%%'", oBar.code );
        q->SQL->Text = sql;
        q->Prepare();
        q->Open();
        if ( q->RecordCount == 1 )
        {
            if ( q->FieldByName("goodnumber")->AsFloat <= 0 )
            {
                ShowError( "该物品已售完" );
                q->Close();
                Number->SelectAll();
                return;
            }

            sCount = q->FieldByName("goodnumber")->AsFloat;

            OrderList->Selected->Caption = q->FieldByName("name")->AsString;
            Price->Text = MoneyStr(q->FieldByName("labelprice")->AsFloat);

            if ( q->FieldByName("goodtype")->AsInteger == 0 ) // 计件商品
                OrderList->Selected->SubItems->Strings[1] = "1";
            else {
                if (oBar.type != IBarcode::WEIGHT) {
                    ShowError( "不是条码称打印的条码" );
                    q->Close();
                    Number->SelectAll();
                    return;
                }
                OrderList->Selected->SubItems->Strings[1] = oBar.value.ToDouble() / 1000;
                SellCount->Text = oBar.value.ToDouble() / 1000;
            }

            OrderList->Selected->Data = (void*)q->FieldByName("idx")->AsInteger;
            CurLabelPrice = q->FieldByName("labelprice")->AsFloat;
            CurLowestPrice = q->FieldByName("lowestprice")->AsFloat;
            reduce = 10;
            cost = q->FieldByName("cost")->AsFloat;

            OrderList->Selected->SubItems->Strings[3] = cost * oBar.value.ToDouble() / 1000;
            if ( CurLowestPrice <= 0 )
                OrderList->Selected->SubItems->Strings[4] = cost / MinProfitPercent;
            else
                OrderList->Selected->SubItems->Strings[4] = q->FieldByName("lowestprice")->AsString;
        }
        else
        {
            ShowError( "数据库中没有该物品" );
            q->Close();
            Number->SelectAll();
            return;
        }
        q->Close();

        LeaveBox( Number, NumberLabel );
        EnterBox( Price, PriceLabel );
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::PriceKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '*' || Key == '/' || Key == '-' ) KeyProcess1( Key );
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();

    if ( Key == 0x0D )
    {
        if ( Price->Text == "" ) Abort();
        try {
            if ( Price->Text.ToDouble() < 0 ) {
                Price->Text == "";
                Abort();
            }
        } catch(...)
        {
            ShowError( "货币输入错误, 请重新输入" );
            Price->SelectAll();
            Abort();
        }

        OrderList->Selected->SubItems->Strings[0] = MoneyStr( Price->Text.ToDouble() );
        Price->Text = MoneyStr( Price->Text.ToDouble() );

        if (SellCount->Text.ToDouble() <= 0)
            SellCount->Text = 1;

        LeaveBox( Price, PriceLabel );
        EnterBox( SellCount, SellCountLabel );
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::PriceKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    oReduce.cost = cost;
    oReduce.label_price = CurLabelPrice;
    oReduce.lowest_price = CurLowestPrice;
    oReduce.reduce = reduce;

    if ( Key == 40 || Key == 38 )
    {
        if ( Key == 40 )
            oReduce.ReduceDown();
        if ( Key == 38 )
            oReduce.ReduceUp();

        reduce = oReduce.reduce;
        Reduce->Caption = oReduce.reduce_label;
        Price->Text = oReduce.reduce_value;
        Price->SelectAll();
        Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::NewGoodItem()
{
    TListItem * pItem;

    pItem = OrderList->Items->Add();
    pItem->SubItems->Text = " \n \n \n \n \n";
    pItem->Selected = true;
    pItem->ImageIndex = 0;
    LeaveBox( Number, NumberLabel );
    LeaveBox( Price, PriceLabel );
    LeaveBox( SellCount, SellCountLabel );
    Number->Text = "";
    Price->Text = "";
    SellCount->Text = "";
    Reduce->Caption = "不打";

    EnterBox( Number, NumberLabel );
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::CancelGoodItem()
{
    TListItem *pItem = OrderList->Selected;
    if ( pItem->Index > 0 )
        OrderList->Items->Item[ pItem->Index - 1 ]->Delete();
    pItem->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::NewOrderList()
{
    title->Caption = "售货交易单(新)";
    OrderList->Clear();
    TabSheet1->TabVisible = false;
    TabSheet2->TabVisible = false;
    OrderGuide->ActivePageIndex = 0;
    NewGoodItem();
    ShowCustomerLed(0,"");
}
//---------------------------------------------------------------------------

bool __fastcall TOrderForm::CommitOrderList()
{
    AnsiString sql, sql1;
    TListItem *pItem;
    vector<double> cl, pl, lowl;
    bool ret;
    double total;
    AnsiString sTotal, sSellTime;

    try {
        for ( int i = 0; i < OrderList->Items->Count; i++ )
        {
            pItem = OrderList->Items->Item[i];
            cl.push_back( pItem->SubItems->Strings[3].ToDouble() );
            lowl.push_back( pItem->SubItems->Strings[4].ToDouble() );
            pl.push_back( pItem->SubItems->Strings[2].ToDouble() );
        }

        AutoBalance( lowl, pl, CheckOut->Text.ToDouble() );
        total = 0;
        for ( unsigned int i = 0; i < pl.size(); i++ )
        {
            total += pl[i];
        }
        sTotal.sprintf( "%.2f", total );
        if ( sTotal != CheckOut->Text )
        {
            ShowError("合计价格自动计算错误");
            return false;
        }

        sql1 = "insert into t_order_goods(orderlistidx, goodidx, price, cost, profit, counts, selltime) \
        values(%d, %d, %.2f, %.2f, %.2f, %s, '%s');";

        sSellTime = Now().FormatString("yyyy-mm-dd hh:nn:ss");

        for ( unsigned int i = 0; i < pl.size(); i++ )
        {
            pItem = OrderList->Items->Item[i];
            sql.sprintf( sql1.c_str(), orderlist, (int)pItem->Data, pl[i], cl[i], pl[i]-cl[i],
                pItem->SubItems->Strings[1], sSellTime );
            q->SQL->Text = sql;
            q->Prepare();
            q->ExecSQL();

            StorageUpdate( (int)pItem->Data, -pItem->SubItems->Strings[1].ToDouble() );
        }

        ret = CalcDayTotal( orderlist );
    }
    catch (...) {
        return false;
    }

    PrintSellList1(sSellTime);
    return ret;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::EnterBox( TEdit *pEdit, TLabel *pLabel )
{
    pEdit->Enabled = true;
    pEdit->Color = clWhite;
    pEdit->Font->Color = clBlack;
    pLabel->Font->Style = TFontStyles()<< fsBold;
    pEdit->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::LeaveBox( TEdit *pEdit, TLabel *pLabel )
{
    pEdit->Enabled = false;
    pEdit->Color = clGray;
    pEdit->Font->Color = clWhite;
    pLabel->Font->Style = TFontStyles();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::FormShow(TObject *Sender)
{
    if ( Application->Terminated ) return;

    AnsiString stoday, sql;

    if ( TestMode > 0 )
    {
        TestMark1->Visible = true;
        TestMark2->Visible = true;
        TestMark3->Visible = true;
    }
    else if ( TestMode < 0 )
    {
        TestMark1->Caption = "补售";
        TestMark2->Caption = "补售";
        TestMark3->Caption = "补售";
        TestMark1->Visible = true;
        TestMark2->Visible = true;
        TestMark3->Visible = true;
    }
    else
    {
        TestMark1->Visible = false;
        TestMark2->Visible = false;
        TestMark3->Visible = false;
    }

    WindowState = wsNormal;
    SellPage->ActivePageIndex = 0;

    today = Now();
    stoday = today.FormatString("yyyy-mm-dd");
    DutyTimer->Enabled = true;

    NewOrderList();

    GoodType->Items->Clear();
    q->SQL->Text = "select * from t_goodtype";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        GoodType->Items->AddObject( q->FieldByName("name")->AsString, (TObject*)q->FieldByName("idx")->AsInteger );
    }
    q->Close();

    GoodType->ItemIndex = -1;

    // create a order list
    sql.sprintf( "select idx from t_order_list where orderdate='%s'", stoday );
    q->SQL->Text = sql;
    q->Prepare();
    q->Open();
    if ( q->RecordCount > 0 )
        orderlist = q->FieldByName("idx")->AsInteger;
    else
        orderlist = 0;
    q->Close();

    if ( orderlist == 0 )
    {
        sql.sprintf( "insert into t_order_list(orderdate, desp) values('%s', '%s')",
            stoday, stoday+" 全天销售记录" );
        q->SQL->Text = sql;
        q->Prepare();
        q->ExecSQL();
        sql.sprintf( "select idx from t_order_list where orderdate='%s'", stoday );
        q->SQL->Text = sql;
        q->Prepare();
        q->Open();
        orderlist = q->FieldByName("idx")->AsInteger;
        q->Close();

        TotalChange->Caption = "0.00";
        if ( SetChangeForm->SetChange( orderlist ) == true )
        {
            CalcDayTotal( orderlist );
        }
    }
    else
    {
        FreshTotal();
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::KeyProcess1( char &Key )
{
    switch ( Key ) {
    case '+':
        if ( OrderList->Selected->Index == 0 ) return;
        OrderList->Selected->Delete();
        OrderGuide->ActivePageIndex = 1;
        LeaveBox( Total, TotalLabel );
        LeaveBox( CheckOut, CheckOutLabel );
        LeaveBox( GetMoney, GetMoneyLabel );
        AddUpTo();
        EnterBox( CheckOut, CheckOutLabel );
        break;
    case '*':
        OrderList->Selected->Delete();
        NewGoodItem();
        break;
    case '/':
        if ( ShowYesNo("真的要取消此笔售货单吗?") == true )
            NewOrderList();
        break;
    case '-':
        CancelGoodItem();
        NewGoodItem();
        break;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::AddUpTo()
{
    double total = 0.0;
    TotalCost = 0.0;
    TotalLowest = 0.0;

    for ( int i = 0; i < OrderList->Items->Count; i++ )
    {
        total += OrderList->Items->Item[i]->SubItems->Strings[2].ToDouble();
        TotalCost += OrderList->Items->Item[i]->SubItems->Strings[3].ToDouble();
        TotalLowest += OrderList->Items->Item[i]->SubItems->Strings[4].ToDouble();
    }

    Total->Text = MoneyStr( RoundToInt(total) );
    CheckOut->Text = Total->Text;
    GetMoney->Text = "";

    TotalReduce = 10;

    ShowCustomerLed(CustomerLed::TOTAL, Total->Text);

}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ShowCustomerLed(int status, AnsiString price) {
    CustomerLed * led = new CustomerLed();
    if (led->Open() == true) {
        led->Reset();
        led->OpenStatusLight(status);
        if (status > 0)
            led->WritePrice(price);
        else
            led->WritePrice("0.00");
        led->Close();
    }
    else {
        //ShowError("无法打开客户显示器");
    }
    delete led;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::CheckOutKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '/' ) {
        if ( ShowYesNo("真的要取消此笔售货单吗?") == true )
            NewOrderList();
    }
    if ( Key == '-' ) {
        OrderGuide->ActivePageIndex = 0;
        NewGoodItem();
        ShowCustomerLed(0,"");
    }
    if ( Key == 0x0D || Key == '+' )
    {
        if ( CheckOut->Text == "" ) Abort();
        CheckOut->Text = MoneyStr(CheckOut->Text.ToDouble());
        LeaveBox( CheckOut, CheckOutLabel );
        EnterBox( GetMoney, GetMoneyLabel );
    }

    if ( (Key < '0' || Key > '9') && Key != 8 && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::GetMoneyKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '/' ) {
        if ( ShowYesNo("真的要取消此笔售货单吗?") == true )
            NewOrderList();
    }
    if ( Key == '-' ) {
        OrderGuide->ActivePageIndex = 0;
        NewGoodItem();
        ShowCustomerLed(0,"");
    }
    if ( Key == '+' || Key == 0x0D )
    {
        if ( GetMoney->Text == "" ) Abort();

        // sellsheet over
        if ( GiveChange->Caption.ToDouble() < 0 ) {
            GetMoney->SelectAll();
            Abort();
        }

        if ( CommitOrderList() == false ) {
            ShowError( "此次销售交易失败" );
        }
        else
        {
            ShowChangeForm->ShowChange( GiveChange->Caption );
            NewOrderList();
        }
    }

    if ( (Key < '0' || Key > '9') && Key != 8 && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SellSheetShow(TObject *Sender)
{
    if ( Application->Terminated ) return;
    if ( pControl )
        pControl->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::NumberEnter(TObject *Sender)
{
    pControl = (TWinControl*)Sender;
    char key = 0x0D;
    if (pControl->Name == "Price") {
        PriceKeyPress(pControl, key);
    }

    if (pControl->Name == "SellCount") {
        SellCountKeyPress(pControl, key);
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::FreshSellSheet( TDateTime date )
{
    TListItem *pItem;

    AnsiString dateStr = date.FormatString("yyyy-mm-dd");

    //CalcDayTotal( orderlist );

    curlist = 0;
    SellGoodsList->Items->BeginUpdate();
    SellGoodsList->Items->Clear();
    SellGoodsList->Items->EndUpdate();
    CancelList->Items->BeginUpdate();
    CancelList->Items->Clear();
    CancelList->Items->EndUpdate();
    try
    {
        // Fresh SellGoodsList
        AnsiString sql = "select g.name, g.labelprice, g.barcode, \
        og.idx as ordergoodidx, og.price, og.counts, og.selltime, og.canceldate, \
        ol.totalprice, ol.totalsellnum, ol.totalcancelnum, ol.totalcash, ol.totalchange, ol.idx as olidx \
        from t_order_list ol \
        left outer join t_order_goods og on ol.idx = og.orderlistidx \
        left outer join t_goods g on og.goodidx = g.idx \
        where ol.orderdate='" + dateStr + "'";
        q->SQL->Text = sql;
        q->Prepare();
        q->Open();
        for ( q->First(); !q->Eof; q->Next() )
        {
            pItem = SellGoodsList->Items->Add();
            pItem->Caption = q->FieldByName("name")->AsString;
            pItem->SubItems->Add( MoneyStr(q->FieldByName("price")->AsFloat) );
            pItem->SubItems->Add( WeightStr(q->FieldByName("counts")->AsFloat) );
            pItem->SubItems->Add( q->FieldByName("selltime")->AsDateTime.FormatString("hh:nn:ss") );
            pItem->SubItems->Add( q->FieldByName("barcode")->AsString );
            if ( q->FieldByName("canceldate")->AsString != "" )
            {
                pItem->ImageIndex = 1;
                pItem->SubItems->Add( q->FieldByName("canceldate")->AsDateTime.FormatString("yyyy-mm-dd") + " 退此物品" );
            }
            else
            {
                pItem->ImageIndex = 0;
                pItem->SubItems->Add( "" );
            }

            pItem->Data = (void*)q->FieldByName("ordergoodidx")->AsInteger;
            curlist = q->FieldByName("olidx")->AsInteger;
        }
        q->Close();

        // Fresh CancelList
        sql = "select g.name, g.labelprice, g.barcode, \
        og.idx as ordergoodidx, og.price, og.counts, og.selltime, og.canceldate, \
        ol.totalprice, ol.totalsellnum, ol.totalcancelnum, ol.totalcash \
        from t_order_list ol \
        left outer join t_order_goods og on ol.idx = og.orderlistidx \
        left outer join t_goods g on og.goodidx = g.idx \
        where og.canceldate='" + dateStr + "'";
        q->SQL->Text = sql;
        q->Prepare();
        q->Open();
        for ( q->First(); !q->Eof; q->Next() )
        {
            pItem = CancelList->Items->Add();
            pItem->Caption = q->FieldByName("name")->AsString;
            pItem->SubItems->Add( MoneyStr(q->FieldByName("price")->AsFloat) );
            if ( q->FieldByName("labelprice")->AsFloat != 0 )
            {
                pItem->SubItems->Add( AnsiString().sprintf("%.1f折",
                    q->FieldByName("price")->AsFloat/q->FieldByName("labelprice")->AsFloat*10) );
            }
            else
            {
                pItem->SubItems->Add( "" );
            }
            pItem->SubItems->Add( WeightStr(q->FieldByName("counts")->AsFloat) );
            pItem->SubItems->Add( q->FieldByName("selltime")->AsDateTime.FormatString("yyyy-mm-dd hh:nn:ss") );
            pItem->SubItems->Add( q->FieldByName("canceldate")->AsDateTime.FormatString("yyyy-mm-dd") );
            pItem->SubItems->Add( q->FieldByName("barcode")->AsString );

            pItem->ImageIndex = 4;
            pItem->Data = (void*)q->FieldByName("ordergoodidx")->AsInteger;
        }
        q->Close();

        FreshTotal( curlist );
    } catch(...) {
        q->Close();
    }

    SellGoodsList->Width = 1000;
    CancelList->Width = 1000;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::PosGoodItem( int goodidx )
{
    if ( goodidx > 0 )
    {
        for ( int i = 0; i < SellGoodsList->Items->Count; i++ )
        {
            if ( (int)SellGoodsList->Items->Item[i]->Data == goodidx )
            {
                SellGoodsList->Items->Item[i]->Selected = true;
                break;
            }
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ChangeSheetShow(TObject *Sender)
{
    if ( Application->Terminated ) return;
    SellDate->DateTime = today;
    FreshSellSheet( today );
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SellGoodsListContextPopup(TObject *Sender,
      TPoint &MousePos, bool &Handled)
{
    TListItem *pItem = SellGoodsList->GetItemAt( MousePos.x, MousePos.y );
    if ( !pItem ) return;

    TPoint p = SellGoodsList->ClientToScreen( MousePos );
    if ( pItem->ImageIndex == 0 || pItem->ImageIndex == 2 )
    {
        SellGoodsList->PopupMenu->Popup( p.x, p.y );
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::DoCancelExecute(TObject *Sender)
{
    TListItem * pItem;

    try {

    if ( SellGoodsList->Selected && ShowYesNo("退货操作不可逆转.真的要退这些货物吗?") == false ) return;

    while ( SellGoodsList->Selected )
    {
        pItem = SellGoodsList->Selected;
        int cancelidx = (int)pItem->Data;
        int cancelgoodidx;

        q->SQL->Text = AnsiString().sprintf( "update t_order_goods set CancelDate=CURRENT_DATE where idx=%d", cancelidx );
        q->ExecSQL();

        q->SQL->Text = "select goodidx from t_order_goods where idx=" + IntToStr(cancelidx);
        q->Open();
        cancelgoodidx = q->FieldByName("goodidx")->AsInteger;
        q->Close();

        StorageUpdate( cancelgoodidx, pItem->SubItems->Strings[2].ToInt() );

        pItem->SubItems->Strings[4] = today.FormatString("yyyy-mm-dd") + " 退此物品";
        pItem->ImageIndex = 1;
        pItem->Selected = false;
    }

    CalcDayTotal( orderlist );
    if ( curlist != 0 && curlist != orderlist )
        CalcDayTotal( curlist );
    FreshSellSheet( today );

    } catch (...) {
        ShowError("退货操作不成功");
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::GetMoneyChange(TObject *Sender)
{
    if ( GetMoney->Text != "" && CheckOut->Text != "" )
        GiveChange->Caption = MoneyStr( GetMoney->Text.ToDouble() - CheckOut->Text.ToDouble() );
    else
        GiveChange->Caption = 0;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SellGoodsListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
    if ( Selected == true )
    {
        DoCancel->Enabled = false;
        if ( (Item->ImageIndex == 0 || Item->ImageIndex == 2) && Item->Caption != "" )
        {
            DoCancel->Enabled = true;
        }
    }
    else
    {
        DoCancel->Enabled = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::FormClose(TObject *Sender,
      TCloseAction &Action)
{
    CalcDayTotal( orderlist );
    DutyTimer->Enabled = false;
    if ( UserLoginForm->UserLogout() == false )
    {
        DutyTimer->Enabled = true;
        Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::CheckOutKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    oReduce.cost = TotalCost;
    oReduce.label_price = Total->Text.ToDouble();
    oReduce.lowest_price = TotalLowest;
    oReduce.reduce = TotalReduce;

    if ( Key == 40 || Key == 38 )
    {
        if ( Key == 40 )
            oReduce.ReduceDown();
        if ( Key == 38 )
            oReduce.ReduceUp();

        TotalReduce = oReduce.reduce;
        Reduce2->Caption = oReduce.reduce_label;
        CheckOut->Text = oReduce.reduce_value;
        CheckOut->SelectAll();
        Abort();
    }
}
//---------------------------------------------------------------------------
void __fastcall TOrderForm::PrintSellList1(AnsiString selltime)
{
    if ( TestMode != 0 && TestMode != 1 ) return;

    IPrinter * printer = new GiChengPrinter();

    if (printer->OpenPrinter() == false) {
        return;
    }

    printer->ResetPrinter();

    if ( TestMode == 1 )
    {
        for ( int i = 0; i < 10; i++ )
            printer->PrintReturn();
        goto end;
    }

    printer->PrintLogo();
    int col[4];
    col[0] = 11;
    col[1] = 6;
    col[2] = 6;
    col[3] = 6;

    printer->PrintStr("商品品名", col[0]);
    printer->PrintBin(' ');
    printer->PrintStr("数量", col[1], IPrinter::ALIGN_RIGHT);
    printer->PrintBin(' ');
    printer->PrintStr("单价", col[2], IPrinter::ALIGN_RIGHT);
    printer->PrintBin(' ');
    printer->PrintStr("小计", col[3], IPrinter::ALIGN_RIGHT);
    printer->PrintReturn();

    for ( int i = 0; i < OrderList->Items->Count; i++ )
    {
        printer->PrintStr(OrderList->Items->Item[i]->Caption, col[0]);
        printer->PrintBin(' ');
        printer->PrintStr(OrderList->Items->Item[i]->SubItems->Strings[1], col[1], IPrinter::ALIGN_RIGHT);
        printer->PrintBin(' ');
        printer->PrintStr(OrderList->Items->Item[i]->SubItems->Strings[0], col[2], IPrinter::ALIGN_RIGHT);
        printer->PrintBin(' ');
        printer->PrintStr(OrderList->Items->Item[i]->SubItems->Strings[2], col[3], IPrinter::ALIGN_RIGHT);
        printer->PrintReturn();
    }
    printer->PrintReturn();
    printer->PrintItem( "合计金额", MoneyStr(CheckOut->Text.ToDouble()) );
    printer->PrintItem( "收取现金", MoneyStr(GetMoney->Text.ToDouble()) );
    printer->PrintItem( "找    零", MoneyStr(GiveChange->Caption.ToDouble()) );
    printer->PrintTail();

    printer->KickOut();
end:
    printer->ClosePrinter();
    delete printer;
}

void __fastcall TOrderForm::PrintSellList2(AnsiString selltime)
{
    int num;
    q->Close();
    q->SQL->Text = "select count(*) as cnt from t_order_goods where orderlistidx = " + IntToStr(orderlist) +
    " and selltime = '" + selltime + "'";
    q->Open();
    num = q->FieldByName("cnt")->AsInteger;
    q->Close();

    q->SQL->Text = "select g.name, price, counts from t_order_goods og join t_goods g on \
    og.goodidx = g.idx where og.orderlistidx = " + IntToStr(orderlist) +
    " and selltime = '" + selltime + "'";
    q->Open();
    PrinterForm->ReceiptRep->DataSet = q;
    PrinterForm->SetPageLength(num);
    PrinterForm->ReceiptRep->Print();
    q->Close();

    IPrinter * printer = new GiChengPrinter();
    printer->OpenPrinterA();
    printer->KickOut();
    printer->ClosePrinter();
    delete printer;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::BarCodeChange(TObject *Sender)
{
    if ( BarCode->Text != "" || GoodName->Text != "" || GoodCode->Text != "" )
    {
        Search->Enabled = true;
    }
    else
    {
        Search->Enabled = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SearchSheetShow(TObject *Sender)
{
    if ( Application->Terminated ) return;
    BarCodeChange(Sender);
    BarCode->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SearchExecute(TObject *Sender)
{
    AnsiString sBarCode = BarCode_UPC_E( BarCode->Text );
    if ( sBarCode == "" ) sBarCode = BarCode->Text;
    if ( sBarCode == "" && GoodName->Text == "" && GoodCode->Text == "" )
        return;

    AnsiString sql = "select g.name,g.goodcode,g.barcode,g.labelprice,g.lowestprice,\
    t.name as goodtype from t_goods g \
    left outer join t_goodtype t on g.typeidx = t.idx where ";
    if ( sBarCode != "" ) sql += "g.barcode like '%%" + sBarCode + "%%' or ";
    if ( GoodName->Text != "" ) sql += "g.name like '%" + GoodName->Text + "%' or ";
    if ( GoodCode->Text != "" ) sql += "g.goodcode like '%" + GoodCode->Text + "%' or ";
    sql = sql.SubString(1, sql.Length()-3);

    FreshGoodsList( sql );
    GoodType->ItemIndex = -1;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SearchAllExecute(TObject *Sender)
{
    AnsiString sql = "select g.name,g.goodcode,g.barcode,g.labelprice,g.lowestprice,\
    t.name as goodtype from t_goods g \
    left outer join t_goodtype t on g.typeidx = t.idx";
    FreshGoodsList( sql );
    GoodType->ItemIndex = -1;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::FreshGoodsList( AnsiString sql )
{
    TListItem *pItem;
    GoodsList->Items->BeginUpdate();
    GoodsList->Clear();
    for ( int i = 0; i < GoodsList->Columns->Count; i++ )
    {
        GoodsList->Columns->Items[i]->ImageIndex = -1;
    }
    GoodsList->Columns->Items[0]->ImageIndex = 7;
    GoodsList->Items->EndUpdate();
    ColumnToSort = 0;

    q->SQL->Text = sql;
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        pItem = GoodsList->Items->Add();
        pItem->Caption = q->FieldByName("goodtype")->AsString;
        pItem->SubItems->Add( q->FieldByName("name")->AsString );
        pItem->SubItems->Add( q->FieldByName("barcode")->AsString );
        pItem->SubItems->Add( q->FieldByName("goodcode")->AsString );
        pItem->SubItems->Add( q->FieldByName("goodnumber")->AsString );
        pItem->SubItems->Add( MoneyStr(q->FieldByName("labelprice")->AsFloat) );
        pItem->SubItems->Add( MoneyStr(q->FieldByName("lowestprice")->AsFloat) );
        pItem->ImageIndex = 6;
    }
    q->Close();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::GoodTypeChange(TObject *Sender)
{
    AnsiString sql = "select g.name,g.goodcode,g.barcode,g.goodnumber,g.labelprice,g.lowestprice,\
    t.name as goodtype from t_goods g \
    left outer join t_goodtype t on g.typeidx = t.idx where g.typeidx=" +
    IntToStr((int)GoodType->Items->Objects[GoodType->ItemIndex]);

    FreshGoodsList( sql );
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::BarCodeKeyPress(TObject *Sender, char &Key)
{
    TEdit *pEdit = (TEdit *)Sender;

    if ( Key == 0x0D )
    {
        SearchExecute(0);
        if ( pEdit->Name == "BarCode" ) pEdit->Clear();
        else pEdit->SelectAll();
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::GoodsListColumnClick(TObject *Sender,
      TListColumn *Column)
{
    /* 1.0 version
    ColumnToSort = Column->Index;
    for ( int i = 0; i < GoodsList->Columns->Count; i++ )
        GoodsList->Columns->Items[i]->ImageIndex = -1;

    Column->ImageIndex = 7;
    ((TCustomListView *)Sender)->AlphaSort();
    */

    if ( ColumnToSort == Column->Index )
        DescSort = !DescSort;
    else
    {
        ColumnToSort = Column->Index;
        DescSort = false;
    }
    ((TCustomListView *)Sender)->AlphaSort();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SetChangeExecute(TObject *Sender)
{
    if ( CashSetForm->SetCash( orderlist ) == true )
    {
        CalcDayTotal( orderlist );
        FreshTotal();
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::FreshTotal( int orderlistid )
{
    int oid = orderlistid;
    if ( orderlistid <= 0 )
        oid = orderlist;

    q->SQL->Text = "select * from t_order_list where idx=" + IntToStr(oid);
    q->Open();
    if ( q->RecordCount > 0 )
    {
        TotalCash->Caption = MoneyStr( q->FieldByName("totalcash")->AsFloat );
        TotalSell->Caption = MoneyStr( q->FieldByName("totalprice")->AsFloat );
        TotalNumber->Caption = q->FieldByName("totalsellnum")->AsString;
        TotalCancel->Caption = q->FieldByName("totalcancelnum")->AsString;
        TotalChange->Caption = MoneyStr(q->FieldByName("totalchange")->AsFloat);
        TotalIncome->Caption = MoneyStr(q->FieldByName("totalincome")->AsFloat);
        TotalExpenses->Caption = MoneyStr(q->FieldByName("totalexpenses")->AsFloat);
        BankSave->Caption = MoneyStr(q->FieldByName("banksave")->AsFloat);
    }
    q->Close();

    q->SQL->Text = "select totalcash from t_order_list where idx=" + IntToStr(oid-1);
    q->Open();
    if ( q->RecordCount > 0 )
    {
        if ( MoneyStr( q->FieldByName("totalcash")->AsFloat ) != TotalChange->Caption )
            TotalChange->Font->Color = clRed;
        else
            TotalChange->Font->Color = clBlue;
    }
    q->Close();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SellDateCloseUp(TObject *Sender)
{
    FreshSellSheet( SellDate->Date );
    SetChange->Enabled = true;
    if ( SellDate->Date != today )
        SetChange->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SellGoodsListCustomDrawItem(
      TCustomListView *Sender, TListItem *Item, TCustomDrawState State,
      bool &DefaultDraw)
{
    if ( Item->ImageIndex == 1 )
        Sender->Canvas->Font->Color = clRed;

    DefaultDraw = true;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::CancelListCustomDrawItem(
      TCustomListView *Sender, TListItem *Item, TCustomDrawState State,
      bool &DefaultDraw)
{
    Sender->Canvas->Font->Color = clPurple;
    DefaultDraw = true;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ShowSellExecute(TObject *Sender)
{
    SellPage->ActivePageIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ShowSellListExecute(TObject *Sender)
{
    SellPage->ActivePageIndex = 1;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ShowSearchExecute(TObject *Sender)
{
    SellPage->ActivePageIndex = 2;
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::GoodsListCompare(TObject *Sender,
      TListItem *Item1, TListItem *Item2, int Data, int &Compare)
{
    /* 1.0 version
    if ( ColumnToSort == 0 )
        Compare = CompareText(Item1->Caption,Item2->Caption);
    else
    {
        int ix = ColumnToSort - 1;
        if ( ix < 3 )
            Compare = CompareText(Item1->SubItems->Strings[ix], Item2->SubItems->Strings[ix]);
        else
            Compare = (Item1->SubItems->Strings[ix].ToDouble() - Item2->SubItems->Strings[ix].ToDouble()) > 0;
    }
    */

    int ix = ColumnToSort - 1;
    switch ( ColumnToSort ) {
        case 0:
            Compare = CompareText(Item1->Caption,Item2->Caption);
            break;
        case 1:
        case 2:
        case 3:
            Compare = CompareText(Item1->SubItems->Strings[ix], Item2->SubItems->Strings[ix]);
            break;
        case 4:
        case 5:
        case 6:
            Compare = Item1->SubItems->Strings[ix].ToDouble() - Item2->SubItems->Strings[ix].ToDouble();
            break;
    }

    if ( DescSort )
    {
        if ( Compare > 0 ) Compare = -1;
        else if ( Compare < 0 ) Compare = 1;
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::DutyTimerTimer(TObject *Sender)
{
    UserLoginForm->LogoutTime();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::SellCountKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '+' || Key == '*' || Key == '/' || Key == '-' ) KeyProcess1( Key );
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();

    if ( Key == 0x0D )
    {
        if ( SellCount->Text == "" || SellCount->Text.ToDouble() <= 0 ) Abort();
        if ( SellCount->Text.ToDouble() > sCount ) {
            ShowError("该物品库存量为%d个", sCount);
            SellCount->Text = sCount;
            SellCount->SetFocus();
            return;
        }

        OrderList->Selected->SubItems->Strings[1] = SellCount->Text.ToDouble();
        OrderList->Selected->SubItems->Strings[2] = MoneyStr( SellCount->Text.ToDouble() * OrderList->Selected->SubItems->Strings[0].ToDouble() );

        // 写客显
        ShowCustomerLed(CustomerLed::PRICE, OrderList->Selected->SubItems->Strings[2]);

        LeaveBox( SellCount, SellCountLabel );
        NewGoodItem();
    }
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ToolButton7Click(TObject *Sender)
{
    PrinterForm->ReceiptRep->PrinterSetup();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::ToolButton8Click(TObject *Sender)
{
    int num;
    q->Close();
    q->SQL->Text = "select count(*) as cnt from t_order_goods where orderlistidx = " + IntToStr(orderlist);
    q->Open();
    num = q->FieldByName("cnt")->AsInteger;
    q->Close();

    q->SQL->Text = "select g.name, price, counts from t_order_goods og join t_goods g on \
    og.goodidx = g.idx where og.orderlistidx = " + IntToStr(orderlist);
    q->Open();
    PrinterForm->ReceiptRep->DataSet = q;
    PrinterForm->SetPageLength(num);
    PrinterForm->ReceiptRep->Preview();
    q->Close();


    IPrinter * printer = new GiChengPrinter();
    if (printer->OpenPrinterA() == false) {
        ShowError("打印机未打开");
    }
    else {
        //printer->ResetPrinter();
        //printer->PrintLogo();
        printer->KickOut();
        printer->ClosePrinter();
    }
    delete printer;

    TScale scale;
    scale.ParseFile();
    scale.SendScale();
}
//---------------------------------------------------------------------------

void __fastcall TOrderForm::CMRecieveNewPrice(TMessage &Message)
{
    if ( Message.WParam == TYPES_UPDATE_PRICE )
    {
//        ShowInfo("into");
        AnsiString strPath = ".\\UpdatePrice.txt";  //调价单
        AnsiString r0, r1, sql1;

        TStringList *list = new TStringList();
        TStringList *changePricelist = new TStringList();
        int nListIndex = 0;
        int number;

        list->LoadFromFile(strPath);

        q->Close();

        for ( int i=0; i<list->Count; i++ )
        {
            r0 = list->Strings[i];

            if ( r0.IsEmpty() )
                continue;
            else
            {
                changePricelist->Clear();
                SplitByChar(r0, '|', changePricelist);

                if ( changePricelist->Count == 5 )  //调价单开始的第一行
                {
                    // 查询数据库中是否有相同调价单
                    sql1.sprintf("SELECT count(*) as line FROM T_CHANGEPRICE_LIST WHERE IDX=%d", changePricelist->Strings[0].Trim().ToInt());
                    q->SQL->Text = sql1;
                    q->Prepare();
                    q->Open();
                    number = q->FieldByName("line")->AsInteger;
                    q->Close();

                    if ( number == 0 )
                    {
                        nListIndex = changePricelist->Strings[0].Trim().ToInt();

                        sql1.sprintf("INSERT INTO T_CHANGEPRICE_LIST(IDX, CHANGEDATE, NAME, TOTALNUMBER, DESP) VALUES(%d, '%s', '%s', %d, '%s')",
                                        changePricelist->Strings[0].Trim().ToInt(),
                                        changePricelist->Strings[1].Trim(),
                                        changePricelist->Strings[2].Trim(),
                                        changePricelist->Strings[3].Trim().ToInt(),
                                        changePricelist->Strings[4].Trim());
                        q->SQL->Text = sql1;
                        q->ExecSQL();
                    }
                    #if 0
                    else if ( number == 1 )
                    {
                        sql1.sprintf("UPDATE T_CHANGEPRICE_LIST SET IDX=%d, CHANGEDATE='%s', NAME='%s', TOTALNUMBER=%d, DESP='%s'",
                                        changePricelist->Strings[0].Trim().ToInt(),
                                        changePricelist->Strings[1].Trim(),
                                        changePricelist->Strings[2].Trim(),
                                        changePricelist->Strings[3].Trim().ToInt(),
                                        changePricelist->Strings[4].Trim());
                        q->SQL->Text = sql1;
                        q->ExecSQL();
                    }
                    #endif

                    nListIndex = changePricelist->Strings[0].Trim().ToInt();
                }
                else    //调价单的其他行
                {
                    q->Close();
                    sql1.sprintf("INSERT INTO T_CHANGEPRICE_GOODS(GOODIDX, LISTIDX, OLDPRICE, NEWPRICE) VALUES(%d, %ld, %f, %f)",
                                    changePricelist->Strings[0].Trim().ToInt(),
                                    nListIndex,
                                    changePricelist->Strings[2].Trim().ToDouble(),
                                    changePricelist->Strings[3].Trim().ToDouble());
                    q->SQL->Text = sql1;
                    q->ExecSQL();
                }
            }
        }
        delete list;
        delete changePricelist;
    }
}
