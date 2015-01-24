object OrderFrame: TOrderFrame
  Left = 0
  Top = 0
  Width = 1151
  Height = 270
  Align = alClient
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object OrderListView: TListView
    Left = 0
    Top = 0
    Width = 1151
    Height = 270
    Align = alClient
    Columns = <
      item
        Caption = #19979#21333#26102#38388
        Width = 170
      end
      item
        Caption = #19979#21333#21830#21697
        Width = 200
      end
      item
        Caption = #24635#20215'/'#39044#20272#24635#20215
        Width = 100
      end
      item
        Caption = #29366#24577
        Width = 90
      end
      item
        Caption = #23458#25143#22995#21517
        Width = 100
      end
      item
        Caption = #25910#36135#30005#35805
        Width = 120
      end
      item
        Caption = #37197#36865#26102#38388
        Width = 170
      end
      item
        Caption = #37197#36865#22320#22336
        Width = 100
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = OrderListViewDblClick
    OnKeyPress = OrderListViewKeyPress
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 208
    Top = 56
    object CancelOrder: TMenuItem
      Caption = #21462#28040#35746#21333
      OnClick = CancelOrderClick
    end
    object RefundOrder: TMenuItem
      Caption = #35746#21333#36864#27454
    end
  end
end
