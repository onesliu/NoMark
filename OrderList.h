//---------------------------------------------------------------------------

#ifndef OrderListH
#define OrderListH
#include <vcl.h>
#include <list>
#include <algorithms.h>
#include "Order.h"
#include "SoundPlay.h"
//---------------------------------------------------------------------------
class OrderList {
public:
	std::list<Order> orders;
	
	OrderList() {
	}
	
	void clear() {
	}
	
	Order * get(__int64 orderid) {
        std::list<Order>::iterator itr;
		for(itr = orders.begin(); itr != orders.end(); ++itr) {
			if (itr->order_id == orderid)
				return &(*itr);
		}
		return NULL;
	}
	
	void add(Order order) {
		orders.push_back(order);
	}
	
	int size() {
		return orders.size();
	}
	
	boolean hasChangedOrder() {
        std::list<Order>::iterator itr;
		for(itr = orders.begin(); itr != orders.end(); ++itr) {
			if (itr->hasChanged())
				return true;
		}
		return false;
	}
	
	void mergeOrderList(OrderList * newlist, SoundPlay SoundPlayer) {
		if (newlist == NULL) return;
		
		//删除上次完成的订单
		clearFinished();
		
        std::list<Order>::iterator itr;
		for(itr = orders.begin(); itr != orders.end(); ++itr) {
			Order * o_old = &(*itr);
			Order * o_new = newlist->get(o_old->order_id);

			if (o_new == NULL && o_old->is_delete == false) {
				//有完成订单，报警
				o_old->is_delete = true;
				SoundPlayer.play(SoundPlay::SOUND_ORDER_FINISH);
			}
		}

		std::list<Order> new_orders;
		for(itr = newlist->orders.begin(); itr != newlist->orders.end(); ++itr) {
			Order * o_new = &(*itr);
			Order * o_old = this->get(o_new->order_id);
			
			if (o_old == NULL) {
				//有新订单，报警
				new_orders.push_back(*o_new);
				SoundPlayer.play(SoundPlay::SOUND_ORDER_NEW);
			}
			else if (o_old != NULL) {
				if (o_old->order_status_orign != o_new->order_status_orign) {
					//有修改订单，报警
					o_old->initStatus(o_new->order_status);
					SoundPlayer.play(SoundPlay::SOUND_ORDER_MODIFY);
				}
			}
		}
		
		if (new_orders.size() > 0) {
			orders.merge(new_orders);
		}
	}
	
	void clearFinished() {
        std::list<Order>::iterator itr;
		for(itr = orders.begin(); itr != orders.end(); ++itr) {
			if (itr->is_delete == true) {
				orders.erase(itr);
			}
		}
	}
	
	void commitAllOrders() {
        std::list<Order>::iterator itr;
		for(itr = orders.begin(); itr != orders.end(); ++itr) {
			itr->commit();
		}
	}

    void sortOrderByTime() {
        orders.sort();
    }

};

#endif
