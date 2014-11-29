//---------------------------------------------------------------------------

#ifndef ScaleInputUnitH
#define ScaleInputUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Product.h"
//---------------------------------------------------------------------------
class TScaleInputForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
	TEdit *ScaleWeight;
	TButton *OkBtn;
	TLabel *Label2;
	TLabel *Label3;
	TEdit *ScalePrice;
	TButton *Button2;
	void __fastcall OkBtnClick(TObject *Sender);
	void __fastcall ScalePriceKeyPress(TObject *Sender, char &Key);
	void __fastcall ScalePriceChange(TObject *Sender);
	void __fastcall ScaleWeightChange(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
	Product * product;
public:		// User declarations
    __fastcall TScaleInputForm(TComponent* Owner);
    void __fastcall ShowScale(Product * p);
};
//---------------------------------------------------------------------------
extern PACKAGE TScaleInputForm *ScaleInputForm;
//---------------------------------------------------------------------------
#endif
