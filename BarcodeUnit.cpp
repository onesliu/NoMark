//---------------------------------------------------------------------------


#pragma hdrstop

#include "BarcodeUnit.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

bool IBarcode::parseCode(AnsiString barcode) {

    code = "", value = "";

    if ( barcode.Length() > 12 )
    {
		code = barcode.SubString(3, 5);
        value = barcode.SubString(8, 5);
		type = barcode[2] - 0x30;

        productId = code.ToInt();
        weight = value.ToDouble() / 1000;
		return true;
    }

    return false;
}
