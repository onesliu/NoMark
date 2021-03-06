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
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TOrderFrame : public TFrame
{
__published:	// IDE-managed Components
    TListView *OrderListView;
	TPopupMenu *PopupMenu1;
	TMenuItem *CancelOrder;
	TMenuItem *RefundOrder;
	TMenuItem *N1;
	TMenuItem *CashPay;
	TMenuItem *N2;
	TMenuItem *Export;
	TSaveDialog *SaveDialog;
	void __fastcall OrderListViewDblClick(TObject *Sender);
	void __fastcall OrderListViewKeyPress(TObject *Sender, char &Key);
	void __fastcall PopupMenu1Popup(TObject *Sender);
	void __fastcall CancelOrderClick(TObject *Sender);
	void __fastcall CashPayClick(TObject *Sender);
	void __fastcall OrderListViewCustomDrawItem(TCustomListView *Sender,
          TListItem *Item, TCustomDrawState State, bool &DefaultDraw);
	void __fastcall ExportClick(TObject *Sender);
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
