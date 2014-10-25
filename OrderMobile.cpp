//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("MainOrderUnit.cpp", MainOrderForm);
USEFORM("OrderFrameUnit.cpp", OrderFrame); /* TFrame: File Type */
USEFORM("LoginDlgUnit.cpp", LoginDlg);
USEFORM("CheckoutUnit.cpp", CheckoutForm);
USEFORM("OrderInfoUnit.cpp", OrderInfoForm);
USEFORM("ScaleInputUnit.cpp", ScaleInputForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
         Application->Initialize();
         Application->CreateForm(__classid(TMainOrderForm), &MainOrderForm);
         Application->CreateForm(__classid(TLoginDlg), &LoginDlg);
         Application->CreateForm(__classid(TCheckoutForm), &CheckoutForm);
         Application->CreateForm(__classid(TOrderInfoForm), &OrderInfoForm);
         Application->CreateForm(__classid(TScaleInputForm), &ScaleInputForm);
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
