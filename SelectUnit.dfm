object SelectForm: TSelectForm
  Left = 433
  Top = 225
  BorderStyle = bsNone
  Caption = 'SelectForm'
  ClientHeight = 245
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GoodsList: TListView
    Left = 0
    Top = 0
    Width = 516
    Height = 245
    Align = alClient
    Columns = <
      item
        Caption = #26465#30721
        Width = 90
      end
      item
        Caption = #21697#21517
        Width = 120
      end
      item
        Caption = #24211#23384#25968#37327
        Width = 60
      end
      item
        Caption = #38646#21806#20215
        Width = 80
      end
      item
        Caption = #36135#21495
        Width = 80
      end>
    Ctl3D = False
    FlatScrollBars = True
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnColumnClick = GoodsListColumnClick
    OnCompare = GoodsListCompare
    OnDblClick = GoodsListDblClick
    OnKeyPress = GoodsListKeyPress
  end
end
