//---------------------------------------------------------------------------

#ifndef ScaleInputUnitH
#define ScaleInputUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TScaleInputForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TButton *Button1;
private:	// User declarations
public:		// User declarations
    __fastcall TScaleInputForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TScaleInputForm *ScaleInputForm;
//---------------------------------------------------------------------------
#endif
