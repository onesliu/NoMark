//---------------------------------------------------------------------------

#ifndef SpecialProductsUnitH
#define SpecialProductsUnitH
//---------------------------------------------------------------------------
#include <vcl.h>
#include <map>
#include <strstream>
#include "json/json.h"

class SpecialProducts {
private:
	static SpecialProducts * _self;
    typedef std::map<int, AnsiString> TProductMap;
	TProductMap pmap;
    TProductMap::iterator pitr;

	SpecialProducts()
	{
	}

    virtual ~SpecialProducts() {
        if (_self) {
            delete _self;
        }
    }

public:
	static SpecialProducts * getInstance()
	{
		if (_self == NULL)
		{
			_self = new SpecialProducts();
		}
		
		return _self;
	}

    AnsiString getProduct(int st) {
        TProductMap::iterator itr;
        itr = pmap.find(st);
        if (itr != pmap.end()) {
            return itr->second;
        }
		return "";
	}

    int firstProduct() {
    	pitr = pmap.begin();
        if (pitr != pmap.end()) {
            return pitr->first;
        }
        return -1;
    }

    int nextProduct() {
    	pitr++;
        if (pitr != pmap.end()) {
            return pitr->first;
        }
        return -1;
    }

	void putProduct(int sid, AnsiString sval) {
		pmap[sid] = sval;
	}
	
	int getSize() {
		return pmap.size();
	}

    bool ParseSpecials(AnsiString str);
};

#endif
 