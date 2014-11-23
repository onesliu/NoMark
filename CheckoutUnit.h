//---------------------------------------------------------------------------

#ifndef CheckoutUnitH
#define CheckoutUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TCheckoutForm : public TForm
{
__published:	// IDE-managed Components
    TButton *BtnBalance;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *LabelBalanceWeight;
    TLabel *LabelBalanceMoney;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *LabelBalanceDateCurr;
    TLabel *Label6;
    TLabel *LabelBalanceOrderNumber;
    TLabel *LabelBalanceKinds;
    TLabel *BalanceResult;
    TLabel *Label5;
    TLabel *LabelBalanceDateLast;
    void __fastcall BtnBalanceClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TCheckoutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCheckoutForm *CheckoutForm;
//---------------------------------------------------------------------------
#endif
