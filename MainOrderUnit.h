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
    TToolButton *ToolButton1;
    TImageList *ImageList1;
    TToolButton *ToolButton2;
    TStatusBar *StatusBar1;
    TOrderFrame *OrderFrame1;
    TTabSheet *TabSheet5;
    TTimer *MainTimer;
    TOrderFrame *OrderFrame2;
    TOrderFrame *OrderFrame3;
    TOrderFrame *OrderFrame4;
    TLabel *Label1;
    TDateTimePicker *DateTimePicker1;
    TButton *Button1;
    TPanel *Panel1;
    TOrderFrame *OrderFrame5;
    void __fastcall ToolButton2Click(TObject *Sender);
    void __fastcall ToolButton1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TMainOrderForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainOrderForm *MainOrderForm;
//---------------------------------------------------------------------------
#endif
