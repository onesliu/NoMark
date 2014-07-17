//---------------------------------------------------------------------------

#ifndef StoreStatUnitH
#define StoreStatUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Chart.hpp>
#include <DBChart.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TStoreStatForm : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TLabel *Label1;
    TLabel *TotalNumber;
    TLabel *Label2;
    TLabel *TotalCost;
    TPanel *Panel1;
    TButton *Ok;
    TTabSheet *TabSheet2;
    TDBGrid *MonthSellStat;
    TTabSheet *TabSheet3;
    TTabSheet *TabSheet4;
    TDBChart *DBChart1;
    TTabSheet *TabSheet5;
    TDBChart *DBChart2;
    TLineSeries *BarSeries2;
    TDBChart *DBChart3;
    TLineSeries *LineSeries1;
    TLineSeries *BarSeries1;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
    __fastcall TStoreStatForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStoreStatForm *StoreStatForm;
//---------------------------------------------------------------------------
#endif
