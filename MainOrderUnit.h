//---------------------------------------------------------------------------

#ifndef MainOrderUnitH
#define MainOrderUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
#include "OrderFrameUnit.h"
#include <ExtCtrls.hpp>
#include "qyycy.h"

//---------------------------------------------------------------------------
class TMainOrderForm : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TTabSheet *TabSheet3;
    TTabSheet *TabSheet4;
    TCoolBar *CoolBar1;
    TToolBar *ToolBar1;
    TToolButton *LoginButton;
    TImageList *ImageList1;
    TToolButton *CheckoutButton;
    TStatusBar *StatusBar1;
    TOrderFrame *OrderFrame1;
    TTabSheet *TabSheet5;
    TTimer *MainTimer;
    TOrderFrame *OrderFrame2;
    TOrderFrame *OrderFrame3;
    TOrderFrame *OrderFrame4;
    TLabel *Label1;
    TDateTimePicker *DateTimePicker1;
    TButton *BtnQuery;
    TPanel *Panel1;
    TOrderFrame *OrderFrame5;
    void __fastcall CheckoutButtonClick(TObject *Sender);
    void __fastcall LoginButtonClick(TObject *Sender);
    void __fastcall TabSheet1Show(TObject *Sender);
    void __fastcall TabSheet2Show(TObject *Sender);
    void __fastcall TabSheet3Show(TObject *Sender);
    void __fastcall TabSheet4Show(TObject *Sender);
    void __fastcall TabSheet5Show(TObject *Sender);
    void __fastcall BtnQueryClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall MainTimerTimer(TObject *Sender);
private:	// User declarations
    bool m_bLogin;
    HFC_DATA_S *hfcData;
    char outch[MAX_PATH];
    bool __fastcall GetOrders();
    bool __fastcall ParseOrders();
    bool __fastcall InsertList();
    char* __fastcall UTF8toGBK(string str);
public:		// User declarations
    __fastcall TMainOrderForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainOrderForm *MainOrderForm;
//---------------------------------------------------------------------------
#endif
