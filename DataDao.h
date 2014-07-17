#ifndef DataDaoH
#define GoodDaoH
#include <vcl.h>

typedef struct _GoodDao {
    AnsiString barcode;
    AnsiString name;
    AnsiString model;
    AnsiString price;
    AnsiString lowprice;
}GoodDao;

#endif