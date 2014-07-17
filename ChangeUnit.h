//---------------------------------------------------------------------------

#ifndef ChangeUnitH
#define ChangeUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TChangeForm : public TForm
{
__published:	// IDE-managed Components
    TPanel *title;
    TPanel *Panel2;
    TPageControl *OrderGuide;
    TTabSheet *TabSheet1;
    TLabel *NumberLabel;
    TEdit *Number;
    TTabSheet *TabSheet2;
    TLabel *TotalLabel;
    TEdit *Total;
    TPanel *Panel3;
    TListView *ChangeList;
    TImageList *ImageList2;
    TLabel *PriceLabel;
    TEdit *Price;
    TLabel *Label20;
    TLabel *Reduce;
    TLabel *Label22;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label7;
    TLabel *Label8;
    TLabel *Label3;
    TLabel *Label15;
    TLabel *Label16;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label23;
    TLabel *Label24;
    TLabel *Label4;
    TLabel *Label6;
    TLabel *Label12;
    TLabel *Label19;
    TLabel *Label21;
    TLabel *Label25;
    TLabel *Label26;
    TLabel *AddupLabel;
    TEdit *Addup;
    TLabel *GetMoneyLabel;
    TEdit *GetMoney;
    TLabel *Label11;
    TLabel *GiveChange;
    void __fastcall NumberKeyPress(TObject *Sender, char &Key);
    void __fastcall TotalKeyPress(TObject *Sender, char &Key);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall PriceKeyPress(TObject *Sender, char &Key);
    void __fastcall PriceKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall GetMoneyKeyPress(TObject *Sender, char &Key);
    void __fastcall GetMoneyChange(TObject *Sender);
private:	// User declarations
    int CurItem;
    double CurLabelPrice, CurLowestPrice;
    double reduce;
    double cost;

    void __fastcall NewChangeList();
    bool __fastcall CommitChangeList();
    void __fastcall NewGoodItem();
    void __fastcall CancelGoodItem();
    void __fastcall KeyProcess( char Key );
    void __fastcall KeyProcess2( char Key );

    void __fastcall AutoList();
    void __fastcall AddUpTo();

    void __fastcall EnterBox( TEdit *pEdit, TLabel *pLabel );
    void __fastcall LeaveBox( TEdit *pEdit, TLabel *pLabel );
public:		// User declarations
    __fastcall TChangeForm(TComponent* Owner);

    int orderlist;
    int cancelgood;
    double changeprice;
};
//---------------------------------------------------------------------------
extern PACKAGE TChangeForm *ChangeForm;
//---------------------------------------------------------------------------
#endif
