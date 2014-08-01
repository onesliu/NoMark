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
    TEdit *GoodName;
    TEdit *GoodCode;
    TEdit *Cost;
    TEdit *BarCode;
    TEdit *SellPrice;
    TPanel *Panel1;
    TButton *Ok;
    TButton *Cancel;
    void __fastcall OkClick(TObject *Sender);
private:	// User declarations
    TListItem *Item;
    TDataSet *pDS;
public:		// User declarations
    __fastcall TGoodAttribForm(TComponent* Owner);
    bool __fastcall SetGoodItem( TDataSet *pds );
};
//---------------------------------------------------------------------------
extern PACKAGE TGoodAttribForm *GoodAttribForm;
//---------------------------------------------------------------------------
#endif
