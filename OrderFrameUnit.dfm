object OrderFrame: TOrderFrame
  Left = 0
  Top = 0
  Width = 813
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
    Width = 813
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
        Caption = #37197#36865#22320#22336
        Width = 200
      end
      item
        Caption = #37197#36865#26102#38388
        Width = 170
      end
      item
        Caption = #23458#25143#30041#35328
        Width = 100
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = OrderListViewDblClick
    OnKeyPress = OrderListViewKeyPress
  end
end
