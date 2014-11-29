//---------------------------------------------------------------------------


#pragma hdrstop

#include "OrderStatus.h"
#include "CommonUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

OrderStatus * OrderStatus::_self = 0;

bool OrderStatus::ParseStatus(AnsiString str) {
	using namespace std;
    
    try {

	    istrstream istr(str.c_str());
	
	    Json::Reader reader;
	    Json::Value json;

	    if ( !reader.parse(istr, json, false) )
	    {
	        return false;
	    }

        Json::Value::Members items(json.getMemberNames());
        for(unsigned int i = 0; i < items.size(); i++) {
        	int key = AnsiString(items[i].c_str()).ToInt();
            AnsiString val = UTF8toGBK(json[items[i]].asCString());
            putStatus(key, val);
        }
	
    } catch(...) {
    	return false;
	}

    return true;
}
