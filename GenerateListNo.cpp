//---------------------------------------------------------------------------


#pragma hdrstop

#include "GenerateListNo.h"
#include "DbUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

int GenerateListNo::GetMaxListNo(LIST_TYPE type)
{
    AnsiString sTmp1, sTmp2;

    nListNo = -1;
    
    switch (type)
    {
        case CHANGEPRICE_LIST:
        {
            q->Close();
            q->SQL->Text = "select * from t_const where NAME='ShopNo'";
            q->Prepare();
            q->Open();
            int shopNo = q->FieldByName("VAL")->AsInteger;
            
            q->Close();
            sTmp1.sprintf("%03d0000000", shopNo);

            sTmp2.sprintf("select max(IDX) as mid from t_changeprice_list where IDX>%s", sTmp1);
            q->SQL->Text = sTmp2;
            q->Open();
            nListNo = q->FieldByName("mid")->AsInteger;
            if ( nListNo == 0 )
                nListNo = StrToInt(sTmp1);
            q->Close();
            
            break;
        }
        default:
            break;
    }

    return nListNo;
}
