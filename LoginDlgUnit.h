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
#include <IdBaseComponent.hpp>
#include <IdComponent.hpp>
#include <IdHTTP.hpp>
#include <IdTCPClient.hpp>
#include <IdTCPConnection.hpp>
//----------------------------------------------------------------------------
class TLoginDlg : public TForm
{
__published:        
	TButton *OKBtn;
	TButton *CancelBtn;
	TBevel *Bevel1;
    TLabeledEdit *User;
    TLabeledEdit *Password;
    TLabeledEdit *ServerDomain;
    TSpeedButton *SpeedButton1;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall OKBtnClick(TObject *Sender);
    void __fastcall SpeedButton1Click(TObject *Sender);
private:
public:
    void __fastcall ReadConfig();
    void __fastcall SaveConfig();
	virtual __fastcall TLoginDlg(TComponent* AOwner);
    AnsiString __fastcall GetUsername();
    AnsiString __fastcall GetPassword();
};
//----------------------------------------------------------------------------
extern PACKAGE TLoginDlg *LoginDlg;
//----------------------------------------------------------------------------
#endif    
