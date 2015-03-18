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
    AnsiString shipping_phone;
	AnsiString customer_phone;
	AnsiString shipping_addr;
	AnsiString shipping_time;
	AnsiString comment;
    int iscash;
    double costpay;
    double cashpay;

	int order_type;
	int order_status_orign;
	AnsiString productSubject;
	bool is_delete;
    TDateTime order_date;

	std::list<Product*> products;

	Order() : is_delete(false), iscash(0), costpay(0), cashpay(0) {
	}

    virtual ~Order() {
        std::list<Product*>::iterator itr;
		for(itr = products.begin(); itr != products.end(); ++itr) {
			if (*itr != NULL)
				delete *itr;
		}
    }
	
	void add_product(Product * p) {
		products.push_back(p);
	}
	
	Product * get(int productid) {
        using namespace std;
		list<Product*>::iterator itr;
		Product * ret = NULL;
        for(itr = products.begin(); itr != products.end(); ++itr) {
			if ((*itr)->product_id == productid) {
				ret = *itr;
				break;
			}
		}
		return ret;
	}
	
	Product * get(AnsiString barcode) {
        using namespace std;
		list<Product*>::iterator itr;
		IBarcode pbc;
		Product * ret = NULL;
		int id1, id2;

		if (pbc.parseCode(barcode) == false)
			return NULL;
		id1 = pbc.productId;
		
		for(itr = products.begin(); itr != products.end(); ++itr) {
			if (pbc.parseCode((*itr)->ean) == false)
				continue;
			id2 = pbc.productId;
			
			if (id1 == id2) {
				ret = *itr;
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

	void commit(int order_status = 0) {
    	if (order_status != 0)
	    	this->order_status = order_status;
		order_status_orign = order_status;
	}

	bool hasScanedOver() {
		if (order_status > OrderStatus::ORDER_STATUS_WAITING)
			return true;

		std::list<Product*>::iterator itr;
		for(itr = products.begin(); itr != products.end(); ++itr) {
			if ((*itr)->hasScanned() == false)
				return false;
		}

		return true;
	}

    int getScanedOver() {
    	if (order_status == OrderStatus::ORDER_STATUS_WAITING) {
	   		if (order_type == 0)
				return OrderStatus::ORDER_STATUS_SCALED;
			else
				return OrderStatus::ORDER_STATUS_PAYING;
        }
        else
        	return order_status;
    }

	int getDelivered() {
    	if (order_status == OrderStatus::ORDER_STATUS_SCALED) {
			return OrderStatus::ORDER_STATUS_FINISHED;
        }
        else
        	return order_status;
	}
	
	double getOrderTotal() {
		std::list<Product*>::iterator itr;
		double total = 0.0;
		for(itr = products.begin(); itr != products.end(); ++itr) {
			total += (*itr)->total;
		}
		return total;	
	}
	
	double getOrderRealTotal() {
		std::list<Product*>::iterator itr;
		double total = 0.0;
		for(itr = products.begin(); itr != products.end(); ++itr) {
            Product p = *(*itr);
            double realprice = p.realtotal;
			total += (*itr)->realtotal;
		}
		return total;	
	}
};

struct comporder {
	bool operator()(const Order * o1, const Order *o2) {
		return o1->order_date < o2->order_date;
    }
};

#endif
 