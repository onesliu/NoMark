//---------------------------------------------------------------------------

#ifndef BarcodeUnitH
#define BarcodeUnitH

#include <vcl.h>
//---------------------------------------------------------------------------
class IBarcode {
public:
	enum { NORMAL=0, WEIGHT=1, PRICE=2 };
	
	virtual bool parseCode(AnsiString barcode);

	AnsiString code;
	AnsiString value;
    int productId;
    double weight;
	int type;
};

#endif
