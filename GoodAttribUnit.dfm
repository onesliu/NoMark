object GoodAttribForm: TGoodAttribForm
  Left = 1038
  Top = 164
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #21830#21697#23646#24615#35774#32622
  ClientHeight = 306
  ClientWidth = 408
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
    Width = 408
    Height = 271
    ActivePage = GoodAttrib
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object GoodAttrib: TTabSheet
      Caption = #21830#21697#23646#24615#35774#32622
      object Label8: TLabel
        Left = 36
        Top = 79
        Width = 24
        Height = 12
        Caption = #36135#21495
      end
      object Label10: TLabel
        Left = 24
        Top = 123
        Width = 36
        Height = 12
        Caption = #25104#26412#20215
      end
      object Label12: TLabel
        Left = 36
        Top = 57
        Width = 24
        Height = 12
        Caption = #26465#30721
      end
      object Label13: TLabel
        Left = 36
        Top = 145
        Width = 24
        Height = 12
        Caption = #26631#20215
      end
      object Label15: TLabel
        Left = 36
        Top = 13
        Width = 24
        Height = 12
        Caption = #21517#31216
      end
      object Label1: TLabel
        Left = 36
        Top = 189
        Width = 24
        Height = 12
        Caption = #25551#36848
      end
      object Label2: TLabel
        Left = 36
        Top = 35
        Width = 24
        Height = 12
        Caption = #20998#31867
      end
      object Label3: TLabel
        Left = 36
        Top = 101
        Width = 24
        Height = 12
        Caption = #25968#37327
      end
      object Label4: TLabel
        Left = 24
        Top = 167
        Width = 36
        Height = 12
        Caption = #26368#20302#20215
      end
      object Label5: TLabel
        Left = 36
        Top = 211
        Width = 24
        Height = 12
        Caption = #31867#22411
      end
      object GoodsName: TEdit
        Left = 69
        Top = 9
        Width = 196
        Height = 20
        MaxLength = 255
        TabOrder = 0
        Text = 'GoodsName'
      end
      object GoodsCode: TEdit
        Left = 69
        Top = 75
        Width = 196
        Height = 20
        Color = clSilver
        MaxLength = 255
        ReadOnly = True
        TabOrder = 1
        Text = 'GoodsCode'
      end
      object GoodsCost: TEdit
        Left = 69
        Top = 119
        Width = 89
        Height = 20
        Color = clSilver
        ReadOnly = True
        TabOrder = 3
        Text = 'GoodsCost'
      end
      object GoodsBarcode: TEdit
        Left = 69
        Top = 53
        Width = 89
        Height = 20
        Color = clSilver
        MaxLength = 13
        ReadOnly = True
        TabOrder = 2
        Text = 'GoodsBarcode'
      end
      object GoodsSellPrice: TEdit
        Left = 69
        Top = 141
        Width = 89
        Height = 20
        Color = clSilver
        ReadOnly = True
        TabOrder = 4
        Text = 'GoodsSellPrice'
      end
      object GoodsType: TComboBox
        Left = 69
        Top = 207
        Width = 105
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        ItemIndex = 1
        TabOrder = 5
        Text = #20808#31216#37325#21518#20184#27454
        Items.Strings = (
          #30452#25509#20184#27454
          #20808#31216#37325#21518#20184#27454
          #20808#20184#27454#21518#31216#37325)
      end
      object GoodsDesp: TEdit
        Left = 69
        Top = 185
        Width = 313
        Height = 20
        TabOrder = 6
        Text = 'GoodsDesp'
      end
      object GoodsAttr: TEdit
        Left = 69
        Top = 31
        Width = 89
        Height = 20
        Color = clSilver
        ReadOnly = True
        TabOrder = 7
        Text = 'GoodsAttr'
      end
      object GoodsNumber: TEdit
        Left = 69
        Top = 97
        Width = 89
        Height = 20
        Color = clSilver
        ReadOnly = True
        TabOrder = 8
        Text = 'GoodsNumber'
      end
      object GoodsLowestPrice: TEdit
        Left = 69
        Top = 163
        Width = 89
        Height = 20
        Color = clSilver
        TabOrder = 9
        Text = 'GoodsLowestPrice'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 408
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Ok: TButton
      Left = 105
      Top = 7
      Width = 75
      Height = 22
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = OkClick
    end
    object Cancel: TButton
      Left = 193
      Top = 7
      Width = 75
      Height = 22
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
end
