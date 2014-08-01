//---------------------------------------------------------------------------

#ifndef StorageUnitH
#define StorageUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
#include <ActnList.hpp>
#include <Menus.hpp>
#include <Dialogs.hpp>
#include "GoodsFrameUnit.h"
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TStorageForm : public TForm
{
__published:	// IDE-managed Components
    TTreeView *GoodTypeTree;
    TPanel *title;
    TPanel *Panel1;
    TToolBar *ToolBar1;
    TPanel *Panel3;
    TToolButton *ToolButton2;
    TImageList *ImageList1;
    TPopupMenu *PopupMenu1;
    TActionList *ActionList1;
    TAction *addtype;
    TAction *deltype;
    TMenuItem *N1;
    TMenuItem *N2;
    TAction *edittype;
    TMenuItem *N3;
    TCoolBar *CoolBar1;
    TPageControl *ListPage;
    TTabSheet *GoodsSheet;
    TTabSheet *BuySheet;
    TTabSheet *SellSheet;
    TTabSheet *CheckSheet;
    TSplitter *Splitter2;
    TSplitter *Splitter3;
    TToolBar *ToolBar2;
    TToolButton *ToolButton3;
    TCoolBar *CoolBar2;
    TAction *NewIncoming;
    TCoolBar *CoolBar3;
    TToolBar *ToolBar3;
    TToolButton *ToolButton4;
    TAction *NewCheck;
    TGroupBox *GroupBox2;
    TLabel *Label2;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label7;
    TEdit *sGoodName;
    TEdit *sGoodCode;
    TEdit *sNumber;
    TEdit *sBarCode;
    TImageList *ImageList2;
    TCoolBar *CoolBar4;
    TToolBar *ToolBar4;
    TDateTimePicker *SellDate;
    TLabel *Label1;
    TPopupMenu *PopupMenu2;
    TMenuItem *N4;
    TAction *StatGoodSell;
    TTabSheet *PLabelSheet;
    TListView *PrintList;
    TCoolBar *CoolBar6;
    TToolBar *ToolBar6;
    TToolButton *ToolButton8;
    TAction *ExportLabels;
    TSaveDialog *ExportLabelDialog;
    TAction *CancelPrint;
    TToolButton *ToolButton9;
    TToolButton *ToolButton10;
    TAction *EditPrint;
    TGoodsFrame *GoodsFrame1;
    TSplitter *Splitter5;
    TToolButton *ClearAllLabel;
    TAction *EditIncoming;
    TToolButton *ToolButton1;
    TToolButton *ToolButton5;
    TToolButton *ToolButton6;
    TAction *DayCalc;
    TPanel *Panel4;
    TSplitter *Splitter6;
    TTabSheet *AuditGoodSheet;
    TDBGrid *AuditGoodGrid;
    TPopupMenu *PopupMenu3;
    TMenuItem *N5;
    TToolBar *ToolBar5;
    TToolButton *ToolButton12;
    TDBGrid *CheckGoodGrid;
    TSplitter *Splitter4;
    TDBGrid *CheckListGrid;
    TToolButton *ToolButton7;
    TAction *MonthSellStat;
        TPanel *Panel2;
        TSplitter *Splitter1;
    TToolButton *ToolButton11;
    TDBGrid *BuyGrid;
    TDBGrid *SellList;
    TDBGrid *SellGoodList;
    TDBGrid *CancelGrid;
    TDBGrid *CashGrid;
    TDBGrid *IncomingGoodGrid;
    TAction *NewIncoming2;
    TToolButton *ToolButton13;
    TTabSheet *ChangePriceSheet;
    TCoolBar *CoolBar5;
    TToolBar *ToolBar7;
    TToolButton *ToolButton14;
    TDBGrid *ChangeListGrid;
    TSplitter *Splitter7;
    TDBGrid *ChangeGoodGrid;
    TTabSheet *LoseSheet;
    TToolButton *ToolButton15;
    TToolButton *ToolButton16;
    TAction *PrividerManage;
    TAction *NewChangePrice;
    void __fastcall GoodTypeTreeContextPopup(TObject *Sender,
          TPoint &MousePos, bool &Handled);
    void __fastcall addtypeExecute(TObject *Sender);
    void __fastcall deltypeExecute(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall edittypeExecute(TObject *Sender);
    void __fastcall GoodTypeTreeChange(TObject *Sender, TTreeNode *Node);
    void __fastcall NewIncomingExecute(TObject *Sender);
    void __fastcall SellSheetShow(TObject *Sender);
    void __fastcall PLabelSheetShow(TObject *Sender);
    void __fastcall CheckSheetShow(TObject *Sender);
    void __fastcall ExportLabelsExecute(TObject *Sender);
    void __fastcall GoodTypeTreeDragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
    void __fastcall GoodTypeTreeDragDrop(TObject *Sender, TObject *Source,
          int X, int Y);
    void __fastcall ToolButton2Click(TObject *Sender);
    void __fastcall SellDateCloseUp(TObject *Sender);
    void __fastcall SellGoodsListCustomDrawItem(TCustomListView *Sender,
          TListItem *Item, TCustomDrawState State, bool &DefaultDraw);
    void __fastcall CancelListCustomDrawItem(TCustomListView *Sender,
          TListItem *Item, TCustomDrawState State, bool &DefaultDraw);
    void __fastcall GoodTypeTreeCustomDrawItem(TCustomTreeView *Sender,
          TTreeNode *Node, TCustomDrawState State, bool &DefaultDraw);
    void __fastcall EditPrintExecute(TObject *Sender);
    void __fastcall CancelPrintExecute(TObject *Sender);
    void __fastcall CostKeyPress(TObject *Sender, char &Key);
    void __fastcall GoodNumberKeyPress(TObject *Sender, char &Key);
    void __fastcall ClearAllLabelClick(TObject *Sender);
    void __fastcall EditIncomingExecute(TObject *Sender);
    void __fastcall DayCalcExecute(TObject *Sender);
    void __fastcall sNumberKeyPress(TObject *Sender, char &Key);
    void __fastcall sGoodNameKeyPress(TObject *Sender, char &Key);
    void __fastcall NewCheckExecute(TObject *Sender);
    void __fastcall AuditGoodSheetShow(TObject *Sender);
    void __fastcall N5Click(TObject *Sender);
    void __fastcall ToolButton12Click(TObject *Sender);
    void __fastcall MonthSellStatExecute(TObject *Sender);
    void __fastcall BuySheetShow(TObject *Sender);
    void __fastcall NewIncoming2Execute(TObject *Sender);
    void __fastcall ChangePriceSheetShow(TObject *Sender);
    void __fastcall NewChangePriceExecute(TObject *Sender);
    void __fastcall GoodsSheetShow(TObject *Sender);
private:	// User declarations
    TTreeNode * pGoodsRoot, *pIncomingRoot, *pSellRoot, *pCheckRoot,
    *pSearchRoot, *pPrintLabelRoot, *pAuditGoodRoot;

    void __fastcall FreshTree();
    TTreeNode * __fastcall FindNode( int Id );
    void __fastcall FreshGoodsList( int GoodTypeId );
    void __fastcall FreshIncomingSheet();
    void __fastcall FreshSellSheet();
    void __fastcall FreshCheckSheet();
    void __fastcall FreshPrintSheet();
    void __fastcall FreshChangePriceSheet();

    void __fastcall CancelPrintLabel( int goodid );
    void __fastcall SetPrintLabel( int goodid, int storage );

    void __fastcall SearchGoods();
public:		// User declarations
    __fastcall TStorageForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStorageForm *StorageForm;
//---------------------------------------------------------------------------
#endif
