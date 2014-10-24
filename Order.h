//---------------------------------------------------------------------------

#ifndef OrderH
#define OrderH
#include <vcl.h>
#include <list>
#include "Product.h"
#include "BarcodeUnit.h"
#include "OrderStatus.h"
//---------------------------------------------------------------------------
class Order {
public:
	__int64 order_id;
	int order_status;
	AnsiString order_createtime;
	int customer_id;
	AnsiString customer_name;
	AnsiString shipping_name;
	AnsiString customer_phone;
	AnsiString shipping_addr;
	AnsiString shipping_time;
	AnsiString comment;
	
	int order_type;
	int order_status_orign;
	AnsiString productSubject;
	bool is_delete;

	std::list<Product> products;

	Order() : is_delete(false) {
	}
	
	void add_product(Product p) {
		products.push_back(p);
	}
	
	Product * get(int productid) {
        using namespace std;
		list<Product>::iterator itr;
		Product * ret = NULL;
        for(itr = products.begin(); itr != products.end(); ++itr) {
			if (itr->product_id == productid) {
				ret = &(*itr);
				break;
			}
		}
		return ret;
	}
	
	Product * get(AnsiString barcode) {
        using namespace std;
		list<Product>::iterator itr;
		IBarcode pbc;
		Product * ret = NULL;
		int id1, id2;

		if (pbc.parseCode(barcode) == false)
			return NULL;
		id1 = pbc.productId;
		
		for(itr = products.begin(); itr != products.end(); ++itr) {
			if (pbc.parseCode(itr->ean) == false)
				continue;
			id2 = pbc.productId;
			
			if (id1 == id2) {
				ret = &(*itr);
				break;
			}
		}
		return ret;
	}
	
	int product_size() {
		return products.size();
	}
	
	void initStatus(int status) {
		order_status = order_status_orign = status;
	}
	
	void resetStatus() {
		order_status = order_status_orign;
	}
	
	bool hasChanged() {
		if (order_status != order_status_orign)
			return true;
		return false;
	}
	
	void commit() {
		order_status_orign = order_status;
	}
	
	bool hasScanedOver() {
		if (order_status >= OrderStatus::ORDER_STATUS_FINISHED)
			return true;
		
		std::list<Product>::iterator itr;
		for(itr = products.begin(); itr != products.end(); ++itr) {
			if (itr->hasScanned() == false)
				return false;
		}
		
		if (order_type == 0)
			order_status = OrderStatus::ORDER_STATUS_SCALED;
		else
			order_status = OrderStatus::ORDER_STATUS_PAYING;

		return true;
	}
	
	void setDelivered() {
		order_status = OrderStatus::ORDER_STATUS_FINISHED;
	}
	
	double getOrderTotal() {
		std::list<Product>::iterator itr;
		double total = 0.0;
		for(itr = products.begin(); itr != products.end(); ++itr) {
			total += itr->total;
		}
		return total;	
	}
	
	double getOrderRealTotal() {
		std::list<Product>::iterator itr;
		double total = 0.0;
		for(itr = products.begin(); itr != products.end(); ++itr) {
			total += itr->realtotal;
		}
		return total;	
	}
};
#endif
 