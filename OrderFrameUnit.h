//---------------------------------------------------------------------------


#ifndef OrderFrameUnitH
#define OrderFrameUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TOrderFrame : public TFrame
{
__published:	// IDE-managed Components
    TListView *ListView1;
private:	// User declarations
public:		// User declarations
    __fastcall TOrderFrame(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderFrame *OrderFrame;
//---------------------------------------------------------------------------
#endif
