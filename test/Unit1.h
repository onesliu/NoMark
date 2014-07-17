//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <Menus.hpp>
#include <IBTable.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TTreeView *TreeView;
    TIBDatabase *IBDatabase1;
    TIBTransaction *IBTransaction1;
    TButton *Button1;
    TPopupMenu *PopupMenu1;
    TMenuItem *N1;
    TIBQuery *q;
    void __fastcall Button1Click(TObject *Sender);
    void __fastcall TreeViewContextPopup(TObject *Sender, TPoint &MousePos,
          bool &Handled);
    void __fastcall N1Click(TObject *Sender);
private:	// User declarations
    void __fastcall FreshTree( TDataSet *tb );
    TTreeNode * __fastcall FindNode( TTreeView *pView, int Id );
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
