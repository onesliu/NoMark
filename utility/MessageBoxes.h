//---------------------------------------------------------------------------

#ifndef msgbox_utilH
#define msgbox_utilH

#include <vcl.h>

//---------------------------------------------------------------------------

extern void ShowError( const char *fmt, ... );
extern void ShowInfo( const char *fmt, ... );
extern void ShowWarning( const char *fmt, ... );
//return: true--Ok; false--Cancel
extern bool ShowOkCancel( const char *fmt, ... );
//return: true--Yes; false--No
extern bool ShowYesNo( const char *fmt, ... );

#endif
 