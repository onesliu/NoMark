//---------------------------------------------------------------------------

#ifndef OrderStatusH
#define OrderStatusH
#include <vcl.h>
#include <map>
#include <strstream>
#include "json/json.h"
//---------------------------------------------------------------------------
class OrderStatus {
public:
	enum { ORDER_STATUS_WAITING = 1, //待称重
           ORDER_STATUS_PAYING = 2, //待付款
           ORDER_STATUS_SCALED = 3, //待配送
           ORDER_STATUS_FINISHED = 4, //已完成
           ORDER_STATUS_REFUND = 5, //已退款
           ORDER_STATUS_CANCEL = 6, //已取消
    };

private:
	static OrderStatus * _self;
    typedef std::map<int, AnsiString> TStatusMap;
	TStatusMap status;

	OrderStatus()
	{
	}

    virtual ~OrderStatus() {
        if (_self) {
            delete _self;
        }
    }

public:
	static OrderStatus * getInstance()
	{
		if (_self == NULL)
		{
			_self = new OrderStatus();
		}
		
		return _self;
	}

	AnsiString getStatus(int st) {
        TStatusMap::iterator itr;
        itr = status.find(st);
        if (itr != status.end()) {
            return itr->second;
        }
		return "未知状态";
	}
	
	void putStatus(int sid, AnsiString sval) {
		status[sid] = sval;
	}
	
	int getSize() {
		return status.size();
	}

    bool ParseStatus(AnsiString str);
};
#endif
 