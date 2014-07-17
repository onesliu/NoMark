//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ShowChangeUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TShowChangeForm *ShowChangeForm;
//---------------------------------------------------------------------------
__fastcall TShowChangeForm::TShowChangeForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

bool __fastcall TShowChangeForm::ShowChange( AnsiString change )
{
    Change->Caption = "’“¡„: " + change;
    ShowModal();

    return true;
}
//---------------------------------------------------------------------------

