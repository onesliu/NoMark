object PasswordVerify: TPasswordVerify
  Left = 622
  Top = 312
  Width = 346
  Height = 169
  Caption = #23494#30721#39564#35777
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
    Left = 16
    Top = 8
    Width = 96
    Height = 21
    Caption = #30830#23450#35201#32467#31639#65311
  end
  object ConfirmResult: TLabel
    Left = 16
    Top = 96
    Width = 209
    Height = 21
  end
  object BtnConfirm: TButton
    Left = 232
    Top = 56
    Width = 97
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = BtnConfirmClick
  end
  object EditPwd: TLabeledEdit
    Left = 16
    Top = 56
    Width = 209
    Height = 29
    EditLabel.Width = 224
    EditLabel.Height = 21
    EditLabel.Caption = #35831#22312#19979#26041#36755#20837#23494#30721#24182#28857#20987#30830#23450#65306
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
  end
end
