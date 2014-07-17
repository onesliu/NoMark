//---------------------------------------------------------------------------

#ifndef UserLoginUnitH
#define UserLoginUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TUserLoginForm : public TForm
{
__published:	// IDE-managed Components
    TLabeledEdit *Serial;
    TButton *Ok;
    TButton *Cancel;
    void __fastcall OkClick(TObject *Sender);
private:	// User declarations
    int type;
    int DutyID;
    int UserID;

    bool __fastcall SelectUser( AnsiString serial, int &userid );
public:		// User declarations
    __fastcall TUserLoginForm(TComponent* Owner);

    AnsiString UserName;
    bool __fastcall UserLogin();
    bool __fastcall UserLogout();
    void __fastcall LogoutTime();
};
//---------------------------------------------------------------------------
extern PACKAGE TUserLoginForm *UserLoginForm;
//---------------------------------------------------------------------------
#endif
