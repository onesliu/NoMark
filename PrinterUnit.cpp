//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PrinterUnit.h"
#include "DbUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TPrinterForm *PrinterForm;
//---------------------------------------------------------------------------
__fastcall TPrinterForm::TPrinterForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TPrinterForm::SetPageLength(int line)
{
    double len;

    len = Title->Size->Length + Column->Size->Length + Detail->Size->Length*line  + Tail->Size->Length +
    ReceiptRep->Page->TopMargin + ReceiptRep->Page->BottomMargin + 0.1*line;
    ReceiptRep->Page->Length = len;
}
//---------------------------------------------------------------------------

