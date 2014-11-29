object OrderInfoForm: TOrderInfoForm
  Left = 420
  Top = 51
  BorderStyle = bsDialog
  Caption = #35746#21333#26126#32454
  ClientHeight = 646
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 80
    Height = 21
    Caption = #35746#21333#32534#21495#65306
  end
  object OrderNo: TLabel
    Left = 120
    Top = 24
    Width = 67
    Height = 21
    Caption = 'OrderNo'
  end
  object Label2: TLabel
    Left = 32
    Top = 56
    Width = 80
    Height = 21
    Caption = #19979#21333#26102#38388#65306
  end
  object OrderTime: TLabel
    Left = 120
    Top = 56
    Width = 81
    Height = 21
    Caption = 'OrderTime'
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 80
    Height = 21
    Caption = #23458#25143#22995#21517#65306
  end
  object Bevel1: TBevel
    Left = 32
    Top = 88
    Width = 665
    Height = 10
    Shape = bsBottomLine
  end
  object Customer: TLabel
    Left = 120
    Top = 112
    Width = 74
    Height = 21
    Caption = 'Customer'
  end
  object Label4: TLabel
    Left = 344
    Top = 112
    Width = 80
    Height = 21
    Caption = #23458#25143#30005#35805#65306
  end
  object Telephone: TLabel
    Left = 424
    Top = 112
    Width = 80
    Height = 21
    Caption = 'Telephone'
  end
  object Label5: TLabel
    Left = 344
    Top = 24
    Width = 80
    Height = 21
    Caption = #35746#21333#29366#24577#65306
  end
  object Status: TLabel
    Left = 432
    Top = 24
    Width = 47
    Height = 21
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 32
    Top = 144
    Width = 80
    Height = 21
    Caption = #37197#36865#22320#22336#65306
  end
  object Address: TLabel
    Left = 120
    Top = 144
    Width = 60
    Height = 21
    Caption = 'Address'
  end
  object Label7: TLabel
    Left = 32
    Top = 176
    Width = 80
    Height = 21
    Caption = #37197#36865#26102#38388#65306
  end
  object ShippingTime: TLabel
    Left = 120
    Top = 176
    Width = 104
    Height = 21
    Caption = 'ShippingTime'
  end
  object Bevel3: TBevel
    Left = 32
    Top = 264
    Width = 665
    Height = 10
    Shape = bsBottomLine
  end
  object Bevel2: TBevel
    Left = 32
    Top = 536
    Width = 665
    Height = 10
    Shape = bsBottomLine
  end
  object Label8: TLabel
    Left = 32
    Top = 512
    Width = 396
    Height = 17
    Caption = #25552#31034#65306#40736#26631#21452#20987#20135#21697#36755#20837#37325#37327#12290#22914#26524#20351#29992#26465#30721#31216#65292#30452#25509#25195#25551#26465#30721#26631#31614#21363#21487#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 32
    Top = 288
    Width = 80
    Height = 21
    Caption = #35746#21333#20272#35745#65306
  end
  object Total: TLabel
    Left = 120
    Top = 288
    Width = 38
    Height = 21
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 344
    Top = 288
    Width = 112
    Height = 21
    Caption = #23454#38469#24212#20184#21512#35745#65306
  end
  object RealTotal: TLabel
    Left = 464
    Top = 288
    Width = 70
    Height = 21
    Caption = 'RealTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 344
    Top = 176
    Width = 80
    Height = 21
    Caption = #25910#36135#30005#35805#65306
  end
  object ShippingPhone: TLabel
    Left = 424
    Top = 176
    Width = 116
    Height = 21
    Caption = 'ShippingPhone'
  end
  object Label12: TLabel
    Left = 32
    Top = 208
    Width = 80
    Height = 21
    Caption = #23458#25143#30041#35328#65306
  end
  object Comment: TLabel
    Left = 120
    Top = 208
    Width = 577
    Height = 57
    AutoSize = False
    Caption = 'Comment'
    WordWrap = True
  end
  object StoreSelect: TComboBox
    Left = 280
    Top = 560
    Width = 233
    Height = 29
    ItemHeight = 21
    TabOrder = 1
    Text = 'StoreSelect'
  end
  object ProductList: TListView
    Left = 32
    Top = 320
    Width = 665
    Height = 185
    Columns = <
      item
        Caption = #21830#21697#21517
        Width = 150
      end
      item
        Caption = #21333#20215
        Width = 80
      end
      item
        Caption = #35746#36141#25968#37327
        Width = 100
      end
      item
        Caption = #35746#36141#37325#37327
        Width = 100
      end
      item
        Caption = #31216#21518#37325#37327
        Width = 100
      end
      item
        Caption = #23454#38469#24212#20184
        Width = 100
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ProductListDblClick
    OnKeyPress = ProductListKeyPress
  end
  object ConfirmBtn: TButton
    Left = 32
    Top = 560
    Width = 169
    Height = 65
    Caption = #37197#36865#23436#25104#30830#35748
    TabOrder = 2
  end
  object ChangeStoreBtn: TButton
    Left = 280
    Top = 592
    Width = 233
    Height = 33
    Caption = #35746#21333#36716#32473#20854#23427#37197#36865#28857
    TabOrder = 3
  end
  object Cancel: TButton
    Left = 592
    Top = 560
    Width = 105
    Height = 65
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 4
  end
end
