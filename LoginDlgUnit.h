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
#include "HttpAccess.h"
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
	void __fastcall FormDestroy(TObject *Sender);
private:
    bool m_bLogin;
    AnsiString token;
    int district_id;
    THttpAccess * http;
public:
    void __fastcall ReadConfig();
    void __fastcall SaveConfig();
	virtual __fastcall TLoginDlg(TComponent* AOwner);
    bool __fastcall Login();
    bool __fastcall GetLoginStatus();
    void __fastcall SetLoginStatus(bool status);
    AnsiString __fastcall GetUsername();
    AnsiString __fastcall GetPassword();
    AnsiString __fastcall GetOrders();
    AnsiString __fastcall GetStatus();
    AnsiString __fastcall GetDistricts();
};
//----------------------------------------------------------------------------
extern PACKAGE TLoginDlg *LoginDlg;
//----------------------------------------------------------------------------
#endif    
