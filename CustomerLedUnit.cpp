//---------------------------------------------------------------------------


#pragma hdrstop

#include "CustomerLedUnit.h"
#include "MessageBoxes.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

CustomerLed::CustomerLed() : com1(false, 0) {
}

bool CustomerLed::Open() {
      if(!com1.IsOpen())
      {
         return com1.Open(1, 2400);
      }

      return false;
}

void CustomerLed::Close() {
    com1.Close();
}

void CustomerLed::WritePrice(AnsiString price) {
    char c[3] = {0x1b, 0x51, 0x41};
    com1.Write(c, 3);
    com1.Write(price.c_str());
    c[0] = 0x0d;
    com1.Write(c, 1);
}

void CustomerLed::OpenStatusLight(int n) {
    char c[3] = {0x1b, 0x73};
    c[2] = n+0x30;
    com1.Write(c, 3);
}

void CustomerLed::Reset() {
    char c[3] = {0x1b, 0x40, 0x0c};
    com1.Write(c, 3);
}


