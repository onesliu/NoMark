//---------------------------------------------------------------------------

#ifndef CustomerLedUnitH
#define CustomerLedUnitH

#include <vcl.h>
#include "cnComm.h"

//---------------------------------------------------------------------------

class CustomerLed {
public:
    enum {CLOSE=0, PRICE=1, TOTAL=2, RECIEVE=3, CHANGE=4};

    CustomerLed();
    bool Open();
    void Close();
    void Reset();

    void WritePrice(AnsiString price);
    void OpenStatusLight(int n);
private:
    cnComm com1;
};

#endif
