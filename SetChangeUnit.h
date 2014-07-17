//---------------------------------------------------------------------------

#ifndef SetChangeUnitH
#define SetChangeUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TSetChangeForm : public TForm
{
__published:	// IDE-managed Components
    TImage *Image1;
    TLabel *Label1;
    TLabeledEdit *Change;
    TButton *Ok;
    void __fastcall ChangeKeyPress(TObject *Sender, char &Key);
    void __fastcall OkClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
private:	// User declarations
    int orderlist;
public:		// User declarations
    __fastcall TSetChangeForm(TComponent* Owner);

    bool __fastcall SetChange( int orderlistid );
};
//---------------------------------------------------------------------------
extern PACKAGE TSetChangeForm *SetChangeForm;
//---------------------------------------------------------------------------
#endif
