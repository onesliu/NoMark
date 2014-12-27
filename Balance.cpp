//---------------------------------------------------------------------------


#pragma hdrstop

#include "Balance.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

bool Balance::ParseBalance(AnsiString str)
{
	using namespace std;
    
    try {

	    istrstream istr(str.c_str());
	
	    Json::Reader reader;
	    Json::Value json;

	    if ( !reader.parse(istr, json, false) )
	    {
	        return false;
	    }

        last_balance_date = json["last_balance_date"].asCString();
        current_date = json["current_date"].asCString();
        total = json["total"].asDouble();
        count = json["count"].asInt();
	
    } catch(...) {
    	return false;
	}

    return true;
}

bool Balance::SetBalance(AnsiString str)
{
	using namespace std;
    
    try {

	    istrstream istr(str.c_str());
	
	    Json::Reader reader;
	    Json::Value json;

	    if ( !reader.parse(istr, json, false) )
	    {
	        return false;
	    }

        int status = json["status"].asInt();

        if (status != 0)
        	return false;

    } catch(...) {
    	return false;
	}

    return true;
}