//---------------------------------------------------------------------------

#ifndef BalanceH
#define BalanceH

#include <vcl.h>
#include <strstream>
#include "json/json.h"
//---------------------------------------------------------------------------

class Balance
{
public:
	AnsiString last_balance_date;
    AnsiString current_date;
    double total;
    int count;

	bool ParseBalance(AnsiString str);
    bool SetBalance(AnsiString str);
};

#endif
 