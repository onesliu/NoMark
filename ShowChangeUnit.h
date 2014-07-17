//---------------------------------------------------------------------------

#ifndef ShowChangeUnitH
#define ShowChangeUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TShowChangeForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Change;
    TButton *Ok;
private:	// User declarations
public:		// User declarations
    __fastcall TShowChangeForm(TComponent* Owner);

    bool __fastcall ShowChange( AnsiString change );
};
//---------------------------------------------------------------------------
extern PACKAGE TShowChangeForm *ShowChangeForm;
//---------------------------------------------------------------------------
#endif
