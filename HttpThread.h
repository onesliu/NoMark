//---------------------------------------------------------------------------

#ifndef HttpThreadH
#define HttpThreadH

#include "HttpAccess.h"
#include "SyncObjs.hpp"
#include "Order.h"
//---------------------------------------------------------------------------
class THttpThread : public TThread {
public:
	__fastcall THttpThread(bool CreateSuspended) : TThread(CreateSuspended) {
	    m_bLogin = false;
    	http = new THttpAccess();
        lock = new TCriticalSection();
    }
    virtual __fastcall ~THttpThread(void) {
    	delete lock;
    	delete http;
    }

public:

	bool __fastcall Login();
    bool __fastcall ParseOrders();
    void __fastcall Execute();
    AnsiString __fastcall GetOrders();
    bool __fastcall SearchOrders(AnsiString date);
    AnsiString __fastcall GetStatus();
    AnsiString __fastcall GetDistricts();
    AnsiString __fastcall GetBalance();
    AnsiString __fastcall SetBalance();
    AnsiString __fastcall GetProductInfo(bool all = false);
    bool       __fastcall ParseProductInfo(AnsiString str);
    bool __fastcall CommitOrder(Order *order, int order_status);
    bool __fastcall CancelOrder(Order * order);
    bool __fastcall CashPay(Order * order);
    bool __fastcall OrderAlert(Order * order);

    AnsiString user;
    AnsiString password;
    AnsiString server;

public:
    bool m_bLogin;
    AnsiString token;
    int district_id;
    THttpAccess * http;
    AnsiString st1, st2;
    int scale_count;

    TCriticalSection * lock;

    void __fastcall FreshOrders(void);
    void __fastcall FreshStatus(void);
};

#endif
 