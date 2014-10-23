//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OrderFrameUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOrderFrame *OrderFrame;
//---------------------------------------------------------------------------
__fastcall TOrderFrame::TOrderFrame(TComponent* Owner)
    : TFrame(Owner)
{
}
//---------------------------------------------------------------------------
