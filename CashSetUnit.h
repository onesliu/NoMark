//---------------------------------------------------------------------------

#ifndef CashSetUnitH
#define CashSetUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBGrids.hpp>
#include <Graphics.hpp>
#include <Grids.hpp>
#include <DB.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <ToolWin.hpp>
#include <vector>
//---------------------------------------------------------------------------
class TCashSetForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabeledEdit *Change;
    TBevel *Bevel1;
    TImage *Image1;
    TLabel *Label2;
    TLabeledEdit *BankSave;
    TBevel *Bevel2;
    TImage *Image2;
    TButton *Ok;
    TBevel *Bevel3;
    TListView *DetailList;
    TToolBar *ToolBar1;
    TToolButton *AddDetail;
    TToolButton *DelDetail;
    TImageList *ImageList1;
    TToolButton *EditDetail;
    TLabel *Label3;
    void __fastcall ChangeKeyPress(TObject *Sender, char &Key);
    void __fastcall AddDetailClick(TObject *Sender);
    void __fastcall EditDetailClick(TObject *Sender);
    void __fastcall DelDetailClick(TObject *Sender);
    void __fastcall DetailListSelectItem(TObject *Sender, TListItem *Item,
          bool Selected);
    void __fastcall OkClick(TObject *Sender);
private:	// User declarations
    int orderlist;

    std::vector<int> detail_del;
public:		// User declarations
    __fastcall TCashSetForm(TComponent* Owner);

    bool __fastcall SetCash( int orderlistid ); 
};
//---------------------------------------------------------------------------
extern PACKAGE TCashSetForm *CashSetForm;
//---------------------------------------------------------------------------
#endif
