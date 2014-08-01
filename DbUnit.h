//---------------------------------------------------------------------------

#ifndef DbUnitH
#define DbUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <IBDatabase.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <IBTable.hpp>
#include "Janitor.h"
#include <IBUpdateSQL.hpp>
#include <IdBaseComponent.hpp>
#include <IdCoder.hpp>
#include <IdCoder3To4.hpp>
//---------------------------------------------------------------------------
class Td : public TDataModule
{
__published:	// IDE-managed Components
    TIBDatabase *db;
    TIBTransaction *trans;
    TIBQuery *q;
    TIBQuery *q2;
    TIBQuery *AuditGoodSet;
    TDataSource *AuditGoodSource;
    TDateTimeField *AuditGoodSetAUDITTIME;
    TIBStringField *AuditGoodSetNAME1;
    TIBStringField *AuditGoodSetNAME2;
    TIBBCDField *AuditGoodSetCOST1;
    TIBBCDField *AuditGoodSetCOST2;
    TIBQuery *CheckSelectSet;
    TIBQuery *CheckDiffSet;
    TDataSource *CheckDiffSource;
    TIBQuery *CheckNoneSet;
    TDataSource *CheckNoneSource;
    TIBStringField *CheckDiffSetBARCODE;
    TIBStringField *CheckDiffSetNAME;
    TIntegerField *CheckDiffSetIDX;
    TIBUpdateSQL *CheckDiffUpdate;
    TIBTransaction *trans2;
    TIBQuery *q3;
    TIBQuery *CheckListSet;
    TDataSource *CheckListSource;
    TIntegerField *CheckListSetIDX;
    TDateField *CheckListSetCHECKDATE;
    TIBStringField *CheckListSetDESP;
    TIBQuery *CheckGoodSet;
    TDataSource *CheckGoodSource;
    TIBStringField *CheckGoodSetNAME;
    TIBStringField *CheckGoodSetBARCODE;
    TIntegerField *CheckGoodSetDIFFERENCE;
    TStringField *CheckGoodSetDIFF;
    TIBBCDField *CheckListSetTOTALDIFF;
    TIBBCDField *CheckGoodSetCOST;
    TIBBCDField *CheckGoodSetTOTALCOST;
    TIBQuery *SellStatQuery;
    TDataSource *SellStatSource;
    TSmallintField *SellStatQueryYEARS;
    TSmallintField *SellStatQueryMONTHS;
    TIBBCDField *SellStatQueryTC;
    TIBBCDField *SellStatQueryTP;
    TIBBCDField *SellStatQueryTF;
    TIBBCDField *SellStatQueryPER;
    TIBQuery *SellStatQuery2;
    TDataSource *SellStatSource2;
    TIBStringField *SellStatQuery2YM;
    TIBBCDField *SellStatQuery2TC;
    TIBBCDField *SellStatQuery2TP;
    TIBBCDField *SellStatQuery2TF;
    TIBBCDField *SellStatQuery2PER;
    TDataSource *s_goods;
    TIBDataSet *ds_goods;
    TDataSource *IncomingSource;
    TIBBCDField *AuditGoodSetGOODNUMBER1;
    TIBBCDField *AuditGoodSetGOODNUMBER2;
    TIBBCDField *CheckDiffSetNUMBER;
    TFMTBCDField *CheckDiffSetTOTALCOST;
    TIBBCDField *CheckDiffSetCOST;
    TIntegerField *CheckNoneSetIDX;
    TIBStringField *CheckNoneSetBARCODE;
    TIBBCDField *CheckNoneSetNUMBER;
    TIBStringField *CheckNoneSetNAME;
    TIBBCDField *CheckGoodSetSTOCKNUMBER;
    TIBBCDField *CheckGoodSetNUMBER;
    TIBQuery *IncomingSet;
    TIBQuery *IncomingGoodSet;
    TDataSource *IncomingGoodSource;
    TIntegerField *IncomingGoodSetIDX;
    TIBStringField *IncomingGoodSetNAME;
    TIBStringField *IncomingGoodSetGOODCODE;
    TIBBCDField *IncomingGoodSetCOST;
    TIBBCDField *IncomingGoodSetGOODNUMBER;
    TIBBCDField *IncomingGoodSetLABELPRICE;
    TSmallintField *IncomingGoodSetLABELPRINTED;
    TIBStringField *IncomingGoodSetBARCODE;
    TDateTimeField *IncomingGoodSetINCOMINGTIME;
    TIBBCDField *IncomingGoodSetLOWESTPRICE;
    TIBStringField *IncomingGoodSetGOODTYPE;
    TDateField *IncomingSetINCOMINGDATE;
    TIBStringField *IncomingSetNAME;
    TIBBCDField *IncomingSetTOTALCOST;
    TIBBCDField *IncomingSetTOTALNUMBER;
    TIBStringField *IncomingSetDESP;
    TIBDataSet *ds_incoming;
    TDataSource *s_incoming;
    TIntegerField *IncomingSetIDX;
    TDataSource *SellSource;
    TIBQuery *SellSet;
    TIBQuery *SellGoodSet;
    TDataSource *SellGoodSource;
    TIntegerField *SellSetIDX;
    TDateField *SellSetORDERDATE;
    TIBBCDField *SellSetTOTALCHANGE;
    TIBBCDField *SellSetTOTALCASH;
    TIBBCDField *SellSetTOTALCOST;
    TIBBCDField *SellSetTOTALPRICE;
    TIBBCDField *SellSetTOTALPROFIT;
    TIBBCDField *SellSetTOTALSELLNUM;
    TIBBCDField *SellSetTOTALCANCELNUM;
    TIBStringField *SellSetDESP;
    TIBBCDField *SellSetTOTALINCOME;
    TIBBCDField *SellSetTOTALEXPENSES;
    TIBBCDField *SellSetBANKSAVE;
    TStringField *SellSetRate;
    TIBStringField *SellGoodSetNAME;
    TIBBCDField *SellGoodSetLABELPRICE;
    TIBBCDField *SellGoodSetSTORAGENUMBER;
    TIBStringField *SellGoodSetGOODCODE;
    TIBStringField *SellGoodSetBARCODE;
    TIntegerField *SellGoodSetORDERGOODIDX;
    TIBBCDField *SellGoodSetPRICE;
    TIntegerField *SellGoodSetCOUNTS;
    TIBBCDField *SellGoodSetCOST;
    TIBBCDField *SellGoodSetPROFIT;
    TDateTimeField *SellGoodSetSELLTIME;
    TDateField *SellGoodSetCANCELDATE;
    TIBStringField *SellGoodSetGOODTYPE;
    TStringField *SellGoodSetRATE;
    TIBQuery *CancelGoodSet;
    TDataSource *CancelGoodSource;
    TIBQuery *CashSet;
    TDataSource *CashSource;
    TIBStringField *CancelGoodSetNAME;
    TIBBCDField *CancelGoodSetLABELPRICE;
    TIBStringField *CancelGoodSetBARCODE;
    TIntegerField *CancelGoodSetORDERGOODIDX;
    TIBBCDField *CancelGoodSetPRICE;
    TIntegerField *CancelGoodSetCOUNTS;
    TDateTimeField *CancelGoodSetSELLTIME;
    TDateField *CancelGoodSetCANCELDATE;
    TIBBCDField *CancelGoodSetTOTALPRICE;
    TIBBCDField *CancelGoodSetTOTALSELLNUM;
    TIBBCDField *CancelGoodSetTOTALCANCELNUM;
    TIBBCDField *CancelGoodSetTOTALCASH;
    TIntegerField *CashSetIDX;
    TIntegerField *CashSetORDERLISTIDX;
    TSmallintField *CashSetINOUT;
    TIBStringField *CashSetNAME;
    TIBBCDField *CashSetCOST;
    TStringField *CashSetTYPE;
    TStringField *IncomingGoodSetATTRIB;
    TSmallintField *IncomingGoodSetATTRIBUTE;
    TDataSource *ChangePriceSource;
    TIBQuery *ChangeGoodSet;
    TDataSource *ChangeGoodSource;
    TIntegerField *ChangeGoodSetIDX;
    TDateTimeField *ChangeGoodSetCHANGETIME;
    TIBBCDField *ChangeGoodSetOLDPRICE;
    TIBBCDField *ChangeGoodSetNEWPRICE;
    TIBStringField *ChangeGoodSetNAME;
    TIBBCDField *ChangeGoodSetLABELPRICE;
    TIBStringField *ChangeGoodSetBARCODE;
    TIBQuery *ChangePriceSet;
    TIBBCDField *IncomingGoodSetSTORAGENUMBER;
    TIBBCDField *IncomingGoodSetORIGINCOST;
    void __fastcall DataModuleCreate(TObject *Sender);
    void __fastcall DataModuleDestroy(TObject *Sender);
    void __fastcall CheckGoodSetCalcFields(TDataSet *DataSet);
    void __fastcall SellSetCalcFields(TDataSet *DataSet);
    void __fastcall SellGoodSetCalcFields(TDataSet *DataSet);
    void __fastcall CashSetCalcFields(TDataSet *DataSet);
    void __fastcall IncomingGoodSetCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
    __fastcall Td(TComponent* Owner);
    void FreshAuditGood( AnsiString name="" );
    bool ViewExists( AnsiString name );

    //2007-11-09 modify
    AnsiString GoodTypeStr( int id );
    void __fastcall FreshGoodList(AnsiString sql);
};
//---------------------------------------------------------------------------
extern PACKAGE Td *d;
//---------------------------------------------------------------------------
extern double MinProfitPercent;
extern AnsiString sPrintLogo;
extern AnsiString sPrintTail;
extern int TestMode;

extern bool CalcDayTotal( int orderlist );
extern bool StorageUpdate( int goodidx, double count );
extern AnsiString MakePassword( const AnsiString & pwd );
extern AnsiString GetPassword( const AnsiString & pwd );
extern AnsiString BarCode_UPC_E( const AnsiString &code );
extern void ExecSQL( AnsiString sql );
extern TControl * __fastcall _FindControl( TControl* pControl, AnsiString classname );

class TReduce {
public:
    double cost;
    double label_price;
    double lowest_price;
    double reduce;
    AnsiString reduce_label;
    AnsiString reduce_value;
public:
    TReduce() : lowest_price(-1) {}
    void ReduceUp();
    void ReduceDown();
};
extern TReduce oReduce;
//---------------------------------------------------------------------------
#define q d->q
#define q2 d->q2

#endif
