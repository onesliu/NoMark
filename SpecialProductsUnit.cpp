//---------------------------------------------------------------------------


#pragma hdrstop

#include "SpecialProductsUnit.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

SpecialProducts * SpecialProducts::_self = 0;

bool SpecialProducts::ParseSpecials(AnsiString str) {
	using namespace std;
    
    try {

	    istrstream istr(str.c_str());
	
	    Json::Reader reader;
	    Json::Value json;

	    if ( !reader.parse(istr, json, false) )
	    {
	        return false;
	    }

        for ( unsigned int i=0; i<json.size(); i++ )
	    {
        	int pid = UTF8toGBK(json[i]["product_id"].asCString()).ToInt();
            AnsiString pname = UTF8toGBK(json[i]["name"].asCString());
            putProduct(pid, pname);
        }
	
    } catch(...) {
    	return false;
	}

    return true;
}
