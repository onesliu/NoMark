//---------------------------------------------------------------------------

#ifndef LoginUnitH
#define LoginUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TLoginForm : public TForm
{
__published:	// IDE-managed Components
    TLabeledEdit *Password;
    TButton *Ok;
    TButton *Cancel;
    TComboBox *Name;
    TLabel *NameLabel;
    void __fastcall OkClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
private:	// User declarations
    int type;
public:		// User declarations
    __fastcall TLoginForm(TComponent* Owner);

    int Admin, User;
    int Duty;
    bool __fastcall AdminLogin( int level = -1 );
    bool __fastcall UserLogin();
    bool __fastcall UserLogout();
};
//---------------------------------------------------------------------------
extern PACKAGE TLoginForm *LoginForm;
//---------------------------------------------------------------------------
#endif
