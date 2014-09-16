object OrderForm: TOrderForm
  Left = 384
  Top = 169
  Width = 705
  Height = 530
  Align = alClient
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #38144#21806#23458#25143#31471
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object SellPage: TPageControl
    Left = 0
    Top = 0
    Width = 697
    Height = 496
    ActivePage = ChangeSheet
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    Images = ImageList1
    ParentFont = False
    Style = tsFlatButtons
    TabIndex = 1
    TabOrder = 0
    object SellSheet: TTabSheet
      Caption = #21806#36135#20132#26131#21333'(F9)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnShow = SellSheetShow
      object Panel2: TPanel
        Left = 0
        Top = 57
        Width = 689
        Height = 391
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object OrderGuide: TPageControl
          Left = 414
          Top = 0
          Width = 275
          Height = 391
          ActivePage = TabSheet1
          Align = alRight
          Style = tsFlatButtons
          TabIndex = 0
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = #21806#36135#36807#31243
            object Label1: TLabel
              Left = 24
              Top = 176
              Width = 156
              Height = 12
              Caption = #25805#20316#25552#31034': '#20381#27425#36755#20837#29289#21697#32534#21495
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 24
              Top = 208
              Width = 78
              Height = 12
              Caption = #25353#38190': '#32467#24080'(+)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 24
              Top = 232
              Width = 78
              Height = 12
              Caption = #25353#38190': '#28165#38500'(*)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 128
              Top = 232
              Width = 129
              Height = 16
              AutoSize = False
              Caption = #37325#26032#36755#20837#24403#21069#29289#21697
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 128
              Top = 208
              Width = 129
              Height = 16
              AutoSize = False
              Caption = #32467#31639#21806#36135#24635#39069
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object NumberLabel: TLabel
              Left = 24
              Top = 15
              Width = 84
              Height = 12
              Caption = #21830#21697#32534#21495'/'#21517#31216':'
            end
            object PriceLabel: TLabel
              Left = 24
              Top = 79
              Width = 54
              Height = 12
              Caption = #38144#21806#21333#20215':'
            end
            object Label15: TLabel
              Left = 24
              Top = 280
              Width = 78
              Height = 12
              Caption = #25353#38190': '#21462#28040'(/)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 128
              Top = 280
              Width = 129
              Height = 16
              AutoSize = False
              Caption = #21462#28040#24403#21069#20132#26131
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 24
              Top = 256
              Width = 78
              Height = 12
              Caption = #25353#38190': '#22238#21024'(-)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 128
              Top = 256
              Width = 129
              Height = 16
              AutoSize = False
              Caption = #37325#26032#36755#20837#19978#19968#29289#21697
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 24
              Top = 128
              Width = 72
              Height = 16
              Caption = #24403#21069#25240#25187':'
              Font.Charset = GB2312_CHARSET
              Font.Color = clOlive
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Reduce: TLabel
              Left = 104
              Top = 128
              Width = 32
              Height = 16
              Caption = #19981#25171
              Font.Charset = GB2312_CHARSET
              Font.Color = clOlive
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 136
              Top = 128
              Width = 16
              Height = 16
              Caption = #25240
              Font.Charset = GB2312_CHARSET
              Font.Color = clOlive
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 24
              Top = 304
              Width = 60
              Height = 12
              Caption = #25353#38190': '#19978#19979
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 128
              Top = 304
              Width = 129
              Height = 16
              AutoSize = False
              Caption = #25240#25187#33258#21160#21152#20943
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object SellCountLabel: TLabel
              Left = 184
              Top = 79
              Width = 30
              Height = 12
              Caption = #25968#37327':'
            end
            object Number: TEdit
              Left = 24
              Top = 32
              Width = 217
              Height = 18
              Color = clGray
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              OnEnter = NumberEnter
              OnKeyPress = NumberKeyPress
            end
            object Price: TEdit
              Left = 24
              Top = 96
              Width = 145
              Height = 18
              Color = clGray
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              OnEnter = NumberEnter
              OnKeyDown = PriceKeyDown
              OnKeyPress = PriceKeyPress
            end
            object SellCount: TEdit
              Left = 184
              Top = 96
              Width = 57
              Height = 18
              Color = clGray
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              OnEnter = NumberEnter
              OnKeyPress = SellCountKeyPress
            end
          end
          object TabSheet2: TTabSheet
            Caption = #32467#24080#36807#31243
            ImageIndex = 1
            object Label4: TLabel
              Left = 24
              Top = 176
              Width = 60
              Height = 12
              Caption = #25805#20316#25552#31034': '
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 128
              Top = 208
              Width = 102
              Height = 12
              Caption = #26368#32456#32467#24080','#25171#21360#23567#31080
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 128
              Top = 256
              Width = 97
              Height = 16
              AutoSize = False
              Caption = #21462#28040#24403#21069#20132#26131
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object TotalLabel: TLabel
              Left = 24
              Top = 15
              Width = 30
              Height = 12
              Caption = #21512#35745':'
            end
            object CheckOutLabel: TLabel
              Left = 24
              Top = 79
              Width = 42
              Height = 12
              Caption = #24212#25910#27454':'
            end
            object Label19: TLabel
              Left = 128
              Top = 232
              Width = 105
              Height = 16
              AutoSize = False
              Caption = #36820#22238#19978#19968#27493
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 24
              Top = 208
              Width = 78
              Height = 12
              Caption = #25353#38190': '#32467#24080'(+)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 24
              Top = 232
              Width = 78
              Height = 12
              Caption = #25353#38190': '#22238#21024'(-)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 24
              Top = 256
              Width = 78
              Height = 12
              Caption = #25353#38190': '#21462#28040'(/)'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object GetMoneyLabel: TLabel
              Left = 144
              Top = 79
              Width = 54
              Height = 12
              Caption = #23454#25910#29616#37329':'
            end
            object Label11: TLabel
              Left = 144
              Top = 128
              Width = 40
              Height = 16
              Caption = #25214#38646':'
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object GiveChange: TLabel
              Left = 192
              Top = 128
              Width = 8
              Height = 16
              Caption = '0'
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 24
              Top = 128
              Width = 40
              Height = 16
              Caption = #25240#25187':'
              Font.Charset = GB2312_CHARSET
              Font.Color = clOlive
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Reduce2: TLabel
              Left = 66
              Top = 128
              Width = 32
              Height = 16
              Caption = #19981#25171
              Font.Charset = GB2312_CHARSET
              Font.Color = clOlive
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 98
              Top = 128
              Width = 16
              Height = 16
              Caption = #25240
              Font.Charset = GB2312_CHARSET
              Font.Color = clOlive
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Total: TEdit
              Left = 24
              Top = 32
              Width = 217
              Height = 18
              Color = clGray
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              OnEnter = NumberEnter
            end
            object CheckOut: TEdit
              Left = 24
              Top = 96
              Width = 105
              Height = 18
              Color = clGray
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              OnEnter = NumberEnter
              OnKeyDown = CheckOutKeyDown
              OnKeyPress = CheckOutKeyPress
            end
            object GetMoney: TEdit
              Left = 144
              Top = 96
              Width = 97
              Height = 18
              Color = clGray
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              OnChange = GetMoneyChange
              OnEnter = NumberEnter
              OnKeyPress = GetMoneyKeyPress
            end
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 414
          Height = 391
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 1
          object OrderList: TListView
            Left = 0
            Top = 0
            Width = 414
            Height = 391
            Align = alClient
            Columns = <
              item
                Caption = #21697#21517
                Width = 180
              end
              item
                Caption = #21333#20215
                Width = 70
              end
              item
                Caption = #25968#37327
              end
              item
                Caption = #23567#35745
                Width = 70
              end>
            Ctl3D = False
            Enabled = False
            FlatScrollBars = True
            GridLines = True
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            SmallImages = ImageList2
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
      object title: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Caption = #21806#36135#20132#26131#21333'('#26032')'
        Color = 13339492
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -33
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object TestMark1: TLabel
          Left = 32
          Top = 12
          Width = 70
          Height = 33
          Caption = #32451#20064
          Font.Charset = GB2312_CHARSET
          Font.Color = clYellow
          Font.Height = -33
          Font.Name = #26999#20307'_GB2312'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object ChangeSheet: TTabSheet
      Caption = #21806#36135#26085#32467#21333'(F10)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      OnShow = ChangeSheetShow
      object Splitter1: TSplitter
        Left = 0
        Top = 353
        Width = 689
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        AutoSnap = False
        MinSize = 80
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Caption = #21806#36135#26085#32467#21333
        Color = 13339492
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -33
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TestMark2: TLabel
          Left = 32
          Top = 12
          Width = 70
          Height = 33
          Caption = #32451#20064
          Font.Charset = GB2312_CHARSET
          Font.Color = clYellow
          Font.Height = -33
          Font.Name = #26999#20307'_GB2312'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 57
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label13: TLabel
          Left = 5
          Top = 21
          Width = 66
          Height = 12
          Caption = #36873#25321#21806#36135#21333':'
        end
        object Label14: TLabel
          Left = 349
          Top = 10
          Width = 78
          Height = 12
          Caption = #24403#26085#38144#21806#24635#39069':'
        end
        object TotalSell: TLabel
          Left = 429
          Top = 10
          Width = 48
          Height = 12
          Caption = '10000.00'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 492
          Top = 10
          Width = 42
          Height = 12
          Caption = #38144#21806#37327':'
        end
        object TotalNumber: TLabel
          Left = 537
          Top = 10
          Width = 18
          Height = 12
          Caption = '200'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object TotalCash: TLabel
          Left = 285
          Top = 10
          Width = 48
          Height = 12
          Caption = '10000.00'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 584
          Top = 10
          Width = 42
          Height = 12
          Caption = #36864#36135#37327':'
        end
        object TotalCancel: TLabel
          Left = 629
          Top = 10
          Width = 18
          Height = 12
          Caption = '200'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 205
          Top = 10
          Width = 78
          Height = 12
          Caption = #24403#26085#24211#23384#29616#37329':'
        end
        object Label28: TLabel
          Left = 492
          Top = 34
          Width = 42
          Height = 12
          Caption = #25910#20837#39069':'
        end
        object TotalIncome: TLabel
          Left = 537
          Top = 34
          Width = 42
          Height = 12
          Caption = '2000.00'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 584
          Top = 34
          Width = 42
          Height = 12
          Caption = #25903#20986#39069':'
        end
        object TotalExpenses: TLabel
          Left = 629
          Top = 34
          Width = 42
          Height = 12
          Caption = '1000.00'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 349
          Top = 34
          Width = 78
          Height = 12
          Caption = #24403#26085#38134#34892#23384#27454':'
        end
        object BankSave: TLabel
          Left = 429
          Top = 34
          Width = 42
          Height = 12
          Caption = '1000.00'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object TotalChange: TLabel
          Left = 285
          Top = 34
          Width = 48
          Height = 12
          Caption = '10000.00'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 205
          Top = 34
          Width = 78
          Height = 12
          Caption = #26152#26085#24211#29616#20313#39069':'
        end
        object SellDate: TDateTimePicker
          Left = 77
          Top = 17
          Width = 113
          Height = 20
          CalAlignment = dtaLeft
          Date = 38578.812674919
          Format = 'yyyy'#24180'MM'#26376'dd'#26085
          Time = 38578.812674919
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
          OnCloseUp = SellDateCloseUp
        end
      end
      object SellGoodsList: TListView
        Left = 0
        Top = 137
        Width = 689
        Height = 216
        Align = alClient
        Columns = <
          item
            Caption = #24403#26085#38144#21806#29289#21697
            Width = 150
          end
          item
            Caption = #37329#39069
            Width = 80
          end
          item
            Caption = #25968#37327
            Width = 80
          end
          item
            Caption = #38144#21806#26102#38388
            Width = 90
          end
          item
            Caption = #26465#30721
            Width = 90
          end
          item
            Caption = #22791#27880
            Width = 145
          end>
        Ctl3D = False
        FlatScrollBars = True
        GridLines = True
        HideSelection = False
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu1
        SmallImages = ImageList2
        TabOrder = 2
        ViewStyle = vsReport
        OnContextPopup = SellGoodsListContextPopup
        OnCustomDrawItem = SellGoodsListCustomDrawItem
        OnSelectItem = SellGoodsListSelectItem
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 113
        Width = 689
        Height = 24
        AutoSize = True
        ButtonWidth = 99
        Caption = 'ToolBar1'
        Ctl3D = False
        Flat = True
        Images = ImageList2
        Indent = 220
        List = True
        ShowCaptions = True
        TabOrder = 3
        object ToolButton2: TToolButton
          Left = 220
          Top = 0
          Action = DoCancel
          AutoSize = True
        end
        object ToolButton1: TToolButton
          Left = 299
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton3: TToolButton
          Left = 307
          Top = 0
          Action = SetChange
          AutoSize = True
          Caption = #25910#25903#24080#21153#35774#32622
        end
        object ToolButton7: TToolButton
          Left = 410
          Top = 0
          AutoSize = True
          Caption = #25171#21360#26426#35774#32622
          ImageIndex = 0
          OnClick = ToolButton7Click
        end
        object ToolButton8: TToolButton
          Left = 501
          Top = 0
          Caption = 'ToolButton8'
          ImageIndex = 1
          OnClick = ToolButton8Click
        end
      end
      object CancelList: TListView
        Left = 0
        Top = 356
        Width = 689
        Height = 92
        Align = alBottom
        Columns = <
          item
            Caption = #24403#26085#36864#36135#29289#21697
            Width = 150
          end
          item
            Caption = #21806#20215
            Width = 80
          end
          item
            Caption = #25240#25187
            Width = 60
          end
          item
            Caption = #25968#37327
            Width = 40
          end
          item
            Caption = #38144#21806#26102#38388
            Width = 160
          end
          item
            Caption = #36864#36135#26085#26399
            Width = 90
          end
          item
            Caption = #26465#30721
            Width = 70
          end>
        Ctl3D = False
        FlatScrollBars = True
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu1
        SmallImages = ImageList2
        TabOrder = 4
        ViewStyle = vsReport
        OnContextPopup = SellGoodsListContextPopup
        OnCustomDrawItem = CancelListCustomDrawItem
        OnSelectItem = SellGoodsListSelectItem
      end
    end
    object SearchSheet: TTabSheet
      Caption = #24211#23384#26597#35810'(F11)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      OnShow = SearchSheetShow
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Caption = #24211#23384#26597#35810
        Color = 13339492
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -33
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TestMark3: TLabel
          Left = 32
          Top = 12
          Width = 70
          Height = 33
          Caption = #32451#20064
          Font.Charset = GB2312_CHARSET
          Font.Color = clYellow
          Font.Height = -33
          Font.Name = #26999#20307'_GB2312'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 113
        Width = 689
        Height = 335
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GoodsList: TListView
          Left = 0
          Top = 24
          Width = 689
          Height = 311
          Align = alClient
          Columns = <
            item
              Caption = #21830#21697#31867#22411
              Width = 90
            end
            item
              Caption = #21697#21517
              Width = 150
            end
            item
              Caption = #26465#30721
              Width = 100
            end
            item
              Caption = #36135#21495
              Width = 80
            end
            item
              Caption = #24211#23384
              Width = 70
            end
            item
              Caption = #26631#20215
              Width = 70
            end
            item
              Caption = #25104#26412#20215
              Width = 80
            end>
          Ctl3D = False
          FlatScrollBars = True
          GridLines = True
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          SmallImages = ImageList2
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = GoodsListColumnClick
          OnCompare = GoodsListCompare
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 689
          Height = 24
          AutoSize = True
          ButtonWidth = 99
          Caption = 'ToolBar2'
          Ctl3D = False
          Flat = True
          Images = ImageList2
          Indent = 180
          List = True
          ShowCaptions = True
          TabOrder = 1
          object ToolButton6: TToolButton
            Left = 180
            Top = 0
            Action = Search
            AutoSize = True
          end
          object ToolButton4: TToolButton
            Left = 283
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 1
            Style = tbsSeparator
          end
          object ToolButton5: TToolButton
            Left = 291
            Top = 0
            Action = SearchAll
            AutoSize = True
          end
          object GoodType: TComboBox
            Left = 394
            Top = 0
            Width = 145
            Height = 20
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = GoodTypeChange
          end
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 57
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object BarCode: TLabeledEdit
          Left = 24
          Top = 22
          Width = 105
          Height = 18
          Ctl3D = False
          EditLabel.Width = 48
          EditLabel.Height = 12
          EditLabel.Caption = #29289#21697#32534#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          ParentCtl3D = False
          TabOrder = 0
          OnChange = BarCodeChange
          OnKeyPress = BarCodeKeyPress
        end
        object GoodName: TLabeledEdit
          Left = 149
          Top = 22
          Width = 220
          Height = 18
          Ctl3D = False
          EditLabel.Width = 24
          EditLabel.Height = 12
          EditLabel.Caption = #21697#21517
          LabelPosition = lpAbove
          LabelSpacing = 3
          ParentCtl3D = False
          TabOrder = 1
          OnChange = BarCodeChange
          OnKeyPress = BarCodeKeyPress
        end
        object GoodCode: TLabeledEdit
          Left = 390
          Top = 22
          Width = 179
          Height = 18
          Ctl3D = False
          EditLabel.Width = 24
          EditLabel.Height = 12
          EditLabel.Caption = #36135#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          ParentCtl3D = False
          TabOrder = 2
          OnChange = BarCodeChange
          OnKeyPress = BarCodeKeyPress
        end
      end
    end
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 464
    Top = 8
    Bitmap = {
      494C010103000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6B6B600929292009292
      9200A2766700A2766700A27667009A847C0092929200B6B6B600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B6B6B60092929200A276670085472E008547
      2E0085472E0085472E0085472E0085472E006D493100A2766700A27667009292
      9200B6B6B6000000000000000000000000000000000000000000000000000000
      0000979797009797970097979700A0A0A000A0A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007777770077777700777777007777770077777700777777007777
      7700777777007777770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C200C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200C2C2
      C200C2C2C200C2C2C200B6B6B600A2766700C0401300D24C2700DC513100E758
      3E00EF5D4600F9635000FD655400FD655400CD482100D24C2700D24C2700A53F
      1900A276670092929200B6B6B600000000000000000000000000000000007E7E
      7E004545450041414100474747005D5D5D006E6E6E0083838300979797009797
      9700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000777777007777
      77007B6B6B007B6B6B008C4242008C4239008C3939008C3939008C4239007342
      39006B4A42007B6B6B0077777700777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA0008E79
      70008E7970008E7970008E7970008E7970008E7970008E7970008E7970008E79
      70008E7970008E7970008E797000C0401300D24C2700DC513100EF5D4600FC64
      5300FD6A5700FD725C00FD755E00F1684E00D5885500CC5D2F00FD665500F963
      5000E7583E00C040130092929200B6B6B6000000000000000000646464002B5C
      7D003970B1000199CD00127698001D607600294650003E3E3E00474747005D5D
      5D00727272008888880097979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077777700777777008C636300BD52
      5200CE636300CE7B7B00D69C9400E7A5A500F7949400EF8C8C00D6848400CE6B
      6B00CE5A6300B53942008C393900634239007777770077777700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000CDAD
      A000CDADA000CDADA000CDADA000CDADA000CDADA000CDADA000CDADA000CDAD
      A000CDADA000CDADA000CDADA000C0401300DC513100EF5D4600FD665500FD72
      5C00FD786000FD7C6400FD846900C5572B00FDE3B000D5885500F36D5300FD6A
      5700FC645300EF5D46009A5819009292920000000000727272002878AD004969
      B400486BB7003E82DA003387D900208FD9001497DB000393C200127698001D60
      76002D404600414141004D4D4D0064646400767676008E8E8E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000777777008C6B6B00CE6B6B00D69C9400F7C6
      BD00FFBDBD00FFB5B500FFADAD00FFADA500FFA5A500FFA59C00FF9C9C00FF94
      9400F7949400EF848400CE636300B55252008C39390063423900777777000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000FAE1
      CD00F7D7C000FAE1CD00FAE1CD00F7D7C000F7D7C000F7D7C000F7D7C000F7D7
      C000F1CFB700F5D4BA00EFCDB500C5572B00E7583E00FC645300FD725C00FD78
      6000FD846900FC8B6D00D5623700EEB88A00FDE3B000EEB88A00E0664200FD78
      6000FD6A5700F9635000AC652B00929292000000000072727200377BC5004A67
      B1004670BE003F7FD6003E82DA003D84DD003B87E2003A8AE7002C8EE100208F
      D9001497DB00068CB9001968830022556600353C460041414100525252006969
      69007E7E7E009292920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077777700A5737300D69C9400F7CEC600FFC6BD00FFBD
      BD00FFBDB500FFB5B500FFADAD00FFB5AD00FFADAD00FFA5A500FF9C9C00FF94
      9400F78C8C00EF8C8C00E7848400E77B7B00CE636300BD5A5A00633931007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000FAE1
      CD00FAE1CD00F7D7C000F7D7C000FAE1CD00F7D7C000F7D7C000F7D7C000F7D7
      C000F7D7C000EFCDB500F7D7C000CC5D2F00E7583E00FD6B5800FD786000FD84
      6900FE927200EB805900D5885500FFD9A600FFD9A600FFD9A600D25C3200FD84
      6900FD755E00FD665500AC652B00929292008B8B8B005D5D5D00377BC5004B65
      AD004574C400417BD1003F7FD6003E82DA003D84DD003B87E2003A8AE700398C
      EA003890F0003791F3002994EB001A99E5000A98D4000A86AF0019688300264D
      59003A3A3A004747470058585800696969007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077777700B59C9C00EFB5B500F7CEC600FFCEC600FFC6BD00FFC6
      BD00FFC6C600F7CEC600F7D6CE00F7D6CE00F7DED600F7DED600F7DED600F7D6
      CE00F7B5B500EFADA500E7848400DE7B7B00DE737300C6636300BD5A5A006339
      3100777777000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000FAE1
      CD006E584D006E584D00FAE1CD00F7D7C0006E584D006E584D006E584D006E58
      4D006E584D006E584D006E584D006E584D00CC5D2F00EF765600FD7C6400FC8B
      6D00F9926F00CC5D2F00FFCF9C00FFCF9C00FFCF9C00FFCF9C00D7744500FC8B
      6D00FD786000F1684E0091793000000000008B8B8B005D5D5D00327DCC004A67
      B1004278CA004279CD00417BD1003F7FD6003E82DA003D84DD003B87E2003A8A
      E700398CEA003890F0003791F3003695F7003496FB003099FC002299EE001A99
      E5000A98D4000D80A6001D607600294650003E3E3E004D4D4D00646464000000
      0000000000000000000000000000000000000000000000000000000000000000
      000077777700AD848C00EFC6BD00F7D6CE00FFCEC600FFC6C600FFCEC600FFCE
      C600FFCEC600F7CEC600F7CEC600F7D6CE00F7D6CE00F7D6CE00F7D6CE00F7D6
      CE00F7DED600F7DED600F7DED600F7C6BD00D6848400CE6B6B00C65A5A00BD42
      4A00777777007777770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000FAE1
      CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00F7D7C000F7D7C000FAE1CD00F7D7
      C000F7D7C000F7D7C000F7D7C000EFCDB500F7D7C000D5623700EF765600FC8B
      6D00CC5D2F00E99A7A00BF8B8400BF8B8400EEB88A00FFBF9100D7744500FD8E
      7000F87B5F00B7461B0000000000000000008B8B8B0064646400407DD300486B
      B700417BD1004377C9004279CD00417BD1003F7FD6003E82DA003D84DD003B87
      E2003A8AE700398CEA003890F0003791F3003695F7003496FB003399FF003399
      FF003399FF002D99F8002299EE001497DB000393C20012769800393939008888
      8800000000000000000000000000000000000000000000000000000000000000
      0000A57B8400EFB5B500F7D6CE00FFC6BD00FFBDBD00FFC6BD00FFC6BD00FFC6
      BD00FFC6BD00FFC6C600FFCEC600FFCEC600FFCEC600F7CEC600F7CEC600F7D6
      CE00F7D6CE00F7D6CE00F7D6CE00F7D6CE00F7DED600E7ADA500C6636300BD52
      52009C3939007777770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000FAE1
      CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00F7D7C000FAE1
      CD00F7D7C000F7D7C000F7D7C000F7D7C000EFCDB500F7D7C000B1654D00B746
      1B004C214F0001046A00040C7200040C7200110C69007F4C6E00D25C3200D25C
      320085601A000000000000000000000000008B8B8B00476B94003E81D900486C
      B800407DD3004574C4004377C9004279CD00417BD1003F7FD6003E82DA003D84
      DD003B87E2003A8AE700398CEA003890F0003791F3003695F7003496FB003399
      FF003399FF003399FF003399FF003399FF003399FF000A98D400393939008888
      8800000000000000000000000000000000000000000000000000000000007777
      7700AD8C8C00F7DED600FFBDBD00FFB5B500FFB5B500FFB5B500FFBDB500FFBD
      B500FFBDBD00FFC6BD00FFC6BD00FFC6BD00FFC6BD00FFC6C600FFCEC600FFCE
      C600FFCEC600F7CEC600F7CEC600F7D6CE00F7D6CE00F7D6CE00E7ADA500BD5A
      5A00B54A4A006342390077777700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000F8E6
      D500FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00F7D7
      C000F7D7C000F7D7C000F7D7C000F7D7C000F7D7C0004A4A4A00181818000202
      0200010215000C257E00102F9500102F95000F2D930006187B00341A4B00605E
      5E00000000000000000000000000000000008B8B8B00375166003B87E200476C
      B9003F80D7004571C0004574C4004377C9004279CD00407DD3003F7FD6003E82
      DA003D84DD003B87E2003A8AE700398CEA003890F0003791F3003695F7003496
      FB003399FF003399FF003399FF003399FF003399FF000A98D400393939008888
      880000000000000000000000000000000000000000000000000000000000AD8C
      8C00EFC6BD00FFBDB500FFADAD00FFADAD00FFADAD00FFB5AD00FFB5AD00FFB5
      B500FFB5B500FFB5B500FFBDB500FFBDB500FFBDBD00FFBDBD00FFC6BD00FFC6
      BD00FFC6BD00FFC6C600FFCEC600FFCEC600FFCEC600F7CEC600F7CEC600E7A5
      A500B54A4A008C39390077777700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDADA000F9E8
      DB00F8E6D500FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1
      CD00FAE1CD00F7D7C000F7D7C000F7D7C000121212000A0A0A000A0A0A000507
      0E000D29680012359B00143CA200143CA200143CA200143AA00006187B002E34
      5700000000000000000000000000000000005D5D5D00264D59003D83DD00466E
      BC003D83DD00466EBC004571C0004574C4004377C9004279CD00407DD3003F7F
      D6003E82DA003D84DD003B87E2003A8AE700398CEA003890F0003791F3003695
      F7003496FB003399FF003399FF003399FF003399FF000A98D400393939008888
      880000000000000000000000000000000000000000000000000000000000AD8C
      8C00F7D6CE00FFA5A500FFA5A500FFA5A500FFADA500FFADA500FFADAD00FFAD
      AD00FFADAD00FFB5AD00FFB5AD00FFB5B500FFB5B500FFB5B500FFBDB500FFBD
      B500FFBDBD00FFBDBD00FFC6BD00FFC6BD00FFC6BD00FFC6C600FFCEC600FFCE
      C600D6949400AD424200844A4A00777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1B7AB00FEED
      E0006E584D006E584D00FAE1CD00FAE1CD006E584D006E584D006E584D006E58
      4D006E584D006E584D006E584D00181818000D0D0D00121212000D0D0D000D29
      68001948AE001948AE001A4DB3001A4DB3001A4DB3001948AE00143FA400081D
      6C00000000000000000000000000000000005D5D5D00314B60003D85DF004670
      BE003D85DF00476CB900466EBC004571C0004574C4004377C9004279CD00407D
      D3003F7FD6003E82DA003D84DD003B87E2003A8AE700398CEA003890F0003791
      F3003695F7003497FC003399FF003399FF003399FF000A98D400393939008888
      880000000000000000000000000000000000000000000000000000000000AD8C
      8C00FFB5AD00FF9C9C00FF9C9C00FFA59C00FFA5A500FFA5A500FFA5A500FFA5
      A500FFADA500FFADA500FFADAD00FFADAD00FFADAD00FFB5AD00FFB5AD00FFB5
      B500FFB5B500FFB5B500FFBDB500FFBDB500FFBDBD00FFBDBD00FFC6BD00FFC6
      BD00FFADA500B55252006B4A4200777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1B7AB00FEED
      E000FEEDE000F9E8DB00F8E6D500FAE1CD00FAE1CD00FAE1CD00FAE1CD00FAE1
      CD00FAE1CD00FAE1CD00F7D7C00012121200171717001A1A1A000D0D0D001B51
      B7001C56BC001E5AC0001E5AC0001E5FC2001E5AC0001C56BC001C56BC000529
      83001258A2000000000000000000000000005D5D5D002B5C7D003B88E5004571
      C0003B88E5004969B400476CB900466EBC004571C0004574C4004377C9004279
      CD00407DD3003F7FD6003E82DA003D84DD003B87E2003A8AE700398CEA003890
      F0003791F3003595F7003497FC003399FF003399FF000A98D400393939008888
      880000000000000000000000000000000000000000000000000000000000B59C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FFA5
      9C00FFA5A500FFA5A500FFA5A500FFA5A500FFADA500FFADA500FFADAD00FFAD
      AD00FFADAD00FFB5AD00FFB5AD00FFB5B500FFB5B500FFB5B500FFBDB500FFBD
      B500FFB5B500B5525200844A4A00777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6C1B700FDF2
      E400FEEDE000FEEDE000F9E8DB00F8E6D500FAE1CD00FAE1CD00FAE1CD00F8E6
      D500FAE1CD00FAE1CD001C1C1C001A1A1A001F1F1F00242424000E192C002060
      C6002265CB002368CE00246AD000246AD000246AD0002265CB002265CB001042
      9E002C586F000000000000000000000000005D5D5D002B5C7D00398CEA004278
      CA00398CEA004A67B1004969B400486BB700466EBC004571C0004574C4004377
      C9004279CD00407DD3003F7FD6003E82DA003D84DD003B87E2003A8AE700398C
      EA003890F0003791F3003595F7003497FC003399FF000A98D400393939008888
      880000000000000000000000000000000000000000007777770077777700B584
      8C00FF949400FF949400FF949400FF949400FF949400FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FFA59C00FFA5A500FFA5A500FFA5A500FFA5
      A500FFADA500FFADA500FFADAD00FFADAD00FFADAD00FFB5AD00FFB5AD00FFB5
      B500FFB5B500D6737B006B4A4200777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6C1B700FDF2
      E400FDF2E400FEEDE000FEEDE000F9E8DB00F8E6D500FAE1CD00FAE1CD00FAE1
      CD00F8E6D500FAE1CD001C1C1C0021212100282828002C2C2C0017171700246A
      D0002774DA002877DD00297AE000297AE000297AE0002877DD002671D7001653
      B0002E3457000000000000000000000000005D5D5D0028698A00388DED003F80
      D7003A5A87003A445C003D50770043619D004A67B100466EBC004571C0004574
      C4004377C9004279CD00407DD3003F7FD6003E82DA003D84DD003B87E2003A8A
      E700398CEA003890F0003791F3003595F7003497FC000A98D400393939008888
      8800000000000000000000000000000000008C636300A5421000AD523100D66B
      6B00F78C8C00F78C8C00F78C8C00F7949400FF949400FF949400FF949400FF94
      9400FF949400FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FFA5
      9C00FFA5A500FFA5A500FFA5A500FFA5A500FFADA500FFADA500FFADAD00FFAD
      AD00FFADAD00D67B8400844A4A00777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9C6BC00FEED
      E0006E584D006E584D00FEEDE000F9E8DB006E584D006E584D006E584D006E58
      4D006E584D006E584D001C1C1C002A2A2A002F2F2F0036363600242424002162
      B5002D82EA002F8CF3003191F9003295FB003191F9002F8CF3002A7CE2001E5F
      C2002C586F000000000000000000000000005D5D5D0028698A004386D9004386
      D9003333330042588B003C557E003B49660038405100353C4600354961003D50
      77003E66A2004572C1004279CD00417BD1003F7FD6003E82DA003D84DD003B87
      E2003A8AE700398CEA003890F0003791F3003595F7000A98D400393939008888
      880000000000000000000000000000000000B5521800CE630000C6630000CE63
      6300CE636300CE636300CE636300CE636300CE636300CE636300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300F78C8C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FFA59C00FFA5A500FFA5A500FFA5A500FFA5
      A500FFADA500D67B840077777700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9C6BC00FBF0
      E800FEEDE000FDF2E400FEEDE000FEEDE000F9E8DB00FAE1CD00FAE1CD00F8E6
      D500FAE1CD00FAE1CD001C1C1C002A2A2A00383838003F3F3F003F3F3F00102C
      5B002F8CF3003191F900359BFF003AA0FF00359BFF003399FF003296FC001763
      BA002C586F000000000000000000000000005D5D5D00346698004386D9004386
      D900353C46004969B4004969B4004969B4004969B4004969B40043619D004258
      8B003D4D71003840510032393E00374A59003C557E003E66A200377BC5003D84
      DD003B87E2003A8AE700388DED003890F0003791F3000A98D400393939008383
      830000000000000000000000000000000000B55A1800CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000D66B00004A4A4A0077777700AD737300B57B7B00FF949400FF94
      9400FF949400FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FFA5
      9C00FFA5A500D6737B0077777700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9C6BC00FBF0
      E800FBF0E800FEEDE000FDF2E400FEEDE000FEEDE000F9E8DB00F9E8DB00FAE1
      CD00F8E6D500FAE1CD00FAE1CD001C1C1C003F3F3F00464646004D4D4D002C2C
      2C00102C5B0016419E001D56D2002368DD002D82EA003694F7003191F9001258
      A2001258A2000000000000000000000000005D5D5D00338FBC004386D900476E
      A30034445600466EBC004670BE004670BE004670BE004670BE004670BE004670
      BE004670BE004670BE006BB1DD005B94CE00476EA3003C557E00354961003840
      5100374A590034587D003E66A200377BC5003890F0000A98D400393939007272
      720000000000000000000000000000000000B54A4A00FFC69400FFC69400FFC6
      9400FFC69400FFC69400FFC69400FFC69400FFC69400FFC69400FFC69400FFC6
      9400FFC69400EFA55A007B3921007777770000000000AD737300F78C8C00F78C
      8C00F7949400FF949400FF949400FF949400FF949400FF9C9C00FF9C9C00FF9C
      9C00FF9C9C007777770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9C6BC00FBF0
      E800FBF0E800FBF0E800FEEDE000FEEDE000FEEDE000FEEDE000FEEDE000F8E6
      D500F8E6D500F9E6D900FAE1CD002A2A2A003F3F3F004A4A4A004A4A4A00605E
      5E00666666004D4D4D001F20290007155B000D268D0012359B000D2968000912
      1C00000000000000000000000000000000005D5D5D00338FBC004B8BD600476E
      A3003D4D71004376C7004574C4004574C4004574C4004574C4004574C4004574
      C4004574C4004574C40076D0F2008FF1FB008FF1FB008FF1FB006BB1DD004376
      C7004670BE003E66A2003A5A8700364D6A00384051002C4F5C00353535005252
      520000000000000000000000000000000000AD523100FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400F7B573008439180077777700000000009C6B6B00DE7B7B00F78C
      8C00F78C8C00F78C8C00F78C8C00F78C8C00F7949400FF949400FF949400FF94
      9400F79494007777770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDD0C800FDF3
      EC006E584D006E584D00FBF0E800FDF2E4006E584D006E584D006E584D006E58
      4D006E584D006E584D006E584D006E584D002A2A2A0054545400545454006666
      66008484840097979700A4A4A40071717100464646002F2F2F002A2A2A003F3F
      3F00000000000000000000000000000000005D5D5D00338FBC004B8BD6003D4D
      71003C557E004179CD004279CD004279CD004279CD004279CD004279CD004279
      CD004279CD004179CD0076D0F2007ADDFF007ADDFF007ADDFF0069C0F7004278
      CA004279CD004279CD004279CD004279CD004279CD004279CD003A5A87004747
      4700000000000000000000000000000000009C5A6300C66B3100F7B57300F7B5
      7300F7B57300F7B57300F7B57300F7B57300F7B57300F7B57300F7B57300F7B5
      7300F7B57300F7B57300CE6B180077777700000000009C8484009C848400EF84
      8400EF848400EF848400EF8C8C00F78C8C00F78C8C00F78C8C00F78C8C00F78C
      8C00777777000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDD0C800FFF9
      F200FCF3E900F9EFE500FEF4EA00FBF0E800FCEDE400FEEDE000FAECE000FDED
      E100FEEEE200FCECDF00FAE9DC00F9E6D900FAE1CD0021212100605E5E007171
      7100848484008F8F8F00A4A4A400A4A4A4007E7E7E004A4A4A001A1A1A000000
      0000000000000000000000000000000000005D5D5D003B95BF004B8BD6003C55
      7E003F69A800407ED400407ED400407ED400407ED400407ED400407ED400407E
      D400407ED400407ED4005098E60057A5EB0057A5EB005CB5ED0057ADF400407E
      D400407ED400407ED400407ED400407ED400407ED400407ED4003A5A87004D4D
      4D000000000000000000000000000000000000000000AD523100EFAD6300EFAD
      6300EFAD6300EFAD6300EFAD6300EFAD6300EFAD6300EFAD6300EFAD6300EFAD
      6300EFAD6300EFAD6300D67B29006B4A4200000000000000000094737300E77B
      7B00E7848400E7848400EF848400EF848400EF848400EF848400EF8C8C007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5DFD900FFFB
      F000FFFAF000FEF4EA00FCF1E900FEF2EC00FBF0E800FBF0E800FDF2E400FCEE
      E200FDEDE000FEEDE000FDEDE000FAE9DC00F9E6D900F9E6D900282828006666
      66008F8F8F0097979700848484006D6D6D00464646002F2F2F00000000000000
      0000000000000000000000000000000000005D5D5D005098E600476B9400353C
      4600A0A0A00068A8EC0068A8EC003F7FD6003E81DA003E81DA003E81DA003D82
      DB003E82DA003E82DA003D82DB003D82DB003D82DB003D82DB003D82DB003D82
      DB003D82DB003D82DB003D82DB003D82DB003D82DB003D82DB003A5A87005858
      580000000000000000000000000000000000000000009C5A6300B55A1800EF9C
      5200EF9C5200EF9C5200EF9C5200EF9C5200EF9C5200EF9C5200EF9C5200EF9C
      5200EF9C5200EF9C5200DE8C39007B392100777777000000000094737300D66B
      6B00E77B7B00E77B7B00E77B7B00E77B7B00E7848400E7848400777777000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5DFD900FFFD
      F400FDF4EA00FFF9F100FDF1EB00FEF2EE00FAEFEB00FBF1EA00FBF1E700FDF2
      E400FEEFDF00FFF0E000FDEDE000FDEDE000FAE9DC00F9E6D900F9E6D900F9E6
      D900282828002828280028282800282828002828280000000000000000000000
      0000000000000000000000000000000000005D5D5D002D40460034587D005B94
      CE00A8D7F700BEE9FA00E2FCFE00F1FFFF00CDFDFF00BEE9FA008EC5F3007FB6
      F10057A5EB003B88E5003B88E5003A8AE7003A8AE700368DE8003A8AE7003B88
      E5003B88E5003B88E5003B88E5003B88E5003B88E5003B88E500355578005D5D
      5D000000000000000000000000000000000000000000000000009C6B6B00C66B
      2900E7944200E7944200E7944200E7944200E7944200E7944200E7944200E794
      4200E7944200E7944200E7944200B55218007777770000000000A57B7B009C84
      8400DE737300DE737300DE737300DE7B7B00DE7B7B0077777700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5DFD900FFFB
      F700FFF8F400FFF7F300FFF5EF00FFF4EE00FCF3EF00F9F3EC00FAF4E900FCF3
      E500FFF3E000FFF1DE00F7ECDE00FCEDDF00FCECDE00FDEBDC00FDEADA00FCE9
      D900FCE8D700FDD2BF00D7908400978A8300D4CFCC0000000000000000000000
      000000000000000000000000000000000000333333003A5A870037628F003777
      BD00377BC500388DED00388DED00388EEE0068A8EC0068A8EC008EC5F300A8D7
      F700BEE9FA00CDFDFF00CDFDFF00A6E3FB008EC5F3007FB6F10057A5EB004298
      F100398CEA00398CEA00398CEA00398CEA00388DED00388EEE00314B60006464
      6400000000000000000000000000000000000000000000000000000000009C5A
      6300B55A1800DE843100DE8C3900DE843100DE843100DE843100DE8C3900DE84
      3100DE8C3900DE843100DE843100A54208007777770000000000000000009C84
      8400D66B6B00D6737B00DE737300777777007777770000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEAE700FFFE
      FB006E584D006E584D006E584D006E584D006E584D006E584D006E584D006E58
      4D00FFF3E100FFF5E500FEF4EA00FDEEE100FDEDE000FDEBDE00F7B3B300F7AC
      AC00F6A1A200F89A9A00D8938500A3969000DBD6D30000000000000000000000
      0000000000000000000000000000000000000000000091919100919191006969
      69005F5F5F0033333300353C46003549610034669800276AC900327DCC003981
      D3003693F5003693F5004298F10057ADF4007BCAF9007ADDFF0092E4FD00A9F9
      FE00A9F9FE0092E4FD007ADDFF0069C0F70057ADF4004298F100354961007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      00009C5A6300B55A1800CE6B1800DE842100D67B2900DE842100D6732100DE84
      2100D6732100DE842100D6732100BD6310007777770000000000000000009473
      7300777777007777770077777700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAE9E500FFFD
      FA00FCFBF700FDFAF600FEF7F400FFF6F300FCF5F200FBF4F100FCF4ED00FDF4
      EB00FFF3EA00FFEFE800F9ECEA00FDEFE300FDEEE100E5B69100EEA14800E795
      3900DE8B3700D5823600BC8C7000BBB1AC00E5E2E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000076767600243A7500133EB6001A378F003535
      350033333300353C4600334D6600375E8C0034669800276AC900286CDD003497
      FC00389EFF004EB3FE0059BFFF0069CFFF0088EDFF0081DBF100333333007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD523100AD4A1000C6630000D6731000D6731000D673
      1000D6731000D6731000D6731000CE6B10007777770000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ECEDE900FFFF
      FC006E584D006E584D006E584D006E584D006E584D006E584D006E584D006E58
      4D00FFF7F300FBEEEC00FEF3F500FDF0E500FDEFE400EBC09E00FFBD6100FFA9
      3200FCA22300CC905500B1A39B00D8D2CF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008D8D8D00193895001648C400193895003939
      3900000000000000000000000000000000003A3A3A0003097100030971002626
      400038405100334D6600375E8C0034587D00384051004D4D4D00919191000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD523100B55A1800B5521800B552
      1800AD4A0000BD520000C65A0000C65A0000C65A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEEE900FFFF
      FB00FDFFF900FCFDF900FFFAFB00FFF8FB00FFF6FC00FDF6F900FCF7F600FBF6
      F300FCF3F000FCF4F400F8F3F500FEF1E700FDF0E500EBC7A800FFCE8500FEB5
      5500D29E6900AFA09900D6CFCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008D8D8D002356B8001A54D3001E4BB1002B38
      57002B3857003333330035353500373737003535350008198700081987002626
      4000696969000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A57B7B00A57B7B00A57B7B00A57B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEF2ED00FFFF
      FB00FFFFF900FFFFFB00FFFEFD00FFFBFC00FFF8FB00FDF6F900FBF6F500F9F4
      F100FCF6F100F7F2EF00F2F0EF00FDF3E900FEF1E700EDD0AF00FFD89600CD9B
      7400AC9D9600D4CECA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E8E8E005B94CE0059BFFF001C5AD7001A54
      D300174BC8001543BE00133EB6001A378F001A378F000C269700081987002626
      4000727272000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAE9E500FDFF
      F900FDFFF900FDFFF900FDFFF900FDFFF900FDFFF900FDFFF900FDFFF900FDFF
      F900FCF6F100FCF6F100FCF6F100E4E5E400E2E3E300EED1B000CDAE8C009987
      7D00C9C1BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000088888800476B94005B94CE002356B8001C5A
      D7001C5AD700184ECC001648C4001543BE001037AE001033A7000E2EA2002B38
      57007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7DED500E7DE
      D500E7DED500E7DED500E7DED500E3CCBB00E3CCBB00E3CCBB00E3CCBB00E3CC
      BB00E3CCBB00E3CCBB00E3CCBB00E0BEA700DDBCA600E7C2AA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000929292008E8E8E005F5F5F005F5F
      5F004747470033363C002B3857002B38570020316A00243A750020316A003239
      3E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF803FFFFFFFFFFFFFFFFF00000000
      FFFE0007F07FFFFFFFF803FF00000000E0000001E00FFFFFFFC000FF00000000
      C0000000C001FFFFFF00003F00000000C000000080003FFFFE00001F00000000
      C0000000800003FFFC00000F00000000C00000000000007FF800000700000000
      C00000010000001FF000000300000000C00000030000000FF000000300000000
      C00000070000000FE000000100000000C000000F0000000FE000000100000000
      C000000F0000000FE000000000000000C000000F0000000FE000000000000000
      C00000070000000FE000000000000000C00000070000000F8000000000000000
      C00000070000000F0000000000000000C00000070000000F0000000100000000
      C00000070000000F0000000100000000C00000070000000F0000800300000000
      C000000F0000000F0000800300000000C000000F0000000F0000800700000000
      C000001F0000000F8000C00F00000000C000003F0000000F8000401F00000000
      C000007F0000000FC000403F00000000C000007F0000000FE000607F00000000
      C000007F8000000FF00061FF00000000C000007FFE00000FFC007FFF00000000
      C00000FFFE0F001FFF007FFF00000000C00001FFFE0007FFFFF0FFFF00000000
      C00003FFFE0007FFFFFFFFFF00000000C00007FFFE0007FFFFFFFFFF00000000
      C0003FFFFF000FFFFFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 496
    Top = 8
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000FFFF008080800000FFFF0080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080008080
      8000FFFF0000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      800080808000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF180000EF180000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF180000EF180000EF1800000000000000000000FFFF0000FFFF000000FF
      FF0000FFFF00FFFF000000FFFF008080800000FFFF008080800000FFFF0000FF
      FF0080808000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF180000EF180000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF180000EF180000EF1800000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000FFFF008080800000FFFF008080800000FFFF0000FF
      FF0080808000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF180000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF180000EF180000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF000000FFFF008080800000FFFF008080800000FFFF0000FF
      FF00808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF18000000000000000000000000000000000000FFFF000000FFFF00FFFF
      0000FFFF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      80008080800080808000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      00000000000000000000000000000000000000000000FFFF000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FFFF00000000
      000000000000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF180000EF180000EF180000EF180000EF180000EF1800000000
      00000000000000000000000000000000000000000000FFFF0000FFFF000000FF
      FF0000FFFF008080800000FFFF008080800000FFFF0080808000FFFF0000FFFF
      000080808000FFFF0000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EF180000EF180000EF180000EF180000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF008080800000FFFF008080800000FFFF00808080008080800000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EF180000EF18000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF008080800000FFFF0080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCCCF6008888E9009999
      EC00BBBBF2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBD0CC00F6928800F7A2
      9900FAC1BB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3AAEF00AF66E3008C22D6007A00
      D0009533D900C188E900EDDDF90000000000000000009999EC008888E9004444
      DD004444DD003333D9000000D0000000D0003333D9004444DD004444DD002222
      D6000000D0008888E900000000000000000000000000F7A29900F6928800F154
      4400F1544400F0453300EC160000EC160000F0453300F1544400F1544400EF35
      2200EC160000F692880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDDDF900C188E9008C22D6007A00D0007A00D0009533D9009D44
      DD009D44DD009D44DD009D44DD00D3AAEF000000000000000000000000000000
      0000DDDDF900DDDDF9000000000000000000BBBBF2009999EC00BBBBF200BBBB
      F200BBBBF2000000000000000000000000000000000000000000000000000000
      0000FCE0DD00FCE0DD000000000000000000FAC1BB00F7A29900FAC1BB00FAC1
      BB00FAC1BB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C188E9007A00D000AF66E300C188
      E9009D44DD008311D3009533D900A655E000E4CCF60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006666E3002222D6001111D3002222D6001111D3005555E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4736600EF352200ED261100EF352200ED261100F2645500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4CCF600DCBBF200C188E9007A00
      D000CA99EC0000000000A655E0007A00D000C188E90000000000000000000000
      0000E4CCF6000000000000000000000000000000000000000000000000000000
      00003333D9006666E300DDDDF900000000006666E3001111D300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0453300F4736600FCE0DD0000000000F4736600ED261100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4CCF6008311
      D3000000000000000000C188E9008C22D6008C22D600AF66E300EDDDF9009D44
      DD007A00D0000000000000000000000000000000000000000000000000000000
      00000000D0004444DD003333D9001111D3008888E9000000D000AAAAEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EC160000F1544400F0453300ED261100F6928800EC160000F9B1AA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EF180000EF18000000000000000000000000
      0000000000000000000000000000000000000000000000000000C188E9009D44
      DD000000000000000000D3AAEF009D44DD00000000009D44DD008311D3008311
      D300D3AAEF00000000000000000000000000AAAAEF007777E600DDDDF9009999
      EC000000D0006666E3008888E900BBBBF2009999EC000000D0003333D9000000
      000000000000000000000000000000000000F9B1AA00F5837700FCE0DD00F7A2
      9900EC160000F4736600F6928800FAC1BB00F7A29900EC160000F04533000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EF180000EF180000EF180000EF180000000000000000
      0000000000000000000000000000000000000000000000000000C188E9009533
      D9000000000000000000DCBBF2009D44DD00C188E9008C22D600C188E900F6EE
      FC0000000000000000000000000000000000000000009999EC001111D3004444
      DD009999EC00BBBBF2005555E0003333D9003333D9001111D3005555E0004444
      DD004444DD005555E000BBBBF2000000000000000000F7A29900ED261100F154
      4400F7A29900FAC1BB00F2645500F0453300F0453300ED261100F2645500F154
      4400F1544400F2645500FAC1BB00000000000000000000000000000000000000
      000000000000EF180000EF180000EF180000EF180000EF180000EF1800000000
      000000000000000000000000000000000000CA99EC009D44DD008C22D6007A00
      D000CA99EC0000000000DCBBF2008C22D600F6EEFC00CA99EC008C22D6008C22
      D600B877E600F6EEFC0000000000000000000000000000000000EEEEFC005555
      E0001111D300CCCCF6004444DD008888E900000000009999EC000000D0000000
      D0006666E3009999EC00DDDDF900000000000000000000000000FEEFEE00F264
      5500ED261100FBD0CC00F1544400F692880000000000F7A29900EC160000EC16
      0000F4736600F7A29900FCE0DD00000000000000000000000000000000000000
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      00000000000000000000000000000000000000000000EDDDF900C188E9008311
      D300CA99EC0000000000DCBBF2007A00D0009D44DD008311D3009533D900C188
      E9008311D300EDDDF90000000000000000000000000000000000000000000000
      00006666E3001111D3002222D6004444DD008888E9000000D0006666E300DDDD
      F900000000000000000000000000000000000000000000000000000000000000
      0000F4736600ED261100EF352200F1544400F6928800EC160000F4736600FCE0
      DD0000000000000000000000000000000000000000000000000000000000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF1800000000000000000000000000000000000000000000000000000000
      00000000000000000000DCBBF2007A00D000EDDDF900000000007A00D000DCBB
      F200000000000000000000000000000000000000000000000000EEEEFC00BBBB
      F200BBBBF2002222D6000000D0000000D0002222D600BBBBF200000000000000
      0000000000000000000000000000000000000000000000000000FEEFEE00FAC1
      BB00FAC1BB00EF352200EC160000EC160000EF352200FAC1BB00000000000000
      0000000000000000000000000000000000000000000000000000EF180000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF180000EF1800000000000000000000000000000000000000000000E4CC
      F6009D44DD0000000000DCBBF2007A00D000A655E0009D44DD008311D300B877
      E6000000000000000000000000000000000000000000000000009999EC005555
      E0004444DD001111D3000000D0000000D0004444DD008888E9008888E9008888
      E900000000000000000000000000000000000000000000000000F7A29900F264
      5500F1544400ED261100EC160000EC160000F1544400F6928800F6928800F692
      88000000000000000000000000000000000000000000EF180000EF180000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF180000EF180000EF180000000000000000000000000000CA99EC007A00
      D0008311D30000000000C188E9007A00D000DCBBF200000000009D44DD008C22
      D600EDDDF9000000000000000000000000000000000000000000000000000000
      000000000000000000008888E9003333D9008888E9007777E6004444DD008888
      E900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6928800F0453300F6928800F5837700F1544400F692
      88000000000000000000000000000000000000000000EF180000EF180000EF18
      0000EF180000EF180000EF180000EF180000EF180000EF180000EF180000EF18
      0000EF180000EF180000EF180000000000000000000000000000E4CCF600DCBB
      F200F6EEFC0000000000DCBBF200C188E900AF66E3008311D3007A00D0008311
      D300EDDDF9000000000000000000000000000000000000000000000000000000
      000000000000000000008888E9001111D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6928800ED2611000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCBBF200F6EE
      FC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000002222D6002222D600DDDDF90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EF352200EF352200FCE0DD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7B5AD00EF423100F7BDBD00F7BDBD00F7BDBD00FFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBD0CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1CEF5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7948C00EF312100F7948C00EF524200EF524200EF180000EF18
      0000FFCECE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADEF006363E7002121D6000000
      CE003131D6008C8CE700DEDEF70000000000000000000000000000000000F692
      8800EC160000FAC1BB00F6928800FCE0DD000000000000000000000000000000
      0000F6928800F1544400F1544400F4736600000000000000000000000000BA8D
      E8006B0BCD00D8BEF200BA8DE800EBDEF8000000000000000000000000000000
      0000BA8DE800924CDA00924CDA00A66DE1000000000000000000000000000000
      000000000000EF423100F7948C00000000000000000000000000F7B5AD00EF18
      0000F7948C00FFEFEF0000000000000000000000000000000000000000000000
      000000000000DEDEF7008C8CE7002121D6000000CE000000CE003131D6004242
      DE004242DE004242DE004242DE00ADADEF000000000000000000FCE0DD00F154
      4400EC160000FAC1BB00F6928800ED261100F69288000000000000000000F9B1
      AA00EC160000EC160000F5837700FBD0CC000000000000000000EBDEF800924C
      DA006B0BCD00D8BEF200BA8DE800751BD000BA8DE8000000000000000000CEAE
      EE006B0BCD006B0BCD00B07DE400E1CEF5000000000000000000000000000000
      0000FFDEDE00EF180000EF423100EF180000EF524200EF524200EF524200EF18
      0000EF291000FFDEDE0000000000000000008C8CE7000000CE006363E7008C8C
      E7005252DE001010D6003131D6004242DE00CECEF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EC160000F9B1AA0000000000FBD0CC00ED261100F6928800FCE0DD00ED26
      1100F0453300FCE0DD0000000000000000000000000000000000000000000000
      00006B0BCD00CEAEEE0000000000E1CEF500751BD000BA8DE800EBDEF800751B
      D000893CD700EBDEF80000000000000000000000000000000000000000000000
      0000FFDEDE00F7847300000000000000000000000000FFCECE00F7A59C00F794
      8C00FFDEDE00000000000000000000000000CECEF700BDBDEF008C8CE7000000
      CE009C9CEF00000000005252DE000000CE008C8CE70000000000000000000000
      0000CECEF700000000000000000000000000FAC1BB00EC160000EF352200FBD0
      CC00EF352200F69288000000000000000000F6928800EC160000F0453300F264
      5500FEEFEE00000000000000000000000000D8BEF2006B0BCD007F2CD400E1CE
      F5007F2CD400BA8DE8000000000000000000BA8DE8006B0BCD00893CD7009C5C
      DE00F5EFFC000000000000000000000000000000000000000000000000000000
      0000F7948C00EF312100F7948C00F7948C00F7948C00F7948C00F7A59C00F7BD
      BD00F7BDBD00F7BDBD0000000000000000000000000000000000CECEF7001010
      D60000000000000000008C8CE7002121D6002121D6006363E700DEDEF7004242
      DE000000CE00000000000000000000000000FCE0DD00F7A29900EF352200ED26
      1100EF352200ED261100EC160000F1544400F2645500EC160000F0453300FBD0
      CC0000000000000000000000000000000000EBDEF800C49DEB007F2CD400751B
      D0007F2CD400751BD0006B0BCD00924CDA009C5CDE006B0BCD00893CD700E1CE
      F500000000000000000000000000000000000000000000000000000000000000
      0000F7A59C00EF180000F7BDBD00F7BDBD00F7948C00EF180000EF423100EF52
      4200EF524200F7847300000000000000000000000000000000008C8CE7004242
      DE000000000000000000BDBDEF004242DE00000000004242DE001010D6001010
      D600ADADEF000000000000000000000000000000000000000000FEEFEE00F583
      7700EC160000F583770000000000F5837700F4736600F0453300ED261100F045
      3300EC160000EC160000EC160000F9B1AA000000000000000000F5EFFC00B07D
      E4006B0BCD00B07DE40000000000B07DE400A66DE100893CD700751BD000893C
      D7006B0BCD006B0BCD006B0BCD00CEAEEE0000000000F7BDBD00000000000000
      0000F7BDBD00EF180000F7BDBD00EF524200F7847300EF180000F7948C00F7BD
      BD000000000000000000000000000000000000000000000000008C8CE7003131
      D6000000000000000000BDBDEF004242DE008C8CE7002121D6008C8CE700EFEF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F1544400EC160000F9B1AA00F0453300F6928800F6928800F1544400FAC1
      BB00EC160000FCE0DD0000000000000000000000000000000000000000000000
      0000924CDA006B0BCD00CEAEEE00893CD700BA8DE800BA8DE800924CDA00D8BE
      F2006B0BCD00EBDEF800000000000000000000000000F7736300EF524200FFDE
      DE00F7BDBD00EF180000FFEFEF00F7BDBD00F7A59C00EF180000EF423100EF52
      4200F78473000000000000000000000000009C9CEF004242DE002121D6000000
      CE009C9CEF0000000000BDBDEF002121D600EFEFFF009C9CEF002121D6002121
      D6007373E700EFEFFF0000000000000000000000000000000000FAC1BB00FEEF
      EE00F1544400F6928800FCE0DD00EC160000F6928800F4736600F26455000000
      0000EC160000F692880000000000000000000000000000000000D8BEF200F5EF
      FC00924CDA00BA8DE800EBDEF8006B0BCD00BA8DE800A66DE1009C5CDE000000
      00006B0BCD00BA8DE80000000000000000000000000000000000F7736300EF29
      1000F7948C00EF180000F7B5AD00F7948C00F7948C00EF180000F7948C00FFDE
      DE000000000000000000000000000000000000000000DEDEF7008C8CE7001010
      D6009C9CEF0000000000BDBDEF000000CE004242DE001010D6003131D6008C8C
      E7001010D600DEDEF700000000000000000000000000F9B1AA00F0453300EC16
      0000EC160000F1544400F9B1AA00FAC1BB00F6928800F5837700EC160000F154
      4400EC160000F2645500000000000000000000000000CEAEEE00893CD7006B0B
      CD006B0BCD00924CDA00CEAEEE00D8BEF200BA8DE800B07DE4006B0BCD00924C
      DA006B0BCD009C5CDE000000000000000000000000000000000000000000F773
      6300EF180000EF291000FFDEDE00F7BDBD00F7A59C00EF180000EF423100EF52
      4200F78473000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDEF000000CE00CECEF700000000000000CE00BDBD
      EF0000000000000000000000000000000000000000000000000000000000FEEF
      EE00F0453300F1544400F6928800F9B1AA00F583770000000000F1544400F264
      5500FAC1BB00FEEFEE000000000000000000000000000000000000000000F5EF
      FC00893CD700924CDA00BA8DE800CEAEEE00B07DE40000000000924CDA009C5C
      DE00D8BEF200F5EFFC000000000000000000000000000000000000000000FFEF
      EF00EF423100EF312100F7948C00EF524200F7847300EF180000F7948C00FFCE
      CE0000000000000000000000000000000000000000000000000000000000CECE
      F7004242DE0000000000BDBDEF000000CE005252DE004242DE001010D6007373
      E700000000000000000000000000000000000000000000000000000000000000
      0000F1544400F692880000000000FEEFEE00ED261100F5837700F6928800EC16
      0000F47366000000000000000000000000000000000000000000000000000000
      0000924CDA00BA8DE80000000000F5EFFC00751BD000B07DE400BA8DE8006B0B
      CD00A66DE1000000000000000000000000000000000000000000000000000000
      0000FFCECE00EF180000EF635200F7BDBD00F7A59C00F7736300EF524200EF18
      0000EF291000FFDEDE00000000000000000000000000000000009C9CEF000000
      CE001010D600000000008C8CE7000000CE00BDBDEF00000000004242DE002121
      D600DEDEF7000000000000000000000000000000000000000000000000000000
      0000F0453300F69288000000000000000000F7A29900EC160000EF352200ED26
      1100ED2611000000000000000000000000000000000000000000000000000000
      0000893CD700BA8DE8000000000000000000C49DEB006B0BCD007F2CD400751B
      D000751BD0000000000000000000000000000000000000000000000000000000
      000000000000F7736300EF1800000000000000000000F7A59C00EF1800000000
      0000000000000000000000000000000000000000000000000000CECEF700BDBD
      EF00EFEFFF0000000000BDBDEF008C8CE7006363E7001010D6000000CE001010
      D600DEDEF700000000000000000000000000000000000000000000000000FEEF
      EE00EC160000F2645500000000000000000000000000EC160000F47366000000
      000000000000000000000000000000000000000000000000000000000000F5EF
      FC006B0BCD009C5CDE000000000000000000000000006B0BCD00A66DE1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7BDBD00F7B5AD0000000000F7B5AD00EF180000EF6352000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDEF00EFEF
      FF0000000000000000000000000000000000000000000000000000000000FEEF
      EE00FAC1BB00FEEFEE00000000000000000000000000F6928800FEEFEE000000
      000000000000000000000000000000000000000000000000000000000000F5EF
      FC00D8BEF200F5EFFC00000000000000000000000000BA8DE800F5EFFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFEBF00000000
      FFFF800000000000FFFF800000000000FFFF8000000000008001800000000000
      8001800000000000C003800000000000E007800000000000F00F800000000000
      F81F800100000000FC3FE00700000000FE7FF00F00000000FFFFF01F00000000
      FFFFFC3F00000000FFFFFD7F00000000FFFF87FF87FFFFFFFF0180038003FFFF
      F800F307F307FFFF007FF03FF03FFFFF0477F13FF13FFFFFCC07F01FF01FFE7F
      CC87001F001FFC3FCC0F80018001F81F0403C081C081F00F8403F00FF00FE007
      FC4FC03FC03FC003E40FC00FC00F8001C447FC0FFC0F8001C407FCFFFCFFFFFF
      FFCFFC7FFC7FFFFFFFFFFFFFFFFFFFFFF81FFFFFF7FFF7FFF807FF01E0F0E0F0
      F9C3F800C060C060F003007FF203F203F387047703070307F003CC07000F000F
      F003CC87C200C200B00FCC0FF003F00380070403C013C013C00F840380038003
      E007FC4FE043E043E00FE40FF207F207F003C447F307F307F99FC407E39FE39F
      F91FFFCFE39FE39FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    AutoPopup = False
    Images = ImageList2
    Left = 528
    Top = 8
    object CancelMark: TMenuItem
      Action = DoCancel
    end
  end
  object ActionList1: TActionList
    Images = ImageList2
    Left = 560
    Top = 8
    object DoCancel: TAction
      Caption = #36864#36135#25805#20316
      Enabled = False
      ImageIndex = 1
      OnExecute = DoCancelExecute
    end
    object Search: TAction
      Caption = #24320#22987#26597#25214'(F3)'
      ImageIndex = 6
      ShortCut = 114
      OnExecute = SearchExecute
    end
    object SearchAll: TAction
      Caption = #25152#26377#29289#21697'(F4)'
      ImageIndex = 5
      ShortCut = 115
      OnExecute = SearchAllExecute
    end
    object SetChange: TAction
      Caption = #26152#26085#24211#23384#20313#39069
      ImageIndex = 9
      OnExecute = SetChangeExecute
    end
    object ShowSell: TAction
      Caption = 'ShowSell'
      ShortCut = 120
      OnExecute = ShowSellExecute
    end
    object ShowSellList: TAction
      Caption = 'ShowSellList'
      ShortCut = 121
      OnExecute = ShowSellListExecute
    end
    object ShowSearch: TAction
      Caption = 'ShowSearch'
      ShortCut = 122
      OnExecute = ShowSearchExecute
    end
  end
  object DutyTimer: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = DutyTimerTimer
    Left = 592
    Top = 8
  end
  object TimerDownload: TTimer
    Interval = 300000
    OnTimer = TimerDownloadTimer
    Left = 624
    Top = 8
  end
end
