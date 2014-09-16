//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "UserLoginUnit.h"
#include "DbUnit.h"
//---------------------------------------------------------------------------
USEFORM("DbUnit.cpp", d); /* TDataModule: File Type */
USEFORM("SetChangeUnit.cpp", SetChangeForm);
USEFORM("UserLoginUnit.cpp", UserLoginForm);
USEFORM("CashSetUnit.cpp", CashSetForm);
USEFORM("DetailUnit.cpp", DetailForm);
USEFORM("ShowChangeUnit.cpp", ShowChangeForm);
USEFORM("SelectUnit.cpp", SelectForm);
USEFORM("PrinterUnit.cpp", PrinterForm);
USEFORM("OrderUnit.cpp", OrderForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR param, int)
{
    try
    {
         if ( AnsiString(param) != ""  )
         {
             if ( AnsiString(param) == "-t 1" ) TestMode = 1;
             else if ( AnsiString(param) == "-t 2" ) TestMode = 2;
             else if ( AnsiString(param) == "-d" ) TestMode = -1;
             else {
                ShowMessage( "错误的参数,请使用以下参数:\n-t 1\n-t 2" );
                return -1;
             }
         }

         //检查已存在的进程实例
         AnsiString MutexName = "nomarksell" + IntToStr(TestMode);
         CreateMutex( NULL, TRUE, MutexName.c_str() );
         if ( GetLastError() == ERROR_ALREADY_EXISTS )
         {
             return -1;
         }

         Application->Initialize();
         Application->Title = "销售客户端";
         Application->CreateForm(__classid(TOrderForm), &OrderForm);
         Application->CreateForm(__classid(Td), &d);
         Application->CreateForm(__classid(TSetChangeForm), &SetChangeForm);
         Application->CreateForm(__classid(TUserLoginForm), &UserLoginForm);
         Application->CreateForm(__classid(TCashSetForm), &CashSetForm);
         Application->CreateForm(__classid(TDetailForm), &DetailForm);
         Application->CreateForm(__classid(TShowChangeForm), &ShowChangeForm);
         Application->CreateForm(__classid(TSelectForm), &SelectForm);
         Application->CreateForm(__classid(TPrinterForm), &PrinterForm);
         if ( UserLoginForm->UserLogin() == false )
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

