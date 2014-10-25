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
private:	// User declarations
public:		// User declarations
    __fastcall TOrderInfoForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderInfoForm *OrderInfoForm;
//---------------------------------------------------------------------------
#endif
