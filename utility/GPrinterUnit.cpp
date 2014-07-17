//---------------------------------------------------------------------------

#include "SysUtils.hpp"

#pragma hdrstop

#include "GPrinterUnit.h"
#include "DbUnit.h"
#include "UserLoginUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

static int gp = -1;
const int linewidth = 32;

bool OpenPrinter()
{
    if ( gp >= 0 ) return true;
    gp = FileOpen( "LPT1", fmOpenWrite );
    if ( gp >= 0 ) return true;
    gp = -1;
    return false;
}

void ClosePrinter()
{
    if ( gp >= 0 ) FileClose( gp );
    gp = -1;
}

void PrintBin( char c )
{
    FileWrite( gp, (void*)&c, 1 );
}

void ResetPrinter()
{
    if ( gp < 0 ) return;
    PrintBin( 0x1b );
    PrintBin( 0x40 );
}

void PrintReturn()
{
    PrintBin( 0x0a );
}

void PrintLine( AnsiString str )
{
    if ( gp < 0 ) return;
    FileWrite( gp, str.c_str(), str.Length() );
    PrintReturn();
}

void PrintStr( AnsiString str )
{
    if ( gp < 0 ) return;
    FileWrite( gp, str.c_str(), str.Length() );
}

void SetBigWord()
{
    PrintBin( 0x1b );
    PrintBin( 0x21 );
    PrintBin( 48 );
}

void ClrBigWord()
{
    PrintBin( 0x1b );
    PrintBin( 0x21 );
    PrintBin( 0 );
}

void PrintCharLine( char c )
{
    for ( int i = 0; i < linewidth; i++ )
        PrintBin( c );
}

void PrintLogo()
{
    PrintLine( sPrintLogo );

    PrintCharLine( '=' );
    PrintReturn();
}

void PrintTail()
{
    PrintCharLine( '-' );
    PrintLine( sPrintTail );
    PrintCharLine( '=' );

    PrintLine( "时间: " + Now().FormatString("yyyy-mm-dd hh:nn:ss") );
    PrintLine( "收银员: " + UserLoginForm->Serial->Text );

    PrintBin( 0x1b );
    PrintBin( 0x64 );
    PrintBin( 6 );
}

void PrintItem( AnsiString name, AnsiString value )
{
    int blen = linewidth - name.Length() - value.Length();
    AnsiString black;

    for ( int i = 0; i < blen; i++ )
        black += " ";

    PrintLine( name + black + value );
}
