object d: Td
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 310
  Top = 129
  Height = 553
  Width = 817
  object db: TIBDatabase
    DatabaseName = 'debug/GOODS.GDB'
    Params.Strings = (
      'user_name=ones'
      'password=nb33l2l3'
      'lc_ctype=GB_2312')
    LoginPrompt = False
    DefaultTransaction = trans
    Left = 48
    Top = 16
  end
  object trans: TIBTransaction
    DefaultDatabase = db
    AutoStopAction = saCommit
    Left = 104
    Top = 16
  end
  object q: TIBQuery
    Database = db
    Transaction = trans
    Left = 160
    Top = 16
  end
  object q2: TIBQuery
    Database = db
    Transaction = trans
    Left = 208
    Top = 16
  end
  object AuditGoodSet: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      'select * from t_audit_goods order by audittime desc')
    Left = 48
    Top = 80
    object AuditGoodSetAUDITTIME: TDateTimeField
      FieldName = 'AUDITTIME'
      Origin = '"T_AUDIT_GOODS"."AUDITTIME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object AuditGoodSetNAME1: TIBStringField
      FieldName = 'NAME1'
      Origin = '"T_AUDIT_GOODS"."NAME1"'
      Size = 510
    end
    object AuditGoodSetNAME2: TIBStringField
      FieldName = 'NAME2'
      Origin = '"T_AUDIT_GOODS"."NAME2"'
      Size = 510
    end
    object AuditGoodSetCOST1: TIBBCDField
      FieldName = 'COST1'
      Origin = '"T_AUDIT_GOODS"."COST1"'
      Required = True
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object AuditGoodSetCOST2: TIBBCDField
      FieldName = 'COST2'
      Origin = '"T_AUDIT_GOODS"."COST2"'
      Required = True
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object AuditGoodSetGOODNUMBER1: TIBBCDField
      FieldName = 'GOODNUMBER1'
      Origin = '"T_AUDIT_GOODS"."GOODNUMBER1"'
      Precision = 18
      Size = 3
    end
    object AuditGoodSetGOODNUMBER2: TIBBCDField
      FieldName = 'GOODNUMBER2'
      Origin = '"T_AUDIT_GOODS"."GOODNUMBER2"'
      Precision = 18
      Size = 3
    end
    object AuditGoodSetSTORAGENUMBER1: TIBBCDField
      FieldName = 'STORAGENUMBER1'
      Origin = '"T_AUDIT_GOODS"."STORAGENUMBER1"'
      Precision = 18
      Size = 3
    end
    object AuditGoodSetSTORAGENUMBER2: TIBBCDField
      FieldName = 'STORAGENUMBER2'
      Origin = '"T_AUDIT_GOODS"."STORAGENUMBER2"'
      Precision = 18
      Size = 3
    end
  end
  object AuditGoodSource: TDataSource
    DataSet = AuditGoodSet
    Left = 48
    Top = 144
  end
  object CheckSelectSet: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      '')
    Left = 160
    Top = 80
  end
  object CheckDiffSet: TIBQuery
    Database = db
    Transaction = trans
    CachedUpdates = True
    SQL.Strings = (
      
        'select g.idx,g.barcode,g.storagenumber,g.storagenumber as stockn' +
        'umber,cg.number,g.name,(cg.number-g.storagenumber)*g.cost as tot' +
        'alcost,g.cost from t_goods g'
      'left join tmp_check_goods cg on cg.goodidx=g.idx'
      'where cg.number <> g.storagenumber')
    UpdateObject = CheckDiffUpdate
    Left = 264
    Top = 80
    object CheckDiffSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Required = True
      Size = 26
    end
    object CheckDiffSetSTORAGENUMBER: TIBBCDField
      FieldName = 'STORAGENUMBER'
      Origin = '"T_GOODS"."STORAGENUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckDiffSetNUMBER: TIBBCDField
      FieldName = 'NUMBER'
      Origin = '"TMP_CHECK_GOODS"."NUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckDiffSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Required = True
      Size = 510
    end
    object CheckDiffSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_GOODS"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CheckDiffSetSTOCKNUMBER: TIBBCDField
      FieldName = 'STOCKNUMBER'
      Origin = '"T_GOODS"."STORAGENUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckDiffSetTOTALCOST: TFMTBCDField
      FieldName = 'TOTALCOST'
      ProviderFlags = []
      Size = 5
    end
    object CheckDiffSetCOST: TIBBCDField
      FieldName = 'COST'
      Origin = '"T_GOODS"."COST"'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object CheckDiffSource: TDataSource
    DataSet = CheckDiffSet
    Left = 264
    Top = 144
  end
  object CheckNoneSet: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      
        'select g.idx,g.barcode,g.storagenumber,cg.number,g.name from t_g' +
        'oods g'
      'left join tmp_check_goods cg on cg.goodidx=g.idx'
      'where cg.number > 0 or g.storagenumber > 0')
    Left = 360
    Top = 80
    object CheckNoneSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Required = True
      Size = 26
    end
    object CheckNoneSetSTORAGENUMBER: TIBBCDField
      FieldName = 'STORAGENUMBER'
      Origin = '"T_GOODS"."STORAGENUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckNoneSetNUMBER: TIBBCDField
      FieldName = 'NUMBER'
      Origin = '"TMP_CHECK_GOODS"."NUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckNoneSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Required = True
      Size = 510
    end
    object CheckNoneSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_GOODS"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object CheckNoneSource: TDataSource
    DataSet = CheckNoneSet
    Left = 360
    Top = 144
  end
  object CheckDiffUpdate: TIBUpdateSQL
    ModifySQL.Strings = (
      'update t_goods set storagenumber=:number where idx=:idx')
    Left = 160
    Top = 144
  end
  object trans2: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = db
    Left = 264
    Top = 16
  end
  object q3: TIBQuery
    Database = db
    Transaction = trans2
    Left = 320
    Top = 16
  end
  object CheckListSet: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      'select * from t_check_list order by checkdate desc')
    Left = 160
    Top = 208
    object CheckListSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_CHECK_LIST"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CheckListSetCHECKDATE: TDateField
      FieldName = 'CHECKDATE'
      Origin = '"T_CHECK_LIST"."CHECKDATE"'
    end
    object CheckListSetDESP: TIBStringField
      FieldName = 'DESP'
      Origin = '"T_CHECK_LIST"."DESP"'
      Size = 510
    end
    object CheckListSetTOTALDIFF: TIBBCDField
      DisplayWidth = 10
      FieldName = 'TOTALDIFF'
      Origin = '"T_CHECK_LIST"."TOTALDIFF"'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
  end
  object CheckListSource: TDataSource
    DataSet = CheckListSet
    Left = 160
    Top = 272
  end
  object CheckGoodSet: TIBQuery
    Database = db
    Transaction = trans
    OnCalcFields = CheckGoodSetCalcFields
    DataSource = CheckListSource
    SQL.Strings = (
      
        'select g.name,g.barcode,cg.stocknumber,cg.number,cg.difference,g' +
        '.cost,g.cost*(-cg.difference) as totalcost from t_check_goods cg' +
        ' join t_goods g on cg.goodidx=g.idx where checkidx=:idx')
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDX'
        ParamType = ptUnknown
        Size = 4
      end>
    object CheckGoodSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Required = True
      Size = 510
    end
    object CheckGoodSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Required = True
      Size = 26
    end
    object CheckGoodSetSTOCKNUMBER: TIBBCDField
      FieldName = 'STOCKNUMBER'
      Origin = '"T_CHECK_GOODS"."STOCKNUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckGoodSetNUMBER: TIBBCDField
      FieldName = 'NUMBER'
      Origin = '"T_CHECK_GOODS"."NUMBER"'
      Precision = 18
      Size = 3
    end
    object CheckGoodSetDIFFERENCE: TIntegerField
      FieldName = 'DIFFERENCE'
      Origin = '"T_CHECK_GOODS"."DIFFERENCE"'
      Required = True
    end
    object CheckGoodSetDIFF: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DIFF'
      Size = 80
      Calculated = True
    end
    object CheckGoodSetCOST: TIBBCDField
      DisplayWidth = 10
      FieldName = 'COST'
      Origin = '"T_GOODS"."COST"'
      Required = True
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CheckGoodSetTOTALCOST: TIBBCDField
      FieldName = 'TOTALCOST'
      ProviderFlags = []
      DisplayFormat = '#.00'
      Size = 2
    end
  end
  object CheckGoodSource: TDataSource
    DataSet = CheckGoodSet
    Left = 48
    Top = 272
  end
  object SellStatQuery: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      
        'select years,months,sum(totalcost) as tc,sum(totalprice) as tp,s' +
        'um(totalprofit) as tf, sum(totalprofit)/sum(totalprice)*100 as p' +
        'er from v_sell_list where totalprice <> 0 group by years,months ' +
        'order by years desc,months desc')
    Left = 264
    Top = 208
    object SellStatQueryYEARS: TSmallintField
      FieldName = 'YEARS'
      ProviderFlags = []
    end
    object SellStatQueryMONTHS: TSmallintField
      FieldName = 'MONTHS'
      ProviderFlags = []
    end
    object SellStatQueryTC: TIBBCDField
      FieldName = 'TC'
      ProviderFlags = []
      Size = 2
    end
    object SellStatQueryTP: TIBBCDField
      FieldName = 'TP'
      ProviderFlags = []
      Size = 2
    end
    object SellStatQueryTF: TIBBCDField
      FieldName = 'TF'
      ProviderFlags = []
      Size = 2
    end
    object SellStatQueryPER: TIBBCDField
      FieldName = 'PER'
      ProviderFlags = []
      Size = 4
    end
  end
  object SellStatSource: TDataSource
    DataSet = SellStatQuery
    Left = 264
    Top = 272
  end
  object SellStatQuery2: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      
        'select years||'#39'-'#39'||months as YM,sum(totalcost) as tc,sum(totalpr' +
        'ice) as tp,sum(totalprofit) as tf, sum(totalprofit)/sum(totalpri' +
        'ce)*100 as per from v_sell_list where totalprice <> 0 group by y' +
        'ears,months order by years,months')
    Left = 360
    Top = 208
    object SellStatQuery2YM: TIBStringField
      FieldName = 'YM'
      ProviderFlags = []
      Size = 13
    end
    object SellStatQuery2TC: TIBBCDField
      FieldName = 'TC'
      ProviderFlags = []
      Size = 2
    end
    object SellStatQuery2TP: TIBBCDField
      FieldName = 'TP'
      ProviderFlags = []
      Size = 2
    end
    object SellStatQuery2TF: TIBBCDField
      FieldName = 'TF'
      ProviderFlags = []
      Size = 2
    end
    object SellStatQuery2PER: TIBBCDField
      FieldName = 'PER'
      ProviderFlags = []
      Size = 4
    end
  end
  object SellStatSource2: TDataSource
    DataSet = SellStatQuery2
    Left = 360
    Top = 272
  end
  object s_goods: TDataSource
    DataSet = ds_goods
    Left = 464
    Top = 136
  end
  object ds_goods: TIBDataSet
    Database = db
    Transaction = trans
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from t_goods where idx=:IDX')
    SelectSQL.Strings = (
      'select * from T_GOODS')
    ModifySQL.Strings = (
      'update t_goods set name=:NAME, goodcode=:GOODCODE,'
      'barcode=:BARCODE, cost=:COST, labelprice=:LABELPRICE,'
      'lowestprice=:LOWESTPRICE, goodnumber=:GOODNUMBER,'
      'storagenumber=:STORAGENUMBER where idx=:IDX')
    Left = 464
    Top = 80
  end
  object IncomingSource: TDataSource
    DataSet = IncomingSet
    Left = 464
    Top = 272
  end
  object IncomingSet: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      'select * from T_INCOMING_LIST order by idx desc')
    Left = 464
    Top = 208
    object IncomingSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_INCOMING_LIST"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IncomingSetINCOMINGDATE: TDateField
      FieldName = 'INCOMINGDATE'
      Origin = '"T_INCOMING_LIST"."INCOMINGDATE"'
    end
    object IncomingSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_INCOMING_LIST"."NAME"'
      Size = 510
    end
    object IncomingSetTOTALCOST: TIBBCDField
      FieldName = 'TOTALCOST'
      Origin = '"T_INCOMING_LIST"."TOTALCOST"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IncomingSetTOTALNUMBER: TIBBCDField
      FieldName = 'TOTALNUMBER'
      Origin = '"T_INCOMING_LIST"."TOTALNUMBER"'
      Precision = 18
      Size = 3
    end
    object IncomingSetDESP: TIBStringField
      FieldName = 'DESP'
      Origin = '"T_INCOMING_LIST"."DESP"'
      Size = 2048
    end
  end
  object IncomingGoodSet: TIBQuery
    Database = db
    Transaction = trans
    OnCalcFields = IncomingGoodSetCalcFields
    DataSource = IncomingSource
    SQL.Strings = (
      
        'select g.idx, g.name, g.goodcode, g.cost, g.goodnumber, g.labelp' +
        'rice, g.labelprinted, g.barcode, g.goodtype as attribute,'
      
        ' ig.incomingtime, g.lowestprice, ig.goodnumber as storagenumber,' +
        ' t.name as goodtype'
      
        ' from t_incoming_list i left outer join t_incoming_goods ig on i' +
        '.idx = ig.listidx'
      ' left outer join t_goods g on ig.goodidx = g.idx'
      ' left outer join t_goodtype t on g.typeidx = t.idx'
      ' where i.idx=:idx')
    Left = 560
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDX'
        ParamType = ptUnknown
        Size = 4
      end>
    object IncomingGoodSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_GOODS"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IncomingGoodSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Size = 510
    end
    object IncomingGoodSetGOODCODE: TIBStringField
      FieldName = 'GOODCODE'
      Origin = '"T_GOODS"."GOODCODE"'
      Size = 510
    end
    object IncomingGoodSetCOST: TIBBCDField
      FieldName = 'COST'
      Origin = '"T_GOODS"."COST"'
      Precision = 18
      Size = 2
    end
    object IncomingGoodSetGOODNUMBER: TIBBCDField
      FieldName = 'GOODNUMBER'
      Origin = '"T_GOODS"."GOODNUMBER"'
      Precision = 18
      Size = 3
    end
    object IncomingGoodSetLABELPRICE: TIBBCDField
      FieldName = 'LABELPRICE'
      Origin = '"T_GOODS"."LABELPRICE"'
      Precision = 18
      Size = 2
    end
    object IncomingGoodSetLABELPRINTED: TSmallintField
      FieldName = 'LABELPRINTED'
      Origin = '"T_GOODS"."LABELPRINTED"'
    end
    object IncomingGoodSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Size = 26
    end
    object IncomingGoodSetINCOMINGTIME: TDateTimeField
      FieldName = 'INCOMINGTIME'
      Origin = '"T_INCOMING_GOODS"."INCOMINGTIME"'
    end
    object IncomingGoodSetLOWESTPRICE: TIBBCDField
      FieldName = 'LOWESTPRICE'
      Origin = '"T_GOODS"."LOWESTPRICE"'
      Precision = 18
      Size = 2
    end
    object IncomingGoodSetSTORAGENUMBER: TIBBCDField
      FieldName = 'STORAGENUMBER'
      Origin = '"T_GOODS"."STORAGENUMBER"'
      Precision = 18
      Size = 3
    end
    object IncomingGoodSetGOODTYPE: TIBStringField
      FieldName = 'GOODTYPE'
      Origin = '"T_GOODTYPE"."NAME"'
      Size = 510
    end
    object IncomingGoodSetATTRIB: TStringField
      FieldKind = fkCalculated
      FieldName = 'ATTRIB'
      Calculated = True
    end
    object IncomingGoodSetATTRIBUTE: TSmallintField
      FieldName = 'ATTRIBUTE'
      Origin = '"T_GOODS"."GOODTYPE"'
    end
  end
  object IncomingGoodSource: TDataSource
    DataSet = IncomingGoodSet
    Left = 560
    Top = 272
  end
  object ds_incoming: TIBDataSet
    Database = db
    Transaction = trans
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from t_incoming_list where idx=:IDX')
    SelectSQL.Strings = (
      'select * from T_INCOMING_LIST order by idx desc')
    ModifySQL.Strings = (
      'update t_goods set name=:NAME, goodcode=:GOODCODE,'
      'barcode=:BARCODE, cost=:COST, labelprice=:LABELPRICE,'
      'lowestprice=:LOWESTPRICE, goodnumber=:GOODNUMBER,'
      'storagenumber=:STORAGENUMBER where idx=:IDX')
    Left = 560
    Top = 80
  end
  object s_incoming: TDataSource
    DataSet = ds_incoming
    Left = 560
    Top = 136
  end
  object SellSource: TDataSource
    DataSet = SellSet
    Left = 48
    Top = 408
  end
  object SellSet: TIBQuery
    Database = db
    Transaction = trans
    OnCalcFields = SellSetCalcFields
    SQL.Strings = (
      'select * from t_order_list order by idx desc')
    Left = 48
    Top = 344
    object SellSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_ORDER_LIST"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SellSetORDERDATE: TDateField
      FieldName = 'ORDERDATE'
      Origin = '"T_ORDER_LIST"."ORDERDATE"'
    end
    object SellSetTOTALCHANGE: TIBBCDField
      FieldName = 'TOTALCHANGE'
      Origin = '"T_ORDER_LIST"."TOTALCHANGE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetTOTALCASH: TIBBCDField
      FieldName = 'TOTALCASH'
      Origin = '"T_ORDER_LIST"."TOTALCASH"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetTOTALCOST: TIBBCDField
      FieldName = 'TOTALCOST'
      Origin = '"T_ORDER_LIST"."TOTALCOST"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetTOTALPRICE: TIBBCDField
      FieldName = 'TOTALPRICE'
      Origin = '"T_ORDER_LIST"."TOTALPRICE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetTOTALPROFIT: TIBBCDField
      FieldName = 'TOTALPROFIT'
      Origin = '"T_ORDER_LIST"."TOTALPROFIT"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetTOTALSELLNUM: TIBBCDField
      FieldName = 'TOTALSELLNUM'
      Origin = '"T_ORDER_LIST"."TOTALSELLNUM"'
      Precision = 18
      Size = 3
    end
    object SellSetTOTALCANCELNUM: TIBBCDField
      FieldName = 'TOTALCANCELNUM'
      Origin = '"T_ORDER_LIST"."TOTALCANCELNUM"'
      Precision = 18
      Size = 3
    end
    object SellSetDESP: TIBStringField
      FieldName = 'DESP'
      Origin = '"T_ORDER_LIST"."DESP"'
      Size = 510
    end
    object SellSetTOTALINCOME: TIBBCDField
      FieldName = 'TOTALINCOME'
      Origin = '"T_ORDER_LIST"."TOTALINCOME"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetTOTALEXPENSES: TIBBCDField
      FieldName = 'TOTALEXPENSES'
      Origin = '"T_ORDER_LIST"."TOTALEXPENSES"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetBANKSAVE: TIBBCDField
      FieldName = 'BANKSAVE'
      Origin = '"T_ORDER_LIST"."BANKSAVE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellSetRate: TStringField
      FieldKind = fkCalculated
      FieldName = 'Rate'
      Calculated = True
    end
  end
  object SellGoodSet: TIBQuery
    Database = db
    Transaction = trans
    OnCalcFields = SellGoodSetCalcFields
    DataSource = SellSource
    SQL.Strings = (
      
        'select g.name, g.labelprice, g.storagenumber, g.goodcode, g.barc' +
        'ode, '
      
        '        og.idx as ordergoodidx, og.price, og.counts, og.cost, og' +
        '.profit, og.selltime, og.canceldate, '
      '        gt.name as goodtype '
      '        from t_order_goods og '
      '        left outer join t_goods g on og.goodidx = g.idx '
      '        left outer join t_goodtype gt on g.typeidx = gt.idx '
      '        where orderlistidx=:idx')
    Left = 128
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDX'
        ParamType = ptUnknown
        Size = 4
      end>
    object SellGoodSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Size = 510
    end
    object SellGoodSetLABELPRICE: TIBBCDField
      FieldName = 'LABELPRICE'
      Origin = '"T_GOODS"."LABELPRICE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellGoodSetSTORAGENUMBER: TIBBCDField
      FieldName = 'STORAGENUMBER'
      Origin = '"T_GOODS"."STORAGENUMBER"'
      Precision = 18
      Size = 3
    end
    object SellGoodSetGOODCODE: TIBStringField
      FieldName = 'GOODCODE'
      Origin = '"T_GOODS"."GOODCODE"'
      Size = 510
    end
    object SellGoodSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Size = 26
    end
    object SellGoodSetORDERGOODIDX: TIntegerField
      FieldName = 'ORDERGOODIDX'
      Origin = '"T_ORDER_GOODS"."IDX"'
      Required = True
    end
    object SellGoodSetPRICE: TIBBCDField
      FieldName = 'PRICE'
      Origin = '"T_ORDER_GOODS"."PRICE"'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object SellGoodSetCOUNTS: TIntegerField
      FieldName = 'COUNTS'
      Origin = '"T_ORDER_GOODS"."COUNTS"'
    end
    object SellGoodSetCOST: TIBBCDField
      FieldName = 'COST'
      Origin = '"T_ORDER_GOODS"."COST"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellGoodSetPROFIT: TIBBCDField
      FieldName = 'PROFIT'
      Origin = '"T_ORDER_GOODS"."PROFIT"'
      currency = True
      Precision = 18
      Size = 2
    end
    object SellGoodSetSELLTIME: TDateTimeField
      FieldName = 'SELLTIME'
      Origin = '"T_ORDER_GOODS"."SELLTIME"'
    end
    object SellGoodSetCANCELDATE: TDateField
      FieldName = 'CANCELDATE'
      Origin = '"T_ORDER_GOODS"."CANCELDATE"'
    end
    object SellGoodSetGOODTYPE: TIBStringField
      FieldName = 'GOODTYPE'
      Origin = '"T_GOODTYPE"."NAME"'
      Size = 510
    end
    object SellGoodSetRATE: TStringField
      FieldKind = fkCalculated
      FieldName = 'RATE'
      Calculated = True
    end
  end
  object SellGoodSource: TDataSource
    DataSet = SellGoodSet
    Left = 128
    Top = 408
  end
  object CancelGoodSet: TIBQuery
    Database = db
    Transaction = trans
    DataSource = SellSource
    SQL.Strings = (
      'select g.name, g.labelprice, g.barcode, '
      
        '        og.idx as ordergoodidx, og.price, og.counts, og.selltime' +
        ', og.canceldate, '
      
        '        ol.totalprice, ol.totalsellnum, ol.totalcancelnum, ol.to' +
        'talcash '
      '        from t_order_list ol '
      
        '        left outer join t_order_goods og on ol.idx = og.orderlis' +
        'tidx '
      '        left outer join t_goods g on og.goodidx = g.idx '
      '        where og.canceldate=:orderdate')
    Left = 224
    Top = 344
    ParamData = <
      item
        DataType = ftDate
        Name = 'ORDERDATE'
        ParamType = ptUnknown
        Size = 4
      end>
    object CancelGoodSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Size = 510
    end
    object CancelGoodSetLABELPRICE: TIBBCDField
      FieldName = 'LABELPRICE'
      Origin = '"T_GOODS"."LABELPRICE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object CancelGoodSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Size = 26
    end
    object CancelGoodSetORDERGOODIDX: TIntegerField
      FieldName = 'ORDERGOODIDX'
      Origin = '"T_ORDER_GOODS"."IDX"'
    end
    object CancelGoodSetPRICE: TIBBCDField
      FieldName = 'PRICE'
      Origin = '"T_ORDER_GOODS"."PRICE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object CancelGoodSetCOUNTS: TIntegerField
      FieldName = 'COUNTS'
      Origin = '"T_ORDER_GOODS"."COUNTS"'
    end
    object CancelGoodSetSELLTIME: TDateTimeField
      FieldName = 'SELLTIME'
      Origin = '"T_ORDER_GOODS"."SELLTIME"'
    end
    object CancelGoodSetCANCELDATE: TDateField
      FieldName = 'CANCELDATE'
      Origin = '"T_ORDER_GOODS"."CANCELDATE"'
    end
    object CancelGoodSetTOTALPRICE: TIBBCDField
      FieldName = 'TOTALPRICE'
      Origin = '"T_ORDER_LIST"."TOTALPRICE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object CancelGoodSetTOTALSELLNUM: TIBBCDField
      FieldName = 'TOTALSELLNUM'
      Origin = '"T_ORDER_LIST"."TOTALSELLNUM"'
      Precision = 18
      Size = 3
    end
    object CancelGoodSetTOTALCANCELNUM: TIBBCDField
      FieldName = 'TOTALCANCELNUM'
      Origin = '"T_ORDER_LIST"."TOTALCANCELNUM"'
      Precision = 18
      Size = 3
    end
    object CancelGoodSetTOTALCASH: TIBBCDField
      FieldName = 'TOTALCASH'
      Origin = '"T_ORDER_LIST"."TOTALCASH"'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object CancelGoodSource: TDataSource
    DataSet = CancelGoodSet
    Left = 224
    Top = 408
  end
  object CashSet: TIBQuery
    Database = db
    Transaction = trans
    OnCalcFields = CashSetCalcFields
    DataSource = SellSource
    SQL.Strings = (
      
        'select * from t_inout_items where orderlistidx=:idx order by ino' +
        'ut')
    Left = 320
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDX'
        ParamType = ptUnknown
        Size = 4
      end>
    object CashSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_INOUT_ITEMS"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CashSetORDERLISTIDX: TIntegerField
      FieldName = 'ORDERLISTIDX'
      Origin = '"T_INOUT_ITEMS"."ORDERLISTIDX"'
      Required = True
    end
    object CashSetINOUT: TSmallintField
      FieldName = 'INOUT'
      Origin = '"T_INOUT_ITEMS"."INOUT"'
      Required = True
    end
    object CashSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_INOUT_ITEMS"."NAME"'
      Size = 510
    end
    object CashSetCOST: TIBBCDField
      FieldName = 'COST'
      Origin = '"T_INOUT_ITEMS"."COST"'
      currency = True
      Precision = 18
      Size = 2
    end
    object CashSetTYPE: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'TYPE'
      Calculated = True
    end
  end
  object CashSource: TDataSource
    DataSet = CashSet
    Left = 320
    Top = 408
  end
  object ChangePriceSource: TDataSource
    DataSet = ChangePriceSet
    Left = 424
    Top = 408
  end
  object ChangeGoodSet: TIBQuery
    Database = db
    Transaction = trans
    OnCalcFields = IncomingGoodSetCalcFields
    DataSource = ChangePriceSource
    SQL.Strings = (
      
        'select cg.idx, cg.changetime, cg.oldprice, cg.newprice, g.name, ' +
        'g.labelprice, g.barcode'
      'from t_changeprice_goods cg join t_goods g on cg.goodidx=g.idx'
      'where cg.listidx=:idx')
    Left = 520
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDX'
        ParamType = ptUnknown
        Size = 4
      end>
    object ChangeGoodSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"T_CHANGEPRICE_GOODS"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ChangeGoodSetCHANGETIME: TDateTimeField
      FieldName = 'CHANGETIME'
      Origin = '"T_CHANGEPRICE_GOODS"."CHANGETIME"'
    end
    object ChangeGoodSetOLDPRICE: TIBBCDField
      FieldName = 'OLDPRICE'
      Origin = '"T_CHANGEPRICE_GOODS"."OLDPRICE"'
      Required = True
      Precision = 18
      Size = 2
    end
    object ChangeGoodSetNEWPRICE: TIBBCDField
      FieldName = 'NEWPRICE'
      Origin = '"T_CHANGEPRICE_GOODS"."NEWPRICE"'
      Required = True
      Precision = 18
      Size = 2
    end
    object ChangeGoodSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"T_GOODS"."NAME"'
      Required = True
      Size = 510
    end
    object ChangeGoodSetLABELPRICE: TIBBCDField
      FieldName = 'LABELPRICE'
      Origin = '"T_GOODS"."LABELPRICE"'
      Precision = 18
      Size = 2
    end
    object ChangeGoodSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"T_GOODS"."BARCODE"'
      Required = True
      Size = 26
    end
  end
  object ChangeGoodSource: TDataSource
    DataSet = ChangeGoodSet
    Left = 520
    Top = 408
  end
  object ChangePriceSet: TIBQuery
    Database = db
    Transaction = trans
    SQL.Strings = (
      'select * from T_CHANGEPRICE_LIST order by idx desc')
    Left = 424
    Top = 344
  end
end
