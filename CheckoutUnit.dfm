object CheckoutForm: TCheckoutForm
  Left = 310
  Top = 130
  Width = 468
  Height = 344
  Caption = #19978#32593#32467#31639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 32
    Top = 88
    Width = 144
    Height = 21
    Caption = #26399#38388#20869#26410#32467#31639#37329#39069#65306
  end
  object Label2: TLabel
    Left = 32
    Top = 152
    Width = 80
    Height = 21
    Caption = #38144#21806#37325#37327#65306
    Visible = False
  end
  object LabelBalanceWeight: TLabel
    Left = 184
    Top = 152
    Width = 48
    Height = 21
    Caption = #37325#37327#20540
    Visible = False
  end
  object LabelBalanceMoney: TLabel
    Left = 184
    Top = 88
    Width = 5
    Height = 21
  end
  object Label3: TLabel
    Left = 32
    Top = 184
    Width = 80
    Height = 21
    Caption = #38144#21806#31181#31867#65306
    Visible = False
  end
  object Label4: TLabel
    Left = 32
    Top = 56
    Width = 112
    Height = 21
    Caption = #26412#27425#32467#31639#26085#26399#65306
  end
  object LabelBalanceDateCurr: TLabel
    Left = 184
    Top = 56
    Width = 5
    Height = 21
  end
  object Label6: TLabel
    Left = 32
    Top = 120
    Width = 144
    Height = 21
    Caption = #26399#38388#20869#23436#25104#35746#21333#25968#65306
  end
  object LabelBalanceOrderNumber: TLabel
    Left = 184
    Top = 120
    Width = 5
    Height = 21
  end
  object LabelBalanceKinds: TLabel
    Left = 184
    Top = 184
    Width = 48
    Height = 21
    Caption = #31181#31867#20540
    Visible = False
  end
  object BalanceResult: TLabel
    Left = 184
    Top = 232
    Width = 5
    Height = 21
  end
  object Label5: TLabel
    Left = 32
    Top = 24
    Width = 112
    Height = 21
    Caption = #19978#27425#32467#31639#26085#26399#65306
  end
  object LabelBalanceDateLast: TLabel
    Left = 184
    Top = 24
    Width = 5
    Height = 21
  end
  object BtnBalance: TButton
    Left = 32
    Top = 224
    Width = 121
    Height = 49
    Caption = #32467#31639
    Default = True
    TabOrder = 0
    OnClick = BtnBalanceClick
  end
end
