//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cnComm.h"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
   TEdit *EditSend;
   TButton *Send;
   TButton *OpenPort;
   TEdit *EditRcv;
   void __fastcall OpenPortClick(TObject *Sender);
   void __fastcall SendClick(TObject *Sender);
   void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
    BEGIN_MESSAGE_MAP
        MESSAGE_HANDLER(ON_COM_RECEIVE, TMessage, OnComRecv) //电源管理拦截
    END_MESSAGE_MAP(TForm)
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        LRESULT __fastcall OnComRecv(TMessage &msg);
        cnComm com1, com2;
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
