object CheckoutForm: TCheckoutForm
  Left = 362
  Top = 249
  BorderStyle = bsDialog
  Caption = #19978#32593#32467#31639
  ClientHeight = 282
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 72
    Top = 88
    Width = 96
    Height = 16
    Caption = #24453#32467#31639#37329#39069#65306
  end
  object Label2: TLabel
    Left = 32
    Top = 224
    Width = 368
    Height = 16
    Caption = #27880#65306#22914#38656#26597#30475#35746#21333#35814#24773#65292#35831#20351#29992#8220#35746#21333#26597#35810#8221#21151#33021#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -16
    Font.Name = #26032#23435#20307
    Font.Style = []
    ParentFont = False
  end
  object LabelBalanceMoney: TLabel
    Left = 184
    Top = 88
    Width = 5
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 88
    Top = 56
    Width = 80
    Height = 16
    Caption = #24403#21069#26102#38388#65306
  end
  object LabelBalanceDateCurr: TLabel
    Left = 184
    Top = 56
    Width = 8
    Height = 16
  end
  object Label6: TLabel
    Left = 56
    Top = 120
    Width = 112
    Height = 16
    Caption = #24453#32467#31639#35746#21333#25968#65306
  end
  object LabelBalanceOrderNumber: TLabel
    Left = 184
    Top = 120
    Width = 8
    Height = 16
  end
  object Label5: TLabel
    Left = 56
    Top = 24
    Width = 112
    Height = 16
    Caption = #19978#27425#32467#31639#26102#38388#65306
  end
  object LabelBalanceDateLast: TLabel
    Left = 184
    Top = 24
    Width = 8
    Height = 16
  end
  object BtnBalance: TButton
    Left = 32
    Top = 160
    Width = 289
    Height = 49
    Caption = #25910#21040#26412#20844#21496#30340#24080#27454#21518#65292#35831#28857#20987#27492#22788
    TabOrder = 1
    OnClick = BtnBalanceClick
  end
  object Button1: TButton
    Left = 336
    Top = 160
    Width = 89
    Height = 49
    Caption = #21462#28040
    Default = True
    ModalResult = 2
    TabOrder = 0
  end
end
