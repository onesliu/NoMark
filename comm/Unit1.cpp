//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#define TOSTRING(arg) #arg
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
   Send->Enabled = false;
}
LRESULT __fastcall TForm1::OnComRecv(TMessage &msg)
{
    AnsiString str = "";
    char buf[1024];
    char tmpBuf[1];
    int len=com1.Read(buf,1024);
    if(len>0)
    {
      for(int i=0;i<len;i++)
      {
         sprintf(tmpBuf,"%c",buf[i]);
         str+=AnsiString(tmpBuf);
      }
      EditRcv->Text = str;
    }
    return 0;
}
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------
void __fastcall TForm1::OpenPortClick(TObject *Sender)
{
//
   if(OpenPort->Caption == "Open Port")
   {
      if(!com1.IsOpen())
      {
         if(com1.Open(1))
         {
            ShowMessage("串口已经打开");
            com1.SetWnd(Handle);
            OpenPort->Caption = "Close Port";
            Send->Enabled = true;
         }
      }
      else
         ShowMessage("串口com1被其他程序占用!");
   }
   else
   {
      com1.Close();
      ShowMessage("串口已经关闭!");
      OpenPort->Caption = "Open Port";
      Send->Enabled = false;
   }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SendClick(TObject *Sender)
{
//
   com1.Write(EditSend->Text.c_str());
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
   if(com1.IsOpen())
      com1.Close();   
}
//---------------------------------------------------------------------------

