object Form1: TForm1
  Left = 251
  Top = 189
  Width = 696
  Height = 480
  Caption = 'hou'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object EditSend: TEdit
    Left = 296
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Send: TButton
    Left = 432
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 1
    OnClick = SendClick
  end
  object OpenPort: TButton
    Left = 184
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Open Port'
    TabOrder = 2
    OnClick = OpenPortClick
  end
  object EditRcv: TEdit
    Left = 296
    Top = 184
    Width = 121
    Height = 129
    TabOrder = 3
  end
end
