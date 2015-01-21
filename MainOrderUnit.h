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
#include "HttpThread.h"

#define WM_UPDATESCALERBAR WM_USER+1

//---------------------------------------------------------------------------
class TMainOrderForm : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TTabSheet *TabSheet3;
    TCoolBar *CoolBar1;
    TToolBar *ToolBar1;
    TToolButton *LoginButton;
    TImageList *ImageList1;
    TToolButton *CheckoutButton;
	TStatusBar *StatusBar;
    TOrderFrame *OrderFrame1;
    TTabSheet *TabSheet5;
    TOrderFrame *OrderFrame2;
    TOrderFrame *OrderFrame3;
    TLabel *Label1;
	TDateTimePicker *OrderDate;
    TButton *BtnQuery;
    TPanel *Panel1;
    TOrderFrame *OrderFrame5;
    TButton *Button1;
	TToolButton *UpdateScale;
	TToolButton *ToolButton2;
    void __fastcall CheckoutButtonClick(TObject *Sender);
    void __fastcall LoginButtonClick(TObject *Sender);
    void __fastcall TabSheet1Show(TObject *Sender);
    void __fastcall TabSheet2Show(TObject *Sender);
    void __fastcall TabSheet3Show(TObject *Sender);
    void __fastcall TabSheet5Show(TObject *Sender);
    void __fastcall BtnQueryClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
	void __fastcall OrderDateChange(TObject *Sender);
    void __fastcall Button1Click(TObject *Sender);
	void __fastcall UpdateScaleClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TMainOrderForm(TComponent* Owner);
	THttpThread *httpThread;

    void __fastcall UpdateScalerBar(TMessage &msg);
        
    BEGIN_MESSAGE_MAP
        VCL_MESSAGE_HANDLER(WM_UPDATESCALERBAR, TMessage, UpdateScalerBar)
    END_MESSAGE_MAP(TForm);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainOrderForm *MainOrderForm;
//---------------------------------------------------------------------------
#endif
