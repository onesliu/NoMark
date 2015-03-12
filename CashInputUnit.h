//----------------------------------------------------------------------------
#ifndef CashInputUnitH
#define CashInputUnitH
//----------------------------------------------------------------------------
#include <vcl\System.hpp>
#include <vcl\Windows.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Classes.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\ExtCtrls.hpp>
//----------------------------------------------------------------------------
class TCashInputForm : public TForm
{
__published:        
	TButton *OKBtn;
	TBevel *Bevel1;
	TLabeledEdit *CashEdit;
	void __fastcall CashEditKeyPress(TObject *Sender, char &Key);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall OKBtnClick(TObject *Sender);
private:
public:
	virtual __fastcall TCashInputForm(TComponent* AOwner);

    double __fastcall ShowCashInput(AnsiString title, double val = 0.0);
};
//----------------------------------------------------------------------------
extern PACKAGE TCashInputForm *CashInputForm;
//----------------------------------------------------------------------------
#endif    
