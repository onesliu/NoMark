object DetailForm: TDetailForm
  Left = 359
  Top = 252
  BorderStyle = bsDialog
  Caption = #25910#25903#26126#32454#32534#36753
  ClientHeight = 205
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 48
    Height = 12
    Caption = #25910#25903#31867#22411
  end
  object Inout: TComboBox
    Left = 32
    Top = 31
    Width = 177
    Height = 20
    Style = csDropDownList
    ItemHeight = 12
    TabOrder = 0
    Items.Strings = (
      #25910#20837
      #25903#20986)
  end
  object Usage: TLabeledEdit
    Left = 32
    Top = 80
    Width = 177
    Height = 20
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #29992#36884
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 1
    OnKeyPress = UsageKeyPress
  end
  object Cost: TLabeledEdit
    Left = 32
    Top = 128
    Width = 177
    Height = 20
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #37329#39069
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
    OnKeyPress = CostKeyPress
  end
  object Ok: TButton
    Left = 72
    Top = 168
    Width = 97
    Height = 22
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = OkClick
  end
end
