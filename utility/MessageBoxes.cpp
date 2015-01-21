//---------------------------------------------------------------------------


#include <vcl.h>
#include <stdarg.h>
#include <stdio.h>
#pragma hdrstop

#include "MessageBoxes.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

int BaseShow( HWND handle, int IconFlag, const char *fmt, va_list arglist )
{
    char sz_buf[1024];

	vsprintf( sz_buf, fmt, arglist );

    return MessageBox( handle, sz_buf, Application->Title.c_str(), IconFlag );
}

void ShowError( HWND handle, const char *fmt, ...) {
    va_list arglist;
    va_start( arglist, fmt );
    BaseShow( handle, MB_OK | MB_ICONERROR, fmt, arglist );
	va_end( arglist );
}

void ShowError( const char *fmt, ... )
{
    va_list arglist;
    va_start( arglist, fmt );
    BaseShow( Application->Handle, MB_OK | MB_ICONERROR, fmt, arglist );
	va_end( arglist );
}

void ShowInfo( const char *fmt, ... )
{
    va_list arglist;
    va_start( arglist, fmt );
    BaseShow( Application->Handle, MB_OK | MB_ICONINFORMATION, fmt, arglist );
	va_end( arglist );
}

void ShowWarning( const char *fmt, ... )
{
    va_list arglist;
    va_start( arglist, fmt );
    BaseShow( Application->Handle, MB_OK | MB_ICONWARNING, fmt, arglist );
	va_end( arglist );
}

bool ShowOkCancel( const char *fmt, ... )
{
    bool bResult;

    va_list arglist;
    va_start( arglist, fmt );
    if( BaseShow( Application->Handle, MB_OKCANCEL | MB_ICONQUESTION, fmt, arglist ) == IDOK )
        bResult = true;
    else
        bResult = false;
	va_end( arglist );

    return bResult;
}

bool ShowYesNo( const char *fmt, ... )
{
    bool bResult;

    va_list arglist;
    va_start( arglist, fmt );
    if( BaseShow( Application->Handle, MB_YESNO | MB_ICONQUESTION, fmt, arglist ) == IDYES )
        bResult = true;
    else
        bResult = false;
	va_end( arglist );

    return bResult;
}

