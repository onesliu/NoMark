object GoodsFrame: TGoodsFrame
  Left = 0
  Top = 0
  Width = 797
  Height = 356
  Ctl3D = False
  ParentCtl3D = False
  TabOrder = 0
  object CoolBar1: TCoolBar
    Left = 0
    Top = 21
    Width = 797
    Height = 26
    AutoSize = True
    Bands = <
      item
        Control = ToolBar5
        ImageIndex = -1
        MinHeight = 22
        Width = 793
      end>
    object ToolBar5: TToolBar
      Left = 9
      Top = 0
      Width = 780
      Height = 22
      AutoSize = True
      ButtonWidth = 99
      Caption = 'ToolBar1'
      Ctl3D = True
      EdgeBorders = []
      Flat = True
      Images = ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = EditGood
        AutoSize = True
      end
      object ToolButton5: TToolButton
        Left = 79
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 87
        Top = 0
        Action = ClearLabel
        AutoSize = True
      end
      object ToolButton1: TToolButton
        Left = 190
        Top = 0
        Action = StatInfo
        AutoSize = True
      end
    end
  end
  object Info1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 21
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = #21830#21697#21015#34920
    Color = 13339492
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object GoodsGrid: TDBGrid
    Left = 0
    Top = 47
    Width = 797
    Height = 309
    Align = alClient
    DataSource = d.s_goods
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = GoodsGridDrawColumnCell
    OnDblClick = EditGoodExecute
    OnMouseUp = GoodsGridMouseUp
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
        FieldName = 'GOODTYPE'
        Title.Caption = #21830#21697#31867#22411
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STORAGENUMBER'
        Title.Caption = #24211#23384#37327
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOODNUMBER'
        Title.Caption = #36827#36135#37327
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COST'
        Title.Caption = #25104#26412
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LABELPRICE'
        Title.Caption = #38646#21806#20215
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOWESTPRICE'
        Title.Caption = #26368#20302#20215
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOODCODE'
        Title.Caption = #36135#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LABELPRINTED'
        Title.Caption = #26631#31614#37327
        Width = 45
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 424
    Top = 32
    object ClearLabel: TAction
      Caption = #28165#38500#26631#31614#25171#21360
      ImageIndex = 1
      OnExecute = ClearLabelExecute
    end
    object DelGood: TAction
      Caption = #21024#38500#21830#21697
      ImageIndex = 1
      OnExecute = DelGoodExecute
    end
    object EditGood: TAction
      Caption = #32534#36753#21830#21697
      ImageIndex = 2
      OnExecute = EditGoodExecute
    end
    object SetLabel: TAction
      Caption = #36755#20837#26631#31614#25171#21360#37327
      ImageIndex = 0
      OnExecute = SetLabelExecute
    end
    object SetLabel2: TAction
      Caption = #25353#24211#23384#37327#35774#32622#26631#31614
      ImageIndex = 0
      OnExecute = SetLabel2Execute
    end
    object SetLable3: TAction
      Caption = #25353#36827#36135#37327#35774#32622#26631#31614
      ImageIndex = 0
      OnExecute = SetLable3Execute
    end
    object StatInfo: TAction
      Caption = #32479#35745#20449#24687
      ImageIndex = 7
    end
  end
  object ImageList1: TImageList
    Left = 464
    Top = 32
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000021212100212121002121210021212100000000002121
      2100212121002121210021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004444440000000000000000000000
      0000000000000000000000000000000000002121210021212100E7520000FF6B
      1800212121002121210021212100E7520000FF6B180021212100212121002121
      2100E7520000FF6B180021212100212121000000000000000000000000000000
      00000000000080808000C0C0C000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131009C9C9C00CECECE009C9C9C006363630063636300313131000031
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400444444002222220044444400444444000000
      00000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000000000
      0000C0C0C000FFFFFF00C0C0C000C0C0C0008080800000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00CECECE009C9C9C009C9C9C009C9C9C009C9C9C00636363003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000444444004444440022222200000000003399CC0000000000222222004444
      44004444440000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C0063636300CECECE00313131009C9C9C009C9C9C0000000000003100003131
      3100636363000000000000000000000000000000000000000000444444004444
      44002222220000000000CCFFFF0066CCFF003399CC003399CC0066CCFF000000
      00002222220044444400444444000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE009C9C9C00CECECE009C9C9C00636363006363630000313100636363000000
      0000313131000000000000000000000000000000000000000000000000000000
      0000CCFFFF0066CCFF00CCFFFF0066CCFF003399CC003399CC0066CCFF003399
      CC0066CCFF0000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      00002121210021212100FFB54A00212121000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C00FFFFFF0031313100CECECE00636363006363630063636300003131000031
      0000313131006363630000000000000000000000000000000000CCFFFF0066CC
      FF00CCFFFF0066CCFF00CCFFFF0066CCFF003399CC003399CC0066CCFF003399
      CC0066CCFF003399CC00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A00212121002121
      2100E7520000FFB54A0021212100212121000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00FFFFFF0031313100FFFFFF00636363006363630063636300000000000031
      0000313131000000000000000000000000000000000000000000CCFFFF0066CC
      FF00CCFFFF0066CCFF00CCFFFF0066CCFF003399CC003399CC0066CCFF003399
      CC0066CCFF003399CC00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C009C9C9C009C9C9C00CECECE00636363006363630063636300313131000031
      0000003100000000000000000000000000000000000000000000CCFFFF0066CC
      FF00CCFFFF0066CCFF00CCFFFF003399CC0033CCFF003366990066CCFF003399
      CC0066CCFF003399CC00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B51800002121210021212100FFB54A00212121002121
      2100B5180000E752000021212100212121000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C0063636300FFFFFF00313131009C9C9C009C9C9C0000313100636363000000
      0000636363000000000000000000000000000000000000000000CCFFFF0066CC
      FF00CCFFFF003399CC0033CCFF0033CCFF003366660033CCFF0033CCFF003366
      990066CCFF003399CC00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A002121210021212100FF6B1800FFB54A0021212100212121002121
      2100212121002121210021212100000000000000000000000000000000000000
      0000C0C0C000FFFFFF0000000000808080008080800000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE009C9C9C009C9C9C00CECECE009C9C9C0000313100636363003131
      3100000000000000000000000000000000000000000000000000CCFFFF003399
      CC0033CCFF0033CCFF0033CCFF00444444000066660033CCFF00336666003366
      660033CCFF0033669900000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A00212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000033CCFF003399CC003333330033CCFF0033CCFF003399CC0033CCFF0033CC
      FF0033CCFF0000000000000000000000000021212100B5180000212121002121
      2100FFB54A002121210021212100B5180000E752000021212100212121000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000FFFFFF00C0C0C000808080008080800080808000000000000000
      0000808080000000000000000000000000000000000000000000000000009C9C
      9C00CECECE00FFFFFF00CECECE009C9C9C009C9C9C0063636300313131003131
      3100636363000000000000000000000000000000000000000000000000000000
      0000000000000000000033CCFF00555555005555550033CCFF0033CCFF000000
      0000000000000000000000000000000000002121210021212100FF6B1800FFB5
      4A00212121002121210021212100212121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE00CECECE006363630031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000033CCFF0000000000000000000000
      00000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210021212100B5180000E752
      0000212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCE0
      DD00FCE0DD0000000000000000000000000000000000FCE0DD00FEEFEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F264
      5500F4736600000000000000000000000000FEEFEE00EF352200F47366000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010174000000890000008200000080000000800000008200010138000000
      0000000000000000000000000000000000000000000000000000D4A69900D4A6
      9900D4A69900D4A69900D4A69900D4A69900D19E9700D19E9700D19E9700D19E
      9700D19E97006666660000000000000000000000000000000000000000000000
      0000000000006666660069696900A28A8A004B49490053443F00000000000000
      000000000000000000000000000000000000000000000000000000000000F154
      4400F15444000000000000000000FCE0DD00EF352200EC160000EC1600000000
      0000000000000000000000000000000000000000000000000000000000000000
      8F000000890000008C00000090000000900000008B000000860000007F000000
      8200000000000000000000000000000000000000000000000000FEECDA00FEE5
      CB00FEE5CB00FEE0C300FEDDBB00FEDDBB00FED9B300FED4AB00FED4AB00FFD1
      A300FDD2BF006666660000000000000000000000000000000000000000006666
      6600B8B8B8008F8E8F00B1B1B100917D7D003333330038373700716462004031
      2B0000000000000000000000000000000000F7A299000000000000000000F583
      7700F154440000000000F4736600FCE0DD0000000000F9B1AA00EC1600000000
      000000000000FCE0DD00FCE0DD00000000000000000000000000020291000000
      9500000097000000A2000000A2000000A20000009F000000970000008B000000
      850000008B000000000000000000000000000000000000000000FEECDA00FEE8
      D300FEE5CB00FEE5CB00FEE0C300FEDDBB00FEDDBB00FED9B300FED4AB00FED4
      AB00FDD2BF006666660000000000000000000000000066666600D3D3D300CFCF
      CF0099999900B8B8B800ADADAD00696969005F59580071717100848484009695
      95009887860053443F000000000000000000F2645500F2645500FEEFEE00F692
      8800F154440000000000ED261100F154440000000000FAC1BB00EC1600000000
      0000FEEFEE00F0453300F1544400000000000000000002029E000000A1002727
      AE00FFFFFF000000A5000000AF000202B0000000AC004848BA00FFFFFF000000
      8F00000089000000800000000000000000000000000000000000FEF1E300F5D0
      AD00F3CCA900F3CCA900FEE5CB00FEE0C300FEDDBB00F5C59800F5C59800F5C5
      9800FDD2BF0066666600000000000000000096959500B1B1B100B5B5B500B5B5
      B500ABABAB00BEBEBE00E8E8E800B8B8B8008F8E8F0045484A007C7A7A008F8E
      8F00B2999900D6B0B0008375750000000000FEEFEE00F0453300F2645500F692
      8800F154440000000000F6928800EC160000FCE0DD00FAC1BB00EC160000FEEF
      EE00F0453300EC160000F6928800000000002929BA000202A5000000B300CBCB
      A500FFFFFF00FFFFFF000000AF000000B7004848BA00FFFFF900FFFFFF008585
      AE0000009D000202910001020F00000000000000000000000000FDF4EA00002A
      EA00002AEA00FEE8D300FEE5CB00FEE5CB002A32B8000118B800010996002A24
      8900FDD2BF00666666000000000000000000BCBBBB00B1B1B100B1B1B100E8E8
      E800E8E8E800D9D9DA00C2C2C200A5A5A5008F8E8F0096959500BCBBBB00807F
      7F00574F5000B2959500696060000000000000000000FCE0DD00ED261100EF35
      2200F0453300F2645500FBD0CC00ED26110000000000FAC1BB00EC160000FAC1
      BB00F6928800FCE0DD0000000000000000000505A6000303B6000101C1000000
      B900C1C1A500FFFFFF00FFFFFF005353DB00FFFFF500FFFFFF006B6B95000000
      B9000101AA0000009A0001016D00000000000000000000000000FCF6F000FEF1
      E300002AEA00F5C59800F3CCA900F3CCA900E9C4A7000118B800755A8D00FEDD
      BB00FDD2BF00666666000000000000000000DEDEDE00E8E8E800EFEFF000DEDE
      DE00CFCFCF00BCBBBB009B8F8F0065666B0035749A0071646200D9D9DA00EFEF
      F000F3C9C9009695950000000000000000000000000000000000F6928800EC16
      0000EC160000EF352200FCE0DD000000000000000000F6928800EC1600000000
      0000000000000000000000000000000000000808B5000505C5000606CE000101
      CE000000BD00D6D6BB00FFFFFF00FFFFFF00FFFFFF008585AE000000C5000303
      C1000202B8000202A60002029E00000000000000000000000000FEF9F300FDF4
      EA005562D400002AEA00002AEA00002AEA000024DA000014A700F5C59800FEDD
      BB00FDD2BF006666660000000000000000000000000096959500969595009695
      95005F6E79003D90C7001279BE000D74B5001279BE002776AC00666666006666
      660000000000000000000000000000000000000000000000000000000000EF35
      2200F154440000000000ED261100EC160000F1544400EF352200EC160000F9B1
      AA00FAC1BB00FBD0CC0000000000000000000C0CC2000B0BD2000D0DDC000303
      D5000000D2004648C500FFFFFF00FFFFFF00FFFFF6000000C6000000C9000505
      CA000505C5000303B2000505B900000000000000000000000000FEFDFD00FEF9
      F300FDF4EA00002AEA00F3CCA900F7E6D9000022D100755D9100FEE5CB00FEE0
      C300FDD2BF0066666600000000000000000000000000000000003999E4002289
      E0001F84D7003198E3005BC1F9005EC5FF0053B8FA002B90EF005B483E000000
      000000000000000000000000000000000000F9B1AA00F0453300EC160000ED26
      1100EF352200F9B1AA0000000000FCE0DD00F9B1AA00F6928800F2645500EF35
      2200EC160000EC160000F0453300000000001313CF001515E2001313EB000000
      E0004141CC00FFFFF600FFFFFF00FFFFF300FFFFFF00FFFFFF000000CB000707
      D4000808CF000707BB000505B300000000000000000000000000FEFDFD00FEF9
      F300FEF9F3003349D900EBB48300002AEA000020CB00ECBB9000FEE5CB00FEE5
      CB00FDD2BF0066666600000000000000000000000000000000003999E40063C9
      FF0059C0FF0063C9FF0049AAF9005CC1FF003A9FF1004EB4FF00775040006666
      6600000000000000000000000000000000000000000000000000FEEFEE00F473
      6600ED261100F1544400F5837700000000000000000000000000000000000000
      0000000000000000000000000000000000001919D6001B1BF3001D1DFF004E4E
      E500FFFFF300FFFFFF0076769B000000D400CBCBAB00FFFFFF00FFFFFF000000
      E5000D0DDA000C0CC20006069000000000000000000000000000FEFDFD00FEFD
      FD00FEF9F300FEF9F3001331DC00002DF4004E48A900FEECDA00FEE8D300FEE5
      CB00FDD2BF0066666600000000000000000000000000000000000000000061C2
      FF0044A6F2002F92E80053B8FA00278CE9007795AE003999E40053B8FA00965E
      340066666600000000000000000000000000000000000000000000000000F692
      8800EC1600000000000000000000FAC1BB00F1544400F1544400F5837700F9B1
      AA00FEEFEE000000000000000000000000003434E7002E2EFF002E2EFF00D6D6
      BB00FFFFFF006B6B95000000E9000000E5000000D400BDBD9B00FFFFFD007272
      BF001515E2001313CF005F5F6F00000000000000000000000000FEFDFD00FEFD
      FD00FEFDFD00FEF9F300233EDE00002AEA00ECB88A00FEF1E300FEECDA00FEE8
      D300FDD2BF006666660000000000000000000000000000000000000000000000
      0000000000008C77590045ACFF0053B8FA0099907900D87E2400CE6A0600F2B9
      850066666600000000000000000000000000000000000000000000000000F692
      8800EC160000000000000000000000000000FCE0DD00F6928800F1544400EC16
      0000F2645500000000000000000000000000000000002E2EFF004B4BFF004C4C
      FB006B6B82001212FF000707FD000505F3000C0CFE001B1BF3004E4E97002727
      FF002121EC001010D20000000000000000000000000000000000FEFDFD00FEFD
      FD00FEFDFD00FEFDFD00FEF9F3006562B900FDF4EA00FEF1E300FEECDA00FEE5
      D000FDD2BF006666660000000000000000000000000000000000000000000000
      00000000000000000000DC8D4400F4B87E00EEAA6600E2914100D5781A00C870
      280000000000000000000000000000000000000000000000000000000000F583
      7700EC160000FAC1BB0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004646FF006D6D
      FF008181FF007575FF005656FF004646FF004D4DFF005656FF004949FF003838
      FF002020F6000000000000000000000000000000000000000000FEFDFD00FEFD
      FD00FEFDFD00FEFDFD00FEFDFD00FEF9F300FCF6F000FDF4EA00ECBB9000E795
      3800D98735006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C87B4400DC8736005839
      260000000000000000000000000000000000000000000000000000000000F7A2
      9900F7A299000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004D4D
      FF007E7EFF00A2A2FF00A5A5FF009A9AFF008181FF006868FF004B4BFF002727
      FF00000000000000000000000000000000000000000000000000FEFDFD00FEFD
      FD00FEFDFD00FEFDFD00FEFDFD00FEFDFD00FEF9F300FCF6F000E9C4A700FEB5
      5400666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C87B4400DC87
      3600693D22000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3FFE006464FF008181FF007E7EFF006363FF003F3FFE006E6EF0000000
      0000000000000000000000000000000000000000000000000000FEFDFD00FEFD
      FD00FEFDFD00FEFDFD00FEFDFD00FEFDFD00F7F9FB00F4F3F300EBD3B6006666
      6600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C87B
      4400C87B4400000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF8421F00FF00FFF7F0000
      E007E007FC1F0000E007C003F0070000E007C003C0010000E0078001E0030000
      E0078001C0010000E0078001C0010000E007C003C0010000E007C003C0010001
      E007C003C001001FC003C003E003001FC003C003F80F003FC003C003FE3F03FF
      F81FF81FFFFF03FFFFFFFFFFFFFF87FFE79FFFFFFFFFFFFFE71FF01FC003F83F
      E61FE00FC003E00F6499C007C003800304918003C003000104010001C0030001
      80830001C0030003C19F0001C003800FE4030001C003C01F02010001C003C00F
      C1FF0001C003E007E6070001C003F807E7078003C003FC0FE3FFC007C003FF8F
      E7FFE00FC007FFC7FFFFF01FC00FFFE700000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 376
    Top = 32
    object N5: TMenuItem
      Action = EditGood
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Action = SetLabel
    end
    object N6: TMenuItem
      Action = SetLabel2
    end
    object N7: TMenuItem
      Action = SetLable3
    end
    object N2: TMenuItem
      Action = ClearLabel
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = DelGood
    end
  end
end
