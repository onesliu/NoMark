//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DetailUnit.h"
#include "CommonUnit.h"
#include "MessageBoxes.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDetailForm *DetailForm;
//---------------------------------------------------------------------------
__fastcall TDetailForm::TDetailForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

bool __fastcall TDetailForm::EditDetail( TListItem *Item )
{
    if ( Item == NULL ) return false;

    Inout->ItemIndex = Item->SubItems->Strings[2].ToInt();
    Usage->Text = Item->SubItems->Strings[0];
    Cost->Text = Item->SubItems->Strings[1];

    if ( ShowModal() == mrOk )
    {
        Item->Caption = Inout->Text;
        Item->SubItems->Strings[2] = Inout->ItemIndex;
        Item->SubItems->Strings[0] = Usage->Text;
        Item->SubItems->Strings[1] = MoneyStr(Cost->Text.ToDouble());
        return true;
    }

    return false;
}
//---------------------------------------------------------------------------

void __fastcall TDetailForm::CostKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TDetailForm::UsageKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '\'' || Key == '\"' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TDetailForm::OkClick(TObject *Sender)
{
    if ( Usage->Text == "" || Cost->Text == "" )
    {
        ShowError("请输入用途和金额");
        Abort();
    }

    try {
        Cost->Text.ToDouble();
    } catch(...)
    {
        ShowError("金额格式错误");
        Abort();
    }

    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

