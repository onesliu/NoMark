object GoodAttribForm: TGoodAttribForm
  Left = 486
  Top = 182
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #21830#21697#23646#24615#35774#32622
  ClientHeight = 222
  ClientWidth = 468
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 468
    Height = 187
    ActivePage = GoodAttrib
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object GoodAttrib: TTabSheet
      Caption = #21830#21697#23646#24615#35774#32622
      object Label8: TLabel
        Left = 16
        Top = 59
        Width = 24
        Height = 12
        Caption = #36135#21495
      end
      object Label10: TLabel
        Left = 16
        Top = 107
        Width = 36
        Height = 12
        Caption = #25104#26412#20215
      end
      object Label11: TLabel
        Left = 352
        Top = 59
        Width = 48
        Height = 12
        Caption = #36827#36135#25968#37327
      end
      object Label12: TLabel
        Left = 240
        Top = 59
        Width = 24
        Height = 12
        Caption = #26465#30721
      end
      object Label13: TLabel
        Left = 128
        Top = 108
        Width = 24
        Height = 12
        Caption = #26631#20215
      end
      object Label14: TLabel
        Left = 240
        Top = 108
        Width = 36
        Height = 12
        Caption = #26368#20302#20215
      end
      object Label15: TLabel
        Left = 16
        Top = 11
        Width = 24
        Height = 12
        Caption = #21697#21517
      end
      object Label16: TLabel
        Left = 352
        Top = 107
        Width = 48
        Height = 12
        Caption = #24211#23384#25968#37327
      end
      object GoodName: TEdit
        Left = 16
        Top = 27
        Width = 425
        Height = 20
        MaxLength = 255
        TabOrder = 0
        Text = 'GoodName'
      end
      object GoodCode: TEdit
        Left = 16
        Top = 75
        Width = 201
        Height = 20
        MaxLength = 255
        TabOrder = 1
        Text = 'GoodCode'
      end
      object Cost: TEdit
        Left = 16
        Top = 123
        Width = 89
        Height = 20
        TabOrder = 4
        Text = 'Cost'
      end
      object GoodNumber: TEdit
        Left = 352
        Top = 75
        Width = 89
        Height = 20
        MaxLength = 5
        TabOrder = 3
        Text = 'GoodNumber'
      end
      object BarCode: TEdit
        Left = 240
        Top = 75
        Width = 89
        Height = 20
        MaxLength = 13
        ReadOnly = True
        TabOrder = 2
        Text = 'BarCode'
      end
      object SellPrice: TEdit
        Left = 128
        Top = 123
        Width = 89
        Height = 20
        TabOrder = 5
        Text = 'SellPrice'
      end
      object LowestPrice: TEdit
        Left = 240
        Top = 123
        Width = 89
        Height = 20
        TabOrder = 6
        Text = 'LowestPrice'
      end
      object StorageNumber: TEdit
        Left = 352
        Top = 123
        Width = 89
        Height = 20
        MaxLength = 5
        TabOrder = 7
        Text = 'StorageNumber'
        OnChange = StorageNumberChange
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 187
    Width = 468
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Ok: TButton
      Left = 153
      Top = 7
      Width = 75
      Height = 22
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = OkClick
    end
    object Cancel: TButton
      Left = 241
      Top = 7
      Width = 75
      Height = 22
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
end
