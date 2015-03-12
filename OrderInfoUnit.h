//---------------------------------------------------------------------------

#ifndef OrderInfoUnitH
#define OrderInfoUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
#include "Order.h"
//---------------------------------------------------------------------------
class TOrderInfoForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabel *OrderNo;
    TLabel *Label2;
    TLabel *OrderTime;
    TLabel *Label3;
    TBevel *Bevel1;
    TLabel *Customer;
    TLabel *Label4;
    TLabel *Telephone;
    TLabel *Label5;
    TLabel *Status;
    TLabel *Label6;
    TLabel *Address;
    TLabel *Label7;
    TLabel *ShippingTime;
    TBevel *Bevel3;
    TComboBox *StoreSelect;
    TListView *ProductList;
    TButton *ConfirmBtn;
    TButton *ChangeStoreBtn;
    TBevel *Bevel2;
    TButton *Cancel;
    TLabel *Label8;
    TLabel *Label9;
    TLabel *Total;
    TLabel *Label10;
    TLabel *RealTotal;
	TLabel *Label11;
	TLabel *ShippingPhone;
	TLabel *Label12;
	TLabel *Comment;
	TButton *PrintBtn;
	TButton *CancelOrder;
	TButton *CashPay;
	TButton *CostPayBtn;
	TButton *CashPayBtn;
	TLabel *Label13;
	TLabel *CostPayLabel;
	TLabel *Label15;
	TLabel *CashPayLabel;
	void __fastcall ProductListDblClick(TObject *Sender);
	void __fastcall ProductListKeyPress(TObject *Sender, char &Key);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall ConfirmBtnClick1(TObject *Sender);
    void __fastcall ConfirmBtnClick2(TObject *Sender);
	void __fastcall PrintBtnClick(TObject *Sender);
	void __fastcall CashPayClick(TObject *Sender);
	void __fastcall CancelOrderClick(TObject *Sender);
	void __fastcall CostPayBtnClick(TObject *Sender);
	void __fastcall CashPayBtnClick(TObject *Sender);
private:	// User declarations
	Order * order;
    AnsiString m_strKeyInput;
    bool __fastcall ScanningGun(char &Key);
    void __fastcall PrintSell();
    void __fastcall ShowCostPay();
    void __fastcall ShowCashPay();
public:		// User declarations
    __fastcall TOrderInfoForm(TComponent* Owner);
    void __fastcall ShowOrder(Order *order);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderInfoForm *OrderInfoForm;
//---------------------------------------------------------------------------
#endif
