//----------------------------------------------------------------------------
#ifndef LoginDlgUnitH
#define LoginDlgUnitH
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
class TLoginDlg : public TForm
{
__published:        
	TButton *OKBtn;
	TButton *CancelBtn;
	TBevel *Bevel1;
    TLabeledEdit *User;
    TLabeledEdit *Password;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall OKBtnClick(TObject *Sender);
private:
    void __fastcall ReadConfig();
    void __fastcall SaveConfig();
public:
	virtual __fastcall TLoginDlg(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TLoginDlg *LoginDlg;
//----------------------------------------------------------------------------
#endif    
