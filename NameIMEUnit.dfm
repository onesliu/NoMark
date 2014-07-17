object NameIME: TNameIME
  Left = 290
  Top = 315
  BorderStyle = bsNone
  Caption = 'NameIME'
  ClientHeight = 192
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 192
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Color = clSilver
    TabOrder = 0
    object InputArea: TPanel
      Left = 4
      Top = 4
      Width = 492
      Height = 21
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvNone
      Caption = 'InputArea'
      Color = clSilver
      TabOrder = 0
    end
    object OutputArea: TListBox
      Left = 4
      Top = 25
      Width = 492
      Height = 163
      Style = lbOwnerDrawFixed
      Align = alClient
      BevelInner = bvSpace
      BevelKind = bkFlat
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clSilver
      Enabled = False
      ExtendedSelect = False
      ItemHeight = 16
      Items.Strings = (
        '1.'#24352#23398#21451
        '2.'#29579#33778
        '3.'#20320#22909
        '4.'#20182#22909
        '5.'#25105#22909
        '6.'#22909#19981#22909
        '7.'#19981#22909
        '8.'#22909#22909
        '9.'#38590#22909
        '0.'#22909#20010#23617)
      TabOrder = 1
    end
  end
end
