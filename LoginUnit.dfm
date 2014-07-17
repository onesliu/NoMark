object LoginForm: TLoginForm
  Left = 293
  Top = 257
  BorderStyle = bsDialog
  Caption = 'LoginForm'
  ClientHeight = 177
  ClientWidth = 285
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
  object NameLabel: TLabel
    Left = 50
    Top = 16
    Width = 54
    Height = 12
    Caption = 'NameLabel'
  end
  object Password: TLabeledEdit
    Left = 50
    Top = 88
    Width = 185
    Height = 20
    EditLabel.Width = 48
    EditLabel.Height = 12
    EditLabel.Caption = 'Password'
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 0
  end
  object Ok: TButton
    Left = 61
    Top = 132
    Width = 75
    Height = 22
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = OkClick
  end
  object Cancel: TButton
    Left = 149
    Top = 132
    Width = 75
    Height = 22
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Name: TComboBox
    Left = 50
    Top = 32
    Width = 185
    Height = 20
    Style = csDropDownList
    ItemHeight = 12
    TabOrder = 3
  end
end
