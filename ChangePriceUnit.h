//---------------------------------------------------------------------------

#ifndef ChangePriceUnitH
#define ChangePriceUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <IBUpdateSQL.hpp>
//---------------------------------------------------------------------------
class TChangePriceForm : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *GroupBox1;
    TLabel *Label1;
    TLabel *Label8;
    TLabel *Label10;
    TLabel *ListDate;
    TEdit *ListName;
    TEdit *ListDesp;
    TPanel *title;
    TDBGrid *ChangeGrid;
    TPanel *Panel2;
    TButton *Ok;
    TButton *Cancel;
    TDataSource *ChangePriceDataSource;
    TIBDataSet *ChangePriceDataSet;
    TIntegerField *ChangePriceDataSetIDX;
    TIntegerField *ChangePriceDataSetGOODIDX;
    TIntegerField *ChangePriceDataSetLISTIDX;
    TDateTimeField *ChangePriceDataSetCHANGETIME;
    TIBBCDField *ChangePriceDataSetOLDPRICE;
    TIBBCDField *ChangePriceDataSetNEWPRICE;
    TIBStringField *ChangePriceDataSetBARCODE;
    TIBStringField *ChangePriceDataSetNAME;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall CancelClick(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall OkClick(TObject *Sender);
    void __fastcall ChangePriceDataSetBeforeEdit(TDataSet *DataSet);
private:	// User declarations
    int listId;
public:		// User declarations
    __fastcall TChangePriceForm(TComponent* Owner);

    bool __fastcall NewChangePrice();
};
//---------------------------------------------------------------------------
extern PACKAGE TChangePriceForm *ChangePriceForm;
//---------------------------------------------------------------------------
#endif
