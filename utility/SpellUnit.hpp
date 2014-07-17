// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'SpellUnit.pas' rev: 6.00

#ifndef SpellUnitHPP
#define SpellUnitHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Spellunit
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall MakeSpellCode(AnsiString stText, int iMode, int iCount);
extern PACKAGE char * __stdcall GetSpellCode(char * szText, int iMode, int iCount);

}	/* namespace Spellunit */
using namespace Spellunit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SpellUnit
