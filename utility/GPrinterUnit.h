//---------------------------------------------------------------------------

#ifndef GPrinterUnitH
#define GPrinterUnitH
//---------------------------------------------------------------------------
bool OpenPrinter();
void ClosePrinter();
void PrintBin( char c );
void ResetPrinter();
void PrintStr( AnsiString str );
void PrintLine( AnsiString str );
void PrintCharLine( char c );
void PrintReturn();
void PrintLogo();
void PrintTail();
void SetBigWord();
void ClrBigWord();
void PrintItem( AnsiString name, AnsiString value );
#endif
