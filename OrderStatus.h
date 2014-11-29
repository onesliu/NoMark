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
	enum { ORDER_STATUS_WAITING = 1, //������
           ORDER_STATUS_PAYING = 2, //������
           ORDER_STATUS_SCALED = 3, //������
           ORDER_STATUS_FINISHED = 4, //�����
           ORDER_STATUS_REFUND = 5, //���˿�
           ORDER_STATUS_CANCEL = 6, //��ȡ��
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
		return "δ֪״̬";
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
 