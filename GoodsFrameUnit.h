//---------------------------------------------------------------------------


#ifndef GoodsFrameUnitH
#define GoodsFrameUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ActnList.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TGoodsFrame : public TFrame
{
__published:	// IDE-managed Components
    TActionList *ActionList1;
    TAction *SetLabel;
    TAction *ClearLabel;
    TImageList *ImageList1;
    TPopupMenu *PopupMenu1;
    TMenuItem *N1;
    TMenuItem *N2;
    TAction *DelGood;
    TMenuItem *N3;
    TMenuItem *N4;
    TAction *EditGood;
    TMenuItem *N5;
    TCoolBar *CoolBar1;
    TToolBar *ToolBar5;
    TToolButton *ToolButton2;
    TToolButton *ToolButton5;
    TToolButton *ToolButton3;
    TPanel *Info1;
    TDBGrid *GoodsGrid;
    TAction *SetLabel2;
    TAction *SetLable3;
    TMenuItem *N6;
    TMenuItem *N7;
    TMenuItem *N8;
    TToolButton *ToolButton1;
    TAction *StatInfo;
    TToolButton *ToolButton4;
    TAction *AddNewGoods;
    void __fastcall ClearLabelExecute(TObject *Sender);
    void __fastcall SetLabelExecute(TObject *Sender);
    void __fastcall DelGoodExecute(TObject *Sender);
    void __fastcall EditGoodExecute(TObject *Sender);
    void __fastcall SetLabel2Execute(TObject *Sender);
    void __fastcall SetLable3Execute(TObject *Sender);
    void __fastcall GoodsGridDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
    void __fastcall GoodsGridMouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
    void __fastcall AddNewGoodsExecute(TObject *Sender);
private:	// User declarations
    AnsiString GoodsListSql;
    bool blSelect;
    void * BookMark;
    int CurrNo, OldNo;
    int m_nGoodsCatagory;
public:		// User declarations
    __fastcall TGoodsFrame(TComponent* Owner);

    void __fastcall SetSelectedType(int GoodTypeId, bool ClearOut=true);
    void __fastcall SetGoodsCatagory(int catagory);
    int  __fastcall GetGoodsCatagory(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TGoodsFrame *GoodsFrame;
//---------------------------------------------------------------------------
#endif
