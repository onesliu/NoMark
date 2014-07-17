object CheckForm: TCheckForm
  Left = 344
  Top = 91
  Width = 660
  Height = 598
  BorderWidth = 5
  Caption = #30424#28857#36807#31243
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 176
    Top = 64
    Width = 54
    Height = 12
    Caption = #24453#36873#21015#34920':'
  end
  object Label2: TLabel
    Left = 16
    Top = 296
    Width = 78
    Height = 12
    Caption = #25439#28322#24211#23384#21015#34920':'
  end
  object Label4: TLabel
    Left = 16
    Top = 160
    Width = 78
    Height = 12
    Caption = #24453#30424#24211#23384#21015#34920':'
  end
  object TotalDiff: TLabel
    Left = 192
    Top = 296
    Width = 54
    Height = 12
    Caption = 'TotalDiff'
  end
  object Label3: TLabel
    Left = 144
    Top = 296
    Width = 42
    Height = 12
    Caption = #24635#24046#39069':'
  end
  object title: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = #30424#28857#21333
    Color = 13339492
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -33
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BarCode: TLabeledEdit
    Left = 16
    Top = 83
    Width = 145
    Height = 18
    Ctl3D = False
    EditLabel.Width = 60
    EditLabel.Height = 12
    EditLabel.Caption = #26465#30721'/'#21517#31216':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ParentCtl3D = False
    TabOrder = 1
    OnKeyPress = BarCodeKeyPress
  end
  object Number: TLabeledEdit
    Left = 16
    Top = 131
    Width = 145
    Height = 18
    Ctl3D = False
    EditLabel.Width = 54
    EditLabel.Height = 12
    EditLabel.Caption = #30424#28857#25968#37327':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ParentCtl3D = False
    TabOrder = 2
    OnKeyPress = NumberKeyPress
  end
  object DiffGrid: TDBGrid
    Left = 16
    Top = 312
    Width = 609
    Height = 169
    Ctl3D = False
    DataSource = d.CheckDiffSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BARCODE'
        Title.Caption = #26465#30721
        Width = 120
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
        FieldName = 'STORAGENUMBER'
        Title.Caption = #24211#23384#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER'
        Title.Caption = #30424#28857#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COST'
        Title.Caption = #21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALCOST'
        Title.Caption = #24635#24046#20215
        Visible = True
      end>
  end
  object NoneGrid: TDBGrid
    Left = 16
    Top = 176
    Width = 609
    Height = 113
    Ctl3D = False
    DataSource = d.CheckNoneSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BARCODE'
        Title.Caption = #26465#30721
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #21697#21517
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STORAGENUMBER'
        Title.Caption = #24211#23384#37327
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER'
        Title.Caption = #30424#28857#25968
        Width = 100
        Visible = True
      end>
  end
  object Ok: TButton
    Left = 472
    Top = 488
    Width = 153
    Height = 22
    Caption = #30424#28857#36755#20837#26410#23436','#20020#26102#36864#20986
    TabOrder = 5
    OnClick = OkClick
  end
  object Commit: TButton
    Left = 472
    Top = 515
    Width = 153
    Height = 22
    Caption = '3.'#20840#37096#23436#25104','#20445#23384#36864#20986
    TabOrder = 6
    OnClick = CommitClick
  end
  object SelectGrid: TDBGrid
    Left = 176
    Top = 80
    Width = 449
    Height = 73
    Ctl3D = False
    DataSource = CheckSelectSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyPress = SelectGridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'BARCODE'
        Title.Caption = #26465#30721
        Width = 120
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
        FieldName = 'STORAGENUMBER'
        Title.Caption = #24211#23384#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER'
        Title.Caption = #30424#28857#25968
        Visible = True
      end>
  end
  object Adjust: TButton
    Left = 264
    Top = 515
    Width = 193
    Height = 22
    Caption = '2.'#30424#28857#36755#20837#23436#25104','#35843#25972#25439#28322#24211#23384
    TabOrder = 8
    OnClick = AdjustClick
  end
  object AddZero: TButton
    Left = 16
    Top = 515
    Width = 233
    Height = 22
    Caption = '1.'#21152#20837#25152#26377#26410#30424#28857#21830#21697#21040#25439#28322#21015#34920
    TabOrder = 9
    OnClick = AddZeroClick
  end
  object Button1: TButton
    Left = 17
    Top = 488
    Width = 150
    Height = 22
    Caption = #37325#26032#24320#22987','#28165#38500#30424#28857#35760#24405
    TabOrder = 10
    OnClick = Button1Click
  end
  object ImageList1: TImageList
    Left = 464
    Top = 16
  end
  object CheckSelectSource: TDataSource
    DataSet = d.CheckSelectSet
    OnDataChange = CheckSelectSourceDataChange
    Left = 304
    Top = 112
  end
end
