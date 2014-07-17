//---------------------------------------------------------------------------

#ifndef PrinterUnitH
#define PrinterUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <QuickRpt.hpp>
#include <QRCtrls.hpp>
//---------------------------------------------------------------------------
class TPrinterForm : public TForm
{
__published:	// IDE-managed Components
    TQuickRep *ReceiptRep;
    TQRBand *Title;
    TQRBand *Column;
    TQRLabel *QRLabel1;
    TQRLabel *QRLabel2;
    TQRLabel *QRLabel3;
    TQRLabel *QRLabel4;
    TQRBand *Detail;
    TQRDBText *GoodName;
    TQRDBText *QRDBText2;
    TQRDBText *QRDBText3;
    TQRBand *Tail;
    TQRLabel *QRLabel6;
    TQRExpr *QRExpr1;
    TQRLabel *QRLabel5;
    TQRSysData *QRSysData1;
private:	// User declarations
public:		// User declarations
    __fastcall TPrinterForm(TComponent* Owner);

    void __fastcall SetPageLength(int line);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrinterForm *PrinterForm;
//---------------------------------------------------------------------------
#endif
