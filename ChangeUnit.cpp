//---------------------------------------------------------------------------

#include <vcl.h>
#include <vector>
#pragma hdrstop

#include "ChangeUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChangeForm *ChangeForm;
using namespace std;

extern void AutoBalance( vector<double> costs, vector<double> &prices, double total );
//---------------------------------------------------------------------------
__fastcall TChangeForm::TChangeForm(TComponent* Owner)
    : TForm(Owner)
{
    CurItem = -1;
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::KeyProcess( char Key )
{
    switch ( Key ) {
    case '+':
        if ( ChangeList->Selected->Index == 0 ) return;
        ChangeList->Selected->Delete();
        OrderGuide->ActivePageIndex = 1;
        LeaveBox( Addup, AddupLabel );
        LeaveBox( Total, TotalLabel );
        LeaveBox( GetMoney, GetMoneyLabel );
        AddUpTo();
        EnterBox( Total, TotalLabel );
        break;
    case '*':
        ChangeList->Selected->Delete();
        NewGoodItem();
        break;
    case '-':
        CancelGoodItem();
        NewGoodItem();
        break;
    case '/':
        ModalResult = mrCancel;
        return;
    }
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::NumberKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '+' || Key == '*' || Key == '/' || Key == '-' ) KeyProcess( Key );
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();

    AnsiString sql;

    if ( Key == 0x0D )
    {
        AnsiString BarCode = BarCode_UPC_E( Number->Text );
        if ( BarCode == "" ) Abort();

        sql.sprintf( "select idx,name,labelprice,cost,lowestprice from t_goods where barcode='%s'", BarCode );
        q->SQL->Text = sql;
        q->Prepare();
        q->Open();
        if ( q->RecordCount > 0 )
        {
            ChangeList->Selected->Caption = q->FieldByName("name")->AsString;
            Price->Text = MoneyStr(q->FieldByName("labelprice")->AsFloat);
            ChangeList->Selected->SubItems->Strings[1] = "1";
            ChangeList->Selected->Data = (void*)q->FieldByName("idx")->AsInteger;
            CurLabelPrice = q->FieldByName("labelprice")->AsFloat;
            reduce = 10;
            cost = q->FieldByName("cost")->AsFloat;

            ChangeList->Selected->SubItems->Strings[2] = q->FieldByName("cost")->AsString;
            if ( CurLowestPrice <= 0 )
                ChangeList->Selected->SubItems->Strings[3] = cost / MinProfitPercent;
            else
                ChangeList->Selected->SubItems->Strings[3] = q->FieldByName("lowestprice")->AsString;
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

void __fastcall TChangeForm::PriceKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '*' || Key == '/' || Key == '-' ) KeyProcess( Key );
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();

    if ( Key == 0x0D )
    {
        if ( Price->Text == "" ) Abort();
        try {
            if ( Price->Text.ToDouble() <= 0 ) {
                Price->Text == "";
                Abort();
            }
        } catch(...)
        {
            ShowError( "货币输入错误, 请重新输入" );
            Price->SelectAll();
            Abort();
        }

        ChangeList->Selected->SubItems->Strings[0] = MoneyStr( Price->Text.ToDouble() );
        Price->Text = MoneyStr( Price->Text.ToDouble() );
        LeaveBox( Price, PriceLabel );
        NewGoodItem();
    }
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::TotalKeyPress(TObject *Sender, char &Key)
{
    if ( Total->Text.ToDouble() == 0.0 )
    {
        GetMoney->Text = "0";
        KeyProcess2( Key );
    }
    else
    {
        if ( Key == '-' ) {
            OrderGuide->ActivePageIndex = 0;
            NewGoodItem();
        }

        if ( Key == '/' ) {
            ModalResult = mrCancel;
            return;
        }

        if ( Key == 0x0D || Key == '+' )
        {
            if ( Total->Text.ToDouble() < 0 ) Abort();
            LeaveBox( Total, TotalLabel );
            EnterBox( GetMoney, GetMoneyLabel );
            GetMoney->Text = "0";
            GetMoney->SelectAll();
        }
    }

    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::GetMoneyKeyPress(TObject *Sender, char &Key)
{
    KeyProcess2( Key );
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::KeyProcess2( char Key )
{
    if ( Key == '-' ) {
        OrderGuide->ActivePageIndex = 0;
        NewGoodItem();
    }

    if ( Key == '/' ) {
        ModalResult = mrCancel;
        return;
    }

    if ( Key == '+' || Key == 0x0D )
    {
        if ( GetMoney->Text == "" ) Abort();
        
        // sellsheet over
        if ( GetMoney->Enabled == true && GiveChange->Caption.ToDouble() < 0 ) {
            GetMoney->SelectAll();
            Abort();
        }

        // sellsheet over
        if ( CommitChangeList() == false ) {
            ShowError( "此次换货交易失败" );
        }
        else
        {
            ModalResult = mrOk;
            return;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::EnterBox( TEdit *pEdit, TLabel *pLabel )
{
    pEdit->Enabled = true;
    pEdit->Color = clWhite;
    pEdit->Font->Color = clBlack;
    pLabel->Font->Style = TFontStyles()<< fsBold;
    pEdit->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::LeaveBox( TEdit *pEdit, TLabel *pLabel )
{
    pEdit->Enabled = false;
    pEdit->Color = clGray;
    pEdit->Font->Color = clWhite;
    pLabel->Font->Style = TFontStyles();
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::NewChangeList()
{
    ChangeList->Clear();
    TabSheet1->TabVisible = false;
    TabSheet2->TabVisible = false;
    OrderGuide->ActivePageIndex = 0;
    NewGoodItem();
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::NewGoodItem()
{
    TListItem * pItem;

    pItem = ChangeList->Items->Add();
    pItem->SubItems->Text = " \n \n \n \n";
    pItem->Selected = true;
    pItem->ImageIndex = 2;
    LeaveBox( Number, NumberLabel );
    LeaveBox( Price, PriceLabel );
    Number->Text = "";
    Price->Text = "";
    Reduce->Caption = "不打";

    EnterBox( Number, NumberLabel );
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::CancelGoodItem()
{
    TListItem *pItem = ChangeList->Selected;
    if ( pItem->Index > 0 )
        ChangeList->Items->Item[ pItem->Index - 1 ]->Delete();
    pItem->Delete();
}
//---------------------------------------------------------------------------

bool __fastcall TChangeForm::CommitChangeList()
{
    AnsiString sql, sql1;
    TListItem *pItem;
    vector<double> cl, pl;

    try {
        d->trans->StartTransaction();

        for ( int i = 0; i < ChangeList->Items->Count; i++ )
        {
            pItem = ChangeList->Items->Item[i];
            cl.push_back( pItem->SubItems->Strings[2].ToDouble() );
            pl.push_back( pItem->SubItems->Strings[0].ToDouble() );
        }

        AutoBalance( cl, pl, Addup->Text.ToDouble() );

        sql1 = "insert into t_order_goods(orderlistidx, goodidx, price, cost, profit, \
        mark, bechangedidx) values(%d, %d, %.2f, %.2f, %.2f, 1, %d);";

        for ( unsigned int i = 0; i < pl.size(); i++ )
        {
            pItem = ChangeList->Items->Item[i];
            sql.sprintf( sql1.c_str(), orderlist, (int)pItem->Data, pl[i], cl[i], pl[i]-cl[i], cancelgood );
            q->SQL->Text = sql;
            q->Prepare();
            q->ExecSQL();

            StorageUpdate( (int)pItem->Data, -1 );
        }

        sql1.sprintf( "update t_order_goods set cost=0, profit=0, mark=3, bechangedidx= \
        (select max(idx) from t_order_goods) \
        where idx=%d", cancelgood );
        q->SQL->Text = sql1;
        q->Prepare();
        q->ExecSQL();

        StorageUpdate( cancelgood, 1 );
    }
    catch (...) {
        d->trans->Rollback();
        return false;
    }

    d->trans->Commit();
    return true;
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::FormShow(TObject *Sender)
{
    NewChangeList();    
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::PriceKeyDown(TObject *Sender, WORD &Key,
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

void __fastcall TChangeForm::AddUpTo()
{
    double total = 0.0;
    AnsiString tPrice;

    for ( int i = 0; i < ChangeList->Items->Count; i++ )
    {
        total += ChangeList->Items->Item[i]->SubItems->Strings[0].ToDouble();
    }

    double t = total - changeprice;
    Addup->Text = MoneyStr( total );

    Total->Text = MoneyStr( t );
    GetMoney->Text = "";
}
//---------------------------------------------------------------------------

void __fastcall TChangeForm::GetMoneyChange(TObject *Sender)
{
    if ( GetMoney->Text == "" ) {
        GetMoney->Text = "0";
        GetMoney->SelectAll();
    }
    if ( GetMoney->Text != "" && Total->Text != "" )
        GiveChange->Caption = MoneyStr( GetMoney->Text.ToDouble() - Total->Text.ToDouble() );
    else
        GiveChange->Caption = 0;
}
//---------------------------------------------------------------------------

