//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SelectUnit.h"
#include "CommonUnit.h"
#include "DbUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSelectForm *SelectForm;
//---------------------------------------------------------------------------
__fastcall TSelectForm::TSelectForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

AnsiString TSelectForm::SelectGood( AnsiString code, TListView *pExclude, GoodDao *gdao )
{
    AnsiString sql;
    TListItem *pItem;

    bar = "";

    sql.sprintf( "select * from t_goods where barcode like '%%%s%%' or name like '%%%s%%' order by goodnumber desc", code, code );
    q->Close();
    q->SQL->Text = sql;
    q->Open();
    GoodsList->Items->BeginUpdate();
    GoodsList->Clear();
    if ( q->RecordCount > 0 )
    {
        for ( q->First(); !q->Eof; q->Next() )
        {
            pItem = GoodsList->Items->Add();
            pItem->Caption = q->FieldByName("barcode")->AsString;
            pItem->Data = (void*)q->FieldByName("idx")->AsInteger;
            pItem->SubItems->Add( q->FieldByName("name")->AsString );
            pItem->SubItems->Add( q->FieldByName("goodnumber")->AsString );
            pItem->SubItems->Add( MoneyStr(q->FieldByName("labelprice")->AsFloat) );
            pItem->SubItems->Add( q->FieldByName("goodcode")->AsString );

            if ( pExclude )
            {
                for ( int i = 0; i < pExclude->Items->Count; i++ )
                {
                    if ( (int)pItem->Data == (int)pExclude->Items->Item[i]->Data )
                        pItem->SubItems->Strings[1] = pItem->SubItems->Strings[1].ToInt() -
                        pExclude->Items->Item[i]->SubItems->Strings[1].ToInt();
                }
            }

            ColumnToSort = 2;
            DescSort = true;
            GoodsList->AlphaSort();
        }
        GoodsList->Items->Item[0]->Selected = true;
    }
    GoodsList->Items->EndUpdate();
    q->Close();

    ColumnToSort = 2;
    DescSort = true;
    gooddao = gdao;
    if (GoodsList->Items->Count > 0)
        ShowModal();
    else
        return code;
    return bar;
}
//---------------------------------------------------------------------------

void __fastcall TSelectForm::GoodsListKeyPress(TObject *Sender, char &Key)
{
    if ( Key == 0x0D ) GoodsListDblClick( Sender );
    if ( Key == 0x1B ) ModalResult = mrCancel;
}
//---------------------------------------------------------------------------

void __fastcall TSelectForm::GoodsListDblClick(TObject *Sender)
{
    if ( GoodsList->Items->Count == 0 )
    {
        ModalResult = mrCancel;
        return;
    }
    
    if ( GoodsList->Selected != NULL )
    {
        bar = GoodsList->Selected->Caption;
        if (gooddao != NULL) {
            gooddao->barcode = bar;
            gooddao->name = GoodsList->Selected->SubItems->Strings[0];
            gooddao->model = GoodsList->Selected->SubItems->Strings[1];
            gooddao->price = GoodsList->Selected->SubItems->Strings[2];
        }
        ModalResult = mrOk;
    }
}
//---------------------------------------------------------------------------

void __fastcall TSelectForm::GoodsListCompare(TObject *Sender,
      TListItem *Item1, TListItem *Item2, int Data, int &Compare)
{
    int ix = ColumnToSort - 1;
    switch ( ColumnToSort ) {
        case 0:
            Compare = CompareText(Item1->Caption,Item2->Caption);
            break;
        case 1:
        case 4:
            Compare = CompareText(Item1->SubItems->Strings[ix], Item2->SubItems->Strings[ix]);
            break;
        case 2:
        case 3:
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

void __fastcall TSelectForm::GoodsListColumnClick(TObject *Sender,
      TListColumn *Column)
{
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

void __fastcall TSelectForm::FormShow(TObject *Sender)
{
    GoodsList->SetFocus();    
}
//---------------------------------------------------------------------------

