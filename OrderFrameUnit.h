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
	void __fastcall OrderListViewDblClick(TObject *Sender);
	void __fastcall OrderListViewKeyPress(TObject *Sender, char &Key);
private:	// User declarations
	OrderList * olist;
public:		// User declarations
    __fastcall TOrderFrame(TComponent* Owner);
    void FreshOrderList(OrderList * olist, int order_status);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderFrame *OrderFrame;
//---------------------------------------------------------------------------
#endif
