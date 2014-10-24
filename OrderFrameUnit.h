//---------------------------------------------------------------------------


#ifndef OrderFrameUnitH
#define OrderFrameUnitH
#include "OrderList.h"
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
    TListView *OrderListView;
private:	// User declarations
public:		// User declarations
    __fastcall TOrderFrame(TComponent* Owner);
    void FreshOrderList(OrderList * olist, int order_status);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderFrame *OrderFrame;
//---------------------------------------------------------------------------
#endif
