//---------------------------------------------------------------------------

#ifndef DetailUnitH
#define DetailUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TDetailForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TComboBox *Inout;
    TLabeledEdit *Usage;
    TLabeledEdit *Cost;
    TButton *Ok;
    void __fastcall CostKeyPress(TObject *Sender, char &Key);
    void __fastcall UsageKeyPress(TObject *Sender, char &Key);
    void __fastcall OkClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TDetailForm(TComponent* Owner);

    bool __fastcall EditDetail( TListItem *Item );
};
//---------------------------------------------------------------------------
extern PACKAGE TDetailForm *DetailForm;
//---------------------------------------------------------------------------
#endif
