//---------------------------------------------------------------------------

#ifndef OrderUnitH
#define OrderUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <Graphics.hpp>
#include <Menus.hpp>
#include <ActnList.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TOrderForm : public TForm
{
__published:	// IDE-managed Components
    TListView *OrderList;
    TPanel *title;
    TPanel *Panel2;
    TPageControl *OrderGuide;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label4;
    TLabel *Label6;
    TLabel *Label7;
    TLabel *Label8;
    TPanel *Panel3;
    TLabel *Label3;
    TLabel *Label12;
    TLabel *NumberLabel;
    TEdit *Number;
    TEdit *Price;
    TLabel *PriceLabel;
    TLabel *TotalLabel;
    TEdit *Total;
    TLabel *CheckOutLabel;
    TEdit *CheckOut;
    TPageControl *SellPage;
    TTabSheet *SellSheet;
    TTabSheet *ChangeSheet;
    TTabSheet *SearchSheet;
    TImageList *ImageList1;
    TPanel *Panel1;
    TPanel *Panel4;
    TListView *SellGoodsList;
    TPanel *Panel5;
    TLabel *Label13;
    TListView *GoodsList;
    TPanel *Panel6;
    TImageList *ImageList2;
    TLabel *Label14;
    TLabel *TotalSell;
    TPanel *Panel8;
    TLabeledEdit *BarCode;
    TLabeledEdit *GoodName;
    TLabeledEdit *GoodCode;
    TLabel *Label15;
    TLabel *Label16;
    TDateTimePicker *SellDate;
    TPopupMenu *PopupMenu1;
    TMenuItem *CancelMark;
    TActionList *ActionList1;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label19;
    TAction *DoCancel;
    TLabel *Label20;
    TLabel *Reduce;
    TLabel *Label22;
    TLabel *Label23;
    TLabel *Label24;
    TLabel *Label21;
    TLabel *Label25;
    TLabel *Label26;
    TLabel *Label18;
    TLabel *TotalNumber;
    TLabel *GetMoneyLabel;
    TEdit *GetMoney;
    TLabel *Label11;
    TLabel *GiveChange;
    TToolBar *ToolBar1;
    TToolButton *ToolButton2;
    TLabel *TotalCash;
    TLabel *Label27;
    TLabel *TotalCancel;
        TToolBar *ToolBar2;
    TToolButton *ToolButton6;
        TToolButton *ToolButton4;
        TToolButton *ToolButton5;
    TLabel *Label5;
    TLabel *Reduce2;
    TLabel *Label29;
    TAction *Search;
    TAction *SearchAll;
    TComboBox *GoodType;
    TListView *CancelList;
    TSplitter *Splitter1;
    TLabel *Label17;
    TToolButton *ToolButton1;
    TToolButton *ToolButton3;
    TAction *SetChange;
    TAction *ShowSell;
    TAction *ShowSellList;
    TAction *ShowSearch;
    TLabel *TestMark1;
    TLabel *TestMark2;
    TLabel *TestMark3;
    TLabel *Label28;
    TLabel *TotalIncome;
    TLabel *Label31;
    TLabel *TotalExpenses;
    TLabel *Label33;
    TLabel *BankSave;
    TLabel *TotalChange;
    TLabel *Label36;
    TTimer *DutyTimer;
    TEdit *SellCount;
    TLabel *SellCountLabel;
    TToolButton *ToolButton7;
    TToolButton *ToolButton8;
    void __fastcall NumberKeyPress(TObject *Sender, char &Key);
    void __fastcall PriceKeyPress(TObject *Sender, char &Key);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall CheckOutKeyPress(TObject *Sender, char &Key);
    void __fastcall SellSheetShow(TObject *Sender);
    void __fastcall NumberEnter(TObject *Sender);
    void __fastcall ChangeSheetShow(TObject *Sender);
    void __fastcall SellGoodsListContextPopup(TObject *Sender,
          TPoint &MousePos, bool &Handled);
    void __fastcall DoCancelExecute(TObject *Sender);
    void __fastcall PriceKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall GetMoneyKeyPress(TObject *Sender, char &Key);
    void __fastcall GetMoneyChange(TObject *Sender);
    void __fastcall SellGoodsListSelectItem(TObject *Sender,
          TListItem *Item, bool Selected);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall CheckOutKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall BarCodeChange(TObject *Sender);
    void __fastcall SearchSheetShow(TObject *Sender);
    void __fastcall SearchExecute(TObject *Sender);
    void __fastcall SearchAllExecute(TObject *Sender);
    void __fastcall GoodTypeChange(TObject *Sender);
    void __fastcall BarCodeKeyPress(TObject *Sender, char &Key);
    void __fastcall GoodsListColumnClick(TObject *Sender,
          TListColumn *Column);
    void __fastcall SetChangeExecute(TObject *Sender);
    void __fastcall SellDateCloseUp(TObject *Sender);
    void __fastcall SellGoodsListCustomDrawItem(TCustomListView *Sender,
          TListItem *Item, TCustomDrawState State, bool &DefaultDraw);
    void __fastcall CancelListCustomDrawItem(TCustomListView *Sender,
          TListItem *Item, TCustomDrawState State, bool &DefaultDraw);
    void __fastcall ShowSellExecute(TObject *Sender);
    void __fastcall ShowSellListExecute(TObject *Sender);
    void __fastcall ShowSearchExecute(TObject *Sender);
    void __fastcall GoodsListCompare(TObject *Sender, TListItem *Item1,
          TListItem *Item2, int Data, int &Compare);
    void __fastcall DutyTimerTimer(TObject *Sender);
    void __fastcall SellCountKeyPress(TObject *Sender, char &Key);
    void __fastcall ToolButton7Click(TObject *Sender);
    void __fastcall ToolButton8Click(TObject *Sender);
private:	// User declarations
    TDateTime today;
    int orderlist, curlist;
    double CurLabelPrice, CurLowestPrice;
    double reduce;
    double cost;
    double TotalCost, TotalLowest, TotalReduce;
    TWinControl * pControl;
    int ColumnToSort;
    bool DescSort;
    int sCount;

    void __fastcall NewOrderList();
    bool __fastcall CommitOrderList();
    void __fastcall NewGoodItem();
    void __fastcall CancelGoodItem();
    void __fastcall AddUpTo();

    void __fastcall EnterBox( TEdit *pEdit, TLabel *pLabel );
    void __fastcall LeaveBox( TEdit *pEdit, TLabel *pLabel );

    void __fastcall KeyProcess1( char &Key );
    void __fastcall KeyProcess2( char &Key );

    void __fastcall FreshSellSheet( TDateTime date );
    void __fastcall PosGoodItem( int goodidx );

    void __fastcall PrintSellList(AnsiString selltime);
    void __fastcall FreshGoodsList( AnsiString sql );
    void __fastcall FreshTotal( int orderlistid = 0 );
public:		// User declarations
    __fastcall TOrderForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderForm *OrderForm;
//---------------------------------------------------------------------------
#endif
