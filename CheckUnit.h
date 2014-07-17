//---------------------------------------------------------------------------

#ifndef CheckUnitH
#define CheckUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Buttons.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <DB.hpp>
//---------------------------------------------------------------------------
class TCheckForm : public TForm
{
__published:	// IDE-managed Components
    TImageList *ImageList1;
    TPanel *title;
    TDataSource *CheckSelectSource;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label4;
    TLabeledEdit *BarCode;
    TLabeledEdit *Number;
    TDBGrid *DiffGrid;
    TDBGrid *NoneGrid;
    TButton *Ok;
    TButton *Commit;
    TDBGrid *SelectGrid;
    TButton *Adjust;
    TLabel *TotalDiff;
    TLabel *Label3;
    TButton *AddZero;
    TButton *Button1;
    void __fastcall NumberKeyPress(TObject *Sender, char &Key);
    void __fastcall CheckSelectSourceDataChange(TObject *Sender,
          TField *Field);
    void __fastcall SelectGridKeyPress(TObject *Sender, char &Key);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall BarCodeKeyPress(TObject *Sender, char &Key);
    void __fastcall OkClick(TObject *Sender);
    void __fastcall CommitClick(TObject *Sender);
    void __fastcall AdjustClick(TObject *Sender);
    void __fastcall AddZeroClick(TObject *Sender);
    void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
    void __fastcall FreshCheckList();

    int GoodIdx;
public:		// User declarations
    __fastcall TCheckForm(TComponent* Owner);


};
//---------------------------------------------------------------------------
extern PACKAGE TCheckForm *CheckForm;
//---------------------------------------------------------------------------
#endif
