object OrderInfoForm: TOrderInfoForm
  Left = 367
  Top = 114
  BorderStyle = bsDialog
  Caption = #35746#21333#26126#32454
  ClientHeight = 539
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = ProductListKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 60
    Height = 12
    Caption = #35746#21333#32534#21495#65306
  end
  object OrderNo: TLabel
    Left = 96
    Top = 24
    Width = 42
    Height = 12
    Caption = 'OrderNo'
  end
  object Label2: TLabel
    Left = 32
    Top = 48
    Width = 60
    Height = 12
    Caption = #19979#21333#26102#38388#65306
  end
  object OrderTime: TLabel
    Left = 96
    Top = 48
    Width = 54
    Height = 12
    Caption = 'OrderTime'
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 60
    Height = 12
    Caption = #23458#25143#22995#21517#65306
  end
  object Bevel1: TBevel
    Left = 32
    Top = 64
    Width = 665
    Height = 10
    Shape = bsBottomLine
  end
  object Customer: TLabel
    Left = 96
    Top = 88
    Width = 48
    Height = 12
    Caption = 'Customer'
  end
  object Label4: TLabel
    Left = 344
    Top = 88
    Width = 60
    Height = 12
    Caption = #23458#25143#30005#35805#65306
  end
  object Telephone: TLabel
    Left = 408
    Top = 88
    Width = 54
    Height = 12
    Caption = 'Telephone'
  end
  object Label5: TLabel
    Left = 344
    Top = 24
    Width = 60
    Height = 12
    Caption = #35746#21333#29366#24577#65306
  end
  object Status: TLabel
    Left = 408
    Top = 24
    Width = 36
    Height = 12
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #26032#23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 32
    Top = 112
    Width = 60
    Height = 12
    Caption = #37197#36865#22320#22336#65306
  end
  object Address: TLabel
    Left = 96
    Top = 112
    Width = 42
    Height = 12
    Caption = 'Address'
  end
  object Label7: TLabel
    Left = 32
    Top = 136
    Width = 60
    Height = 12
    Caption = #37197#36865#26102#38388#65306
  end
  object ShippingTime: TLabel
    Left = 96
    Top = 136
    Width = 72
    Height = 12
    Caption = 'ShippingTime'
  end
  object Bevel3: TBevel
    Left = 32
    Top = 208
    Width = 665
    Height = 10
    Shape = bsBottomLine
  end
  object Bevel2: TBevel
    Left = 32
    Top = 424
    Width = 665
    Height = 10
    Shape = bsBottomLine
  end
  object Label8: TLabel
    Left = 32
    Top = 400
    Width = 396
    Height = 12
    Caption = #25552#31034#65306#40736#26631#21452#20987#20135#21697#36755#20837#37325#37327#12290#22914#26524#20351#29992#26465#30721#31216#65292#30452#25509#25195#25551#26465#30721#26631#31614#21363#21487#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = #26032#23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 32
    Top = 232
    Width = 60
    Height = 12
    Caption = #35746#21333#20272#35745#65306
  end
  object Total: TLabel
    Left = 96
    Top = 228
    Width = 45
    Height = 16
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #26032#23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 208
    Top = 232
    Width = 84
    Height = 12
    Caption = #23454#38469#24212#20184#21512#35745#65306
  end
  object RealTotal: TLabel
    Left = 296
    Top = 228
    Width = 81
    Height = 16
    Caption = 'RealTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #26032#23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 344
    Top = 136
    Width = 60
    Height = 12
    Caption = #25910#36135#30005#35805#65306
  end
  object ShippingPhone: TLabel
    Left = 408
    Top = 136
    Width = 78
    Height = 12
    Caption = 'ShippingPhone'
  end
  object Label12: TLabel
    Left = 32
    Top = 160
    Width = 60
    Height = 12
    Caption = #23458#25143#30041#35328#65306
  end
  object Comment: TLabel
    Left = 96
    Top = 160
    Width = 577
    Height = 41
    AutoSize = False
    Caption = 'Comment'
    WordWrap = True
  end
  object Label13: TLabel
    Left = 568
    Top = 232
    Width = 60
    Height = 12
    Caption = #37319#36141#25903#20986#65306
  end
  object CostPayLabel: TLabel
    Left = 626
    Top = 232
    Width = 72
    Height = 12
    Caption = 'CostPayLabel'
  end
  object Label15: TLabel
    Left = 416
    Top = 232
    Width = 60
    Height = 12
    Caption = #21040#20184#37329#39069#65306
  end
  object CashPayLabel: TLabel
    Left = 474
    Top = 232
    Width = 72
    Height = 12
    Caption = 'CashPayLabel'
  end
  object StoreSelect: TComboBox
    Left = 32
    Top = 448
    Width = 153
    Height = 27
    Style = csOwnerDrawFixed
    ItemHeight = 21
    TabOrder = 1
  end
  object ProductList: TListView
    Left = 32
    Top = 248
    Width = 665
    Height = 145
    Columns = <
      item
        Caption = #21830#21697#21517
        Width = 100
      end
      item
        Caption = #21333#20215
        Width = 80
      end
      item
        Caption = #25968#37327
      end
      item
        Caption = #27599#20221#20272#37325
        Width = 80
      end
      item
        Caption = #39044#20272#24635#37325
        Width = 80
      end
      item
        Caption = #39044#20272#24635#20215
        Width = 80
      end
      item
        Caption = #31216#21518#37325#37327
        Width = 80
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
    Left = 200
    Top = 448
    Width = 113
    Height = 65
    Caption = #37197#36865#23436#25104#30830#35748
    TabOrder = 2
  end
  object ChangeStoreBtn: TButton
    Left = 32
    Top = 480
    Width = 153
    Height = 33
    Caption = #35746#21333#36716#32473#20854#23427#37197#36865#28857
    TabOrder = 3
  end
  object Cancel: TButton
    Left = 608
    Top = 448
    Width = 89
    Height = 65
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 4
  end
  object PrintBtn: TButton
    Left = 416
    Top = 448
    Width = 89
    Height = 25
    Caption = #25171#21360#23567#31080
    TabOrder = 5
    OnClick = PrintBtnClick
  end
  object ChangeStatus: TButton
    Left = 320
    Top = 448
    Width = 89
    Height = 25
    Caption = #25913#35746#21333#29366#24577
    TabOrder = 6
    OnClick = ChangeStatusClick
  end
  object CostPayBtn: TButton
    Left = 512
    Top = 448
    Width = 89
    Height = 25
    Caption = #37319#36141#25903#20986
    TabOrder = 7
    OnClick = CostPayBtnClick
  end
  object CashPayBtn: TButton
    Left = 512
    Top = 488
    Width = 89
    Height = 25
    Caption = #21040#20184#37329#39069
    TabOrder = 8
    OnClick = CashPayBtnClick
  end
  object SendAlert: TButton
    Left = 320
    Top = 488
    Width = 89
    Height = 25
    Caption = #21457#36865#20184#27454#25552#37266
    TabOrder = 9
    OnClick = SendAlertClick
  end
  object PayQueryBtn: TButton
    Left = 416
    Top = 488
    Width = 89
    Height = 25
    Caption = #25903#20184#26597#35810
    TabOrder = 10
    OnClick = PayQueryBtnClick
  end
  object SatusPopup: TPopupMenu
    Left = 464
    Top = 400
    object OrderWaiting: TMenuItem
      Caption = #24453#31216#37325
      OnClick = OrderWaitingClick
    end
    object OrderScaled: TMenuItem
      Caption = #24453#20184#27454
      OnClick = OrderScaledClick
    end
    object CashPay: TMenuItem
      Caption = #36135#21040#20184#27454
      OnClick = CashPayClick
    end
    object WeixinPay: TMenuItem
      Caption = #24453#37197#36865#65288#24494#20449#25903#20184#65289
      OnClick = WeixinPayClick
    end
    object CancelOrder: TMenuItem
      Caption = #21462#28040#35746#21333
      OnClick = CancelOrderClick
    end
    object OrderRefund: TMenuItem
      Caption = #24050#36864#27454
      OnClick = OrderRefundClick
    end
    object OrderComplete: TMenuItem
      Caption = #24050#23436#25104
      OnClick = OrderCompleteClick
    end
  end
end
