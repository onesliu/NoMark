//---------------------------------------------------------------------------

#ifndef GoodAttribUnitH
#define GoodAttribUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <DB.hpp>
#include <IBDatabase.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <IBTable.hpp>
#include "qyycy.h"
//---------------------------------------------------------------------------
class TGoodAttribForm : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PageControl1;
    TTabSheet *GoodAttrib;
    TLabel *Label8;
    TLabel *Label10;
    TLabel *Label12;
    TLabel *Label13;
    TLabel *Label15;
    TEdit *GoodsName;
    TEdit *GoodsCode;
    TEdit *GoodsCost;
    TEdit *GoodsBarcode;
    TEdit *GoodsSellPrice;
    TPanel *Panel1;
    TButton *Ok;
    TButton *Cancel;
    TComboBox *GoodsType;
    TLabel *Label1;
    TEdit *GoodsDesp;
    TLabel *Label2;
    TEdit *GoodsAttr;
    TLabel *Label3;
    TEdit *GoodsNumber;
    TLabel *Label4;
    TEdit *GoodsLowestPrice;
    TLabel *Label5;
    void __fastcall OkClick(TObject *Sender);
private:	// User declarations
    TListItem *Item;
    TDataSet *pDS;
    OP_TYPES m_opType;
public:		// User declarations
    __fastcall TGoodAttribForm(TComponent* Owner);
    bool __fastcall SetGoodItem(TDataSet *pds, OP_TYPES op_type);
    bool __fastcall InsertGoods(TDataSet *pds, OP_TYPES op_type);
};
//---------------------------------------------------------------------------
extern PACKAGE TGoodAttribForm *GoodAttribForm;
//---------------------------------------------------------------------------
#endif
