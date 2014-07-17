//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GoodsFrameUnit.h"
#include "GoodAttribUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TGoodsFrame *GoodsFrame;
//---------------------------------------------------------------------------
__fastcall TGoodsFrame::TGoodsFrame(TComponent* Owner)
    : TFrame(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::ClearLabelExecute(TObject *Sender)
{
    if ( GoodsGrid->SelectedRows->Count <= 0 ) return;
    if ( ShowYesNo("���Ҫ�����ǩ��ӡ��?") == false ) return;
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    for (int i=0; i < GoodsGrid->SelectedRows->Count; i++)
    {
        pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[i].c_str());
        ExecSQL( "update t_goods set labelprinted=0 where idx=" +
            IntToStr(pDS->FieldByName("idx")->AsInteger) );
    }

    pDS->Close();
    pDS->Open();
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::SetLabelExecute(TObject *Sender)
{
    if ( GoodsGrid->SelectedRows->Count <= 0 ) return;
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    AnsiString Count = "0";
    if ( InputQuery("�����ǩ��ӡ��", "�����ǩ��ӡ����", Count) == false ) return;
    try {
        if ( Count.ToInt() <= 0 ) return;

        for (int i=0; i < GoodsGrid->SelectedRows->Count; i++)
        {
            pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[i].c_str());
            ExecSQL( AnsiString().sprintf("update t_goods set labelprinted=%s where idx=%d",
                Count, pDS->FieldByName("idx")->AsInteger ) );
        }
    } catch(...) {
        ShowError( "��ǩ�����������" );
        return;
    }

    pDS->Close();
    pDS->Open();
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::SetSelectedType( int GoodTypeId, bool ClearOut )
{
    if ( GoodsGrid->SelectedRows->Count <= 0 ) return;
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    for (int i=0; i < GoodsGrid->SelectedRows->Count; i++)
    {
        pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[i].c_str());
        ExecSQL( AnsiString().sprintf( "update t_goods set typeidx=%d where idx=%d",
            GoodTypeId, pDS->FieldByName("idx")->AsInteger ) );
    }

    pDS->Close();
    pDS->Open();
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::DelGoodExecute(TObject *Sender)
{
    if ( GoodsGrid->SelectedRows->Count <= 0 ) return;
    if ( ShowYesNo("���Ҫɾ����Щ��Ʒ��?") == false ) return;
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    for (int i=0; i < GoodsGrid->SelectedRows->Count; i++)
    {
        pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[i].c_str());
        ExecSQL( "delete from t_goods where idx=" + IntToStr(pDS->FieldByName("idx")->AsInteger) );
    }

    pDS->Close();
    pDS->Open();
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::EditGoodExecute(TObject *Sender)
{
    if ( GoodsGrid->SelectedRows->Count != 1 ) return;
    TIBQuery *pDS = (TIBQuery *)GoodsGrid->DataSource->DataSet;
    pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[0].c_str());
    if ( GoodAttribForm->SetGoodItem( pDS ) )
    {
        try {
            pDS->DisableControls();
            pDS->ApplyUpdates();
            pDS->EnableControls();
        } catch(...) {
            d->trans->Rollback();
            return;
        }
        d->trans->Commit();
    }
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::SetLabel2Execute(TObject *Sender)
{
    if ( GoodsGrid->SelectedRows->Count <= 0 ) return;
    AnsiString Count = "0";
    if ( ShowYesNo("����ǰ���������ѡ�е���Ʒ��ǩ��ӡ����?") == false ) return;
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    for (int i=0; i < GoodsGrid->SelectedRows->Count; i++)
    {
        pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[i].c_str());
        ExecSQL( AnsiString().sprintf("update t_goods set labelprinted=storagenumber where idx=%d",
            pDS->FieldByName("idx")->AsInteger ) );
    }

    pDS->Close();
    pDS->Open();
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::SetLable3Execute(TObject *Sender)
{
    if ( GoodsGrid->SelectedRows->Count <= 0 ) return;
    AnsiString Count = "0";
    if ( ShowYesNo("��������������ѡ�е���Ʒ��ǩ��ӡ����?") == false ) return;
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    for (int i=0; i < GoodsGrid->SelectedRows->Count; i++)
    {
        pDS->GotoBookmark((void *)GoodsGrid->SelectedRows->Items[i].c_str());
        ExecSQL( AnsiString().sprintf("update t_goods set labelprinted=goodnumber where idx=%d",
            pDS->FieldByName("idx")->AsInteger ) );
    }

    pDS->Close();
    pDS->Open();
}
//---------------------------------------------------------------------------
//AnsiString().sprintf("��ƷƷ��:%d�� ������:%d�� һ��δ��:%d�� �ܽ�����:%d�� ��ǰ���:%d�� ����:%d��",

void __fastcall TGoodsFrame::GoodsGridDrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
    TDataSet *pDS = GoodsGrid->DataSource->DataSet;
    TDBGrid *Grid = (TDBGrid *)Sender;
    if ( !State.Contains( gdSelected ) )
    {
        if ( pDS->FieldByName("storagenumber")->AsInteger == 0 )
            Grid->Canvas->Font->Color = clBlue;
        if ( pDS->FieldByName("storagenumber")->AsInteger == pDS->FieldByName("goodnumber")->AsInteger )
            Grid->Canvas->Font->Color = clOlive;
    }
    Grid->DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------

void __fastcall TGoodsFrame::GoodsGridMouseUp(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
/*
    TIBQuery *pDS = (TIBQuery *)GoodsGrid->DataSource->DataSet;
    TDBGrid *Grid = (TDBGrid *)Sender;
    if ( Button == mbLeft )
    {
        if ( !blSelect )
        {
            BookMark = pDS->GetBookmark();
            OldNo = pDS->RecNo;
            blSelect = true;
            return;
        }
        else
        {
            if ( Shift.Contains( ssShift ) )
            {
                CurrNo = pDS->RecNo;
                pDS->DisableControls();
                pDS->GotoBookmark(BookMark);
                Grid->SelectedRows->CurrentRowSelected = true;
                if ( CurrNo > OldNo )
                {
                    while ( CurrNo > pDS->RecNo )
                    {
                        Grid->SelectedRows->CurrentRowSelected = true;
                        pDS->Next();
                    }
                }
            }
            else
            {
                while ( CurrNo < pDS->RecNo )
                {
                    Grid->SelectedRows->CurrentRowSelected = true;
                    pDS->Prior();
                }
            }

            pDS->EnableControls();
            pDS->FreeBookmark(BookMark);
            blSelect = False;
            CurrNo = 0;
            OldNo = 0;
        }
    }
    else
    {
        BookMark = pDS->GetBookmark();
        OldNo = pDS->RecNo;
        blSelect = true;
        return;
    }
*/
}
//---------------------------------------------------------------------------

