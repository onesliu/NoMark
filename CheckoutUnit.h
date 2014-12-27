//---------------------------------------------------------------------------

#ifndef CheckoutUnitH
#define CheckoutUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include "Balance.h"
//---------------------------------------------------------------------------
class TCheckoutForm : public TForm
{
__published:	// IDE-managed Components
    TButton *BtnBalance;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *LabelBalanceMoney;
    TLabel *Label4;
    TLabel *LabelBalanceDateCurr;
    TLabel *Label6;
    TLabel *LabelBalanceOrderNumber;
    TLabel *Label5;
    TLabel *LabelBalanceDateLast;
	TButton *Button1;
    void __fastcall BtnBalanceClick(TObject *Sender);
private:	// User declarations
	Balance * balance;
public:		// User declarations
    __fastcall TCheckoutForm(TComponent* Owner);

    void __fastcall ShowBalance(Balance * balance);
};
//---------------------------------------------------------------------------
extern PACKAGE TCheckoutForm *CheckoutForm;
//---------------------------------------------------------------------------
#endif
