//---------------------------------------------------------------------------

#ifndef GenerateListNoH
#define GenerateListNoH
//---------------------------------------------------------------------------
    enum LIST_TYPE
    {
        CHANGEPRICE_LIST = 0,
        CHECK_LIST       = 1,
        INCOMING_LIST    = 2,
        ORDER_LIST       = 3
    } ;
    
class GenerateListNo
{
public:

    int nListNo;
    int GetMaxListNo(LIST_TYPE type);
};

#endif
