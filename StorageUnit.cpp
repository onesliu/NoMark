//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "StorageUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "ImcomingUnit.h"
#include "CommonUnit.h"
#include "SysSetUnit.h"
#include "CheckUnit.h"
#include "StoreStatUnit.h"
#include "ChangePriceUnit.h"
#include "qyycy.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GoodsFrameUnit"
#pragma resource "*.dfm"
TStorageForm *StorageForm;
//---------------------------------------------------------------------------
__fastcall TStorageForm::TStorageForm(TComponent* Owner)
    : TForm(Owner)
{
    DateSeparator = '-';
    ShortDateFormat = "yyyy-mm-dd";
    pGoodsRoot = 0;
    pIncomingRoot = 0;
    pSellRoot = 0;
    pCheckRoot = 0;
    pSearchRoot = 0;
    pPrintLabelRoot = 0;
}
//---------------------------------------------------------------------------
void __fastcall TStorageForm::GoodTypeTreeContextPopup(TObject *Sender,
      TPoint &MousePos, bool &Handled)
{
    TTreeNode *pNode = GoodTypeTree->GetNodeAt( MousePos.x, MousePos.y );

    if ( pNode != NULL && pNode != pIncomingRoot && pNode != pSellRoot &&
         pNode != pCheckRoot && pNode != pSearchRoot && pNode != pPrintLabelRoot )
    {
        pNode->Selected = true;
        if ( pNode->HasChildren )
            deltype->Enabled = false;
        else
            deltype->Enabled = true;

        if ( pNode == pGoodsRoot )
            edittype->Enabled = false;
        else
            edittype->Enabled = true;

        TPoint p = GoodTypeTree->ClientToScreen( MousePos );
        GoodTypeTree->PopupMenu->Popup( p.x, p.y );
    }
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::addtypeExecute(TObject *Sender)
{
    AnsiString classname = InputBox( "添加分类", "分类名称", "" );
    TTreeNode *pNode;

    if ( classname == "" ) return;

    ExecSQL( "insert into t_goodtype(pid, name) values(" + IntToStr((int)GoodTypeTree->Selected->Data) +
    ", '" + classname + "')" );

    q->SQL->Text = "select MAX(idx) as id from t_goodtype";
    q->Open();
    pNode = GoodTypeTree->Items->AddChildObject( GoodTypeTree->Selected, classname,
        (void*)q->FieldByName("id")->AsInteger );
    pNode->ImageIndex = 17;
    q->Close();

    GoodTypeTree->Selected->Expand( true );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::deltypeExecute(TObject *Sender)
{
    if ( ShowYesNo( "真的要删除该商品分类吗?" ) == false ) return;

    ExecSQL( "delete from t_goodtype where idx = " + IntToStr((int)GoodTypeTree->Selected->Data) );

    GoodTypeTree->Selected->Delete();
}
//---------------------------------------------------------------------------

TTreeNode * __fastcall TStorageForm::FindNode( int Id )
{
    for ( int i = 0; i < GoodTypeTree->Items->Count; i++ )
    {
        if ( (int)GoodTypeTree->Items->Item[i]->Data == Id )
            return GoodTypeTree->Items->Item[i];
    }

    return NULL;
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshTree()
{
    TTreeNode *pNode;
    int CurId = 0;

    if ( GoodTypeTree->Selected ) CurId = (int)GoodTypeTree->Selected->Data;

    GoodTypeTree->Items->BeginUpdate();
    GoodTypeTree->Items->Clear();

    pGoodsRoot = GoodTypeTree->Items->AddObject( NULL, "当前库存商品", (void*)0 );
    pGoodsRoot->ImageIndex = 20;
    pGoodsRoot->SelectedIndex = 20;
    q->SQL->Text = "select * from t_goodtype order by pid,name";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        if ( q->FieldByName("pid")->AsInteger <= 0 )
            pNode = pGoodsRoot;
        else
            pNode = FindNode( q->FieldByName("pid")->AsInteger );

        if ( pNode == NULL ) pNode = pGoodsRoot;

        pNode = GoodTypeTree->Items->AddChildObject( pNode, q->FieldByName("name")->AsString,
            (void*)q->FieldByName("idx")->AsInteger );
        pNode->ImageIndex = 17;
        pNode->SelectedIndex = 17;
    }
    q->Close();

    GoodTypeTree->FullExpand();
    pNode = FindNode( CurId );
    if ( pNode ) pNode->Selected = true;
    else pGoodsRoot->Selected = true;

    GoodTypeTree->Items->EndUpdate();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FormShow(TObject *Sender)
{
    GoodsSheet->TabVisible = true;
    FreshTree();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::edittypeExecute(TObject *Sender)
{
    AnsiString classname = InputBox( "更改分类", "分类名称", "" );
    if ( classname == "" ) return;

    ExecSQL( "update t_goodtype set name= '" + classname +
    "' where idx = " + IntToStr((int)GoodTypeTree->Selected->Data) );

    GoodTypeTree->Selected->Text = classname;
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::GoodTypeTreeChange(TObject *Sender,
      TTreeNode *Node)
{
    FreshGoodsList((int)Node->Data);
    ListPage->ActivePageIndex = 0;
    GoodsFrame1->SetGoodsCatagory((int)Node->Data);
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::NewIncomingExecute(TObject *Sender)
{
    IncomingForm->NewIncoming();
    FreshIncomingSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshSellSheet()
{
    d->SellSet->DisableControls();
    d->SellSet->Close();
    d->SellSet->Open();
    d->SellSet->EnableControls();

    d->SellGoodSet->DisableControls();
    d->SellGoodSet->Close();
    d->SellGoodSet->Open();
    d->SellGoodSet->EnableControls();

    d->CancelGoodSet->DisableControls();
    d->CancelGoodSet->Close();
    d->CancelGoodSet->Open();
    d->CancelGoodSet->EnableControls();

    d->CashSet->DisableControls();
    d->CashSet->Close();
    d->CashSet->Open();
    d->CashSet->EnableControls();
}
//---------------------------------------------------------------------------


void __fastcall TStorageForm::SellSheetShow(TObject *Sender)
{
    if ( SellSheet->Visible == false ) return;
    FreshSellSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshCheckSheet()
{
    d->CheckListSet->DisableControls();
    d->CheckListSet->Close();
    d->CheckListSet->Open();
    d->CheckListSet->EnableControls();

    d->CheckGoodSet->DisableControls();
    d->CheckGoodSet->Close();
    d->CheckGoodSet->Open();
    d->CheckGoodSet->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshIncomingSheet()
{
    d->IncomingSet->DisableControls();
    d->IncomingSet->Close();
    d->IncomingSet->Open();
    d->IncomingSet->EnableControls();

    d->IncomingGoodSet->DisableControls();
    d->IncomingGoodSet->Close();
    d->IncomingGoodSet->Open();
    d->IncomingGoodSet->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshPrintSheet()
{
    TListItem *pItem;

    PrintList->Items->BeginUpdate();
    PrintList->Items->Clear();
    PrintList->Items->EndUpdate();
    q->SQL->Text = "select * from t_goods where labelprinted > 0";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        pItem = PrintList->Items->Add();
        pItem->Caption = q->FieldByName("name")->AsString;
        pItem->SubItems->Add( MoneyStr(q->FieldByName("labelprice")->AsFloat) );
        pItem->SubItems->Add( q->FieldByName("barcode")->AsString );
        pItem->SubItems->Add( q->FieldByName("goodnumber")->AsString );
        pItem->SubItems->Add( q->FieldByName("labelprinted")->AsString );
        pItem->Data = (void*)q->FieldByName("idx")->AsInteger;
        pItem->ImageIndex = 0;
    }
    q->Close();

    PrintList->Width = 1000;

    if ( PrintList->Items->Count > 0 )
        PrintList->Items->Item[0]->Selected = true;
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::PLabelSheetShow(TObject *Sender)
{
    if ( PLabelSheet->Visible == false ) return;
    FreshPrintSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::CheckSheetShow(TObject *Sender)
{
    if ( CheckSheet->Visible == false ) return;
    FreshCheckSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::ExportLabelsExecute(TObject *Sender)
{
    FILE * fp;

    if ( PrintList->Items->Count <= 0 ) return;

    if ( ExportLabelDialog->Execute() == false ) return;

    fp = fopen( ExportLabelDialog->FileName.c_str(), "w" );
    if ( !fp ) return;
    Janitor g_fp( fclose, fp );

    for ( int i = 0; i < PrintList->Items->Count; i++ )
    {
        int labelcount = PrintList->Items->Item[i]->SubItems->Strings[4].ToInt();
        for ( int j = 0; j < labelcount; j++ )
        {
            /* 1.0 导出方法：条码，品名，标价
            fprintf( fp, "%s,%s,￥%s\n", PrintList->Items->Item[i]->SubItems->Strings[1].c_str(),
            PrintList->Items->Item[i]->Caption.c_str(), PrintList->Items->Item[i]->SubItems->Strings[0].c_str() );
            */

            // 1.1 导出方法：品名，条码，标价
            fprintf( fp, "%s,%s,￥%s\n", PrintList->Items->Item[i]->Caption.c_str(),
                PrintList->Items->Item[i]->SubItems->Strings[1].c_str(),
                PrintList->Items->Item[i]->SubItems->Strings[0].c_str() );
        }
    }

    ShowInfo( "导出完毕." );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::CancelPrintLabel( int goodid )
{
    ExecSQL( "update t_goods set labelprinted=0 where idx=" + IntToStr(goodid) );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::SetPrintLabel( int goodid, int storage )
{
    AnsiString num;

    try {
        num = InputBox("输入", "请输入标签打印数量:", storage);
        num.ToInt();
    } catch(...) {
        ShowError("标签打印量输入错误");
        return;
    }

    ExecSQL( AnsiString().sprintf("update t_goods set labelprinted=%s where idx=%d", num, goodid) );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshGoodsList( int GoodTypeId )
{
    AnsiString sql = "select g.idx, g.typeidx, g.barcode, g.name, g.goodcode, \
                      g.cost, g.goodnumber, g.labelprice, g.lowestprice, g.labelprinted, \
                      g.desp, g.goodtype as g_goodtype, g.added, t.name as goodtype from t_goods g \
                      left outer join t_goodtype t on g.typeidx = t.idx";

    if ( GoodTypeId >= 0 )
        sql += " where g.typeidx=" + IntToStr(GoodTypeId);
    d->FreshGoodList(sql);
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::GoodTypeTreeDragOver(TObject *Sender,
      TObject *Source, int X, int Y, TDragState State, bool &Accept)
{
    TTreeNode *pNode = GoodTypeTree->GetNodeAt(X,Y);
    Accept = false;

    if ( ((TWinControl*)Source)->Name == "GoodTypeTree" )
    {
        TTreeView *pTree = (TTreeView *)Source;
        if ( pNode && pTree && ((int)pNode->Data > 0 || pGoodsRoot == pNode) && (int)pTree->Selected->Data > 0 )
            Accept = true;
    }
    else
    {
        TListView *pView = (TListView*)Source;
        if ( pNode && pView && pView->Name == "GoodsList" && (int)pNode->Data > 0 )
            Accept = true;
    }
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::GoodTypeTreeDragDrop(TObject *Sender,
      TObject *Source, int X, int Y)
{
    TTreeNode *pNode = GoodTypeTree->GetNodeAt(X,Y);
    AnsiString sql;

    if ( ((TWinControl*)Source)->Name == "GoodTypeTree" )
    {
        TTreeView *pTree = (TTreeView *)Source;
        if ( pNode && pTree && ((int)pNode->Data > 0 || pGoodsRoot == pNode) && (int)pTree->Selected->Data > 0 )
        {
            sql.sprintf( "update t_goodtype set pid=%d where idx=%d", (int)pNode->Data,
                (int)pTree->Selected->Data );
            q->SQL->Text = sql;
            q->ExecSQL();

            FreshTree();
        }
    }
    else
    {
        TListView *pView = (TListView*)Source;
        TGoodsFrame *pFrame = 0;

        if ( pView && pView->Name == "GoodsList" )
        {
            TControl *pControl;
            pControl = _FindControl( pView, "TGoodsFrame" );
            if ( pControl == NULL ) return;
            pFrame = (TGoodsFrame*)pControl;
        }

        if ( pFrame == NULL ) return;

        if ( pView && pView->Name == "GoodsList" && (int)pNode->Data > 0 )
        {
            if ( pNode != GoodTypeTree->Selected && (int)GoodTypeTree->Selected->Data > 0 )
                pFrame->SetSelectedType( (int)pNode->Data );
            else
                pFrame->SetSelectedType( (int)pNode->Data, false );
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::ToolButton2Click(TObject *Sender)
{
    SysSetForm->SysSet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::SellDateCloseUp(TObject *Sender)
{
    AnsiString sDate = SellDate->Date.FormatString("yyyy-mm-dd");
/*    for ( int i = 0; i < SellList->Items->Count; i++ )
    {
        if ( SellList->Items->Item[i]->Caption == sDate )
        {
            SellList->Items->Item[i]->Selected = true;
            SellList->Items->Item[i]->MakeVisible( false );
            break;
        }
    }      */
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::SellGoodsListCustomDrawItem(
      TCustomListView *Sender, TListItem *Item, TCustomDrawState State,
      bool &DefaultDraw)
{
    if ( Item->ImageIndex == 1 )
        Sender->Canvas->Font->Color = clRed;

    DefaultDraw = true;
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::CancelListCustomDrawItem(
      TCustomListView *Sender, TListItem *Item, TCustomDrawState State,
      bool &DefaultDraw)
{
    Sender->Canvas->Font->Color = clPurple;
    DefaultDraw = true;
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::GoodTypeTreeCustomDrawItem(
      TCustomTreeView *Sender, TTreeNode *Node, TCustomDrawState State,
      bool &DefaultDraw)
{
    if ( Node->Level == 0 )
        Sender->Canvas->Font->Style = TFontStyles() << fsBold;

    DefaultDraw = true;
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::EditPrintExecute(TObject *Sender)
{
    if ( PrintList->SelCount <= 0 ) return;

    AnsiString Count = "1";
    if ( PrintList->SelCount == 1 )
        Count = PrintList->Selected->SubItems->Strings[4];
    if ( InputQuery("标签打印量设置", "打印标签数量", Count) == false ) return;
    try {
        if ( Count.ToInt() <= 0 ) return;

        for ( int i = 0; i < PrintList->Items->Count; i++ )
        {
            if ( PrintList->Items->Item[i]->Selected )
            {
                ExecSQL( AnsiString().sprintf("update t_goods set labelprinted=%s where idx=%d",
                    Count, (int)PrintList->Items->Item[i]->Data ) );
                PrintList->Items->Item[i]->SubItems->Strings[4] = Count;
            }
        }
    } catch(...) {
        ShowError( "标签数量输入错误" );
        return;
    }
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::CancelPrintExecute(TObject *Sender)
{
    if ( PrintList->SelCount <= 0 ) return;
    if ( ShowYesNo("真的要清除标签打印吗?") == false ) return;
    PrintList->Items->BeginUpdate();
    while ( PrintList->Selected )
    {
        ExecSQL( "update t_goods set labelprinted=0 where idx=" +
            IntToStr((int)PrintList->Selected->Data) );
        PrintList->Selected->Delete();
    }
    PrintList->Items->EndUpdate();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::CostKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::GoodNumberKeyPress(TObject *Sender,
      char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::ClearAllLabelClick(TObject *Sender)
{
    if ( PrintList->SelCount <= 0 ) return;
    if ( ShowYesNo("真的要清除 全部 标签打印吗?") == false ) return;
    PrintList->Items->BeginUpdate();
    ExecSQL( "update t_goods set labelprinted=0" );
    PrintList->Clear();
    PrintList->Items->EndUpdate();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::EditIncomingExecute(TObject *Sender)
{
    IncomingForm->NewIncoming( BuyGrid->DataSource->DataSet->FieldByName("idx")->AsInteger );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::DayCalcExecute(TObject *Sender)
{
    /*
    if ( SellList->Selected == NULL ) return;

    CalcDayTotal( (int)SellList->Selected->Data );
    FreshSellSheet();     */
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::sNumberKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();

    TEdit *pEdit = (TEdit *)Sender;
    if ( Key == 0x0D )
    {
        SearchGoods();
        if ( pEdit->Name == "sBarCode" ) pEdit->Clear();
        else pEdit->SelectAll();
    }
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::sGoodNameKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '\'' || Key == '\"' ) Abort();

    TEdit *pEdit = (TEdit *)Sender;
    if ( Key == 0x0D )
    {
        SearchGoods();
        pEdit->SelectAll();
    }
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::SearchGoods()
{
    AnsiString sql = "select g.idx, g.typeidx, g.barcode, g.name, g.goodcode, \
                      g.cost, g.goodnumber, g.labelprice, g.lowestprice, g.labelprinted, \
                      g.desp, g.goodtype as g_goodtype, g.added, t.name as goodtype from t_goods g \
                      left outer join t_goodtype t on g.typeidx = t.idx";

    if ( sBarCode->Text != "" || sGoodName->Text != "" || sGoodCode->Text != "" || sNumber->Text != "" )
    {
        sql += " where ";
        if ( sBarCode->Text != "" ) sql += "g.barcode like '%" + sBarCode->Text + "%' or ";
        if ( sGoodName->Text != "" ) sql += "g.name like '%" + sGoodName->Text + "%' or ";
        if ( sGoodCode->Text != "" ) sql += "g.goodcode like '%" + sGoodCode->Text + "%' or ";
        if ( sNumber->Text != "" ) sql += "g.goodnumber=" + sNumber->Text + " or ";
        sql = sql.SubString(1, sql.Length()-3);
    }

    d->FreshGoodList( sql );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::NewCheckExecute(TObject *Sender)
{
    CheckForm->ShowModal();
    FreshCheckSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::AuditGoodSheetShow(TObject *Sender)
{
    if ( AuditGoodSheet->Visible == false ) return;
    d->FreshAuditGood();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::N5Click(TObject *Sender)
{
    if ( AuditGoodGrid->DataSource->DataSet->FieldByName("Name1")->AsString != "" )
        d->FreshAuditGood( AuditGoodGrid->DataSource->DataSet->FieldByName("Name1")->Value );
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::ToolButton12Click(TObject *Sender)
{
    d->FreshAuditGood();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::MonthSellStatExecute(TObject *Sender)
{
    StoreStatForm->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::BuySheetShow(TObject *Sender)
{
    if ( BuySheet->Visible == false ) return;
    FreshIncomingSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::NewIncoming2Execute(TObject *Sender)
{
    IncomingForm->NewIncoming(0, 1);
    FreshIncomingSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::ChangePriceSheetShow(TObject *Sender)
{
    if ( ChangePriceSheet->Visible == false ) return;
    FreshChangePriceSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::FreshChangePriceSheet()
{
    d->ChangePriceSet->DisableControls();
    d->ChangePriceSet->Close();
    d->ChangePriceSet->Open();
    d->ChangePriceSet->EnableControls();

    d->ChangeGoodSet->DisableControls();
    d->ChangeGoodSet->Close();
    d->ChangeGoodSet->Open();
    d->ChangeGoodSet->EnableControls();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::NewChangePriceExecute(TObject *Sender)
{
    if (ChangePriceForm->NewChangePrice() == true)
        FreshChangePriceSheet();
}
//---------------------------------------------------------------------------

void __fastcall TStorageForm::GoodsSheetShow(TObject *Sender)
{
    if ( GoodsSheet->Visible == false ) return;

    sBarCode->Text = "";
    sGoodName->Text = "";
    sGoodCode->Text = "";
    sNumber->Text = "";

    if (GoodTypeTree->Selected != NULL)
        FreshGoodsList( (int)GoodTypeTree->Selected->Data );
    else
        FreshGoodsList(0);
}
//---------------------------------------------------------------------------
AnsiString __fastcall TStorageForm::UploadGoodsInfo()
{
    bool res;
    HTTP_FILE_HANDLE hfcHandle;
    AnsiString str, sql, type_name;
    int parent_id;

    // Update goods list
    TStringList *list = new TStringList();

    q->Close();
    q->SQL->Text = "SELECT * FROM t_goods WHERE ADDED = 0";
    q->Open();
    if ( q->RecordCount == 0 )
    {
        str = "商品信息: 无更新！";
    }
    else
    {
        for ( q->First(); !q->Eof; q->Next() )
        {
            sql.sprintf("SELECT * FROM T_GOODTYPE WHERE IDX=%d", q->FieldByName("typeidx")->AsInteger);
            q2->SQL->Text = sql;
            q2->Open();
            type_name = q2->FieldByName("name")->AsString;
            parent_id = q2->FieldByName("pid")->AsInteger;
            q2->Close();

            str.sprintf("%d|%d|%s|%s|%s|%s|%f|%f|%f|%f|%s|%d|1",
                            q->FieldByName("typeidx")->AsInteger,
                            parent_id,
                            type_name,
                            q->FieldByName("barcode")->AsString,
                            q->FieldByName("name")->AsString,
                            q->FieldByName("goodcode")->AsString,
                            q->FieldByName("goodnumber")->AsFloat,
                            q->FieldByName("cost")->AsFloat,
                            q->FieldByName("labelprice")->AsFloat,
                            q->FieldByName("lowestprice")->AsFloat,
                            q->FieldByName("desp")->AsString,
                            q->FieldByName("goodtype")->AsInteger);

            list->Add(str);
        }
        if ( !DirectoryExists(".\\data") )
            CreateDir(".\\data");

        list->SaveToFile(FILE_UPLOAD_GOODS_INFO);

        hfcHandle = HFC_Init();
        res = HFC_CanWebsiteVisit(hfcHandle, QYYCY_URL_LOGIN);
        if ( res == false )
            str = "商品信息: 网络连接失败";
        else
        {
            res = HFC_Login(hfcHandle, QYYCY_URL_LOGIN, QYYCY_USERNAME, QYYCY_PASSWORD, QYYCY_URL_LOGIN_OK);
            if ( res == false )
                str = "商品信息: 登陆失败！";
            else
            {
                res = HFC_Upload(hfcHandle, QYYCY_URL_UPLOAD, TYPES_GOODSINFO, FILE_UPLOAD_GOODS_INFO);
                if ( res == false )
                    str = "商品信息: 上传数据失败！";
                else
                {
                    str = "商品信息: 上传成功！";
                    ExecSQL("UPDATE t_goods set ADDED = 1 WHERE ADDED = 0");
                }
            }
        }
        HFC_Release(hfcHandle);
    }
    delete list;
    list = NULL;

    return str;
}

AnsiString __fastcall TStorageForm::UploadChangePriceList()
{
    bool res;
    HTTP_FILE_HANDLE hfcHandle;
    AnsiString str, sql, strTypeName;
    // Update goods list


    // Update change price list
    q->Close();
    q->SQL->Text = "SELECT * FROM T_CHANGEPRICE_LIST WHERE UPLOADED = 0";
    q->Open();
    if ( q->RecordCount == 0 )
    {
        str += "调价单: 无更新！";
    }
    else
    {
        TStringList *list = new TStringList();

        for ( q->First(); !q->Eof; q->Next() )
        {
            str.sprintf("%d|%s|%s|%d|%s|%d",
                                        q->FieldByName("IDX")->AsInteger,
                                        q->FieldByName("CHANGEDATE")->AsString,
                                        q->FieldByName("NAME")->AsString,
                                        q->FieldByName("TOTALNUMBER")->AsInteger,
                                        q->FieldByName("DESP")->AsString,
                                        q->FieldByName("UPLOADED")->AsInteger);
            list->Add(str);

            q2->Close();
            sql.sprintf("SELECT * FROM t_changeprice_goods WHERE LISTIDX = %d", q->FieldByName("IDX")->AsInteger);
            q2->SQL->Text = sql;
            q2->Open();
	        for ( q2->First(); !q2->Eof; q2->Next() )
	        {
	            // Get Product name
	            q3->Close();
	            q3->SQL->Text = "SELECT * FROM t_goods WHERE IDX = " + q2->FieldByName("GOODIDX")->AsString;
	            q3->Open();

	            str.sprintf("%d|%s|%s|%f|%f", q2->FieldByName("GOODIDX")->AsInteger,
	                                          q3->FieldByName("NAME")->AsString,
	                                          q3->FieldByName("BARCODE")->AsString,
	                                          q2->FieldByName("OLDPRICE")->AsFloat,
	                                          q2->FieldByName("NEWPRICE")->AsFloat);
                list->Add(str);
	        }
            list->Add("\r\n");
        }

        if ( !DirectoryExists(".\\data") )
        	CreateDir(".\\data");

        list->SaveToFile(FILE_UPLOAD_CHANGE_PRICE);

        delete list;
        list = NULL;

        // Update change price list
        hfcHandle = HFC_Init();
        res = HFC_CanWebsiteVisit(hfcHandle, QYYCY_URL_LOGIN);
        if ( res == false )
            str = "调价单: 网络连接失败！";
        else
        {
            res = HFC_Login(hfcHandle, QYYCY_URL_LOGIN, QYYCY_USERNAME, QYYCY_PASSWORD, QYYCY_URL_LOGIN_OK);
            if ( res == false )
                str = "调价单: 登陆失败！";
            else
            {
                res = HFC_Upload(hfcHandle, QYYCY_URL_UPLOAD, TYPES_UPDATE_PRICE, FILE_UPLOAD_CHANGE_PRICE);
                if ( res == false )
                    str = "调价单: 上传数据失败！";
                else
                {
                    str = "调价单: 上传成功！";
                    ExecSQL("UPDATE T_CHANGEPRICE_LIST set UPLOADED = 1 WHERE UPLOADED = 0");
                }
            }
        }
        HFC_Release(hfcHandle);
    }

    return str;
}

void __fastcall TStorageForm::UploadDataExecute(TObject *Sender)
{
    AnsiString str;

    str = UploadGoodsInfo() + "\r\n" + UploadChangePriceList();
    ShowInfo(str.c_str());
}
//---------------------------------------------------------------------------

