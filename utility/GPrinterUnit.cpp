//---------------------------------------------------------------------------

#include "SysUtils.hpp"

#pragma hdrstop

#include "GPrinterUnit.h"
#include "DbUnit.h"
#include "MessageBoxes.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

bool IPrinter::OpenPrinter()
{
    if ( gp >= 0 ) return true;
    gp = FileOpen( "LPT1", fmOpenWrite );
    if ( gp >= 0 ) return true;
    gp = -1;
    return false;
}

void IPrinter::ClosePrinter()
{
    if ( gp >= 0 ) FileClose( gp );
    gp = -1;
}

void IPrinter::PrintBin( char c )
{
    FileWrite( gp, (void*)&c, 1 );
}

void IPrinter::PrintLine( AnsiString str )
{
    if ( gp < 0 ) return;

    unsigned char * p = str.c_str();
    int j = 0;
    for (int i = 0; i < str.Length(); j++) {
    	if (j > 0 && j%linewidth == 0)
        	PrintReturn();
        j = j%linewidth;
    	if ((p[i] > 0x80) && ((j+1)%linewidth == 0))
            continue;
        PrintBin(p[i]);
        i++;
    }
    PrintReturn();
}

void IPrinter::PrintTab()
{
    PrintBin( 0x09 );
}

void IPrinter::PrintReturn()
{
    PrintBin( 0x0a );
}

void IPrinter::FeedPaper(int line) {
    PrintBin( 0x1b );
    PrintBin( 0x64 );
    PrintBin( line );
}

void IPrinter::ResetPrinter()
{
    if ( gp < 0 ) return;
    //初始化打印机
    PrintBin( 0x1b );
    PrintBin( 0x40 );
    //设置标准行模式
    PrintBin( 0x1b );
    PrintBin( 0x53 );
}

void IPrinter::PrintStr( AnsiString str )
{
    if ( gp < 0 ) return;
    FileWrite( gp, str.c_str(), str.Length() );
}

void IPrinter::PrintStr( AnsiString str, int width, int align )
{
    AnsiString ss, fmt;
    if (align == ALIGN_RIGHT)
        fmt.sprintf("%%%ds", width);
    else
        fmt.sprintf("%%-%ds", width);

    wchar_t buf[11];
    memset(buf, 0, sizeof(buf));
    str.SubString(1, width).WideChar(buf, sizeof(buf)-2);
    ss.sprintf(fmt.c_str(), WideCharToString(buf));
    PrintStr(ss);
}

void IPrinter::PrintCharLine( char c )
{
    for ( int i = 0; i < linewidth; i++ )
        PrintBin( c );
}

void IPrinter::SetAlign(int align)
{
    PrintBin(0x1b);
    PrintBin(0x61);

    switch(align) {
    case ALIGN_LEFT: PrintBin(0); break;
    case ALIGN_CENTER: PrintBin(1); break;
    case ALIGN_RIGHT: PrintBin(2); break;
    }
}

void IPrinter::SetColumn(int col[], int num)
{
    PrintBin(0x1b);
    PrintBin(0x44);

    int c = 0;
    for(int i = 0; i < num; i++) {
        c += col[i];
        PrintBin(c);
    }

    PrintBin(0);
}

void IPrinter::PrintItem( AnsiString name, AnsiString value )
{
    int blen = linewidth - name.Length() - value.Length();
    AnsiString black;

    for ( int i = 0; i < blen; i++ )
        black += " ";

    PrintLine( name + black + value );
}

void IPrinter::PrintLogo(AnsiString sPrintLogo)
{
	if (sPrintLogo.Length() > linewidth)
    	PrintLine( sPrintLogo );
    else {
		int black = (linewidth-sPrintLogo.Length())/2;
    	for(int i = 0; i < black; i++)
    		PrintBin(' ');
        PrintStr(sPrintLogo);
        PrintReturn();
    }

    PrintCharLine( '-' );
    PrintReturn();
}

void IPrinter::PrintTail(AnsiString sPrintTail)
{
    PrintCharLine( '-' );
    PrintLine( sPrintTail );
    PrintCharLine( '-' );

    PrintLine( "时间: " + Now().FormatString("yyyy-mm-dd hh:nn:ss") );

    FeedPaper(6);
}

void IPrinter::KickOut() {

    PrintBin( 0x1b );
    PrintBin( 0x70 );
    PrintBin( 0x00 );
    PrintBin( 128 );
    PrintBin( 128 );
}


//---------------------------------------------------------------------------

void GPrinter::SetBigWord()
{
    PrintBin( 0x1b );
    PrintBin( 0x21 );
    PrintBin( 48 );
}

void GPrinter::ClrBigWord()
{
    PrintBin( 0x1b );
    PrintBin( 0x21 );
    PrintBin( 0 );
}

//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
