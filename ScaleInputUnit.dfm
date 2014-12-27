object ScaleInputForm: TScaleInputForm
  Left = 466
  Top = 337
  BorderStyle = bsDialog
  Caption = #31216#37325#36755#20837
  ClientHeight = 222
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 272
    Height = 16
    Caption = #36755#20837#31216#37325#21518#30340#20215#26684#65292#25110#37325#37327#65288#20844#26020#65289#65306
  end
  object Label2: TLabel
    Left = 40
    Top = 115
    Width = 48
    Height = 16
    Caption = #37325#37327#65306
  end
  object Label3: TLabel
    Left = 40
    Top = 67
    Width = 48
    Height = 16
    Caption = #20215#26684#65306
  end
  object ScaleWeight: TEdit
    Left = 88
    Top = 112
    Width = 217
    Height = 24
    TabOrder = 1
    Text = 'ScaleWeight'
    OnChange = ScaleWeightChange
    OnKeyPress = ScalePriceKeyPress
  end
  object OkBtn: TButton
    Left = 88
    Top = 168
    Width = 97
    Height = 33
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object ScalePrice: TEdit
    Left = 88
    Top = 64
    Width = 217
    Height = 24
    TabOrder = 0
    Text = 'ScalePrice'
    OnChange = ScalePriceChange
    OnKeyPress = ScalePriceKeyPress
  end
  object Button2: TButton
    Left = 200
    Top = 168
    Width = 97
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
