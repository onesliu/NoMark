//---------------------------------------------------------------------------

#ifndef PwdVerifyH
#define PwdVerifyH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Mask.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TPasswordVerify : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TButton *BtnConfirm;
    TLabeledEdit *EditPwd;
    TLabel *ConfirmResult;
    void __fastcall BtnConfirmClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TPasswordVerify(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPasswordVerify *PasswordVerify;
//---------------------------------------------------------------------------
#endif
