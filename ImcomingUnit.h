//---------------------------------------------------------------------------

#ifndef ImcomingUnitH
#define ImcomingUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
#include <ActnList.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TIncomingForm : public TForm
{
__published:	// IDE-managed Components
    TPanel *title;
    TPanel *Panel1;
    TListView *BuyList;
    TPanel *Panel2;
    TButton *Ok;
    TButton *Cancel;
    TPanel *Panel3;
    TGroupBox *GroupBox2;
    TLabel *Label2;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label6;
    TLabel *Label7;
    TEdit *GoodName;
    TEdit *GoodCode;
    TEdit *Cost;
    TEdit *Number;
    TEdit *BarCode;
    TEdit *SellPrice;
    TGroupBox *GroupBox1;
    TLabel *Label1;
    TLabel *Label8;
    TEdit *ListName;
    TImageList *ImageList1;
    TActionList *ActionList1;
    TAction *AddGood;
    TAction *DelGood;
    TAction *ExportText;
    TAction *ImportText;
    TOpenDialog *FileOpenDialog;
    TSaveDialog *FileSaveDialog;
    TButton *Button1;
    TButton *Button2;
    TButton *Button3;
    TButton *Button4;
    TPanel *Panel4;
    TLabel *Label11;
    TLabel *Label12;
    TLabel *tnumber;
    TLabel *tcost;
    TEdit *ListDesp;
    TGroupBox *GroupBox3;
    TLabel *Label16;
    TComboBox *CalcType;
    TLabel *Label18;
    TEdit *CalcPercent;
    TLabel *Label19;
    TLabel *Label21;
    TLabel *Label10;
    TLabel *ListDate;
    TLabel *Label22;
    TLabel *GoodType;
    void __fastcall AddGoodExecute(TObject *Sender);
    void __fastcall GoodNameChange(TObject *Sender);
    void __fastcall GoodCodeChange(TObject *Sender);
    void __fastcall CostChange(TObject *Sender);
    void __fastcall NumberChange(TObject *Sender);
    void __fastcall BarCodeChange(TObject *Sender);
    void __fastcall SellPriceChange(TObject *Sender);
    void __fastcall BuyListSelectItem(TObject *Sender, TListItem *Item,
          bool Selected);
    void __fastcall CostKeyPress(TObject *Sender, char &Key);
    void __fastcall NumberKeyPress(TObject *Sender, char &Key);
    void __fastcall DelGoodExecute(TObject *Sender);
    void __fastcall OkClick(TObject *Sender);
    void __fastcall SellPriceEnter(TObject *Sender);
    void __fastcall GoodNameKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall GoodCodeEnter(TObject *Sender);
    void __fastcall CostEnter(TObject *Sender);
    void __fastcall NumberEnter(TObject *Sender);
    void __fastcall ExportTextExecute(TObject *Sender);
    void __fastcall ImportTextExecute(TObject *Sender);
    void __fastcall GoodNameKeyPress(TObject *Sender, char &Key);
    void __fastcall BarCodeExit(TObject *Sender);
    void __fastcall SellPriceExit(TObject *Sender);
    void __fastcall CancelClick(TObject *Sender);
    void __fastcall CalcTypeChange(TObject *Sender);
    void __fastcall CalcLowPriceKeyPress(TObject *Sender, char &Key);
    void __fastcall CalcLowPriceExit(TObject *Sender);
    void __fastcall BarCodeKeyPress(TObject *Sender, char &Key);
private:	// User declarations
    TListItem * pCurGood;
    TDateTime today;
    int IncomingIdx;

    void __fastcall ClearAll();
    void __fastcall ClearAttrib();
    void __fastcall FillAttrib();
    void __fastcall EnableAttrib( bool e );
    bool __fastcall UpdateToDb();

    void __fastcall FreshList();
    void __fastcall SelectGood(TObject *Sender);

    void __fastcall KeyPressMove(TObject *Sender, char Key);
    void __fastcall SumAll();
    int __fastcall CheckCurComplete();
    int __fastcall CheckComplete(TListItem *pCurGood);

    void __fastcall Cancel2Click(TObject *Sender);
public:		// User declarations
    __fastcall TIncomingForm(TComponent* Owner);
    AnsiString GenerateBarCode();
    
    int dGoodType;
    bool __fastcall NewIncoming( int idx = 0, int goodtype = 0 );
};
//---------------------------------------------------------------------------
extern PACKAGE TIncomingForm *IncomingForm;
//---------------------------------------------------------------------------
#endif
