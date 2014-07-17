//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SetChangeUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSetChangeForm *SetChangeForm;
//---------------------------------------------------------------------------
__fastcall TSetChangeForm::TSetChangeForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSetChangeForm::ChangeKeyPress(TObject *Sender,
      char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D && Key != '.' ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TSetChangeForm::OkClick(TObject *Sender)
{
    if ( Change->Text == "" ) return;
    try {
        if ( Change->Text.ToDouble() < 0 )
        {
            ShowError( "����С����" );
            Change->SelectAll();
            return;
        }

        q->SQL->Text = AnsiString().sprintf("update t_order_list set totalchange=%s where idx=%d",
            Change->Text, orderlist );
        q->ExecSQL();

        ModalResult = mrOk;

    } catch(...) {
        ShowError( "����ʽ����" );
        Change->SelectAll();
    }
}
//---------------------------------------------------------------------------

// �����״ε�¼���ڡ��������տ���ֽ����ý��տ�����������Ա�˶�
bool __fastcall TSetChangeForm::SetChange( int orderlistid )
{
    if ( orderlistid == 0 ) return false;

    orderlist = orderlistid;

    q->SQL->Text = "select totalcash from t_order_list where idx="+IntToStr(orderlist-1);
    q->Open();
    if ( q->RecordCount > 0 )
        Change->Text = MoneyStr(q->FieldByName("totalcash")->AsFloat);
    else
        Change->Text = "0.00";
    q->Close();

    if ( ShowModal() == mrOk ) return true;
    return false;
}
//---------------------------------------------------------------------------

void __fastcall TSetChangeForm::FormShow(TObject *Sender)
{
    Change->SetFocus();
    Change->SelectAll();
}
//---------------------------------------------------------------------------

