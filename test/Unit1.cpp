//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
    IBDatabase1->Connected = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
    q->SQL->Text = "select * from t_goodtype";
    q->Open();
    FreshTree( q );
    q->Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TreeViewContextPopup(TObject *Sender,
      TPoint &MousePos, bool &Handled)
{
    if ( TreeView->GetNodeAt( MousePos.x, MousePos.y ) != NULL )
    {
        TPoint p = TreeView->ClientToScreen( TPoint(MousePos.x, MousePos.y) );
        TreeView->PopupMenu->Popup( p.x, p.y );
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FreshTree( TDataSet *tb )
{
    TTreeNode *pNode, *pNode2;
    void * Data;

    TreeView->Items->BeginUpdate();
    TreeView->Items->Clear();
    TreeView->Items->EndUpdate();

    pNode = TreeView->Items->AddObject( NULL, "所有分类", (void*)0 );
    for ( tb->First(); !tb->Eof; tb->Next() )
    {
        pNode2 = FindNode( TreeView, tb->FieldByName("pid")->AsInteger );
        Data = (void*)tb->FieldByName("idx")->AsInteger;
        if ( pNode2 == NULL )
        {
            TreeView->Items->AddObject( pNode, tb->FieldByName("name")->AsString, Data );
        }
        else
        {
            TreeView->Items->AddObject( pNode2, tb->FieldByName("name")->AsString, Data );
        }
    }
}
//---------------------------------------------------------------------------

TTreeNode * __fastcall TForm1::FindNode( TTreeView *pView, int Id )
{
    for ( int i = 0; i < pView->Items->Count; i++ )
    {
        if ( pView->Items->Item[i]->Data == (void*)Id )
            return pView->Items->Item[i];
    }

    return NULL;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::N1Click(TObject *Sender)
{
    AnsiString classname = InputBox( "添加分类", "分类名称", "" );

    if ( classname == "" ) return;

    q->SQL->Text = "insert into t_goodtype(pid, name) values(" + IntToStr((int)TreeView->Selected->Data) +
    ", '" + classname + "')";
    q->ExecSQL();

    q->SQL->Text = "select MAX(idx) from t_goodtype";
    q->Open();
    TreeView->Items->AddObject( TreeView->Selected, classname, (void*)q->FieldByName("idx")->AsInteger );
    q->Close();
}
//---------------------------------------------------------------------------

