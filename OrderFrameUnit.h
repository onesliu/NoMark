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
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TOrderFrame : public TFrame
{
__published:	// IDE-managed Components
    TListView *OrderListView;
	TPopupMenu *PopupMenu1;
	TMenuItem *CancelOrder;
	TMenuItem *RefundOrder;
	void __fastcall OrderListViewDblClick(TObject *Sender);
	void __fastcall OrderListViewKeyPress(TObject *Sender, char &Key);
	void __fastcall PopupMenu1Popup(TObject *Sender);
	void __fastcall CancelOrderClick(TObject *Sender);
private:	// User declarations
	OrderList * olist;
    int ostatus;
public:		// User declarations
    __fastcall TOrderFrame(TComponent* Owner);
    void FreshOrderList(OrderList * olist, int order_status);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderFrame *OrderFrame;
//---------------------------------------------------------------------------
#endif
