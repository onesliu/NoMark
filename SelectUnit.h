//---------------------------------------------------------------------------

#ifndef SelectUnitH
#define SelectUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include "DataDao.h"
//---------------------------------------------------------------------------
class TSelectForm : public TForm
{
__published:	// IDE-managed Components
    TListView *GoodsList;
    void __fastcall GoodsListKeyPress(TObject *Sender, char &Key);
    void __fastcall GoodsListDblClick(TObject *Sender);
    void __fastcall GoodsListCompare(TObject *Sender, TListItem *Item1,
          TListItem *Item2, int Data, int &Compare);
    void __fastcall GoodsListColumnClick(TObject *Sender,
          TListColumn *Column);
    void __fastcall FormShow(TObject *Sender);
private:	// User declarations
    AnsiString bar;
    int ColumnToSort;
    GoodDao * gooddao;
    bool DescSort;
public:		// User declarations
    __fastcall TSelectForm(TComponent* Owner);

    AnsiString SelectGood( AnsiString code, TListView *pExclude, GoodDao *gdao = NULL );
};
//---------------------------------------------------------------------------
extern PACKAGE TSelectForm *SelectForm;
//---------------------------------------------------------------------------
#endif
