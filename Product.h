//---------------------------------------------------------------------------

#ifndef ProductH
#define ProductH
#include <vcl.h>
#include <math.hpp>
//---------------------------------------------------------------------------
class Product {
public:
	int product_id;
	AnsiString product_name;
	int product_type;
	AnsiString ean;
	double price;
	int quantity;
	double total;
	double realweight;
	double realtotal;
	
	int scancount;

    Product() : scancount(0) {}

	bool hasScanned() {
		if (scancount < quantity) return false;
		return true;
	}
	
	void resetScan() {
		scancount = 0;
	}
	
	void finishScan() {
		scancount = quantity;
	}
	
	void addScan(double weight) {
		if (scancount == 0) {
			realweight = realtotal = 0;
		}
		else if (scancount >= quantity) {
			return;
		}
		
		realweight += weight;
		realtotal = SimpleRoundTo(realweight * price); //金额2位小数四舍五入
		scancount++;
	}
};
#endif
