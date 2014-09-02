//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SysSetUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSysSetForm *SysSetForm;
//---------------------------------------------------------------------------
__fastcall TSysSetForm::TSysSetForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::SysSet()
{
    q->SQL->Text = "select * from t_const";
    q->Open();
    if ( q->RecordCount > 0 )
    {
        q->First();
        LowestProfit->Text = q->FieldByName("val")->AsFloat * 100;

        q->Next();
        PrintHead->Text = q->FieldByName("val")->AsString;

        q->Next();
        PrintTail->Text = q->FieldByName("val")->AsString;
    }
    q->Close();

    q->SQL->Text = "select * from t_const where NAME='ShopNo'";
    q->Prepare();
    q->Open();
    EditShopNo->Text = q->FieldByName("VAL")->AsString;
    q->Close();

        
    TListItem *pItem;
    AdminList->Clear();
    q->SQL->Text = "select * from t_admin";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        pItem = AdminList->Items->Add();
        pItem->Caption = q->FieldByName("name")->AsString;
        pItem->SubItems->Add( q->FieldByName("ulevel")->AsString );
        pItem->SubItems->Add( q->FieldByName("desp")->AsString );
        pItem->SubItems->Add( GetPassword(q->FieldByName("pwd")->AsString) );
        pItem->Data = (void*)q->FieldByName("idx")->AsInteger;
        pItem->ImageIndex = 0;
    }
    q->Close();

    UserList->Clear();
    q->SQL->Text = "select * from t_user";
    q->Open();
    for ( q->First(); !q->Eof; q->Next() )
    {
        pItem = UserList->Items->Add();
        pItem->Caption = q->FieldByName("serial")->AsString;
        pItem->SubItems->Add( q->FieldByName("name")->AsString );
        pItem->SubItems->Add( q->FieldByName("desp")->AsString );
        pItem->Data = (void*)q->FieldByName("idx")->AsInteger;
        pItem->ImageIndex = 1;
    }
    q->Close();

    deladmin.clear();
    deluser.clear();
    PageControl1->ActivePageIndex = 0;
    ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::LowestProfitKeyPress(TObject *Sender,
      char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AdminListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
    AdminName->Text = "";
    AdminPwd->Text = "";
    AdminDesp->Text = "";
    LevelUpDown->Position = 0;
    AdminName->Enabled = false;
    AdminPwd->Enabled = false;
    AdminDesp->Enabled = false;
    Level->Enabled = false;
    LevelUpDown->Enabled = false;
    DelAdmin->Enabled = false;
    if ( Selected )
    {
        AdminName->Text = Item->Caption;
        AdminPwd->Text = Item->SubItems->Strings[2];
        AdminDesp->Text = Item->SubItems->Strings[1];
        LevelUpDown->Position = Item->SubItems->Strings[0].ToInt();

        if ( AdminName->Text == "超级管理员" )
        {
            AdminPwd->Enabled = true;
            AdminDesp->Enabled = true;
        }
        else
        {
            AdminName->Enabled = true;
            AdminPwd->Enabled = true;
            AdminDesp->Enabled = true;
            LevelUpDown->Enabled = true;
            Level->Enabled = true;
            DelAdmin->Enabled = true;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::UserListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
    UserName->Text = "";
    UserSerial->Text = "";
    UserDesp->Text = "";
    UserName->Enabled = false;
    UserSerial->Enabled = false;
    UserDesp->Enabled = false;
    DelUser->Enabled = false;
    if ( Selected )
    {
        UserSerial->Text = Item->Caption;
        UserName->Text = Item->SubItems->Strings[0];
        UserDesp->Text = Item->SubItems->Strings[1];

        UserName->Enabled = true;
        UserSerial->Enabled = true;
        UserDesp->Enabled = true;
        DelUser->Enabled = true;
    }
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::OkClick(TObject *Sender)
{
    if ( LowestProfit->Text == "" )
    {
        ShowError("请输入最低利润比例");
        return;
    }

    TListItem *pItem;
    int i;
    AnsiString sTmp;

    // save page1
    ExecSQL( AnsiString().sprintf("update t_const set val='%.2f' where idx=0",
        LowestProfit->Text.ToDouble() / 100.0 ) );
    MinProfitPercent = 1 - LowestProfit->Text.ToDouble() / 100.0;

    sTmp = PrintHead->Text;
    ReplaceStr(sTmp, "'", "''");
    ExecSQL( AnsiString().sprintf("update t_const set val='%s' where idx=1", sTmp ) );

    sTmp = PrintTail->Text;
    ReplaceStr(sTmp, "'", "''");
    ExecSQL( AnsiString().sprintf("update t_const set val='%s' where idx=2", sTmp ) );

    // save page2
    for ( i = 0; i < AdminList->Items->Count; i++ )
    {
        pItem = AdminList->Items->Item[i];
        if ( (int)pItem->Data > 0 )
            ExecSQL( AnsiString().sprintf("update t_admin set \
            name='%s', pwd='%s', ulevel=%s, desp='%s' where idx=%d",
            pItem->Caption, MakePassword(pItem->SubItems->Strings[2]),
            pItem->SubItems->Strings[0], pItem->SubItems->Strings[1],
            (int)pItem->Data) );
        else
            ExecSQL( AnsiString().sprintf("insert into t_admin( \
            name, pwd, ulevel, desp) values('%s', '%s', %s, '%s')",
            pItem->Caption, MakePassword(pItem->SubItems->Strings[2]),
            pItem->SubItems->Strings[0], pItem->SubItems->Strings[1]) );
    }
    for ( i = 0; i < (int)deladmin.size(); i++ )
    {
        ExecSQL( "delete from t_admin where idx=" + IntToStr(deladmin[i]) );
    }

    // save page3
    for ( i = 0; i < UserList->Items->Count; i++ )
    {
        pItem = UserList->Items->Item[i];
        if ( (int)pItem->Data > 0 )
            ExecSQL( AnsiString().sprintf("update t_user set \
            serial='%s', name='%s', desp='%s' where idx=%d",
            pItem->Caption, pItem->SubItems->Strings[0],
            pItem->SubItems->Strings[1], (int)pItem->Data) );
        else
            ExecSQL( AnsiString().sprintf("insert into t_user( \
            serial, name, desp) values('%s', '%s', '%s')",
            pItem->Caption, pItem->SubItems->Strings[0],
            pItem->SubItems->Strings[1]) );
    }
    for ( i = 0; i < (int)deluser.size(); i++ )
    {
        ExecSQL( "delete from t_user where idx=" + IntToStr(deluser[i]) );
    }

    // save page4 (多店设置)
    // 查询数据库中是否有相同调价单
    q->SQL->Text = "select count(*) as line from t_const where NAME='ShopNo'";
    q->Prepare();
    q->Open();
    int number = q->FieldByName("line")->AsInteger;
    q->Close();
    if ( number == 0 )
    {
        ExecSQL( AnsiString().sprintf("INSERT INTO T_CONST(NAME, VAL) VALUES('ShopNo', '%s')", EditShopNo->Text));
    }
    else
    {
        ExecSQL( AnsiString().sprintf("UPDATE T_CONST SET VAL='%s' WHERE NAME='ShopNo'", EditShopNo->Text));
    }

    ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AddAdminClick(TObject *Sender)
{
    TListItem *pItem;

    pItem = AdminList->Items->Add();
    pItem->Caption = "新管理员";
    pItem->SubItems->Text = "1\n\n\n";
    pItem->ImageIndex = 0;
    pItem->Data = 0;
    pItem->Selected = true;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::DelAdminClick(TObject *Sender)
{
    if ( (int)AdminList->Selected->Data > 0 )
        deladmin.push_back( (int)AdminList->Selected->Data );

    AdminList->Selected->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AddUserClick(TObject *Sender)
{
    TListItem *pItem;

    pItem = UserList->Items->Add();
    pItem->Caption = "";
    pItem->SubItems->Text = "\n\n";
    pItem->ImageIndex = 1;
    pItem->Data = 0;
    pItem->Selected = true;
    UserSerial->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::DelUserClick(TObject *Sender)
{
    if ( (int)UserList->Selected->Data > 0 )
        deluser.push_back( (int)UserList->Selected->Data );

    UserList->Selected->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AdminNameChange(TObject *Sender)
{
    if ( !AdminList->Selected ) return;
    if ( ((TEdit*)Sender)->Text == "" ) return;
    AdminList->Selected->Caption = AdminName->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AdminPwdChange(TObject *Sender)
{
    if ( !AdminList->Selected ) return;
    if ( ((TEdit*)Sender)->Text == "" ) return;
    AdminList->Selected->SubItems->Strings[2] = AdminPwd->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AdminDespChange(TObject *Sender)
{
    if ( !AdminList->Selected ) return;
    AdminList->Selected->SubItems->Strings[1] = AdminDesp->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::LevelChange(TObject *Sender)
{
    if ( !AdminList->Selected ) return;
    if ( ((TEdit*)Sender)->Text == "" ) return;
    if ( Level->Text == "" ) Level->Text = "1";
    AdminList->Selected->SubItems->Strings[0] = Level->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::UserNameChange(TObject *Sender)
{
    if ( !UserList->Selected ) return;
    UserList->Selected->SubItems->Strings[0] = UserName->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::UserSerialChange(TObject *Sender)
{
    if ( !UserList->Selected ) return;
    UserList->Selected->Caption = UserSerial->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::UserDespChange(TObject *Sender)
{
    if ( !UserList->Selected ) return;
    UserList->Selected->SubItems->Strings[1] = UserDesp->Text;
}
//---------------------------------------------------------------------------

void __fastcall TSysSetForm::AdminNameKeyPress(TObject *Sender, char &Key)
{
    if ( Key == '\'' || Key == '\"' ) Abort();    
}
//---------------------------------------------------------------------------


void __fastcall TSysSetForm::EditShopNoKeyPress(TObject *Sender, char &Key)
{
    if ( (Key < '0' || Key > '9') && Key != 8 && Key != 0x0D ) Abort();
}
//---------------------------------------------------------------------------

