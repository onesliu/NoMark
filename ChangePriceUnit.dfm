object ChangePriceForm: TChangePriceForm
  Left = 310
  Top = 130
  Width = 693
  Height = 583
  Caption = #35843#20215#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 57
    Width = 677
    Height = 64
    Align = alTop
    Caption = #21333#25454#20449#24687
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 152
      Top = 28
      Width = 66
      Height = 12
      Caption = #35843#20215#21333#21517#31216':'
    end
    object Label8: TLabel
      Left = 360
      Top = 28
      Width = 30
      Height = 12
      Caption = #22791#27880':'
    end
    object Label10: TLabel
      Left = 16
      Top = 28
      Width = 54
      Height = 12
      Caption = #21046#21333#26085#26399':'
    end
    object ListDate: TLabel
      Left = 76
      Top = 28
      Width = 60
      Height = 12
      Caption = '2005-08-05'
    end
    object ListName: TEdit
      Left = 222
      Top = 25
      Width = 123
      Height = 18
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = 'ListName'
    end
    object ListDesp: TEdit
      Left = 392
      Top = 25
      Width = 249
      Height = 18
      TabOrder = 1
      Text = 'ListDesp'
    end
  end
  object title: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = #35843#20215#21333
    Color = 13339492
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -33
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object ChangeGrid: TDBGrid
    Left = 0
    Top = 121
    Width = 677
    Height = 379
    Align = alClient
    BorderStyle = bsNone
    DataSource = ChangePriceDataSource
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BARCODE'
        Title.Caption = #21830#21697#26465#30721
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #21697#21517
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDPRICE'
        Title.Caption = #29616#20215
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NEWPRICE'
        Title.Caption = #26032#20215#26684
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHANGETIME'
        Title.Caption = #20462#25913#26102#38388
        Width = 150
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 500
    Width = 677
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
    DesignSize = (
      677
      45)
    object Ok: TButton
      Left = 216
      Top = 12
      Width = 88
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Caption = #20445#23384#36807#24080
      TabOrder = 0
      OnClick = OkClick
    end
    object Cancel: TButton
      Left = 331
      Top = 12
      Width = 139
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #19981#20445#23384#21333#25454#36864#20986
      TabOrder = 1
      OnClick = CancelClick
    end
  end
  object ChangePriceDataSource: TDataSource
    DataSet = ChangePriceDataSet
    Left = 168
    Top = 240
  end
  object ChangePriceDataSet: TIBDataSet
    Database = d.db
    Transaction = d.trans
    BeforeEdit = ChangePriceDataSetBeforeEdit
    CachedUpdates = True
    DeleteSQL.Strings = (
      'update tmp_changeprice_goods set '
      'newprice=null'
      'where goodidx=:goodidx and listidx=:listidx')
    SelectSQL.Strings = (
      'select * from tmp_changeprice_goods order by goodidx')
    ModifySQL.Strings = (
      'update tmp_changeprice_goods set '
      'newprice=:newprice '
      'where goodidx=:goodidx and listidx=:listidx')
    Left = 168
    Top = 192
    object ChangePriceDataSetIDX: TIntegerField
      FieldName = 'IDX'
      Origin = '"TMP_CHANGEPRICE_GOODS"."IDX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object ChangePriceDataSetGOODIDX: TIntegerField
      FieldName = 'GOODIDX'
      Origin = '"TMP_CHANGEPRICE_GOODS"."GOODIDX"'
      ReadOnly = True
      Required = True
    end
    object ChangePriceDataSetLISTIDX: TIntegerField
      FieldName = 'LISTIDX'
      Origin = '"TMP_CHANGEPRICE_GOODS"."LISTIDX"'
      ReadOnly = True
      Required = True
    end
    object ChangePriceDataSetCHANGETIME: TDateTimeField
      FieldName = 'CHANGETIME'
      Origin = '"TMP_CHANGEPRICE_GOODS"."CHANGETIME"'
      ReadOnly = True
    end
    object ChangePriceDataSetOLDPRICE: TIBBCDField
      FieldName = 'OLDPRICE'
      Origin = '"TMP_CHANGEPRICE_GOODS"."OLDPRICE"'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object ChangePriceDataSetNEWPRICE: TIBBCDField
      FieldName = 'NEWPRICE'
      Origin = '"TMP_CHANGEPRICE_GOODS"."NEWPRICE"'
      currency = True
      Precision = 18
      Size = 2
    end
    object ChangePriceDataSetBARCODE: TIBStringField
      FieldName = 'BARCODE'
      Origin = '"TMP_CHANGEPRICE_GOODS"."BARCODE"'
      ReadOnly = True
      Size = 510
    end
    object ChangePriceDataSetNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TMP_CHANGEPRICE_GOODS"."NAME"'
      ReadOnly = True
      Size = 510
    end
  end
end
