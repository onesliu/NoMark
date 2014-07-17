//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "LoginUnit.h"
#include "DbUnit.h"
//---------------------------------------------------------------------------
USEFORM("DbUnit.cpp", d); /* TDataModule: File Type */
USEFORM("ImcomingUnit.cpp", IncomingForm);
USEFORM("StorageUnit.cpp", StorageForm);
USEFORM("GoodsFrameUnit.cpp", GoodsFrame); /* TFrame: File Type */
USEFORM("CheckUnit.cpp", CheckForm);
USEFORM("SysSetUnit.cpp", SysSetForm);
USEFORM("LoginUnit.cpp", LoginForm);
USEFORM("GoodAttribUnit.cpp", GoodAttribForm);
USEFORM("StoreStatUnit.cpp", StoreStatForm);
USEFORM("NameIMEUnit.cpp", NameIME);
USEFORM("SelectUnit.cpp", SelectForm);
USEFORM("ChangePriceUnit.cpp", ChangePriceForm);
//---------------------------------------------------------------------------
void FirstLogin();

WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
         Application->Initialize();
         Application->Title = "库存管理";
         Application->CreateForm(__classid(TStorageForm), &StorageForm);
         Application->CreateForm(__classid(Td), &d);
         Application->CreateForm(__classid(TIncomingForm), &IncomingForm);
         Application->CreateForm(__classid(TCheckForm), &CheckForm);
         Application->CreateForm(__classid(TSysSetForm), &SysSetForm);
         Application->CreateForm(__classid(TLoginForm), &LoginForm);
         Application->CreateForm(__classid(TGoodAttribForm), &GoodAttribForm);
         Application->CreateForm(__classid(TStoreStatForm), &StoreStatForm);
         Application->CreateForm(__classid(TNameIME), &NameIME);
         Application->CreateForm(__classid(TSelectForm), &SelectForm);
         Application->CreateForm(__classid(TChangePriceForm), &ChangePriceForm);
         FirstLogin();
         if ( LoginForm->AdminLogin() == false )
             Application->Terminate();
         Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    catch (...)
    {
         try
         {
             throw Exception("");
         }
         catch (Exception &exception)
         {
             Application->ShowException(&exception);
         }
    }
    return 0;
}
//---------------------------------------------------------------------------

void FirstLogin()
{
    bool first = false;

    q->SQL->Text = "select * from t_admin";
    q->Open();
    if ( q->RecordCount <= 0 ) first = true;
    q->Close();

    if ( first )
    {
        AnsiString pwd = MakePassword( "123456" );
        ExecSQL( "insert into t_admin(name,pwd,ulevel) values('超级管理员', '" + pwd + "', 0)" );
    }
}
