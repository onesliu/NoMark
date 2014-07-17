//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CashSetUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
#include "DetailUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TCashSetForm *CashSetForm;
//---------------------------------------------------------------------------
__fastcall TCashSetForm::TCashSetForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

bool __fastcall TCashSetForm::SetCash( int orderlistid )
{
    TListItem *pItem;

    if ( orderlistid <= 0 ) return false;
    orderlist = orderlistid;
    detail_del.clear();

    q->SQL->Text = "select * from t_order_list where idx="+IntToStr(orderlistid);
    q->Open();
    if ( q->RecordCount > 0 )
    {
        Change->Text = MoneyStr(q->FieldByName("totalchange")->AsFloat);
        BankSave->Text = MoneyStr(q->FieldByName("banksave")->AsFloat);
    }
    q->Close();

    DetailList->Clear();
    q->SQL->Text = "select * from t_inout_items where orderlistidx="+IntToStr(orderlistid);
    q->Open();
    for( q->First(); !q->Eof; q->Next() )
    {
        pItem = DetailList->Items->Add();
        pItem->Caption = (q->FieldByName("inout")->AsInteger==0)?"收入":"支出";
        pItem->SubItems->Add( q->FieldByName("name")->AsString );
        pItem->SubItems->Add( MoneyStr(q->FieldByName("cost")->AsFloat) );
        pItem->SubItems->Add( q->FieldByName("inout")->AsInteger );
        pItem->Data = (void*)q->FieldByName("idx")->AsInteger;
    }
    q->Close();

    if ( ShowModal() == mrOk ) return true;

    return false; 
}
//---------------------------------------------------------------------------

void __fastcall TCashSetForm::ChangeKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TCashSetForm::AddDetailClick(TObject *Sender)
{
    TListItem *pItem;
    pItem = DetailList->Items->Add();
    pItem->Data = 0;
    pItem->SubItems->Text = "\n\n0\n";
    if ( DetailForm->EditDetail( pItem ) == false )
        pItem->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TCashSetForm::EditDetailClick(TObject *Sender)
{
    if ( DetailList->Selected )
        DetailForm->EditDetail( DetailList->Selected );
}
//---------------------------------------------------------------------------

void __fastcall TCashSetForm::DelDetailClick(TObject *Sender)
{
    if ( DetailList->Selected )
    {
        if ( ShowYesNo("真的要删除该收支明细吗?") == true )
        {
            detail_del.push_back( (int)DetailList->Selected->Data );
            DetailList->Selected->Delete();
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TCashSetForm::DetailListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
    if ( Selected )
    {
        EditDetail->Enabled = true;
        DelDetail->Enabled = true;
    }
    else
    {
        EditDetail->Enabled = false;
        DelDetail->Enabled = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TCashSetForm::OkClick(TObject *Sender)
{
    if ( Change->Text == "" || BankSave->Text == "" )
    {
        ShowError( "必须填写昨日库现余额和银行存款" );
        return;
    }

    try {
        TListItem *pItem;

        if ( Change->Text.ToDouble() < 0 || BankSave->Text.ToDouble() < 0 )
        {
            ShowError( "金额不能小于零" );
            return;
        }

        ExecSQL( AnsiString().sprintf("update t_order_list set totalchange=%s, \
        banksave=%s where idx=%d", Change->Text, BankSave->Text, orderlist ) );

        for ( int i = 0; i < DetailList->Items->Count; i++ )
        {
            pItem = DetailList->Items->Item[i];
            if ( (int)pItem->Data != 0 )
            {
                ExecSQL( AnsiString().sprintf("update t_inout_items set \
                inout=%s, name='%s', cost=%s where idx=%d", pItem->SubItems->Strings[2],
                pItem->SubItems->Strings[0], pItem->SubItems->Strings[1], (int)pItem->Data ) );
            }
            else
            {
                ExecSQL( AnsiString().sprintf("insert into t_inout_items(orderlistidx, \
                inout, name, cost) values(%d, %s, '%s', %s)", orderlist,
                pItem->SubItems->Strings[2], pItem->SubItems->Strings[0], pItem->SubItems->Strings[1] ) );
            }
        }

        for ( unsigned int i = 0; i < detail_del.size(); i++ )
        {
            ExecSQL( AnsiString().sprintf("delete from t_inout_items where idx=%d",detail_del[i]) );
        }

        ModalResult = mrOk;
    } catch(...) {
        ShowError( "金额格式错误" );
        return;
    }
}
//---------------------------------------------------------------------------

