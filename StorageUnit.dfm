object StorageForm: TStorageForm
  Left = 372
  Top = 128
  Width = 755
  Height = 547
  Caption = #24211#23384#31649#29702
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object title: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Caption = #24211#23384#31649#29702
    Color = 13339492
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -33
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 75
    Width = 739
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ListPage: TPageControl
      Left = 0
      Top = 0
      Width = 739
      Height = 434
      ActivePage = ChangePriceSheet
      Align = alClient
      Images = ImageList1
      MultiLine = True
      Style = tsFlatButtons
      TabIndex = 4
      TabOrder = 0
      object GoodsSheet: TTabSheet
        Caption = #21830#21697#20998#32452
        ImageIndex = 20
        object Splitter1: TSplitter
          Left = 185
          Top = 0
          Width = 3
          Height = 402
          Cursor = crHSplit
          AutoSnap = False
        end
        inline GoodsFrame1: TGoodsFrame
          Left = 188
          Top = 0
          Width = 543
          Height = 402
          Align = alClient
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          inherited CoolBar1: TCoolBar
            Width = 543
            Bands = <
              item
                Control = GoodsFrame1.ToolBar5
                ImageIndex = -1
                MinHeight = 22
                Width = 539
              end>
            inherited ToolBar5: TToolBar
              Width = 526
            end
          end
          inherited Info1: TPanel
            Width = 543
          end
          inherited GoodsGrid: TDBGrid
            Width = 543
            Height = 355
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
          end
          inherited ActionList1: TActionList
            Top = 104
          end
          inherited ImageList1: TImageList
            Top = 104
          end
          inherited PopupMenu1: TPopupMenu
            Top = 104
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 402
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 185
            Height = 21
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = #21830#21697#20998#31867#21450#31649#29702
            Color = 13339492
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object GoodTypeTree: TTreeView
            Left = 0
            Top = 21
            Width = 185
            Height = 381
            Align = alClient
            Ctl3D = True
            DragMode = dmAutomatic
            HideSelection = False
            Images = ImageList1
            Indent = 25
            ParentCtl3D = False
            PopupMenu = PopupMenu1
            ReadOnly = True
            RightClickSelect = True
            TabOrder = 1
            OnChange = GoodTypeTreeChange
            OnContextPopup = GoodTypeTreeContextPopup
            OnCustomDrawItem = GoodTypeTreeCustomDrawItem
            OnDragDrop = GoodTypeTreeDragDrop
            OnDragOver = GoodTypeTreeDragOver
          end
        end
      end
      object SearchSheet: TTabSheet
        Caption = #21830#21697#26597#25214
        ImageIndex = 28
        OnShow = SearchSheetShow
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 731
          Height = 73
          Align = alTop
          Caption = #26597#35810#26465#20214
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Label2: TLabel
            Left = 336
            Top = 19
            Width = 24
            Height = 12
            Caption = #36135#21495
          end
          object Label4: TLabel
            Left = 480
            Top = 19
            Width = 36
            Height = 12
            Caption = #24211#23384#37327
          end
          object Label5: TLabel
            Left = 16
            Top = 19
            Width = 24
            Height = 12
            Caption = #26465#30721
          end
          object Label7: TLabel
            Left = 152
            Top = 19
            Width = 24
            Height = 12
            Caption = #21697#21517
          end
          object sGoodName: TEdit
            Left = 152
            Top = 35
            Width = 169
            Height = 18
            MaxLength = 255
            TabOrder = 0
            Text = 'sGoodName'
            OnKeyPress = sGoodNameKeyPress
          end
          object sGoodCode: TEdit
            Left = 336
            Top = 35
            Width = 129
            Height = 18
            MaxLength = 255
            TabOrder = 1
            Text = 'sGoodCode'
            OnKeyPress = sGoodNameKeyPress
          end
          object sNumber: TEdit
            Left = 480
            Top = 35
            Width = 81
            Height = 18
            MaxLength = 5
            TabOrder = 2
            Text = 'sNumber'
            OnKeyPress = sNumberKeyPress
          end
          object sBarCode: TEdit
            Left = 16
            Top = 35
            Width = 121
            Height = 18
            MaxLength = 13
            TabOrder = 3
            Text = 'sBarCode'
            OnKeyPress = sNumberKeyPress
          end
        end
        inline GoodsFrame2: TGoodsFrame
          Left = 0
          Top = 73
          Width = 731
          Height = 329
          Align = alClient
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          inherited CoolBar1: TCoolBar
            Width = 731
            Bands = <
              item
                Control = GoodsFrame2.ToolBar5
                ImageIndex = -1
                MinHeight = 22
                Width = 727
              end>
            inherited ToolBar5: TToolBar
              Width = 714
            end
          end
          inherited Info1: TPanel
            Width = 731
          end
          inherited GoodsGrid: TDBGrid
            Width = 731
            Height = 282
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            Columns = <
              item
                Expanded = False
                FieldName = 'BARCODE'
                Title.Caption = #21830#21697#26465#30721
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Caption = #21697#21517
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GOODTYPE'
                Title.Caption = #21830#21697#31867#22411
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STORAGENUMBER'
                Title.Caption = #24211#23384#37327
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GOODNUMBER'
                Title.Caption = #36827#36135#37327
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COST'
                Title.Caption = #25104#26412
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LABELPRICE'
                Title.Caption = #38646#21806#20215
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOWESTPRICE'
                Title.Caption = #26368#20302#20215
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GOODCODE'
                Title.Caption = #36135#21495
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LABELPRINTED'
                Title.Caption = #26631#31614#37327
                Width = 45
                Visible = True
              end>
          end
        end
      end
      object BuySheet: TTabSheet
        Caption = #36827#36135#21333
        ImageIndex = 29
        OnShow = BuySheetShow
        object Splitter2: TSplitter
          Left = 0
          Top = 217
          Width = 731
          Height = 3
          Cursor = crVSplit
          Align = alTop
          AutoSnap = False
        end
        object CoolBar2: TCoolBar
          Left = 0
          Top = 0
          Width = 731
          Height = 26
          AutoSize = True
          BandBorderStyle = bsNone
          Bands = <
            item
              Control = ToolBar2
              ImageIndex = -1
              MinHeight = 22
              Width = 727
            end>
          Ctl3D = False
          object ToolBar2: TToolBar
            Left = 9
            Top = 0
            Width = 714
            Height = 22
            AutoSize = True
            ButtonWidth = 111
            Caption = 'ToolBar1'
            Ctl3D = True
            EdgeBorders = []
            Flat = True
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton3: TToolButton
              Left = 0
              Top = 0
              Action = NewIncoming
              AutoSize = True
            end
            object ToolButton13: TToolButton
              Left = 115
              Top = 0
              Action = NewIncoming2
            end
            object ToolButton1: TToolButton
              Left = 226
              Top = 0
              Action = EditIncoming
              AutoSize = True
            end
          end
        end
        object BuyGrid: TDBGrid
          Left = 0
          Top = 26
          Width = 731
          Height = 191
          Align = alTop
          DataSource = d.IncomingSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDblClick = EditIncomingExecute
          Columns = <
            item
              Expanded = False
              FieldName = 'IDX'
              Title.Caption = #32534#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCOMINGDATE'
              Title.Caption = #36827#36135#26102#38388
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #36827#36135#21333#21517#31216
              Width = 187
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALCOST'
              Title.Caption = #24635#20215
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALNUMBER'
              Title.Caption = #24635#37327
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESP'
              Title.Caption = #25551#36848
              Width = 232
              Visible = True
            end>
        end
        object IncomingGoodGrid: TDBGrid
          Left = 0
          Top = 220
          Width = 731
          Height = 182
          Align = alClient
          DataSource = d.IncomingGoodSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'BARCODE'
              Title.Caption = #26465#30721
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #21697#21517
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATTRIB'
              Title.Caption = #21830#21697#23646#24615
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STORAGENUMBER'
              Title.Caption = #36827#36135#37327
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COST'
              Title.Caption = #25104#26412#20215
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCOMINGTIME'
              Title.Caption = #36827#36135#26102#38388
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOODNUMBER'
              Title.Caption = #24211#23384#25968#37327
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABELPRICE'
              Title.Caption = #26631#20215
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOWESTPRICE'
              Title.Caption = #26368#20302#20215
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOODCODE'
              Title.Caption = #36135#21495
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABELPRINTED'
              Title.Caption = #26631#31614#25171#21360
              Visible = True
            end>
        end
      end
      object SellSheet: TTabSheet
        Caption = #21806#36135#21333
        ImageIndex = 22
        OnShow = SellSheetShow
        object Splitter3: TSplitter
          Left = 0
          Top = 241
          Width = 731
          Height = 3
          Cursor = crVSplit
          Align = alTop
          AutoSnap = False
        end
        object Splitter5: TSplitter
          Left = 0
          Top = 309
          Width = 731
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          AutoSnap = False
        end
        object CoolBar4: TCoolBar
          Left = 0
          Top = 0
          Width = 731
          Height = 26
          AutoSize = True
          BandBorderStyle = bsNone
          Bands = <
            item
              Control = ToolBar4
              ImageIndex = -1
              MinHeight = 22
              Width = 727
            end>
          Ctl3D = False
          object ToolBar4: TToolBar
            Left = 9
            Top = 0
            Width = 714
            Height = 22
            AutoSize = True
            ButtonHeight = 18
            ButtonWidth = 18
            Caption = 'ToolBar1'
            EdgeBorders = []
            Flat = True
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object Label1: TLabel
              Left = 0
              Top = 0
              Width = 96
              Height = 12
              Caption = #36873#25321#21806#36135#21333#26085#26399': '
              Layout = tlCenter
            end
            object SellDate: TDateTimePicker
              Left = 96
              Top = 0
              Width = 127
              Height = 22
              CalAlignment = dtaLeft
              Date = 38590.9122931019
              Format = 'yyyy'#24180'MM'#26376'dd'#26085
              Time = 38590.9122931019
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 0
              OnCloseUp = SellDateCloseUp
            end
            object ToolButton5: TToolButton
              Left = 223
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              Style = tbsSeparator
            end
            object ToolButton6: TToolButton
              Left = 231
              Top = 0
              Action = DayCalc
              AutoSize = True
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 312
          Width = 731
          Height = 90
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter6: TSplitter
            Left = 357
            Top = 0
            Width = 3
            Height = 90
            Cursor = crHSplit
            Align = alRight
            AutoSnap = False
          end
          object CancelGrid: TDBGrid
            Left = 0
            Top = 0
            Width = 357
            Height = 90
            Align = alClient
            DataSource = d.CancelGoodSource
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'BARCODE'
                Title.Caption = #26465#30721
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Caption = #24403#26085#36864#36135#29289#21697
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE'
                Title.Caption = #21806#20215
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LABELPRICE'
                Title.Caption = #26631#20215
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SELLTIME'
                Title.Caption = #21806#36135#26102#38388
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANCELDATE'
                Title.Caption = #36864#36135#26102#38388
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COUNTS'
                Title.Caption = #25968#37327
                Visible = True
              end>
          end
          object CashGrid: TDBGrid
            Left = 360
            Top = 0
            Width = 371
            Height = 90
            Align = alRight
            DataSource = d.CashSource
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Caption = #25910#25903#26126#32454
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TYPE'
                Title.Caption = #31867#22411
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COST'
                Title.Caption = #37329#39069
                Width = 67
                Visible = True
              end>
          end
        end
        object SellList: TDBGrid
          Left = 0
          Top = 26
          Width = 731
          Height = 215
          Align = alTop
          DataSource = d.SellSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDX'
              Title.Caption = #21333#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDERDATE'
              Title.Caption = #19979#21333#26085#26399
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALCOST'
              Title.Caption = #24635#25104#26412
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALPRICE'
              Title.Caption = #24635#33829#19994#39069
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALPROFIT'
              Title.Caption = #24635#27611#21033
              Width = 86
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Rate'
              Title.Caption = #27611#21033#29575
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALSELLNUM'
              Title.Caption = #21806#36135#37327
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALCANCELNUM'
              Title.Caption = #36864#36135#37327
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALCASH'
              Title.Caption = #24211#23384#29616#37329
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALINCOME'
              Title.Caption = #25910#20837#29616#37329
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALEXPENSES'
              Title.Caption = #25903#20986#29616#37329
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANKSAVE'
              Title.Caption = #38134#34892#23384#27454
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESP'
              Title.Caption = #25551#36848
              Visible = True
            end>
        end
        object SellGoodList: TDBGrid
          Left = 0
          Top = 244
          Width = 731
          Height = 65
          Align = alClient
          DataSource = d.SellGoodSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'BARCODE'
              Title.Caption = #26465#30721
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SELLTIME'
              Title.Caption = #38144#21806#26102#38388
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOODTYPE'
              Title.Caption = #21830#21697#31867#22411
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #21697#21517
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUNTS'
              Title.Caption = #38144#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Title.Caption = #21806#20215
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COST'
              Title.Caption = #25104#26412
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROFIT'
              Title.Caption = #27611#21033
              Width = 69
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'RATE'
              Title.Caption = #27611#21033#29575
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABELPRICE'
              Title.Caption = #26631#20215
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STORAGENUMBER'
              Title.Caption = #24211#23384
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOODCODE'
              Title.Caption = #36135#21495
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANCELDATE'
              Title.Caption = #36864#36135#26102#38388
              Visible = True
            end>
        end
      end
      object ChangePriceSheet: TTabSheet
        Caption = #35843#20215#21333
        ImageIndex = 50
        OnShow = ChangePriceSheetShow
        object Splitter7: TSplitter
          Left = 0
          Top = 209
          Width = 731
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object CoolBar5: TCoolBar
          Left = 0
          Top = 0
          Width = 731
          Height = 26
          AutoSize = True
          BandBorderStyle = bsNone
          Bands = <
            item
              Control = ToolBar7
              ImageIndex = -1
              MinHeight = 22
              Width = 727
            end>
          Ctl3D = False
          object ToolBar7: TToolBar
            Left = 9
            Top = 0
            Width = 714
            Height = 22
            AutoSize = True
            ButtonWidth = 87
            Caption = 'ToolBar1'
            EdgeBorders = []
            Flat = True
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton14: TToolButton
              Left = 0
              Top = 0
              Action = NewChangePrice
              AutoSize = True
            end
          end
        end
        object ChangeListGrid: TDBGrid
          Left = 0
          Top = 26
          Width = 731
          Height = 183
          Align = alTop
          Ctl3D = True
          DataSource = d.ChangePriceSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDX'
              Title.Caption = #21333#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHANGEDATE'
              Title.Caption = #24314#21333#26102#38388
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #21333#25454#21517#31216
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALNUMBER'
              Title.Caption = #35843#20215#21830#21697#24635#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESP'
              Title.Caption = #22791#27880
              Width = 200
              Visible = True
            end>
        end
        object ChangeGoodGrid: TDBGrid
          Left = 0
          Top = 212
          Width = 731
          Height = 190
          Align = alClient
          Ctl3D = True
          DataSource = d.ChangeGoodSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'BARCODE'
              Title.Caption = #21830#21697#26465#30721
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #21697#21517
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHANGETIME'
              Title.Caption = #35843#20215#26102#38388
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABELPRICE'
              Title.Caption = #29616#20215
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NEWPRICE'
              Title.Caption = #26032#20215#26684
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDPRICE'
              Title.Caption = #26087#20215#26684
              Width = 80
              Visible = True
            end>
        end
      end
      object CheckSheet: TTabSheet
        Caption = #30424#28857#21333
        ImageIndex = 24
        OnShow = CheckSheetShow
        object Splitter4: TSplitter
          Left = 0
          Top = 209
          Width = 731
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object CoolBar3: TCoolBar
          Left = 0
          Top = 0
          Width = 731
          Height = 26
          AutoSize = True
          BandBorderStyle = bsNone
          Bands = <
            item
              Control = ToolBar3
              ImageIndex = -1
              MinHeight = 22
              Width = 727
            end>
          Ctl3D = False
          object ToolBar3: TToolBar
            Left = 9
            Top = 0
            Width = 714
            Height = 22
            AutoSize = True
            ButtonWidth = 111
            Caption = 'ToolBar1'
            EdgeBorders = []
            Flat = True
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton4: TToolButton
              Left = 0
              Top = 0
              Action = NewCheck
              AutoSize = True
            end
          end
        end
        object CheckGoodGrid: TDBGrid
          Left = 0
          Top = 212
          Width = 731
          Height = 190
          Align = alClient
          Ctl3D = True
          DataSource = d.CheckGoodSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #21697#21517
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BARCODE'
              Title.Caption = #26465#30721
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCKNUMBER'
              Title.Caption = #21407#24211#23384#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMBER'
              Title.Caption = #30424#28857#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF'
              Title.Caption = #24046#20540
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALCOST'
              Title.Caption = #24046#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COST'
              Title.Caption = #21333#20215
              Visible = True
            end>
        end
        object CheckListGrid: TDBGrid
          Left = 0
          Top = 26
          Width = 731
          Height = 183
          Align = alTop
          Ctl3D = True
          DataSource = d.CheckListSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CHECKDATE'
              Title.Caption = #30424#28857#32467#26463#26085#26399
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALDIFF'
              Title.Caption = #24635#24046#20215
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESP'
              Title.Caption = #22791#27880
              Width = 200
              Visible = True
            end>
        end
      end
      object LoseSheet: TTabSheet
        Caption = #25253#25439#21333
        ImageIndex = 58
      end
      object PLabelSheet: TTabSheet
        Caption = #26631#31614#25171#21360
        ImageIndex = 5
        TabVisible = False
        OnShow = PLabelSheetShow
        object PrintList: TListView
          Left = 0
          Top = 26
          Width = 731
          Height = 376
          Align = alClient
          Columns = <
            item
              Caption = #21697#21517
              Width = 150
            end
            item
              Caption = #26631#20215
              Width = 60
            end
            item
              Caption = #26465#30721
              Width = 100
            end
            item
              Caption = #36827#36135#37327
              Width = 60
            end
            item
              Caption = #24211#23384
              Width = 60
            end
            item
              Caption = #26631#31614#25171#21360#37327
              Width = 80
            end>
          Ctl3D = False
          FlatScrollBars = True
          GridLines = True
          HideSelection = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          SmallImages = GoodsFrame1.ImageList1
          TabOrder = 0
          ViewStyle = vsReport
        end
        object CoolBar6: TCoolBar
          Left = 0
          Top = 0
          Width = 731
          Height = 26
          AutoSize = True
          BandBorderStyle = bsNone
          Bands = <
            item
              Control = ToolBar6
              ImageIndex = -1
              MinHeight = 22
              Width = 727
            end>
          Ctl3D = False
          object ToolBar6: TToolBar
            Left = 9
            Top = 0
            Width = 714
            Height = 22
            AutoSize = True
            ButtonWidth = 123
            Caption = 'ToolBar1'
            EdgeBorders = []
            Flat = True
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton8: TToolButton
              Left = 0
              Top = 0
              Action = ExportLabels
              AutoSize = True
            end
            object ToolButton10: TToolButton
              Left = 127
              Top = 0
              Action = EditPrint
              AutoSize = True
            end
            object ToolButton9: TToolButton
              Left = 242
              Top = 0
              Action = CancelPrint
              AutoSize = True
            end
            object ClearAllLabel: TToolButton
              Left = 345
              Top = 0
              AutoSize = True
              Caption = #28165#38500#20840#37096#26631#31614
              ImageIndex = 30
              OnClick = ClearAllLabelClick
            end
          end
        end
      end
      object AuditGoodSheet: TTabSheet
        Caption = #25163#24037#24211#23384#35843#25972#23457#35745
        ImageIndex = 21
        TabVisible = False
        OnShow = AuditGoodSheetShow
        object AuditGoodGrid: TDBGrid
          Left = 0
          Top = 24
          Width = 731
          Height = 376
          Align = alClient
          DataSource = d.AuditGoodSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'AUDITTIME'
              Title.Caption = #20462#25913#26102#38388
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME1'
              PopupMenu = PopupMenu3
              Title.Caption = #21407#21697#21517
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME2'
              PopupMenu = PopupMenu3
              Title.Caption = #26032#21697#21517
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOODNUMBER1'
              Title.Caption = #21407#36827#36135#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOODNUMBER2'
              Title.Caption = #26032#36827#36135#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STORAGENUMBER1'
              Title.Caption = #21407#24211#23384#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STORAGENUMBER2'
              Title.Caption = #26032#24211#23384#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COST1'
              Title.Caption = #21407#25104#26412#20215
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COST2'
              Title.Caption = #26032#25104#26412#20215
              Width = 80
              Visible = True
            end>
        end
        object ToolBar5: TToolBar
          Left = 0
          Top = 0
          Width = 731
          Height = 24
          AutoSize = True
          ButtonWidth = 99
          Caption = 'ToolBar5'
          Flat = True
          Images = ImageList2
          List = True
          ShowCaptions = True
          TabOrder = 1
          object ToolButton12: TToolButton
            Left = 0
            Top = 0
            Caption = #26597#30475#25152#26377#35760#24405
            ImageIndex = 6
            OnClick = ToolButton12Click
          end
        end
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 49
    Width = 739
    Height = 26
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 735
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 722
      Height = 22
      AutoSize = True
      ButtonWidth = 99
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = #31995#32479#35774#32622
        ImageIndex = 65
        OnClick = ToolButton2Click
      end
      object ToolButton11: TToolButton
        Left = 79
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 35
        Style = tbsSeparator
      end
      object ToolButton15: TToolButton
        Left = 87
        Top = 0
        Action = PrividerManage
        AutoSize = True
      end
      object ToolButton16: TToolButton
        Left = 178
        Top = 0
        Width = 8
        Caption = 'ToolButton16'
        ImageIndex = 35
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 186
        Top = 0
        Action = MonthSellStat
        AutoSize = True
      end
    end
  end
  object ImageList1: TImageList
    Left = 568
    Top = 32
    Bitmap = {
      494C01017C008100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001002000001002000000000000010
      0200000000000000000000000000000000000000000000000000000000000000
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
      000000000000FEFEFE01F3F3F30CEAEAEA15D6D6D629BFBFBF40BBBBBB44BBBB
      BB44C2C2C23DD6D6D629F2F2F20D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F8076C6C6C938A8A8A75576935F6819A4FFE84793BFE9F6B
      28FE603918F1383838C7D4D4D42B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C82B5001A80B300177D
      B000157BAE001278AB000F75A8000C72A5000A70A300076DA000056B9E000369
      9C0001679A0000669900666666006666660000000000000000001C7A9C001C7A
      9C001C7A9C001C7A9C001C7A9C001C7A9C001C7A9C001C7A9C001C7A9C001C7A
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000F3F3F30C95914DFF6F4D12FE94B563FF9CC07AFF9F9751FFAC79
      31FFAF611EFF46220FF28B8B8B74000000000000000000000000000000000000
      00000000000000000000000000005F76A400738EC200809DD700728CC9000000
      0000000000000000000000000000000000002187BA0066CCFF001F85B8000000
      00006ED4FF006ED4FF006ED4FF006ED4FF006ED4FF006ED4FF006ED4FF006ED4
      FF003AA0D300000000000066990066666600000000001C96C4001C96C4001C96
      C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96
      C4001C7A9C000000000000000000000000000000000000000000FEFEFE01F0F0
      F00FDCDCDC23CBCBCB34667A57EDA0712CFFA0CA7EFFB2DFA3FF9BA664FF9A7E
      39FF955D20FF622A06FF222222DD000000000000000000000000000000000000
      00001C1E20007882B2005C75BE0088A6E800A9C1F7009ABEFB0092B5FB006379
      A50000000000000000000000000000000000248ABD0066CCFF00268CBF000000
      00007AE0FF007AE0FF007AE0FF007AE0FF007AE0FF007AE0FF007AE0FF007AE0
      FF0043A9DC000000000001679A00666666001C96C4001C9AC4008CF2F4006CD6
      FC006CD6FC006CD6FC006CD6FC006CD6FC006CD6FC006CD6FC006CD6FC006CD6
      FC002C9ABC000C72A40000000000000000000000000000000000F0F0F00F9355
      3FD3274F92FF2885FFFF1E1C7DFFC2F7C5FFA0C477FFB9F6C0FF97B379FF877A
      3BFF6F4E1AFF974D10FD86868679000000000000000000000000000000000708
      09000D0D10005C75BE007C9AF90089B0FD006276F5004048FA003941FB0087A7
      F80000000000000000000000000000000000278DC00066CCFF002C92C5000000
      000085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EBFF0085EB
      FF004DB3E6000000000003699C00666666001C9AC4001C9EC4007CE6F40094FA
      FC007CE6F4007CDEFC007CE6F4007CDEFC007CE6F4007CDEFC007CE6F4007CDE
      FC0024A2CC000C72A400000000000000000000000000FCFCFC03AAD9F2BD1756
      F5FFFFD66FFFFFDC9BFFFFFFC3FF92927FFF646F4EFFACEEC6FF7FB58FFF6377
      47FF46341BF86464649BDFDFDF20000000000000000000000000000000003D3D
      3D002A293A006F8BE3007CA6FC008DBAFD009EC5FD00749CF30085A9F5009ABE
      FB0077819500000000000000000000000000298FC20066CCFF003298CB000000
      000091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7
      FF0056BCEF0000000000056B9E00666666001C9AC40024A2CC003CBAD4009CFE
      FC0084EAFC0084EAFC0084EAFC0084EAFC0084EAFC0084EAFC0084EAFC0084E6
      FC0044BAEC000C72A400000000000000000000000000F2F2F20D006DFFFFFFD1
      6BFFFFDEBCFFFFDAAFFFFFF7D9FFFFFCECFFDE8D52FF7A9273FF565D3AFF4051
      37FF004BF7FF705126FFB7B7B7480000000000000000000000000000000088A9
      EE0087A7F8007493F20089B0FD009EC5FD008DBAFD009EC5FD00A6C7FD009EC5
      FD007A92CA000000000000000000000000002C92C5006ED4FF003399CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005FC5F80000000000076DA000666666001C9AC40044B2E40024A2CC009CFE
      FC0094FAFC008CF2FC0094FAFC008CF2FC0094FAFC008CF2FC0094F6FC0094F6
      FC0054BEE4005CBECC000C72A4000000000000000000E1E1E11E8B8284FFFFE8
      B1FFF8D6AAFFFFF2D6FFFFFAF7FFE3B29CFFA9A476FF3E4909FF7E4F1BFF802C
      01FFB3B3B3FF0695FFFF725C41FF000000000000000000000000000000006997
      E90085A7FE006F8CD3009ABEFB009DBDE90089B4FD0087A7F80086B6FD00A1C3
      F50088A9EE000000000000000000000000002E94C7007AE0FF002C92C500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080E6FF00FFFFFF000A70A300666666001C9AC4006CD6FC001C9AC40084EA
      FC009CFEFC009CFEFC009CFEFC009CFEFC009CFEFC009CFEFC009CFEFC009CFE
      FC005CC6FC0094F6FC000C72A40000000000FBFBFB0467ACFCF5FFA700FFFFFF
      FFFFFFF1E4FFFFFFFFFFFFFFFFFFEC9665FF3F3D2FFF9CC378FFA79F5AFFB761
      18FF373331FF008732FF705998FF00000000000000000000000000000000749C
      F30061759F0089ABF50080A2F1009199D8006D8EF30085A9F50086B2F600868D
      B8006B85D9000000000000000000000000003096C90085EBFF0080E6FF002C92
      C5002C92C5002C92C5002C92C5002C92C5002C92C500278DC0002389BC001F85
      B8001B81B4001A80B3001A80B300000000001C9AC40084D6FC001C9EC4006CBE
      DC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00FCFE
      FC0084E6FC00FCFEFC000C72A40000000000EEEEEE1100A1F9FFB8EEEFFFFFFF
      F6FFFFF5E4FFFFFFFFFFEBDBDDFFEDAE71FF565248FFB3E6A6FF8DC89BFF716A
      30FF5F5F5FFF00A155FFBBB8B74F000000000000000000000000000000003E4A
      5C000D0D10003847660083A2D100485677007FA5E1009EC5FD009EC5FD007295
      D0006176B8000000000000000000000000003298CB0091F7FF008EF4FF008EF4
      FF008EF4FF008EF4FF008EF4FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00157BAE006666660000000000000000001C9AC40084EAFC004CC2E4001C9A
      C4001C9AC4001C9AC4001C9AC4001C9AC4001C9AC4001C9AC4001C9AC4001C9A
      C4001C9AC4001C9AC4000C72A40000000000BDB1F2AE0088D3FFFFFFFFFFFFE6
      C5FFFFFCF8FFFFFFFFFFE49C6FFFF7D09EFFFFF1D3FF686460FF333333FF5353
      53FF50A1F9FF677FC3FFE1E1E11E000000000000000000000000000000000000
      00000708090000000000232B3900A6C7FD009EC5FD009EC5FD00A6C7FD009DBD
      E900283144004444440000000000000000003399CC00FFFFFF00000000000000
      00000000000000000000FFFFFF00248ABD002187BA001E84B7001C82B5001A80
      B300177DB0000000000000000000000000001C9AC4008CF2FC008CF2FC008CF2
      FC008CF2FC008CF2FC008CF2FC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00F4FA
      FC001C9AC4001C7A9C00000000000000000053AFFFFF41B100FFFFFFFFFFFFFF
      F5FFFFFFFEFFE6EBF6FFFFB34CFFFFE8C0FFFFFFFBFFFFFDFCFFFFFDFDFFFFFF
      FFFF0091FFFFAFA9A365F4F4F40B000000000000000000000000000000001E1D
      24000000000000000000000000009EC5FD009EC5FD009EC5FD00ACD0FD005868
      7E002C2C2C00000000000000000000000000000000003399CC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00298FC200000000000000000000000000000000000000
      0000000000000000000000000000000000001C9AC400FCFEFC009CFEFC009CFE
      FC009CFEFC009CFEFC00FCFEFC001C9AC4001C9AC4001C9AC4001C9AC4001C9E
      C4001C9AC4000000000000000000000000000095E9FFFFFFAFFFFDFFFFFF70A7
      FFFF9BB6EB71EEEEEE11A1C4F46BA7BEF0FFFFFFFFFFFFFFFFFFFFFFFFFF8ACE
      FFFF6088A9FFDEDEDE21FEFEFE01000000000000000000000000000000003333
      3300000000000505050000000000222A370099BCF60081888E00D3E8FB000000
      00003939390000000000000000000000000000000000000000003399CC003298
      CB003096C9002E94C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000024A2CC00FCFEFC00FCFE
      FC00FCFEFC00FCFEFC001C9AC400000000000000000000000000000000000000
      000000000000000000000000000000000000379EFFFF74A0F3B2EEEEEE11FAFA
      FA05000000000000000000000000FBFBFB04569FF9BEFFFFFFFFFFFFFFFF00AA
      FFFFADA59E67F3F3F30C00000000000000000000000000000000000000000000
      000009090900161616001616160009090900000000003E454C000E1013005151
      5100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024A2CC0024A2
      CC0024A2CC0024A2CC0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01FEFEFE01000000000000
      00000000000000000000000000000000000000000000F6F6F60932B1FFFF6884
      AFFFE4E4E41BFDFDFD0200000000000000000000000000000000000000000000
      0000757575000000000016161600333333000708090016161600070809000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC03F8F8
      F807FDFDFD020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000005242420052424200524242005242420052424200524242000000
      00000000000000000000000000000000000000000000000000002C7A94002C7A
      94002C7A94002C7A94002C7A94002C7A94002C7A94002C7A94002C7A94002C7A
      94002C7A94002C7A94002C7A9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008080800080808000000000000000000000000000B58C
      7B00B5948400F7E7D600EFE7DE00EFE7DE00F7E7DE00F7E7D600BDA59C005242
      420052424200000000000000000000000000000000001C86AC001C96C4001C96
      C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96
      C4001C96C4001C96C4001C96C4002C7A94000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000808080000000
      0000000000000000000000000000000000000080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000808080000000000000000000BDA59C00F7E7
      DE00FFF7F700E7DED600DEB59C00D6A58C00E7C6BD00EFEFEF00F7F7F700F7E7
      D600E7CEBD005242420000000000000000001C96C40064CAFC001C96C40094F6
      FC006CD6FC006CD6FC006CD6FC006CD6FC006CD2FC006CD2FC006CD6FC006CD2
      FC0034AED40094F6FC001C96C4002C7A94000000000000000000000000000000
      0000000000000000000000000000C0C0C000FFFFFF0000000000808080008080
      8000000000000000000000000000000000000080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000008080800000000000BDA59C00F7EFE700FFFF
      FF00C68C7300BD5A2900BD5A2900DEB59C00BD5A2900BD5A2900D69C8400F7F7
      F700F7E7DE00D6C6BD0052424200000000001C96C40064CAFC001C96C4009CFE
      FC007CE6FC004CBEE40054BADC004CBEE40054BADC004CBEE40054BADC004CBE
      E40044B2DC009CFEFC001C96C4002C7A94000000000000000000000000000000
      000000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000000000000000
      0000808080008080800000000000000000000080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080808000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000BDA59C00FFFFFF00CE6B
      4200BD5A2900BD5A2900C6A59400FFFFFF00E7845200BD5A2900BD5A2900D694
      7300FFFFF700F7E7D60052424200000000001C96C40064CAFC001C96C4009CFE
      FC007C92A4007C92A4007C92A4007C92A4007C92A4007C92A4007C92A4007C92
      A4007C92A4007C92A4001C96C4002C7A9400000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000808080008080800000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000BF41410000000000BDA59C00FFFFFF00DE9C7B00BD5A
      2900CE633100CE633100CE6B3900D68C6300CE633100CE633100BD5A2900BD5A
      2900E7CEBD00F7EFEF00DECEC600524242001C96C40064CAFC001C96C4009CFE
      FC007C92A400F4FEFC00F4FEFC00E4EAEC00E4F6FC00E4F6FC00E4F6FC00E4EA
      EC00E4EEFC007C92A4001C96C4002C7A94000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00C0C0C000000000008080800000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000D6C6BD00FFF7F700C6633100BD5A
      2900CE633100BD5A2900CE846300F7E7DE00D66B3900BD5A2900CE633100BD5A
      2900CE734200FFFFFF00E7CEBD00524242001C96C4006CD6FC001C96C4009CFE
      FC007C92A400F4FEFC00FCC68400FCC27C00FCC27C00FCC27C00FCC27C00FCC2
      7C00E4F6FC007C92A4001C96C4002C7A940080808000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000000000008080800000000000000000000080800000FF
      FF0000FFFF0000FFFF0000808000000000000080800000FFFF0000FFFF0000FF
      FF0000000000BF4141000000000000000000D6C6BD00F7DED600BD5A2900CE63
      3100CE633100BD5A2900D6845200FFFFFF00E7AD9400BD5A2900BD5A2900CE63
      3100BD5A2900FFEFEF00F7DED600524242001C96C40084DAFC001C96C400FCFA
      FC00D4D2D400FCFAFC00FCE6CC00FCE2BC00FCE6CC00FCE2BC00FCE6CC00FCE6
      CC00E4EEFC00CCCECC001C96C4002C7A940080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000008080800000000000000000000080800000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000D6C6BD00F7D6CE00CE633100CE63
      3100CE633100CE633100BD5A2900DEAD9400FFF7F700EF9C7300BD5A2900CE63
      3100BD5A2900F7F7EF00EFE7DE005242420024A6CC008CEAFC001C96C4001C96
      C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96C4001C96
      C4001C96C4001C96C4001C96C4000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000000000000080
      800000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF000000
      000080808000000000000000000000000000D6C6BD00FFEFE700D66B3900CE63
      3100CE633100BD5A2900BD5A2900BD5A2900E7CEC600FFFFFF00D66B3900CE63
      3100CE6B3900FFFFFF00F7DED6005242420024A6CC0094F6FC008CF2FC008CF2
      FC009CA6A400FCFEFC00A47E6C00ACBAFC00BCC6FC006486FC005476FC00A47E
      6C00E4F6FC009C969400747274000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000000000000080
      800000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000000000D6C6BD00FFFFFF00F79C6B00D66B
      3900CE8C6B00F7EFE700D6845200BD5A2900D6947300FFFFFF00E78C5A00BD5A
      2900EF946300FFFFFF00D6C6BD005242420024A6CC00F4FEFC009CFAFC009CFE
      FC009CA6A400FCFEFC00A47E6C00FCFEFC00FCFEFC006486FC006486FC00A47E
      6C00FCFEFC009C969400747274000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      00000080800000FFFF0000FFFF000000000000FFFF0000FFFF00000000008080
      80000000000000000000000000000000000000000000D6C6BD00FFEFDE00EF84
      5200E7845200F7F7F700FFFFFF00DEBDAD00FFFFFF00F7F7F700DE734200D673
      3900FFF7EF00F7E7E70052424200000000000000000024A6CC00FCFAFC00FCFA
      FC00B4AEAC00FCFAFC00A47E6C0094AAFC00FCFEFC00ACBAFC0094AAFC00A47E
      6C00FCFEFC009C96940074727400000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000080808000000000000000000000000000000000000000
      00000080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000D6C6BD00FFFFFF00FFEF
      D600FFAD7300EFAD8C00EFE7DE00EFEFEF00F7E7E700FFA57B00F78C5A00F7DE
      CE00FFFFFF00D6C6BD000000000000000000000000000000000024A6CC0024A6
      CC00B4AEAC00FCFEFC00FCA21400A47E6C00A47E6C00A47E6C00A47E6C00FCA2
      1C00FCFAFC009C96940074727400000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000000000808080000000
      0000000000000000000000000000000000000000000000000000D6C6BD00FFFF
      FF00FFFFFF00FFF7C600FFDEAD00FFD69C00FFC69400FFD6AD00FFFFFF00FFFF
      FF00D6C6BD000000000000000000000000000000000000000000000000000000
      0000B4AEAC00FCFAFC00FC9E0C00FC9E0C00FC9E0C00FC9E0C00FC9E0C00FC9E
      0C00FCFEF4009C96940074727400000000000000000000000000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6C6
      BD00D6C6BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DECEC600D6C6
      BD000000000000000000000000000000000000000000BCBABC00000000000000
      0000BCBABC00FCFAFC00FCFAFC00FCFAFC00F4F6FC00FCFAFC00FCFAFC00FCFA
      FC00FCFAFC009C96940074727400000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DECEC600D6C6BD00D6C6BD00D6C6BD00D6C6BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BCBABC00BCBABC00B4AEAC00B4AEAC00B4AEAC00A4A6A4009CA6A4009C96
      94009C9694009C96940000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600848484008484
      840084848400848484008484840084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000000
      0000008484000084840000848400000000000000000000000000000000000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000084840000848400008484000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400C6C6C600FFFFFF0000840000C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF0000FF0000C6C6
      C60084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000084840000848400008484000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000084
      8400008484000084840000848400000000000000000000000000000000000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60084848400848484008484
      8400848484008484840084848400000000000000000000000000008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000C7862800E5941E00C396
      5700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000000000000000000000000000E5941E004D4D4D00000000000000
      0000B08F6300B46C1E00BB5F2200B75B2500B3552B00A33C0D004D4D4D000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000FFFF008080800000FFFF0080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084000000848484000000000000000000FBA016004D4D4D0000000000C586
      2A00BC583000B64F2A0091634300AF482000B64F2A00C55F4200D36D57007F2B
      0A000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080008080
      8000FFFF0000FFFF0000C0C0C000808080000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000840000000000000000000000FFB03300B17E3B00C97F1700A33C
      0D00993300009933000037661B00983602009933000099330000AF482000BE58
      39007F2B0A0000000000000000000000000000000000FFFF0000FFFF0000FFFF
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      800080808000FFFF0000C0C0C000808080000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000000000000FFB43C0099330000A43E
      0000B04A0000B44D0100415D030000670000B44D0100AA4300009C3600009C36
      0500AE655500622F1900000000000000000000000000FFFF0000FFFF000000FF
      FF0000FFFF00FFFF000000FFFF008080800000FFFF008080800000FFFF0000FF
      FF0080808000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000000000000FFBD4C00D06F1C00BA54
      0000C5600000CC660000007B00000176000045760000C25B0000B44D0100A43E
      000071663800A1501C004D4D4D000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000FFFF008080800000FFFF008080800000FFFF0000FF
      FF0080808000FFFF0000C0C0C000808080000000000000000000C6C6C6008484
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000000000000E4923000FDC26B00CC66
      0000D8720000E07A0000008600002E840000D8720000D16A0000376C00002462
      010037661B00716638004D4D4D000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF000000FFFF008080800000FFFF008080800000FFFF0000FF
      FF00808080008080800080808000808080000000000000000000C6C6C6008484
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000000000000C25B0000FFCB7E00F6B8
      64003B9401007498050074980500F48F0000EC860000B07F0000007B0000016F
      000008660400635719004D4D4D000000000000000000FFFF000000FFFF00FFFF
      0000FFFF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      80008080800080808000C0C0C000808080000000000000000000C6C6C6008484
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000000000000D16A0000E08B1B00FDD5
      960028B134001DB33400FFAA2600FFA41800FF990100F48F0000748900002C78
      000085630000236309004D4D4D000000000000000000FFFF000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FFFF00000000
      000000000000FFFF0000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000000000000EC860000E7810000ADCF
      8000FFE0B20058CE690039CD6900FED87E00FFB43C00FF990100EC8600001081
      0000016F0000246201004D4D4D000000000000000000FFFF0000FFFF000000FF
      FF0000FFFF008080800000FFFF008080800000FFFF0080808000FFFF0000FFFF
      000080808000FFFF0000C0C0C00000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000000000000E19624005BA31D002BC3
      5300EFE5BC00FFEED50063DA8200FFFDC800FFCB7400FBA01600F48F00004A85
      0000826C00008F6C1100000000000000000000000000000000000000000000FF
      FF0000FFFF008080800000FFFF008080800000FFFF00808080008080800000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000000000000000000000000000000000000000000063B8410033CB
      640063DA8200ECF5DC00FCFBEE00FFFDC80039CD6900ADAD2700D6960500E07A
      0000108100004D4D4D0000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF008080800000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      000084000000000000000000000000000000000000000000000000000000E29C
      0800A5C55800FED87E00EAF1BF00FFFCF90039CD69001EB73C00EC860000E07A
      0000B8925D000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000FBA01600E4B33300AECE6A0058CE6900EDE0AE007BBC4B00FBA01600B08F
      63000000000000000000C3A77E00000000000000000000000000000000000000
      0000000000000000000000FFFF008080800000FFFF0080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000E0A85400E2A23F00DBAC6600DBAC660000000000C4A4
      8000B9AFA500C2AA8C00C3A77E00000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DED4CE00CCCCCC00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600D8CDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006F6F6F006F6F6F006F6F6F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E1E100CFBFBF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700D8CDC500D8CDCD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7848500D3C3
      C400E0D4D400DAC7C800CEACAC00A27578004F4E4E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010174000000890000008200000080000000800000008200010138000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8CDCD00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700C6C6C600009ACE00108EB500317184002979
      9400297994000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8EFEF00E4E5E500DEDF
      DF00DCD4D400D2BBBB00DFE3E400C0A1A100D3A8A9005C535200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8F000000890000008C00000090000000900000008B000000860000007F000000
      82000000000000000000000000000000000000000000D8CDC500CAB7B700CAB7
      B700CAB7B700CAB7B700CFBFBF00EFEFEF00FFFFF300FFFFFF00FFFFF300FFFF
      F300FFFFFF00FFFFFF00FFFFFF00C6C6C600009ACE007BDBFF0073DBFF0073DB
      FF004AC3EF0010A6D60029799400297994002979940000000000000000000000
      000000000000000000000000000000000000CCB4B400EEEEEE00F2F3F300E9E9
      E900DEDBDB00CEACAC00CCA5A500CEACAC00BC8E8D00B98C9400000000000000
      0000000000000000000000000000000000000000000000000000020291000000
      9500000097000000A2000000A2000000A20000009F000000970000008B000000
      850000008B00000000000000000000000000CFBFBF00D8CDCD00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFF3006FDF940001DD440001DD440001DD440001DD
      440001DD440076E19A00FFFFFF00C6C6C60084DBFF00D6EFFF007BE3FF007BE3
      FF007BE3FF007BE3FF007BE3FF007BE3FF0063D7F70029B2DE00297994002979
      940000000000000000000000000000000000D2B2B200F6FAFA00FFFFFF00F2F3
      F300E0E6E600D6AEB000CB888800C68B9700D06F4A00CD5D0000C6570000C55A
      02006A4D36007474740000000000000000000000000002029E000000A1002727
      AE00FFFFFF000000A5000000AF000202B0000000AC004848BA00FFFFFF000000
      8F0000008900000080000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000B1180000B1180000B1180000B1180000B1
      180000B1180000B11800FFFFFF00C6C6C6007BDBFF0021AADE00C6FFFF0084EF
      FF0084EBFF0084EBFF0084EBFF0052BADE007BDFFF0084EBFF008CEFFF0073E3
      FF002979940000000000000000000000000000000000E1C9C900C87B8100BE82
      8A00D5C6C700CC979800C76B7100CE5A0000F16C0000FB730200FB690000FA72
      0000E8670000BF5C0B0074747400000000002929BA000202A5000000B300CBCB
      A500FFFFFF00FFFFFF000000AF000000B7004848BA00FFFFF900FFFFFF008585
      AE0000009D000202910001020F0000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000099000061D1720066BE6A0088D8910066BE
      6A0061D17200169F1600FFFFFF00C6C6C60094DFFF0039B6EF00F7FFFF007BE7
      FF008CF3FF008CF3FF008CEFFF0000009C005A9ADE008CF3FF008CF3FF0084E7
      FF001886AD000000000000000000000000000000000000000000E28F3800FFA1
      0000F7C87700C68B9700D35D0200F9700000F9700000F9670000FFFFFF00F86A
      0000F9700000EF6C000096541E00000000000505A6000303B6000101C1000000
      B900C1C1A500FFFFFF00FFFFFF005353DB00FFFFF500FFFFFF006B6B95000000
      B9000101AA0000009A0001016D0000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009DACFB000E774500119C110000990000009900000099
      0000009900009EC99E00FFFFFF00C6C6C60094DFFF004ABEF7007BCBE7008CF7
      FF0094FFFF008CE7FF0000009C0084DFF700182CAD009CFFFF0094FFFF0084E7
      FF008CE7FF0029799400000000000000000000000000CBABB500F8A62800FFB3
      3000FFB33000FFB42800DB5B0000FA710000FA710000F96C0000FFFFFF00FA63
      0000F9700000FA720000D35D0200777777000808B5000505C5000606CE000101
      CE000000BD00D6D6BB00FFFFFF00FFFFFF00FFFFFF008585AE000000C5000303
      C1000202B8000202A60002029E0000000000C6C6C600F7F7F70082E6F400395E
      FF002A8BEA002A8BEA00395EFF003392F1000D51FA005977FF00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6009CEFFF005ACBFF004ABEE700F7FF
      FF00ADFFFF006BAEDE0084DFF700ADFFFF001020A500ADFFFF00A5FFFF008CEB
      FF00CEFFFF0029799400000000000000000000000000CBABB500FFBF3300FFBE
      4A00FFC34E00FCB94700F16C0000F9700000FA720000F86A0000FFFFFF00F965
      0000FA720000FA710000E5680000555252000C0CC2000B0BD2000D0DDC000303
      D5000000D2004648C500FFFFFF00FFFFFF00FFFFF6000000C6000000C9000505
      CA000505C5000303B2000505B90000000000C6C6C600FFFFFF000F4EE7001740
      E8000F4EE7001740E8000F4EE7001740E8000F4EE700F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600A5E7FF006BD7FF006BD7FF0052BE
      E70094D3EF00BDE7F700DEF3FF00DEFFFF007396D6007396D600BDFFFF009CEF
      FF00EFFFFF007BCFE700297994000000000000000000C4A4AB00FFC34E00FFC7
      5C00FFCE6500FFC75C00F26B0000F9700000FA6D0000FEE2C900FFFFFF00F967
      0000FA710000F9700000E8670000747474001313CF001515E2001313EB000000
      E0004141CC00FFFFF600FFFFFF00FFFFF300FFFFFF00FFFFFF000000CB000707
      D4000808CF000707BB000505B30000000000C6C6C600FFFFFF000014E0007D7D
      E5007D7DE5007882E9007D7DE5007D7DE5001929DE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600ADEFFF007BE7FF0084E7FF0084EB
      FF007BE7FF007BE7FF006BDFF70084CFEF00F7FBFF0010109C00FFFFFF009CEF
      FF00FFFFFF00F7FFFF00297994000000000000000000BA999100FFCE6500FFD5
      7600FFD77B00FFDE8700E8620000F9700000FA6F0000F9620000F9700000F96C
      0000F9700000F9720000E1660000000000001919D6001B1BF3001D1DFF004E4E
      E500FFFFF300FFFFFF0076769B000000D400CBCBAB00FFFFFF00FFFFFF000000
      E5000D0DDA000C0CC2000606900000000000C6C6C600FFFFFF007D7DE5000014
      E0000024B4000014E0000014E0000024B400A5A5ED00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700DFD7D700CFBFBF00ADFFFF008CF7FF0094FBFF0094FB
      FF0094FBFF0094FBFF0094FBFF0084EFFF0073E3FF00182CAD007BCFE700009A
      CE00009ACE00009ACE00188EB50000000000D5C0C000D2A86C00FFD77B00FFE0
      8B00FFE39400FFE79B00FA963700FF820E00F96C0000FC8A2500FFFFFF00F965
      0000F86F0000FA72000074747400000000003434E7002E2EFF002E2EFF00D6D6
      BB00FFFFFF006B6B95000000E9000000E5000000D400BDBD9B00FFFFFD007272
      BF001515E2001313CF005F5F6F0000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00CFBFBF00CAB7B700CAB7
      B700CAB7B700CAB7B700D8CDC50000000000E7F7FF0094FFFF009CFFFF009CFF
      FF0094FFFF00A5FFFF0094FFFF0094FFFF0094FFFF0084DFF7006BAEDE00009A
      CE0000000000000000000000000000000000DAD3D400F7C87700FFE08B00FFE7
      9B00FFEFAA00FFF1AE00FFF4B400FA963700FFEA6B00FE770100FA630000FF82
      0E00F6972900D59965000000000000000000000000002E2EFF004B4BFF004C4C
      FB006B6B82001212FF000707FD000505F3000C0CFE001B1BF3004E4E97002727
      FF002121EC001010D2000000000000000000C6C6C600F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00D8CDC500000000000000
      000000000000000000000000000000000000009ACE00B5FFFF0094FFFF008CF7
      FF00B5FFFF006BAEDE00009ACE00009ACE00A5DBEF00E7FFFF00D6FFFF00009A
      CE0000000000000000000000000000000000E7E3E400AD998D00E5C99200FFEF
      AA00FFFFCA00FFFFCA00FFFDBC00FFF1AE00FFE08B00D18D5300FDE07E00F7B7
      80000000000000000000000000000000000000000000000000004646FF006D6D
      FF008181FF007575FF005656FF004646FF004D4DFF005656FF004949FF003838
      FF002020F600000000000000000000000000C9C7C300DFD7D700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CAB7B700E6E1E100000000000000
      00000000000000000000000000000000000000000000009ACE00009ACE00009A
      CE00009ACE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5C0C000D5C0C000C9BEBF00A794
      980096777D00A47D8000CCB29500F4DEA200FFE5970067575800000000000000
      0000000000000000000000000000000000000000000000000000000000004D4D
      FF007E7EFF00A2A2FF00A5A5FF009A9AFF008181FF006868FF004B4BFF002727
      FF000000000000000000000000000000000000000000D8CDC500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600DFD7D70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5C0C000DAC7C800CFB8B800BD9A9D00B2848A00A0A0A000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3FFE006464FF008181FF007E7EFF006363FF003F3FFE006E6EF0000000
      00000000000000000000000000000000000000000000C1640A00C1640A00C164
      0A00C1640A00C1640A00C1640A00C1640A00C1640A00C1640A00C1640A00C164
      0A00C1640A00C1640A00C1640A00000000000000000000000000000000000000
      000000000000000000000000000000000000A0620300A0620300A06203000000
      000000000000000000000000000000000000000000001263B3001263B300636F
      8000967A6F00967A6F00A5837200A5837200A5837200A5837200A5837200A583
      7200A5837200FF00FF00FF00FF00FF00FF000000000000000000FF00FF00967A
      6F00967A6F00967A6F00A5837200A5837200A5837200A5837200A5837200A281
      7400FF00FF00FF00FF00FF00FF00FF00FF00C1640A00D6700000D7830100D783
      0100D7830100D7830100D7830100D7830100D7830100D7830100D7830100D783
      0100D7830100D7830100D6700000C1640A000000000000000000000000000000
      000000000000000000000000000000000000A0620300D7830100B56F0800A062
      0300A06203000000000000000000000000001263B3003083D400000000001263
      B3008FA1C200DFD7D100F5D0D000F5D7D700FBDEDE00FBDEDE00FBDEDE00FBDE
      DE00F5D0D000A5837200FF00FF00FF00FF003A488F001C2B8F0003689A000368
      9A00636F8000CCB7B700CCB7B700DFD7D100FBDEDE00FBDEDE00FBDEDE00E4C1
      D3009C7B7A00FF00FF00FF00FF00FF00FF00C1640A00D7830100D7830100D783
      0100D7830100D7830100D7830100D7830100D7830100D7830100D7830100D783
      0100DA8C1000DC931C00DA8C1000C1640A000000000000000000000000000000
      000000000000000000000000000000000000A0620300A0620300B56F0800D783
      0100B56F0800A062030000000000000000001263B3001F75CB003392F1001F75
      CB001263B3008FA1C200EDEDDF00EAEBEB00FFFEE700FFFFF300FFFEE700FFFF
      F300F5D0D000AF8C7800FF00FF00FF00FF00FF00FF00023DC400CBD6E70082E6
      F40003689A00AC7D5C00CDCCBC00CDCCBC00DDDCD600FFFEE700FFFFF300F5D7
      D700A2817400FF00FF00FF00FF00FF00FF00C1640A00D6700000E2A63F00F3BD
      6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD
      6500EDC67900E7B35600E0974300C1640A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0620300A062
      0300B56F0800B56F0800A062030000000000FF00FF001263B300237CD4003392
      F100237CD4001263B3008FA1C200EDEDDF00EDEDDF00F7F7F700EDEDDF00FFFE
      E700F5D0D000A5837200FF00FF00FF00FF00FF00FF00023DC40082E6F400599B
      C50066666600DC931C0099725000CBB59D00CDCCBC00D7BDBD00FFFEE700F5D7
      D700AF8C7800FF00FF00FF00FF00FF00FF0000000000C1640A00C1640A00C164
      0A00C1640A00C1640A00C1640A00C1640A00C1640A00C1640A00C1640A00C164
      0A00C1640A00C1640A00C1640A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0620300D7830100A062030000000000FF00FF00FF00FF0027739F00237C
      D4003CA0FF00237CD4001263B3008FA1C200F6C5C500D5DDC300F8DFC400EEE7
      D200F5D0D000A5837200FF00FF00FF00FF00FF00FF00023DC400023DC4002773
      9F00E2A63F00DF9B2B00D47F1B00CA752F00CEA68200CDCCBC00DFD7D100F5D7
      D70090739100FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0620300C5790B00B56F0800A0620300FF00FF00FF00FF00967A6F004683
      BF003083D4003CA0FF00237CD4001263B300A1A5A700E4BD9300CEA68200CBB5
      9D00CABAAD00A5837200FF00FF00FF00FF00FF00FF00FF00FF00023DC400E097
      4300E7B35600E2A63F00DF9B2B00DC931C00D36B1700CC996600D4CCC500D7BD
      BD0090739100FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0620300DC931C00A0620300FF00FF00FF00FF00A5837200D6D6
      D6004683BF003083D4002A8BEA001F75CB00636F8000A5837200A4826400AF8C
      7800A4826400A4826400FF00FF00FF00FF00FF00FF00FF00FF0090739100F1CA
      9A00E0974300E7B35600E2A63F00DF9B2B00DC931C00D47F1B00CC996600CCB7
      B7009C7B7A00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000C1640A00C1640A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B56F0800DC931C00B56F0800FF00FF00FF00FF00AF8C7800DEDE
      DE00E0E2EB004683BF001F75CB00636F8000A5837200E4C6A300F5D8BA00F5D8
      BA00E4C6A300BE8D6300A4826400FF00FF00FF00FF00FF00FF00AF8C7800EAEB
      EB00D0873800E0974300E7B35600E2A63F00DF9B2B00DC931C00D47F1B00CC99
      660097646800FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000C1640A00D7830100D7830100C1640A00000000000000
      000000000000000000000000000000000000C5790B00C5790B00C5790B00C579
      0B00C5790B00B56F0800C5790B00000000000000000000000000000000000000
      000000000000B56F0800E2A63F00B56F0800FF00FF00FF00FF00AF8C7800EFEF
      EF00EEE7D200D5DDC300526FA200A4826400E4C6A300FCD6AF00F3D99B00F8E9
      CD00F8DFC400CBB59D00CEA68200A4826400FF00FF00FF00FF00AF8C7800F7F7
      F700EFEFEF00D88C3C00E0974300E7B35600E2A63F00DF9B2B00DC931C00D36B
      1700AC7D5C00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000C1640A00E4AC4A00D7830100D7830100D7830100C1640A000807
      FE0000000000000000000000000000000000C5790B00D7830100DA8C1000DA8C
      1000DC931C00DF9B2B00C5790B00000000000000000000000000000000000000
      000000000000B56F0800E2A63F00B56F0800FF00FF00FF00FF00C5948000EFEF
      EF00EFEFEF00DFD7D100CBB59D00C9A17B00EEE7D200FEDCB400FEE0BD00F8E9
      CD00F8E9CD00E4C6A300E4C6A300A4826400FF00FF00FF00FF00C5948000F7F7
      F700FEE0BD00FCD6AF00CA752F00E0974300E7B35600E2A63F00DF9B2B00DC93
      1C006A6895006A689500FF00FF00FF00FF000000000000000000000000000000
      0000C1640A00C1640A00E2A63F00E4AC4A00DC931C00D36B1700C1640A00C164
      0A0000000000000000000000000000000000D4830F00DA8C1000DA8C1000DC93
      1C00D47F1B00C5790B00C5790B00000000000000000000000000000000000000
      0000B56F0800DC931C00D0873800B56F0800FF00FF00FF00FF00C5948000F7F7
      F700F7F7F700E6E6E600CAA59900E4C6A300FFEEDE00F8DFC400F8E9CD00FFEC
      D600F8E9CD00E4C6A300E4C6A300A4826400FF00FF00FF00FF00C5948000F7F7
      F700FFFFFF00FFFFFF00F5D7D700D88C3C00E0974300E7B35600E4AC4A00967A
      6F00BDC3CB00B19FC1002B38BC00FF00FF000000000000000000000000000000
      00000000000000000000C1640A00E4AC4A00DF9B2B00D36B1700000000000000
      000000000000000000000000000000000000D4830F00DA8C1000DC931C00DF9B
      2B00C5790B000000000000000000000000000000000000000000000000000000
      0000C5790B00E9BB6500C5790B0000000000FF00FF00FF00FF00C5948000F7F7
      F700F7F7F700DEDEDE00CAA59900CEA68200FFFFFF00FCD6AF00F5D8BA00F8DF
      C400F8DFC400E4BD9300E4C6A300A4826400FF00FF00FF00FF00C9A17B00F7F7
      F700FEE0BD00FEE0BD00FFE7CC00F5D8BA00D0873800E0974300A5837200B5B5
      B500FFFFFF007078B5005E69D700060EED000000000000000000000000000000
      00000000000000000000C1640A00E7B35600E4AC4A00C1640A00000000000000
      000000000000000000000000000000000000D4830F00DC931C00DF9B2B00DF9B
      2B00DC931C00D4830F00D4830F00000000000000000000000000C5790B00C579
      0B00DF9B2B00E0974300C5790B0000000000FF00FF00FF00FF00C9A17B00F7F7
      F700F7F7F700EDEDDF00CABAAD00AF8C7800F8E9CD00FFEEDE00FFE7CC00FFFF
      FF00F8E9CD00E4BD9300E4BD9300A4826400FF00FF00FF00FF00C9A17B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5F100CC996600A5837200B5B5
      B500A1A5A7001C2CA6002F41D4003455E3000000000000000000000000000000
      00000000000000000000C1640A00FED0A100F3BD6500C1640A00000000000000
      000000000000000000000000000000000000D4830F00DC931C00DC931C00D483
      0F00DF9B2B00E7B35600DF9B2B00D4830F00D4830F00D4830F00DB934700F3D9
      9B00DB934700C5790B000000000000000000FF00FF00FF00FF00CEA68200FFFF
      FF00F7F7F700EFEFEF00E6E6E600A5837200CEA68200FFEEDE00F7F7F700FFFF
      FF00F8DFC400CEA68200EDC6790099666600FF00FF00FF00FF00CEA68200FFFF
      FF00FEE0BD00FEE0BD00FEE0BD00FFE7CC00FFE7CC00F8DFC400CEA682007878
      79001C2CA600718BFF00718BFF001536BA000000000000000000000000000000
      00000000000000000000C1640A00C1640A00C1640A00C1640A00000000000000
      000000000000000000000000000000000000D4830F00DF9B2B00D4830F000000
      0000D4830F00D4830F00E2A63F00EDC67900EDC67900F3D99B00E2A63F00D483
      0F00D4830F00000000000000000000000000FF00FF00FF00FF00CEA68200FFFF
      FF00FFFFFF00F7F7F700EAEBEB00CDCCBC00AF8C7800AF8C7800E4BD9300E5CF
      B700E4BD9300CEA68200A4826400FF00FF00FF00FF00FF00FF00CEA68200CDCD
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700DEDE
      DE001536BA001536BA001536BA00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4830F00DA8C1000D4830F000000
      00000000000000000000D4830F00D4830F00D4830F00D4830F00D4830F000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00CEA6
      8200CEA68200CEA68200CEA68200C9A17B00AF8C7800B6866100A5837200A482
      6400A4826400A4826400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEA6
      8200CEA68200CEA68200CEA68200CEA68200CEA68200C9A17B00C5948000C594
      8000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
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
      00000000000000000000C1640A00C1640A00C1640A00D36B1700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001536BA000024B4000024
      B4000024B4000024B4000024B400D6D6CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000990000009900000099
      0000009900000099000000990000009900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D36B1700E4AC4A00D7830100C1640A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000082AB5000F3BF2000D3DFF000D3D
      FF000D3DFF000D3DFF000F3BF200082AB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000099
      0000000000000000000000000000000000000099000030C2530033CC66004CD4
      790033CC66004CD4790033CC66002DB55E000099000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E4AC4A00E47E0000C1640A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000024B400000000000000000000000000082AB500395EFF00395EFF00395E
      FF00395EFF00395EFF00395EFF00082AB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000099
      0000009900000000000000000000000000000099000058D7820058D7820058D7
      820058D7820058D7820058D7820058D782000099000000000000000000000099
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D36B1700E4AC4A00D7830100C1640A00000000000000
      000000000000000000000000000000000000000000000000000000000000082A
      B5000024B400000000000000000000000000082AB500718BFF00718BFF00718B
      FF00718BFF00718BFF006681EA00082AB5000000000000990000009900000099
      0000009900000099000000990000009900000099000000990000009900001BB4
      36002ABE4C000099000000000000000000000099000090E9AD0090E9AD0090E9
      AD0090E9AD0090E9AD0090E9AD0076E19A000099000000000000000000000099
      0000009900000000000000000000000000000000000000000000000000000000
      0000C1640A00D36B1700E0974300E7B35600DA8C1000D36B1700C1640A00C164
      0A00000000000000000000000000000000000000000000000000082AB5000630
      D7000630D7000024B4000024B4000024B4000024B4000630D7000630D7000630
      D7000630D7000630D700082AB500000000000099000030C2530053D177004CD4
      79004CD479004CD479004CD479004CD479004CD479004CD479004CD479004CD4
      79004CD479002ABE4C00009900000000000000000000009900002ABE4C002ABE
      4C002ABE4C002ABE4C002ABE4C000099000000990000009900000099000014AD
      28002DB55E000099000000000000000000000000000000000000000000000000
      000000000000C1640A00E7B35600DC931C00DF9B2B00E2A63F00C1640A000000
      00000000000000000000000000000000000000000000082AB5000630D700214C
      FF00214CFF00214CFF00214CFF00214CFF00214CFF00214CFF00214CFF00214C
      FF00214CFF00214CFF001740E800082AB5000099000058D7820058D7820058D7
      820058D7820058D7820058D7820058D7820058D7820058D7820058D7820058D7
      820058D7820058D782002ABE4C0000990000009900002DB55E004CD479004CD4
      79004CD479004CD479004CD479004CD479004CD479004CD479004CD479004CD4
      79004CD4790029B7520000990000000000000000000000000000000000000000
      00000000000000000000C1640A00FED0A100E2A63F00C1640A00000000000000
      000000000000000000000000000000000000082AB5001740E8005977FF00395E
      FF005977FF00395EFF00395EFF00395EFF00395EFF00395EFF00395EFF00395E
      FF00395EFF00395EFF00395EFF00082AB500009900005D88D900B3F2C800B3F2
      C800B3F2C800B3F2C800B3F2C800B3F2C800B3F2C800A4EFBD00A4EFBD00A4EF
      BD006FDF940043C3520000990000000000000099000058D7820058D7820058D7
      820058D7820058D7820058D7820058D7820058D7820058D7820058D7820058D7
      820058D7820058D782003AB53E00009900000000000000000000000000000000
      0000000000000000000000000000C1640A00C1640A0000000000000000000000
      00000000000000000000000000000000000000000000082AB5003959E400718B
      FF00718BFF00718BFF005977FF00718BFF00718BFF00718BFF00718BFF00718B
      FF00718BFF00718BFF00637AE600082AB5000000000000990000009900000099
      00000099000000990000009900000099000000990000009900000099000088D8
      910053D1770000990000000000000000000000990000A4EFBD00B3F2C800B3F2
      C800B3F2C800B3F2C800B3F2C800B3F2C800B3F2C800A4EFBD00A4EFBD00A4EF
      BD006FDF940043C3520000990000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000082AB5004C6C
      E6008D9EED000024B4000024B4000024B4000024B4000630D7000630D7000630
      D7000630D7000630D7000024B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000099
      00000099000000000000000000000000000000000000009900002ABE4C002ABE
      4C002ABE4C002ABE4C002ABE4C000099000000990000009900000099000090E9
      AD0061BB61000099000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000082A
      B500082AB5000000000000000000000000000024B400214CFF00214CFF00214C
      FF00214CFF00214CFF001740E800082AB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000099
      0000000000000000000000000000000000000099000029B752004CD4790033CC
      66004CD4790033CC66004CD4790033CC66000099000000000000000000000099
      00000099000000000000000000000000000000000000C1640A00C1640A00D36B
      1700C1640A00C1640A00C1640A00D36B1700C1640A00C1640A00C1640A00D36B
      1700C1640A00C1640A00C1640A00000000000000000000000000000000000000
      0000082AB500000000000000000000000000082AB5005977FF005977FF005977
      FF005977FF005977FF005977FF00082AB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000099000058D7820058D7820058D7
      820058D782006FDF940058D7820058D782000099000000000000000000000099
      000000000000000000000000000000000000C1640A00D6700000D7830100D783
      0100D7830100D7830100D7830100D7830100D7830100D7830100D7830100D783
      0100D7830100D7830100D6700000C1640A000000000000000000000000000000
      000000000000000000000000000000000000082AB500A9AFF100AFB9FE009DAC
      FB009DACFB00AFB9FE00637AE600082AB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000099000090E9AD0090E9AD0090E9
      AD0090E9AD0076E19A0090E9AD006FDF94000099000000000000000000000000
      000000000000000000000000000000000000C1640A00E47E0000D7830100D783
      0100D7830100D7830100D7830100D7830100D7830100D7830100D7830100D783
      0100DA8C1000DC931C00DA8C1000C1640A0000000000FCFCFB00000000000000
      00000000000000000000000000000000000000000000082AB500082AB500082A
      B500082AB500082AB500082AB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000990000009900000099
      0000009900000099000000990000009900000000000000000000000000000000
      000000000000000000000000000000000000C1640A00D6700000E2A63F00F3BD
      6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD6500F3BD
      6500F3BD6500E7B35600E0974300C1640A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1640A00C1640A00C164
      0A00C1640A00C1640A00C1640A00D36B1700C1640A00C1640A00C1640A00C164
      0A00D36B1700C1640A00C1640A000000000000000000000000006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C0000000000000000000000000000000000237CD400237C
      D400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000990000009900000099000000990000009900000099
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C006C6C6C00ADADAD00D6D6
      D600E6E6E600DEDEDE00DEDEDE00CCCCCC00C6C6C600B5B5B500A1A5A700ADAD
      AD00A1A5A700949494006C6C6C006C6C6C0000000000237CD4002A8BEA00237C
      D400237CD4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009900003AB53E002ABE4C000099000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00CCCCCC00B5B5B500BDBD
      BD00A1A5A700A1A5A700A1A5A700ADADAD00A1A5A700A1A5A700ADADAD00A1A5
      A700B5B5B500ADADAD00A1A5A7006C6C6C0000000000237CD40045A5FF003392
      F100237CD400237CD40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009900002ABE4C002FAF3300009900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00DEDEDE008D8D8D009494
      94008D8D8D008D8D8D008D8D8D0083807D008D8D8D0083807D0083807D008380
      7D0083807D008D8D8D00ADADAD006C6C6C00000000001F75CB0051AEE60045A5
      FF003392F100237CD4003083D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000099000058D7820000990000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00DEDEDE0099999900CCCC
      CC00D6D6D600DEDEDE00D6D6D600D6D0CD00CCCCCC00BCBFC300BDBDBD00ADAD
      AD00A1A5A70094949400B5B5B5006C6C6C000000000000000000237CD40051AE
      E60045A5FF003392F100237CD400237CD4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000099000058D7820000990000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000024B4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00DEDEDE00A1A5A700D6D0
      CD00E6E6E600DEDEDE00DEDEDE00DDDCD600D6D0CD00C6C6C600BDBDBD00B5B5
      B500A1A5A70099999900ADADAD006C6C6C000000000000000000000000001F75
      CB0051AEE60045A5FF003392F100237CD400237CD40000000000000000000000
      0000000000000000000000000000000000000000000000000000009900000099
      00001BB436004CD4790014AD2800009900000099000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000082A
      B5000024B4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00DEDEDE00B5B5B500DEDE
      DE0000000000DEDEDE00EAEBEB00DEDEDE00D6D6D600CCCCCC00C6C6C600B5B5
      B5000000000099999900B5B5B5006C6C6C000000000000000000000000000000
      0000237CD40051AEE60045A5FF003392F100237CD400237CD400000000000000
      0000000000000000000000000000000000000000000000000000000000000099
      00002FAF330033CC660014AD2800009900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000082AB5000630
      D7000630D7000024B4000024B4000024B4000024B4000024B4000024B4000024
      B4000024B4000024B4000024B400000000006C6C6C00C6C6C600B5B5B500D6D6
      D600DEDEDE00D6D6D600CCCCCC00C6C6C600BCBFC300BDBDBD00B5B5B50066FF
      0000A1A5A70094949400ADADAD006C6C6C000000000000000000000000000000
      0000000000001F75CB0051AEE60045A5FF003392F100237CD400237CD4000000
      00008D8D8D008D8D8D0083807D00000000000000000000000000000000000000
      00000099000014AD280000990000000000000000000000000000009900000000
      00000000000000000000000000000000000000000000082AB5000630D700214C
      FF00214CFF00214CFF00214CFF00214CFF00214CFF00214CFF00214CFF00214C
      FF00214CFF00214CFF001740E800082AB500000000006C6C6C00999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900949494008D8D8D006C6C6C00000000000000000000000000000000000000
      00000000000000000000237CD40051AEE60045A5FF003392F1001F75CB00237C
      D40094949400A1A5A7008D8D8D00000000000000000000000000000000000000
      000000000000009900000000000000000000000000000099000014AD28000099
      000000000000000000000000000000000000082AB5001740E8005977FF00395E
      FF005977FF00395EFF00395EFF00395EFF00395EFF00395EFF00395EFF00395E
      FF00395EFF00395EFF00395EFF00082AB50000000000000000006C6C6C006C6C
      6C00C5948000F8DFC400FFE7CC00FFECD600FFEEDE00FFF2E600FBDEDE00C594
      80006C6C6C006C6C6C0000000000000000000000000000000000000000000000
      00000000000000000000000000001F75CB0051AEE60045A5FF005C9BB5009494
      9400ADADAD00A1A5A7008D8D8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000099000014AD280033CC66001BB4
      36000099000000000000000000000000000000000000082AB5003455E300718B
      FF00718BFF005977FF005977FF00718BFF00718BFF00718BFF00718BFF00718B
      FF00718BFF00718BFF007085E800082AB5000000000000000000000000006C6C
      6C00C5948000F7F7F70000000000000000000000000000000000FFF2E600AF8C
      78006C6C6C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000237CD4005C9BB50094949400B5B5
      B500ADADAD008D8D8D0000000000000000000000000000000000000000000000
      0000000000000000000000000000009900000099000014AD28004CD479001BB4
      3600009900000099000000000000000000000000000000000000082AB5004C6C
      E600637AE6000024B4000024B4000024B4000024B4000024B4000024B4000024
      B4000024B4000024B4000024B400000000000000000000000000000000000000
      0000C9A17B00F8DFC400FEE0BD00FFE7CC00FFECD600FFEEDE00FBDEDE00C594
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083807D00B5B5B500B5B5
      B5008D8D8D00237CD40000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000099000058D782000099
      000000000000000000000000000000000000000000000000000000000000082A
      B500082AB500FCFBFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9A17B000000000000000000000000000000000000000000FFF2E600AF8C
      7800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083807D00B5B5B500BCBFC3008D8D
      8D006B85A000237CD40000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009900006FDF94000099
      0000000000000000000000000000000000000000000000000000000000000000
      0000082AB5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEA68200FEE0BD00FEE0BD00FEE0BD00FFE7CC00FFE7CC00FFE7CC00C594
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008D8D8D008D8D8D00C6C6C6008D8D8D00237C
      D400237CD4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009900003AB53E003AB53E000099
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEA6820000000000000000000000000000000000F7F7F700EFEFEF00C594
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D8D8D0083807D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009900003AB53E0043C35200009900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEA68200CEA68200CEA68200CEA68200CEA68200C59480000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009900000099000000990000009900000099000000990000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1640A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1640A00D47F1B00C1640A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000099CC000099CC000099
      CC000099CC000099CC000099CC000099CC000099CC000099CC000099CC000099
      CC000099CC000099CC0000000000000000000000000000000000000000009946
      260084422600ADADAD00ADADAD00A1A5A700ADADAD00ADADAD00A1A5A7008442
      2600993300009933000000000000000000000000000000000000000000000000
      00000000000000000000C1640A00D88C3C00DF9B2B00D4830F00C1640A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000082AB5000024B4000024B4000024B4000024
      B4000024B4000024B400082AB500000000000099CC0005ACDD0009C1F20009C1
      F20009C1F20009C1F20009C1F20009C1F20009C1F20009C1F20009C1F20009C1
      F20009C1F20005ACDD0066C2E00000000000000000000000000099554400E47E
      0000C5790B00DEDEDE00CA752F00D4CCC500C6C6C600B5B5B500ADADAD00C164
      0A00D67000009933000000000000000000000000000000000000000000000000
      000000000000C1640A00E0974300E4AC4A00DF9B2B00DC931C00D4830F00C164
      0A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000001536BA000030F2000030F2000030F2000030F2000030
      F2000030F2000030F2000030F200082AB5000099CC000099CC0015C9F50015C9
      F50015C9F50015C9F50015C9F50015C9F50015C9F50015C9F50015C9F50015C9
      F50015C9F50009C1F20066C2E00000000000000000000000000099462600E47E
      0000C1640A00EAEBEB00D0873800DFD7D100D6D6D600CCCCCC00B5B5B500C164
      0A00D67000009933000000000000000000000000000000000000000000000000
      0000C1640A00C1640A00D0873800E7B35600DF9B2B00DC931C00D4830F00C164
      0A00C1640A000000000000000000000000000000000000000000000000000000
      000000000000000000001536BA003455E300395EFF00395EFF00395EFF00395E
      FF00395EFF00395EFF00395EFF000024B4000099CC000099CC0023D1F80023D1
      F80023D1F80023D1F80023D1F80023D1F80023D1F80023D1F80023D1F80023D1
      F80023D1F80015C9F50066C2E00000000000000000000000000099554400E47E
      0000C5790B00EFEFEF00CEA68200EDEDDF00DEDEDE00D6D6D600D4CCC500BB65
      0F00D67000009933000000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E2A63F00E2A63F00DF9B2B00C1640A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001536BA007882E9009DACFB009DACFB00889BFA009DAC
      FB009DACFB00889BFA00889BFA00082AB5000099CC0005ACDD0015C9F50033D9
      FB0033D9FB002DC5B30042D3B00023D1F80033D9FB0033D9FB003392F10039AA
      DC0023D1F80033D9FB0039AADC0000000000000000000000000099554400E47E
      0000D6700000D47F1B00D0873800D0873800D0873800D0873800CA752F00D670
      0000D67000009946260000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E4AC4A00E2A63F00DF9B2B00C1640A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000082AB500082AB500082AB500082AB500082A
      B500082AB500082AB500082AB500000000000099CC0009C1F20005ACDD0042E1
      FE0042D3B00053E2C80053E2C80042D3B00033D9FB0051AEE60067D6F40051AE
      E60045A5FF0047CCCD0082E6F40066C2E000000000000000000099554400E47E
      0000EF890000D7830100E47E0000D6700000E47E0000D6700000D6700000D670
      0000D67000009946260000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E7B35600E4AC4A00DF9B2B00C1640A000000
      0000000000000000000000000000000000000000000000990000009900000099
      0000009900000099000000990000009900000099000000990000000000000000
      0000000000000000000000000000000000000099CC0009C1F20005ACDD0042E1
      FE0042D3B0007AE6B50053E2C80042D3B00063EFFF0039AADC0082E6F4006EB8
      FF0051AEE60042E1FE00A8F9FE0066C2E00000000000000000008F655700EF89
      0000EFEFEF00FFF2E600FFF2E600FFF2E600FFEEDE00FFEEDE00FFEEDE000000
      0000D67000009946260000000000000000000000000000000000000000000000
      00000000000000000000D36B1700E7B35600E4AC4A00DF9B2B00D36B17000000
      0000000000000000000000000000000000000099000033CC660033CC660033CC
      660033CC660033CC660033CC660033CC660033CC660030C25300009900000000
      0000000000000000000000000000000000000099CC0023D1F80009C1F20039AA
      DC002DC5B30047CCCD0047CCCD002DC5B30033D9FB0039AADC0067D6F40039AA
      DC0039AADC0039AADC0067D6F40066C2E000000000000000000099554400EF89
      000000000000FFF5F100FFF2E600FFEEDE00FFECD600FFECD600FFECD6000000
      0000D67000009946260000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E7B35600E4AC4A00E2A63F00C1640A000000
      0000000000000000000000000000000000000099000058D7820058D7820058D7
      820058D7820058D7820058D7820058D7820058D7820053D17700169F16000000
      0000000000000000000000000000000000000099CC0042E1FE0033D9FB0015C9
      F5002C9A8F002DC5B3003894B3002C9A8F0005ACDD001263B30039AADC00237C
      D4001A6AC5000099CC0066C2E00066C2E00000000000000000008F655700EF89
      0000FFFFF300FFF2E600FFEEDE00FFECD600FFE7CC00FFE7CC00FEE0BD000000
      0000E47E00009946260000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E9BB6500E7B35600E2A63F00C1640A000000
      0000000000000000000000000000000000000099000090E9AD00A9E4B000A4EF
      BD00A4EFBD00A4EFBD00A4EFBD00A4EFBD00A4EFBD0076E19A00009900000000
      0000000000000000000000000000000000000099CC0063EFFF0063EFFF0063EF
      FF00119C110076E19A0076E19A000099000042E1FE00082AB500889BFA00395E
      FF000024B4000099CC000000000000000000000000000000000099666600EF89
      000000000000FFF5F100FFFFF300FFF5F100FFF2E600FFF2E600FFF2E6000000
      0000E47E00009946260000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E9BB6500E7B35600E2A63F00C1640A000000
      0000000000000000000000000000000000000000000000990000009900000099
      0000009900000099000000990000009900000099000000990000000000000000
      000000000000000000000000000000000000000000000099CC0082E6F40082E6
      F40000AA110090E9AD00A4EFBD00119C110039AADC0000319F00889BFA00395E
      FF000024B400000000000000000000000000000000000000000099666600EF89
      0000FFFFF300FFF5F100FFF5F100FFF2E600FFEEDE00FFEEDE00FFECD6000000
      0000E47E00009955440000000000000000000000000000000000000000000000
      00000000000000000000C1640A00E0974300E9BB6500D88C3C00C1640A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000099CC000099
      CC00119C110088D8910088D89100119C1100000000001536BA00637AE6003455
      E3001536BA000000000000000000000000000000000000000000996666009966
      6600C9A17B00C5948000CC996600CEA68200C5948000C9A17B00C5948000CC99
      6600995544009955440000000000000000000000000000000000000000000000
      0000000000000000000000000000C1640A00C1640A00C1640A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003AB53E002FAF33000000000000000000000000002E3EBD002E3E
      BD00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000CBC3BE00D2BFB300BFA08C00837F
      7E00A1A1A2000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000CEC6BD00D6BDB500BDA58C00847B7B00A5A5
      A5000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000317B00004AB500004AB500004AB500000000000000
      00000000000000000000000000000000000000000000BD949400BD949400B58C
      8C00B58C8C00B58C8C00BD949400DEC6C600A59C9C007B7B7B009C5A31007B73
      73009C949400EFDEDE0000000000000000000000000000000000000000000000
      0000000000009D887B00B38D7600DCAC8C00F1C19C00FCDAAE00FEEDBB00A995
      8700808182006B6B6C00545456000000000000000000000000000000FF000000
      FF000000FF00B58C7300DEAD8C00F7C69C00FFDEAD00FFEFBD00AD9484008484
      84006B6B6B0052525200000000000000000000000000000000000000FF000000
      FF00000000000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      00000000000000000000000000000000000000000000BD8C8C00F7DEDE00FFEF
      EF00FFEFEF00FFE7E700FFF7F700FFF7F70084848400F7DECE00AD420000C673
      390084848400D6DEEF00A57B8400000000000000000000000000000000000000
      0000D8CDC500E2B08E00F6BE9800FEC9A000FED2A800FEE5B500FEF5C100B19E
      8E0091929200808182007A7A7A006B6B6C00000000000000FF000000FF00DECE
      C6000000FF000000FF00FFCEA500FFD6AD00FFE7B500FFF7C600B59C8C009494
      9400848484007B7B7B006B6B6B00000000000000FF000000FF007B9CFF007B9C
      FF000000FF000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      00000000000000000000000000000000000000000000BD8C8C00F7DEDE00FFE7
      E700FFE7E700FFE7E700FFE7E700FFEFEF0094948C00B5632900AD420000AD42
      0000AD6B4200DEE7FF00A5848C00000000000000000000000000000000000000
      0000DDD0C700E2B08E00F6BE9800FEC9A000FED2A800FEE5B500FEF5C100B19E
      8E0091929200898A8A007A7A7A0075757500000000000000FF0000000000DED6
      C600E7B58C000000FF000000FF00FFD6AD00FFE7B500FFF7C600B59C8C009494
      94008C8C8C007B7B7B00737373000000000000000000000000000000FF000000
      FF00000000000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      00000084000000000000000000000000000000000000C68C8C00F7DEDE00FFEF
      EF00FFEFEF00FFDEDE00FFEFEF00FFF7F700B5734A00AD420000BD6B3900B563
      2100C65A0000DEC6C600BD9CA50000000000000000000000B2000000B2000000
      B200DDD0C700E7B28E00F8BD9600FEC9A000FED2A800FEE5B500FEF5C100B5A0
      900096979800898A8A007A7A7A007A7A7A00000000000000000000000000DED6
      C600E7B58C00FFBD94000000FF000000FF00FFE7B500FFF7C600B5A594009494
      9C008C8C8C007B7B7B007B7B7B000000000000000000000000000000FF000000
      0000000000000000000000317B0000317B00004AB500004AB500000000000000
      00000084000000840000000000000000000000000000C68C8C00F7E7E700FFFF
      FF00FFF7F700F7F7FF00BDCEF700FFFFFF00B5633100B5733900C6C6C600BD94
      6300C6630800CE6B0000DEBDAD0000000000000000007C7CFF004C3FC3000000
      B200D8CDC500E4AE8A00F8BD9600FEC9A000FED2A800FEE5B500FEF5BE00B5A0
      9000989A9B00898A8A00808182007A7A7A00000000000000000000000000DECE
      C600E7AD8C00FFBD9400FFCEA5000000FF00FFE7B500FFF7BD00B5A594009C9C
      9C008C8C8C00848484007B7B7B00000000000000000000000000000000000000
      FF00000000000000000000317B0018ADFF00B5F7FF00004AB500008400000084
      00000084000000FF0000008400000000000000000000C6949400FFEFEF00FFFF
      FF00FFFFFF00EFF7FF000052FF00FFFFFF00DEBDA5008CADFF009CB5FF00A5B5
      FF00E7AD8400D66B0000DE7B000000000000000000007C7CFF00DEDEFF004C3F
      C300D4C5BB00E4A87F00F8BD9600FEC59A00FEC9A000FEE8AD00FEF5BE00B6A0
      8E00989A9B008E8F9000808182007A7A7A00000000000000000000000000D6C6
      BD00E7AD7B00FFBD9400FFC69C00FFCEA500FFEFAD00FFF7BD00B5A58C009C9C
      9C008C8C9400848484007B7B7B00000000000000000000000000000000000000
      FF000000FF000000000000317B0018ADFF00B5F7FF00004AB50000FF000000FF
      000000FF000000FF000000FF00000084000000000000C6949400FFEFEF00FFFF
      FF00FFFFFF00F7F7FF000063FF00F7F7FF00FFFFFF008CADFF000042FF00CED6
      FF00FFFFF700E7A56B00DE730000000000000000000000000000000000000000
      0000C2B2A800DDA17900F7B98F00FEC59A00FEC9A000FCDAAE00FEF2B900B6A0
      8E00989A9B008E8F9000808182007A7A7A00000000000000000000000000C6B5
      AD00DEA57B00F7BD8C00FFC69C00FFCEA500FFDEAD00FFF7BD00B5A58C009C9C
      9C008C8C9400848484007B7B7B00000000000000FF000000FF000000FF007B9C
      FF007B9CFF000000FF0000317B0018ADFF00B5F7FF00004AB500008400000084
      00000084000000FF0000008400000000000000000000C6949400FFEFEF00FFFF
      FF008CBDFF005AA5FF001073FF00F7F7FF00EFF7FF00EFEFFF00BDC6FF000029
      FF00FFF7F700FFFFFF00D684420000000000000000005DE35D005DE35D005DE3
      5D00C0AFA500DDA17900F7B58900FDBC8D00FECE9400FEDBA600FEEDB300B19E
      8E00989A9B00898A8A00808182007A7A7A00000000000000000000000000C6AD
      A500DEA57B00F7B58C00FFBD8C00FFCE9400FFDEA500FFEFB500B59C8C009C9C
      9C008C8C8C00848484007B7B7B00000000000000000000000000000000000000
      FF000000FF000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      00000084000000840000000000000000000000000000C6949400FFF7F700FFFF
      FF00F7F7FF0073B5FF000873FF00F7F7FF00CED6FF00085AFF000852FF005A84
      FF00FFFFFF00FFFFFF00D6BDBD00000000000000000041FF41005DE35D005DE3
      5D00C5B1A300DDA17900F7B58900FDBC8D00FEC59A00FED59800FEE8AD00BFA0
      8C00989A9B0091929200878888007A7A7A00000000000000000000000000C6B5
      A500DEA57B00F7B58C00FFBD8C00FFC69C00FFD69C00FFEFAD00BDA58C009C9C
      9C0094949400848C8C007B7B7B00000000000000000000000000000000000000
      FF00000000000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      00000084000000000000000000000000000000000000CE9C9C00FFF7F700FFFF
      FF00FFFFFF00F7F7EF00DEEFFF00C6C6C600FFFFFF00A5A59400FFF7EF009494
      8C00D6CECE0094949400BD949400000000000000000041FF4100CFFFCF004CE3
      5B00C0AFA500CF987400DA9F7800E4A87F00E5B08500E5C19100E4CF9B00B19E
      8E00A8ADAB00989A9B00919292007F808000000000000000000000000000C6AD
      A500CE9C7300DE9C7B00E7AD7B00E7B58400E7C69400E7CE9C00B59C8C00ADAD
      AD009C9C9C00949494007B848400000000000000000000000000008400000000
      0000000000000000000000317B0000317B00004AB500004AB500000000000000
      00000000000000000000000000000000000000000000CE9C9C00FFFFFF009C9C
      9C00A5A5A50094949400B5B5B5008C8C8C00C6C6C6008C8C8C00DEC6C600736B
      6B00DECECE00635A5A00AD848400000000000000000000000000000000000000
      0000C2ADA100C6927000CF987400DAA47E00F7B58900FECE9400FEDC9D00C0A6
      8E0000FF0000586278000000FF00898A8A00000000000000000000000000C6AD
      A500C6947300CE9C7300DEA57B00F7B58C00FFCE9400FFDE9C00C6A58C0000FF
      00005A637B000000FF008C8C8C00000000000000000000000000008400000084
      0000000000000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      00000000000000000000000000000000000000000000CE9C9C00DEB5B500D6BD
      BD005A525200CEA5A5005A525200B58C8C00635A5A0094737300847B7B008473
      7300B5A5A5008C84840000000000000000000000000046DDD30046DDD30046DD
      D300C2ADA100DB996D00ECA57600FCB17E00FDBB8500FECE9400FEDC9D00BB9D
      88008D9090007A7A7A006F71730080818200000000000000000000000000C6AD
      A500DE9C6B00EFA57300FFB57B00FFBD8400FFCE9400FFDE9C00BD9C8C008C94
      94007B7B7B006B7373008484840000000000008400000084000000FF000000FF
      0000008400000000000000317B0018ADFF00B5F7FF00004AB500000000000000
      0000000000000000000000000000000000000000000000000000847B7B000000
      00005A5A5A00000000006B6B6B00000000008484840094949400949494008484
      8400949494009C9C9C0000000000000000000000000000FFFF0046DDD30046DD
      D300C2ADA100E09C6F00F2A97800FCB17E00FEC08900FED49700FEE4A200C0A6
      8E00AFB3B400A1A1A200929495007F808000000000000000000000000000C6AD
      A500E79C6B00F7AD7B00FFB57B00FFC68C00FFD69400FFE7A500C6A58C00ADB5
      B500A5A5A500949494007B848400000000000000000000000000008400000084
      0000000000000000000000317B0000317B0000317B00004AB500000000000000
      000000000000000000000000000000000000000000000000000000000000848C
      8C00A5A5A5009494940000000000ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00BFFFFF0046DD
      D300CDB5A500F2A97800FDBB8500FEC88F00FED49700FEE8A600FEF5B100CDB5
      A500CFD5D700BDC3C500AFB3B4008E8F9000000000000000000000000000CEB5
      A500F7AD7B00FFBD8400FFCE8C00FFD69400FFEFA500FFF7B500CEB5A500CED6
      D600BDC6C600ADB5B5008C8C9400000000000000000000000000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEC0AB00DAB99C00DCBE9F00DEC4A400DFC9A800DFC9A800D6D7
      D500E0E7E900D7DEE000CFD5D700000000000000000000000000000000000000
      0000DEC6AD00DEBD9C00DEBD9C00DEC6A500DECEAD00DECEAD00D6D6D600E7E7
      EF00D6DEE700CED6D600000000000000000000000000563A06003D4B0600C8D0
      D400563A06003D4B0600563A0600563A0600C8D0D400C8D0D400C8D0D4000001
      4400C8D0D400C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DD951000D7900F00563A
      0600DD951000F4C36800F2B44300CA880F00563A0600563A060000007900120E
      B30000014400C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000B53100008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD009494
      9400A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D540900DD951000DD9510005C3E
      0700F0AB2C00F7D18A00F2B44300F0AB2C00F0AB2C0000007900241CED00827E
      F5002119DB0000014400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084000000B5310000E7100000B531000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500FFFF
      FF007B7B7B004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D540900F0AB2C00DD951000563A
      0600F0AB2C00FCECCF00F4BF5D00F2B44300000079004A43F100A09CF7008884
      F5006761F3002119DB0000014400C8D0D4002E6A9800255A8A00255A8A00255A
      8A00255A8A00255A8A00255A8A00255A8A00255A8A00255A8A00255A8A00255A
      8A00255A8A00255A8A00255A8A00255A8A000000000000000000000000000000
      0000000000000084000000B5310000E7100000B5310000840000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D540900F3B94E00DD951000563A
      0600F0A72100FDF5E700F5C67100000079006761F300C9C7FB00A09CF7009591
      F6007E7AF5005F59F2001B15C300000144003679A50079EEFD0079EEFD0079EE
      FD0079EEFD0079EEFD0079EEFD0075E8F90072E3F50072E3F50072E3F50079EE
      FD0079EEFD0079EEFD006DDAEF00255A8A000000000000000000000000000000
      000000000000000000000084000000B5310000E7100000B53100008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131000000000000000000212121000000000000000000000000000000
      0000000000000000000000000000000000007D540900F4C36800F0A721008358
      0A00F0AB2C00FDF5E700F5C67100000079008884F500F1F1FE00ADAAF800716D
      F400ADAAF8007A75F500221AE200000144003679A50079EEFD0079EEFD0079EE
      FD0079EEFD0079EEFD0079EEFD0079EEFD0079EEFD0079EEFD0079EEFD0079EE
      FD0079EEFD0079EEFD006DDAEF00255A8A000000B5000000B5000000B5000000
      B5000000B5000000B5000000B5000084000000B5310000E7100000B531000084
      0000000000000000000000000000008400000000000000000000000000000000
      0000000000004242420008080800000000000000000000000000000000000000
      0000000000000000000000000000000000007D540900FAE3BA00F2B44300B479
      0D00DD951000F2B44300F0A72100000079006761F300C9C7FB007E7AF5003831
      EF007A75F5006761F300241CED00000144003679A5009BF3FE007ED2E70051AF
      D0004295BD004295BD0051AFD00051AFD0004499C0004B99C0004B99C0004B99
      C0004B99C00057B1D8006DDAEF00255A8A000000B500B5B5FF007B7BFF007B7B
      FF000000FF000000B50000000000000000000084000000B5310000E7100000B5
      3100008400000000000000840000008400000000000000000000000000000000
      000000000000000000004A42420021181800000000009C9C9C00A5A5A500A5A5
      A500000000000000000000000000000000007D540900F3B94E00F4C36800C484
      0E00A8710C00895C0A00895C0A00895C0A00000079005A54F200241CED000000
      7900241CED00241CED0000014400C8D0D4003679A5009BF3FE009BF3FE009BF3
      FE009BF3FE008AF1FE0079EEFD0079EEFD0079EEFD0079EEFD0079EEFD0079EE
      FD0079EEFD0079EEFD006DDAEF00255A8A000000B5007B7BFF007B7BFF000000
      FF000000B500000000000000000000000000000000000084000000B5310000E7
      100000B531000084000000B53100008400000000000000000000000000000000
      0000000000000000000000000000524A4A006B6B6B00FFFFFF00E7E7E700A5A5
      A500A5A5A500000000000000000000000000C8D0D4007D540900A56F0C00895C
      0A00563A0600563A0600563A06003D4B0600563A060000007900000079007D54
      09000000790000007900C8D0D400C8D0D4003679A500ACF4FE007ED2E70062B2
      D10055A2C6004B99C00055A2C6005EC0DC0079EEFD004B99C0004B99C0004B99
      C0004B99C0005FBDE0006DDAEF00255A8A000000B5007B7BFF000000FF007B7B
      FF000000FF000000B500000000000000000000000000000000000084000000B5
      310000E7100000B5310000E71000008400000000000000000000000000000000
      00000000000039B5D6000000000000000000B5B5B500F7F7F700FFFFFF00BDBD
      BD00FFFFFF00A5A5A5000000000000000000C8D0D400C8D0D4007D540900563A
      0600563A06007D540900A56F0C00A56F0C0083580A00563A0600744E09008358
      0A007D540900563A0600C8D0D400C8D0D4003679A500BCF6FE00BCF6FE00ACF4
      FE009BF3FE009BF3FE009BF3FE0079EEFD0079EEFD0079EEFD0079EEFD0079EE
      FD0079EEFD0072E3F5006DDAEF00255A8A000000B5000000FF000000B5000000
      FF007B7BFF000000FF000000B500000000000000000000000000000000000084
      000000B5310000E7100000E710000084000000000000000000004ABDDE0073EF
      FF0008ADDE0063FFFF006BB5D6000000000000000000EFE7DE00DED6D600F7E7
      E700319CBD0008A5D6006BBDD60000000000C8D0D400C8D0D400C8D0D400563A
      06007D540900CC890F00DD951000D7900F00B4790D0083580A00563A06006C49
      0800563A06003D4B0600C8D0D400C8D0D4003679A500DDFBFE009FDEED0083C6
      DD007BC5DD005AACCD005AACCD005AACCD0061C2DD004482C7004B99C0004B99
      C0004C97CC005FBDE00072E3F500255A8A000000B5000000B500000000000000
      B5000000FF007B7BFF000000FF000000B50000000000000000000084000000B5
      310000E7100000E710004AFF5A00008400000000000000000000000000006BDE
      EF0063F7FF0010DEFF0029BDEF0000000000000000000000000000000000EFD6
      CE00189CCE007BF7FF005AB5D60000000000C8D0D400C8D0D400C8D0D4000000
      0000CC890F00F2B44300F2B44300F0A72100DD951000A8710C00563A0600563A
      0600563A0600C8D0D400C8D0D400C8D0D4003679A500FFFFFF00DDFBFE00BCF6
      FE00BCF6FE009BF3FE009BF3FE009BF3FE0079EEFD0079EEFD0079EEFD0079EE
      FD0079EEFD0079EEFD0072E3F500255A8A000000B50000000000000000000000
      00000000B5000000FF007B7BFF000000FF000000B50000840000008400000084
      000000840000008400000084000000840000000000000000000042BDE70029E7
      FF009CFFFF0042EFFF0018C6EF0039B5D6000000000021ADDE0042A5CE000000
      00000000000029BDEF000000000000000000C8D0D400C8D0D400C8D0D4007D54
      0900F0A72100F9DAA200F4BF5D00F2B44300DD951000BB7E0D00563A0600C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D4003679A500FFFFFF00FFFFFF00DDFB
      FE00BCF6FE00ACF4FE009BF3FE009BF3FE0079EEFD0079EEFD0079EEFD0079EE
      FD0079EEFD0079EEFD0072E3F500255A8A000000000000000000000000000000
      0000000000000000B5000000FF007B7BFF000000FF000000B500000000000000
      000000000000000000000000000000000000000000000000000031BDEF0039C6
      F70042CEEF0029BDEF00000000000000000029BDEF0063F7FF004AF7FF0031AD
      CE0000000000000000000000000000000000C8D0D400C8D0D400C8D0D4007D54
      0900DD951000FFFFFF00F6CD8200F2B44300C4840E0083580A003D4B0600C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D4003679A5003679A5003679A5003679
      A5003679A5003679A5003679A5003679A5003679A5003679A5003679A5003679
      A5003679A5003679A5003679A5002E6A98000000000000000000000000000000
      000000000000000000000000B5000000FF007B7BFF000000FF000000B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029BDEF0021B5E700000000000000000029BDEF008CFFFF004AEFFF0052B5
      D60000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D4007D540900DD951000F0A72100CC890F007D540900563A0600C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000B5000000FF000000B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029BDEF000000000000000000000000000000000039ADCE0029BDEF000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D4007D5409006C4908000000000000000000C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002D1800002D18
      00000000000043230000432900004329000043290000492A00004A2500000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001073A5002184AD0063ADC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D180000434913004253
      11002D1800006C390000B5560000B55600008F5D0900985E0700774403004A25
      00004A250000000000000000000000000000000000009C7B6B009C7B6B009C7B
      6B009C7B6B009C7B6B009C7B6B009C7B6B009C7B6B009C7B6B009C7B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003194BD00007BAD004ADEF70008A5D6000084B5001884B5004A9CC6000000
      0000000000000000000000000000000000000000000000000000AD311800A531
      2100A53921009C3929009C4231009C4239009442390094423900000000000000
      0000000000000000000000000000000000007F4602003558100036811B002D18
      0000944B00002D1800002D18000072963500389D3100499B32006E7B2000AF5B
      02007F460200432300000000000000000000000000009C73630000000000FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFEFDE00947B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000188CBD00007BB50094EFFF0031E7FF0029E7FF0018CEEF0008A5D6000084
      B5001084B5004A9CC60000000000000000000000000000000000AD422100FFEF
      DE00FFEFDE00FFE7D600FFE7D600F7E7D600F7E7D600945A5A00000000000000
      0000000000000000000000000000000000007F4602002F5412003FFC43004765
      12002D1800002ACB2A002D1800002CAB450028B1280034B2360038A43100607C
      2000B3640300884E02004A2500000000000000000000A584730000000000DEC6
      BD00DEC6BD00DEBDB500DEBDAD00DEBDAD00DEBDA500FFF7EF00947B6300B584
      8C0094526B009452630094526B000000000000000000000000000000000052AD
      CE00399CC600007BB5009CF7FF0042E7FF0042E7FF0039E7FF0031E7FF0031E7
      FF0029D6EF0021B5DE000884B500187BAD000000000000000000B54A3100FFEF
      DE00FFEFDE00FFEFDE00FFE7D600FFE7D600F7E7D600945A5A00000000000000
      0000000000000000000000000000000000007F460200309225003FFC43003FFC
      43002F6316003FFC43002D18000072CEA00037BA28002EB124001FC450004AA3
      3D00BC670200B45C0100432900000000000000000000AD847B0000000000DEC6
      C600DEC6BD00DEC6BD00DEBDB500DEBDAD00DEBDA500FFF7EF009C7B6B00E7CE
      D600E7CECE00E7C6C6009452630000000000000000000000000000000000108C
      BD00B5F7FF000084B500B5F7FF005AEFFF005AEFFF0052E7FF004AE7FF0042E7
      FF0042E7FF0042E7FF0039CEF700006BA5000000000000000000BD5A3900FFEF
      E700FFEFE700FFEFDE00FFEFDE00FFE7D600F7E7D600945A5A00000000000000
      0000000000000000000000000000000000005B2D00007F4602003FFC43003FFC
      43002ACB2A003FFC43002D180000D9C68A00C9F7ED0042BD4D009D962600CE7E
      1400CC5A0000A65700006C3900004323000000000000AD8C7B0000000000DEC6
      C600DEC6C600DEC6BD00DEBDB500DEBDAD00DEBDA500FFF7EF009C7B6B00D6AD
      BD00CE94A500E7CECE0094526B0000000000000000000000000063B5D60042A5
      CE00DEFFFF000084B500C6FFFF0073F7FF0073F7FF006BEFFF0063EFFF005AEF
      FF005AEFFF0052E7FF0063DEEF00006BA5000000000000000000BD634200BD63
      4200FFEFDE00FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600945A5A00945A
      5A00945A5A00945A5A0000000000000000005B2D00007F46020039F638003FFC
      43003FFC43003FFC43002D180000DF8D0000CF851400B77B0E009F5200009F52
      0000944B00007F460200733C0000311E000000000000AD8C7B0000000000DEC6
      C600DEC6BD00DEC6BD00DEBDB500DEBDB500DEBDAD00FFF7EF009C7B6B00D6AD
      BD00CE94A500E7D6D6009452630000000000000000000000000039A5CE00ADDE
      EF00E7FFFF00006B0800D6FFFF008CFFFF008CFFFF007BF7FF007BF7FF0073F7
      FF006BEFFF004ACEE700ADFFFF000073A5000000000000000000000000000000
      0000BD634200FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFEF
      DE00FFCEB500945A5A0000000000000000007F4602002ACB2A00BCFFCB003FFC
      43003FFC43003FFC43002D1800009DAA0A0052810800824000002D1800002D18
      00002D1800002D1800002D1800002D18000000000000AD8C8400000000000000
      0000000000000000000000000000FFFFF700FFFFF700FFF7EF009C7B6B00D6B5
      BD00CE94A500E7D6D6009C526B000000000000000000000000000894C600CEF7
      FF00006B080073EF9400006B0800A5FFFF00A5FFFF008CF7FF008CF7FF0084F7
      FF007BF7FF005ACEDE00D6FFFF000073A5000000000000000000000000000000
      0000DE9C7300FFEFE700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7
      D600FFCEB500946B630000000000000000007F4602007F4602007F4602007F46
      02007F4602007F4602002D18000054E76F001ED02200824000005151F0001A1A
      E3001616C9001515BA000D0D7B002D18000000000000AD8C840000000000DECE
      CE00DECEC600DEC6BD00DEC6BD00DEC6B500DEBDAD00F7EFE700A5847300D6B5
      BD00CE94A500E7DEDE00945263000000000000000000000000000094C600006B
      08007BF7A50073EF940052F78C00006B080084E7EF0094EFFF00A5FFFF0094FF
      FF0063D6E700B5F7FF00D6FFFF00007BAD000000000000000000000000000000
      0000DE9C7300FFEFE700FFF7EF00FFEFE700FFEFE700FFEFDE00FFEFDE00FFEF
      DE00FFCEBD009C6B6B00000000000000000065330000897A0000AB8A0000C594
      0000DFC60E00DFCE4E00E7CA0800DAF7F7007EDF830082400000B3B3F8006060
      F1001A1AE5001212A0002D1800003A20000000000000AD8C8400000000000000
      0000000000000000000000000000A5847300A5847300A5847300A5847300E7E7
      E700E7DEDE00E7D6D6009C5A6B00000000000000000000000000006B08007BF7
      A5007BF7A50052F78C004AE77B0042E77B00006B080084D6E70063C6DE0063C6
      DE005AC6DE00D6FFFF00E7FFFF00007BAD000000000000000000DE9C7300DE9C
      7300FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700FFEFE700FFEFE700FFEF
      DE00FFCEBD00AD7B73000000000000000000733C00009064000085DA3C00D89F
      0000F3D00D00FFEC5A00FCD30000FFC00500DFA9230082400000FFFFFF00A3A3
      F6005858F1001919DD002D1800003119000000000000BD9C8C00000000000000
      00000000000000000000FFFFF700A5847300F7E7DE00B58C7B00C69C9C00D6AD
      BD00CE9CA500DEC6CE009C5A6B000000000000000000006B08007BF7A5008CF7
      AD0052F78C0052EF84004AEF840042E77B0042E77B00006B0800E7FFFF00F7FF
      FF00E7FFFF00DEFFFF00F7FFFF00007BAD000000000000000000DE9C7300FFF7
      F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700FFEF
      DE00FFCEBD00AD7B73000000000000000000000000007136000094DC940087CF
      1C00D2A40000FCD30000F2DB0000BA8E0000BA84140082400000DEDEFC006060
      F1001B1BEC002222ED001313A8002D18000000000000BD9C8C00000000000000
      0000000000000000000000000000A5847300B58C7B00CEC6BD00E7E7E700A55A
      7300A55A7300A55A7300A55A730000000000006B0800007B1800007B1800007B
      180063F794004AEF84004AE78400007B1800007B1800007B1800006B08001094
      C600000000000000000000000000007BB5000000000000000000DEA58400FFFF
      F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00946B63009C6B
      6B009C6B6B00AD7B7300000000000000000000000000713600006A743D00DDFF
      F200AFD21400DEA10000F3D00D0061D65800BC6A0000824000007F7FF300592F
      00000B0B65001717D000101097002D18000000000000BD9C8C00BD9C8C00AD8C
      8400B58C7B00B58C7B00AD8C7300A5847300CEC6BD00E7E7E700E7E7E700A55A
      7300E7C6CE00AD6B7B000000000000000000000000000000000000000000007B
      180073F79C004AE77B0042E77B00007B1800000000000000000000000000088C
      C600EFF7FF000000000000000000007BB5000000000000000000E7AD8C000000
      000000000000FFF7F700FFF7F700FFF7F700FFF7EF00FFF7EF009C6B6B00FFCE
      CE00DE8C3900000000000000000000000000000000000000000071360000637F
      2E007BE56800C5940000FFB60200AFCD4B0097A910008240000082400000477C
      2F00592F0000101097000D0D7A002D1800000000000000000000000000000000
      000000000000C694A500E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700A55A
      7300AD6B7B00000000000000000000000000000000000000000000000000007B
      18006BEF9C0042DE7B0042DE7B00007B180000000000000000000000000042AD
      DE000084BD000084B5000084B50063ADCE000000000000000000E7B594000000
      00000000000000000000FFFFF700FFF7F700FFF7F700FFF7F700A57B7300C69C
      630000000000000000000000000000000000000000000000000000000000733C
      00006E370000A35F0600E8930C00BFD17D007BBE3C00D38C0D0094570400592F
      00000B0B63000B0B60002D180000000000000000000000000000000000000000
      000000000000AD738400AD738400AD738400AD6B7B00AD6B7B00A5637300A55A
      730000000000000000000000000000000000000000000000000000000000007B
      180063EF940042DE7B0042DE7B00007B18000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00DEAD
      7B00DEAD7B00DEA57300DEA57300DEAD7B00DEAD7B00DEAD7B00B58C6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C3900006E3700006E3700006E3700006F370000723A00000000
      0000592F00002D18000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007B
      1800007B1800007B1800007B1800007B18000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBC3BE00D2BFB300BFA08C00837F
      7E00A1A1A2000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6A38E00AC9A9A00C5929200C592
      9200B9787900B17F7F00A38B8B00A38B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D887B00B38D7600DCAC8C00F1C19C00FCDAAE00FEEDBB00A995
      8700808182006B6B6C0054545600000000004E4439009C846A00977C60009579
      5D0092765A008F7357008469500062524300ECE4DC00AC9A9A00D5A5A500CD9C
      9C00C66E6F00B5858500A38B8B00C8D0D4000000000000000000000000000000
      0000000000004C4C4C004C4C4C004C4C4C004C4C4C00000000000085B2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000077000000FF0000007700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8CDC500E2B08E00F6BE9800FEC9A000FED2A800FEE5B500FEF5C100B19E
      8E0091929200808182007A7A7A006B6B6C005B4F4300A38C7400B6A38E004A3E
      32004A3E32004A3E32004A3E32008A6C52004E443900ECE4DC00B19B9B00BB8A
      8A00C66E6F00AE7F8000C8D0D400C8D0D4000000000000000000000000004C4C
      4C004C4C4C00E1BA7D00E1BA7D00E1BA7D00000000000085B20000FFFF000085
      B200000000000000000000000000000000000000000000000000000000000000
      77000000FF000000BB000000FF00000077000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDD0C700E2B08E00F6BE9800FEC9A000FED2A800FEE5B500FEF5C100B19E
      8E0091929200898A8A007A7A7A00757575005B4F4300AF987E00CDBFAF004C3F
      C3004C3FC3006554AF0074614E00B5997C00ECE4DC00ECE4DC00B5858500AE7F
      8000C66E6F00BA767200AC9A9A00C8D0D40000000000000000004C4C4C00E1BA
      7D00E1BA7D00E1BA7D00EEC98700FAEFD8000085B20000FFFF0000FFFF007FDF
      FF000085B200000000000000000000000000000000000000000048486F000000
      FF000000BB00000077000000BB000000FF000000770000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDD0C700E7B28E00F8BD9600FEC9A000FED2A800FEE5B500FEF5C100B5A0
      900096979800898A8A007A7A7A007A7A7A005B4F4300B6A38E00E5DDD4007C7C
      FF00DEDEFF004C3FC30085715D00ECE4DC00A06B6200B37A5E00A8767600A876
      7600A8767600A8767600A87676009E6B6B00000000004C4C4C00D0955C00D8A7
      6D00E6C89300ECD5A000F8EEC9000085B20000FFFF0000FFFF0000FFFF007FDF
      FF004CD2FE000085B20000000000000000000000000048486F000000FF000000
      BB000000770033333300000077000000BB000000FF0000007700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8CDC500E4AE8A00F8BD9600FEC9A000FED2A800FEE5B500FEF5BE00B5A0
      9000989A9B00898A8A00808182007A7A7A006C5D4C00C3AB9200F2EDE800D3C5
      B600C6B29B00C6B29B00C3AB9200ECE4DC00AC735800F5A63200E4A15900E4A1
      5900E4A15900E4A15900D79D7900A8767600000000004C4C4C00CA945D00DBAF
      7A00E1C18E00ECD5A0000085B20000FFFF0000FFFF0000FFFF0000FFFF007FDF
      FF004CD2FE004CD2FE000085B200000000000000000000001100000022000000
      1100666666006666660066666600000011000000220000001100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4C5BB00DEA78100F8BD9600FEC29600FECFA100FEE2B000FEF5BE00B6A0
      8E00989A9B008E8F9000808182007A7A7A006C5D4C00C6B29B00CBB8A4006252
      4300625243006252430062524300ECE4DC00AC735800FFAA1B00FFAA1B00FFB0
      2800FFB02800FFB02800E4A15900A87676004C4C4C00BF764A00CA945D00EACD
      9B00E7D08A000085B2000085B2000085B2000085B20000FFFF007FDFFF004CD2
      FE000085B2000085B2000085B2000085B2000000000000000000000000000000
      0000444444008888880044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2B2A800DCA17A00F7B98F00FEC29600FEC9A000FEE2B000FEF2B900B6A0
      8E00989A9B008E8F9000808182007A7A7A006C5D4C00CBB8A400DBCDBE0046DD
      D30046DDD3005DCFC10085715D00ECE4DC00AC735800FFAD2200FFBB3F00FFC3
      5000FEC75900FFC35000E4AB6E00A87676004C4C4C00BD825600EFE09E00F7ED
      BB00E6CC8600F2E3AA00E7D08A00FDFBD9000085B2007FDFFF007FDFFF004CD2
      FE000085B200E8D3A8004C4C4C00000000000000000000000000000000000000
      0000333333006666660033333300000000003333330033333300000000000000
      0000000000000000000000000000000000000000000000000000008000000080
      00000080000000800000F7B58900F8BD9600FEC88F00FEDBA600FEEDB300B19E
      8E00989A9B00898A8A00808182007A7A7A006C5D4C00CBB8A400ECE4DC0000FF
      FF00BFFFFF0046DDD300927E6A00ECE4DC00AC735800FFB63500FFC95D00FFDB
      8100FFE29100FFDA7F00E5B58300A87676004C4C4C00BE835A00F7EEC000FDFB
      D900ECD5A000E7D08A00F9F4CD00FEFDEC000085B2007FDFFF004CD2FE004CD2
      FE000085B200E8D3A8004C4C4C00000000000000000000000000000000000000
      0000191919003333330019191900000000000000000066666600000000000000
      00000000000000000000000000000000000000000000000000000080000000FF
      000000FF000000800000F2B08400F7B98F00FEC29600FEDC9D00FEE2B000BFA0
      8C00989A9B0091929200878888007A7A7A0075665600D3BCA400FAF7F500DFD1
      C200D7C2AC00D3BFAB00D3BFAB00ECE4DC00AC735800FFBB3F00FFD16E00FFE6
      9800FFF0AE00FFE29100F2C47F00B17D6E004C4C4C00D5B78B00EFE1B800CA94
      5D00BF856300D4A97200ECDB9300FAF5DB000085B2000085B2000085B2000085
      B2000085B200E8D3A8004C4C4C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088888800000000000000
      00000000000000000000000000000000000000800000008000000080000000FF
      000000FF0000008000000080000000800000E5B08500E5C19100E4CF9B00B29B
      8900A8ADAB00989A9B00919292007F80800075665600D3BCA400D3C5B6006C5D
      4C006C5D4C006C5D4C007B695700ECE4DC00A06B6200BF865800BF8E6800BF96
      7800BF9A8100BF967800BF8E6800A57265004C4C4C00DAC8A700BA876D00A75C
      4300AF6B5400C2906D00C2865C00CA9D5F00EBD88D00EBD88D00EBD88D00EBD8
      8D00E8D3A800946243004C4C4C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600333333000000
      0000000000000000000000000000000000000080000000FF000000FF000000FF
      000000FF000000FF000000FF000000800000F4B88700FEC88F00FEDC9D00C0A6
      8E0000FF0000586278000000FF00898A8A0075665600D3BFAB00E2D4C6005DE3
      5D005DE35D0066D96700927E6A00D7C2AC00ECE4DC00ECE4DC00ECE4DC00ECE4
      DC00ECE4DC00B6A38E00C8D0D400C8D0D400000000004C4C4C00A5695800B77E
      6700B77E6700CBA38C00AF6B5400AF6B5400AB695800AA745F00B77E6700E1CA
      AC00EDD7B8004C4C4C0000000000000000000000000000000000000000000000
      0000000000000080000000FF000000AE0000008000002A2A2A000080000000AE
      000000FF00000080000000000000000000000080000000FF000000FF000000FF
      000000FF000000FF000000FF000000800000FDBB8500FECE9200FEDC9D00BFA0
      8C008C8D8E0078797C006F7173008081820075665600D7C2AC00EBE0D50041FF
      4100CFFFCF004CE35B009B877300D7C2AC00D3BCA400CCB49B00CFB39600C8AC
      8F00C6AA8D0000000000C8D0D400C8D0D400000000004C4C4C00AC857300DBC3
      A700DBBFA500DBCBB700BC887B00B8857600B8857600BC8C8100B8857600E0CC
      B900B1886B004C4C4C0000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000AE00000080000000AE000000FF
      00000080000000000000000000000000000000800000008000000080000000FF
      000000FF0000008000000080000000800000FEC08900FECE9200FEE8A600BFA0
      8C00AFB3B400A1A1A200919292007F80800075665600D9C3AC00FAF8F500E5D7
      C800DCC9B500DCC9B500DCC9B500D9C3AC00D3BCA400D1B79E00CFB39600CFB3
      9600CFB3960000000000C8D0D400C8D0D40000000000000000004C4C4C00EDE6
      DC00E7DCD300DBC6B500DBC3BB00CFAEAA00E3D5D200D6BDB800DFCDC900CCB5
      B0004C4C4C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000080000000FF000000AE000000FF00000080
      00000000000000000000000000000000000000000000000000000080000000FF
      000000FF000000800000FDBB8500FEC88F00FECFA100FEE8A600FEF5B100CBB8
      A400CFD5D700BDC3C500AFB3B4008E8F900075665600D9C3AC00D9C3AC00D9C3
      AC00D9C3AC00D9C3AC00D3BCA400D3BCA400D3BCA400D3BCA400D3BCA400D1B7
      9E00CFB3960000000000C8D0D400C8D0D4000000000000000000000000004C4C
      4C004C4C4C00E7DCD300EDE6E400E3D5D200E3D5D200F0E9E9004C4C4C004C4C
      4C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000FF0000008000000000
      0000000000000000000000000000000000000000000000000000008000000080
      00000080000000800000DAB99C00DCBE9F00DEC4A400DFC9A800D8CBAC00D6D7
      D500E0E7E900D7DEE000CDD2D400000000007566560075665600756656007566
      5600756656006C5D4C006C5D4C006C5D4C006C5D4C005B4F43005B4F43005B4F
      43004E44390000000000C8D0D400C8D0D4000000000000000000000000000000
      0000000000004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000000000000000
      0000000000000000000000000000000000000000000000000000FF737300FF18
      1800FF181800FF8C8C000000000000000000CEC6BD00D6BDB500BDA58C00847B
      7B00A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBC3BE00D2BFB300BFA08C00837F
      7E00A1A1A20000000000000000000000000000000000FF181800FF000000FFFF
      FF00FFFFFF00FF000000F7080800DE9C7B00F7C69C00FFDEAD00FFEFBD00AD94
      8400848484006B6B6B0052525200000000007B390000F7BD6B00F7BD6B00F7BD
      6B00EFB56B00EFB56B00F7BD6B00F7BD6B00F7BD6B00F7B56B00F7B56300F7B5
      6300F7AD5A00EFAD520000000000C8D0D4000000000000000000000000000000
      00000000000000000000765D5300765D5300765D5300765D5300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D887B00B38D7600DCAC8C00F1C19C00FCDAAE00FEEDBB00A995
      8700808182006B6B6C005454560000000000FF737300FF000000FF000000FFFF
      FF00FFFFFF00FF000000FF000000FF5A4200FFD6AD00FFE7B500FFF7C600B59C
      8C0094949400848484007B7B7B006B6B6B007B390000FFD69400FFCE9400FFCE
      8C00F7CE8C00F7CE8C00FFCE8400FFCE8400FFCE8400FFC68400FFC68400FFC6
      7B00F7BD7300F7B5630000000000C8D0D4000000000000000000000000000000
      000084635700765D5300DC6D4600E3724900E3724900DC6D4600765D5300765D
      5300000000000000000000000000000000000000000000000000000000000000
      0000D8CDC500E2B08E00F6BE9800FEC9A000FED2A800FEE5B500FEF5C100B19E
      8E0091929200808182007A7A7A006B6B6C00FF000000FF000000FF000000FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFD6AD00FFE7B500FFF7C600B59C
      8C00949494008C8C8C007B7B7B00737373007B390000FFDEB500D6944200C67B
      2100C67B2100D6944200E7AD6B00D68C4200C67B1800C6731800D68C3900DE9C
      5200E7A55A00FFC67B0000000000C8D0D400000000000000000000000000765D
      5300F07D5400D8714E00C0755800BA654500BA654500C0755800E3805D00F07D
      5400765D53000000000000000000000000000000000000000000000000000000
      0000DDD0C700E2B08E00F6BE9800FEC9A000FED2A800FEE5B500FEF5C100B19E
      8E0091929200898A8A007A7A7A0075757500FF000000FF000000FF000000FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFD6AD00FFE7B500FFF7C600B5A5
      940094949C008C8C8C007B7B7B007B7B7B008C420000FFE7C600FFE7BD00FFE7
      BD00FFDEBD00FFDEB500FFDEB500FFDEAD00FFDEAD00FFD6A500FFD6A500FFD6
      A500FFD69C00FFCE8C0000000000C8D0D4000000000000000000765D5300F885
      5C00CC6B4900CC6B4900FEFFFF00FEFFFF00FEFFFF00FEFFFF00CD816500D871
      4E00F48961007D5A4E000000000000000000000000001414FF00000000000000
      0000DDD0C700E7B28E00F8BD9600FEC9A000FED2A800FEE5B500FEF5C100B5A0
      900096979800898A8A007A7A7A007A7A7A00FF737300FF000000FF000000FF00
      0000FF000000FF000000FF000000FF5A4200FFD6AD00FFE7B500FFF7BD00B5A5
      94009C9C9C008C8C8C00848484007B7B7B008C420000FFE7CE00DEAD7300D694
      5200C67B2100C67B2100D6944A00C67B2100C67B2100D6944200DEA56300EFC6
      8C00FFD6A500FFCE940000000000C8D0D4000000000000000000956B5C00D778
      5700D4795800DB775500D3623800FEFFFF00FEFFFF00D0704D00E1755000D97E
      5E00E7856200956B5C0000000000000000007676FF00C1C1FE007676FF000000
      0000D8CDC500E4AE8A00F8BD9600FEC9A000FED2A800FEE5B500FEF5BE00B5A0
      9000989A9B00898A8A00808182007A7A7A0000000000FF181800FF000000FFFF
      FF00FFFFFF00FF000000FF101000FFAD8C00FFCEA500FFE7B500FFF7BD00B5A5
      8C009C9C9C008C8C9400848484007B7B7B008C420000FFEFD600FFEFD600FFEF
      D600FFEFCE00FFE7CE00FFE7CE00FFE7C600FFE7C600FFE7BD00FFDEB500FFDE
      B500FFD6AD00FFD69C0000000000C8D0D40000000000956B5C00F4896100D97E
      5E00E7856200E7856200E1755000FEFFFF00FEFFFF00DE815E00EB845F00E488
      6600DD806000F6916A00956B5C0000000000000000001414FF00000000000000
      0000D4C5BB00E4A87F00F8BD9600FEC59A00FEC9A000FEE8AD00FEF5BE00B6A0
      8E00989A9B008E8F9000808182007A7A7A000000000000000000FF737300FF18
      1800DE393100EF423100F7A57B00FFC69400FFCEA500FFDEAD00FFF7BD00B5A5
      8C009C9C9C008C8C9400848484007B7B7B009C520000FFEFDE00DEAD7B00D69C
      5A00C67B2900C67B2900C67B2900D6945200EFC69C00FFE7C600FFE7BD00FFDE
      BD00FFDEB500FFD6A50000000000C8D0D40000000000956B5C00F28C6900E785
      6200E98E6D00F6916A00F4865F00FEFFFF00FEFFFF00E98E6D00F8916B00EE92
      7000E98E6D00F8916B00956B5C00000000000000000000000000000000000000
      0000C2B2A800DDA17900F7B98F00FEC59A00FEC9A000FCDAAE00FEF2B900B6A0
      8E00989A9B008E8F9000808182007A7A7A000000000000000000000000000000
      0000C6ADA500DEA57B00F7B58C00FFBD9400FFCE9C00FFDEA500FFEFB500B59C
      8C009C9C9C008C8C8C00848484007B7B7B009C520000FFF7E700FFF7E700FFF7
      E700FFF7E700FFEFDE00FFEFDE00FFEFD600FFEFD600FFE7CE00FFE7C600FFE7
      C600FFDEBD00FFDEAD0000000000C8D0D40000000000B36A5000F8916B00EE92
      7000F5977600FE997600F5885D00FEFFFF00FEFFFF00EE927000FF9F7A00FF9F
      7A00E98E6D00FE997600956B5C0000000000000000001414FF00000000000000
      0000C0AFA500DDA17900F7B58900FDBC8D00FECE9400FEDBA600FEEDB300B19E
      8E00989A9B00898A8A00808182007A7A7A000000000000000000000000000000
      0000C6B5A500DEA57B00F7B58400FFBD8C00FFC69400FFDE9C00FFE7B500BDA5
      8C009C9C9C0094949400848C8C007B7B7B009C520000FFF7EF00DEB58400C67B
      2900E7B57B00D69C5A00C67B2900C67B2900C67B2900D6945200DEAD7300E7BD
      8400FFE7C600FFDEB50000000000C8D0D40000000000AD715B00FF9F7A00F597
      7600FF9F7A00FAA17D00FEFFFF00FEFFFF00FEFFFF00EAA08100FFA88200FFA8
      8200FF9F7A00FFA88200956B5C0000000000000000001414FF00000000000000
      0000C5B1A300DDA17900F7B58900FDBC8D00FEC59A00FED59800FEE8AD00BFA0
      8C00989A9B0091929200878888007A7A7A000000000000000000000000000000
      0000C6ADA500CE9C7300DE9C7B00E7AD7B00E7B58400E7C69400E7CE9C00B59C
      8C00ADADAD009C9C9C00949494007B8484009C520000FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7E700FFF7E700FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7
      CE00FFE7C600FFDEBD0000000000C8D0D4000000000000000000CB775A00FF9F
      7A00FFA88200FFAE8C00FFBA9800FAA17D00F7A98200FFB99500FFB99500FFA8
      8200FFA38300CB775A0000000000000000007676FF001414FF007676FF000000
      0000C0AFA500CF987400DA9F7800E4A87F00E5B08500E5C19100E4CF9B00B19E
      8E00A8ADAB00989A9B00919292007F8080000000000000000000000000000000
      0000C6ADA500C6947300CE9C7300DEA57B00F7BD8400FFCE9C00FFDE9C00C6A5
      8C0000FF00005A637B000000FF008C8C8C009C520000FFF7F700FFF7F700EFD6
      BD00FFF7EF00FFF7EF00FFF7E700EFD6B500FFEFDE00FFEFDE00FFEFD600EFCE
      AD00FFE7CE00FFE7C60000000000C8D0D4000000000000000000CB775A00FFBA
      9800FFAE8C00FFB99500FCAF8700FEFFFF00FEFFFF00FAB48D00FFB99500FFAE
      8C00FFC9A400CB775A0000000000000000001414FF007A7AFF001414FF000000
      0000C2ADA100C6927000CF987400DAA47E00F7B58900FECE9400FEDC9D00C0A6
      8E0000FF0000586278000000FF00898A8A000000000000000000000000000000
      0000C6ADA500DE9C6B00EFA57300FFB57B00FFBD8400FFCE9400FFDE9C00BD9C
      8C008C9494007B7B7B006B737300848484009C520000F7EFE700DEBD9C009C52
      0000DEBD9400FFF7EF00DEBD94009C520000DEBD8C00FFEFDE00DEB58C008C42
      0000DEB58C00FFE7C60000000000C8D0D400000000000000000000000000CB77
      5A00FFCBAA00FFB99500FFB99500FEFFFF00FEFFFF00F6B38E00FFBA9800FFD8
      B500CB775A000000000000000000000000001414FF00ADADFE001414FF000000
      0000C2ADA100DB996D00ECA57600FCB17E00FDBB8500FECE9400FEDC9D00BB9D
      88008D9090007A7A7A006F717300808182000000000000000000000000000000
      0000C6ADA500E79C6B00F7AD7B00FFB58400FFC68C00FFD69400FFE7A500C6A5
      8C00ADB5B500A5A5A500949494007B8484009C520000F7EFE7009C520000C8D0
      D4009C520000F7EFDE009C520000C8D0D4009C520000F7E7CE008C420000C8D0
      D4008C420000F7DEBD0000000000C8D0D4000000000000000000000000000000
      0000CB775A00CB775A00FFD6B200FFD6B200FFD8B500FFE4BF00CB775A00CB77
      5A00000000000000000000000000000000001414FF00C1C1FE001414FF000000
      0000C2ADA100E09C6F00F2A97800FCB17E00FEC08900FED49700FEE4A200C0A6
      8E00AFB3B400A1A1A200929495007F8080000000000000000000000000000000
      0000CEB5A500F7AD7B00FFBD8400FFCE8C00FFD69C00FFEFA500FFF7B500CEBD
      A500CED6D600BDC6C600ADB5B5008C8C94009C520000E7C6AD00E7CEBD009C52
      0000E7CEB500E7C6AD00E7CEAD009C520000E7C6AD00E7C6AD00E7C6A5008C42
      0000E7C6A500E7C6AD0000000000C8D0D4000000000000000000000000000000
      00000000000000000000CB775A00CB775A00CB775A00CB775A00000000000000
      000000000000000000000000000000000000000000001414FF00000000000000
      0000CDB5A500F2A97800FDBB8500FEC88F00FED49700FEE8A600FEF5B100CDB5
      A500CFD5D700BDC3C500AFB3B4008E8F90000000000000000000000000000000
      000000000000DEC6AD00DEBD9C00DEBD9C00DEC6A500DECEAD00DECEAD00D6D6
      D600E7E7EF00D6DEE700CED6D600C8D0D4009C5200009C5200009C520000C8D0
      D4009C5200009C5200009C520000C8D0D4008C4200008C4200008C420000C8D0
      D4008C4200007B42000000000000C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEC0AB00DAB99C00DCBE9F00DEC4A400DFC9A800DFC9A800D6D7
      D500E0E7E900D7DEE000CFD5D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C917500C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D4002E077F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9C0000FF9C
      0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C
      0000FF9C0000FF9C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      00000000000000000000000000000000000016715B0029D4AA002ACCA40027CD
      A50025C19B0025C19B0022B28F001C8F7300000000001C91750000000000C8D0
      D400C8D0D400C8D0D4003A1A6E00532AB9000000000000000000000000000000
      0000000000007B7B7B008C8C8C00847B8400847B84007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000FF9C0000FFE7E700FFE7
      E700FFE7E700FFE7E700FFE7E700FFE7E700FFDEDE00FFDEDE00FFD6D600FFD6
      D600FFCECE00FFCECE00FF9C0000000000000000000000000000000000000000
      00000000000000000000000000006B6B6B00E7E7E70042424200000000000000
      0000000000000000000000000000000000001A856B0037D9B20029D4AA0029D4
      AA0029D4AA0027CDA50027CDA50024B9950016715B0029D4AA0025C19B000000
      0000C8D0D40038186600532AB900A497F5000000000000000000000000000000
      00009C9C9C00EFEFEF00E7DEE700DEDEDE006BB57B00B5BDBD008C9494007B73
      7B008484840000000000000000000000000000000000FF9C0000FFEFEF00FFEF
      EF00FFEFEF00FFEFEF00FFE7E700FFE7E700FFE7E700FFDEDE00FFDEDE00FFD6
      D600FFD6D600FFCECE00FF9C0000000000000000000000000000000000000000
      0000000000000000000073737300E7E7E70039313100293131008CCEAD000000
      0000000000000000000000000000000000001A856B0043DBB6003CDAB40037D9
      B20037D9B20029D4AA0029D4AA002ACCA400227C640068D4B8003DD7B20029B9
      96003E364F00633FC200B4ABFC005F36BD000000000000000000000000000000
      0000ADADAD00A5A5A500FFF7FF0094CE9C0000B5210000AD10000094000084A5
      84009494940084848400000000000000000000000000FF9C0000FFF7F700FFF7
      F70000000000FFEFEF00FFEFEF00FFEFEF0000000000FFE7E700FFDEDE000000
      0000FFD6D600FFD6D600FF9C0000000000000000000000000000000000000000
      00000000000073737300E7E7E7003931310052846B0073BD9400293931008CCE
      B500000000000000000000000000000000001A856B004CDDBA004CDDBA0043DB
      B60043DBB6003CDAB4003FC4A100509D8100786A5C007567590070AF9800536B
      65009C83A100B8B2F3005F36BD00C8D0D4000000000000000000949494000000
      00000000000000000000949494000000000021C6520000B5210010A5180094C6
      9C00E7E7EF0084848400848484000000000000000000FF9C0000FFF7F700FFF7
      F700FFF7F70000000000FFF7F700FFEFEF00FFEFEF00FFE7E700FFE7E700FFDE
      DE00FFD6D600FFD6D600FF9C0000000000000000000000000000000000000000
      000073737300E7E7E700424242005A947B0084D6B5007BC6A5007BBDA5003142
      39009CF7DE000000000000000000000000001D97790054DEBC0054DEBC004CDD
      BA004CDDBA0056AA8E0082746A00A6968900C7B7AD00A9988F0082746A008274
      6A00F9F5DE0055608B00C8D0D400C8D0D4000000000094949400C6C6C6009494
      940000000000000000008C8C8C0000000000D6DEDE0084CE9400E7E7EF00DEBD
      BD00BDA59400C6CED6007B7B7B000000000000000000FF9C0000000000000000
      0000000000000000000000000000FFF7F700FFEFEF00FFE7E700FFE7E700FFDE
      DE00FFDEDE00FFD6D600FF9C0000000000000000000000000000000000008484
      8400E7E7E7004A4242005273630039524A0084D6BD0084CEB50084D6B5008CDE
      C60039524A003931390000000000000000001D9779006CE3C6005EE0C00059DF
      BE0060A68C00A4958700EBDAD200DAC9C100B4A39300A7937800A18C6D008B79
      5F009D8D7700185E5000C8D0D400C8D0D4000000000094949400000000009494
      94009C9C9C009C9C9C0094949400EFEFEF00E7E7E700EFE7EF00E7EFF700CE7B
      2900D65A0000B57342007B8484000000000000000000FF9C0000000000000000
      0000000000000000000000000000FFF7F700FFEFEF00FFEFEF00FFE7E700FFE7
      E700FFDEDE00FFD6D600FF9C000000000000000000000000000084848400E7E7
      E7005A525A00638C7B007BC6A5006BB58C00394A4A008CE7CE0094EFD60073B5
      A50031292900E7E7E70084848400000000001D9779006CE3C6006CE3C60064B6
      9B009A8C8000F9EAE100CCBDB100A28A6200B69D6700DCC18200E8C77E00BFA3
      6F006D5D4B001D5C4B00C8D0D400C8D0D400000000009C9C9C0000000000F7E7
      E700A59C9C00ADADA500F7F7EF00EFEFEF00E7E7E700E7E7E700E7EFFF00DE7B
      0000EF7B0000CE7B290084848C000000000000000000FF9C0000000000000000
      0000000000000000000000000000FFF7F700FFF7F700FFEFEF00FFE7E700FFE7
      E700FFDEDE00FFD6D600FF9C000000000000000000008C8C8C00E7E7E7006B6B
      6B004A5A520084DEC6007BCEAD007BCEAD007BC6A50042635A0073BDAD003129
      2900E7E7E7006B6B6B0000000000000000001D97790076E5CA0076E5CA007062
      5300DECFC800D1C2B900A1875600E0C87F00FFEEB000FFE69900F4D48600D0B3
      79006D5D4B001D5C4B00C8D0D400C8D0D400000000009C9C9C000000000000A5
      CE0018ADCE0042A5C6007BADBD00FFF7EF00F7F7E700EFEFD600F7FFFF00EF7B
      0000E78C1800DECEBD00848484000000000000000000FF9C0000000000000000
      0000000000000000000000000000FFF7F700FFF7F700FFEFEF00FFE7E700FFE7
      E700FFDEDE00FFD6D600FF9C00000000000000000000000000007B737300638C
      7B0073B58C00425A52008CDEC60084D6BD008CE7CE006BAD940042393900E7E7
      E7006B6B6B0000000000000000000000000021AA890076E5CA0076E5CA007062
      5300F1E3D9009D8D7700DEC07900FFFFD500FFEEC100FFDC8200E2C27A00957F
      5B005B967F0000000000C8D0D400C8D0D4000000000094949400FFF7F700E7EF
      F70000CEE70000B5DE0094BDCE00F7EFEF000831F7000021EF004252C600F7FF
      F700EFF7FF00CED6D6008C8C8C000000000000000000FF9C0000000000000000
      0000000000000000000000000000FFF7F700FFF7F700FFEFEF00FFE7E700FFE7
      E700FFDEDE00FFD6D600FF9C0000000000000000000000000000000000008CDE
      BD007BC6A50073BD9C0042635A0094F7DE0073BDAD004A424A00E7E7E7006B6B
      6B000000000000000000000000000000000021AA89007BE6CC007BE6CC007062
      5300CCBDB100A88E5400FFFFD500FFF8E400FFE18B00DEBE7500B59B72006D5D
      4B005DC6A90000000000C8D0D400C8D0D40000000000000000009C9C9C000000
      000039D6EF0000ADD600C6D6D6008C9CF7002963FF000042FF000831E700FFFF
      F700EFEFEF008C8C8C00000000000000000000000000FF9C0000D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6CECE00D6CECE00D6C6C600D6C6C600D6BD
      BD00D6BDBD00D6B5B500FF9C0000000000000000000000000000000000000000
      00008CDEBD0084D6BD0084DEBD0052736B005A5A5A00E7E7E700737373000000
      00000000000000000000000000000000000021AA890083E7CF007BE6CC006D5D
      4B008A7B6C00AA936400ECD38F00E7CA8B00C1A56F00AE967600706253005C98
      880066DCBF0000000000C8D0D400C8D0D400000000000000000000000000A5A5
      A500EFDEDE000000000000000000DEE7FF00295AFF00ADB5FF0000000000D6D6
      CE009494940000000000000000000000000000000000FF9C0000FF9C0000EF84
      0000EF840000EF840000EF840000EF840000EF840000EF840000EF840000EF84
      0000EF840000F7940000FF9C0000000000000000000000000000000000000000
      00000000000094F7DE007BC6B500736B6B00E7E7E70084848400000000000000
      00000000000000000000000000000000000021AA890083E7CF0083E7CF0075B9
      A4005F5145008A765800AA936400A28A62007B685000524743005C98880075E2
      C5006FE4C80000000000C8D0D400C8D0D4000000000000000000000000000000
      0000A5A5A5009C9C9C009C9C9C009C9C9C009C9C9C009C949400949494009C9C
      9C000000000000000000000000000000000000000000FF9C0000FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFAD3900FF9C0000000000000000000000000000000000000000
      000000000000000000007B737300E7E7E7008C8C8C0000000000000000000000
      00000000000000000000000000000000000021AA890085E8D00085E8D00085E8
      D00070B7A4005B4D42005B4D42005B4D42006A89780075B9A4007BE6CC007BE6
      CC0076E5CA0000000000C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9C0000FF9C
      0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C0000FF9C
      0000FF9C0000FF9C000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C000000000000000000000000000000
      00000000000000000000000000000000000021AA89008AE9D2008AE9D2008AE9
      D2008AE9D2008AE9D2008AE9D2008AE9D2008AE9D20085E8D00085E8D00083E7
      CF007BE6CC0000000000C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021AA890021AA890021AA890021AA
      890021AA89001D9779001D9779001D9779001D9779001A856B001A856B001A85
      6B0016715B0000000000C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006B9C00006B9C00639CBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000636BC6003929
      DE004A39EF00846BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A59400A5A59400A5A59400A5A59400000000000000
      0000000000000000000000000000000000000000000000000000AD311800A531
      2100A53921009C3929009C4231009C42390094423900944A4200944A42008C4A
      4A008C5252008C52520000000000000000000000000000000000000000000000
      000000000000007BAD001084B500006BA500006B9C00006B9C005A9CB5000000
      000000000000000000000000000000000000000000007B7BD6000000BD001000
      D6001800DE005239EF006B5AFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A59400A5A59400FFFFF700000000000000000000000000A5A59400A5A5
      9400000000000000000000000000000000000000000000000000AD422100FFEF
      DE00FFEFDE00FFE7D600FFE7D600F7E7D600F7E7D600F7E7D600F7E7D600F7DE
      CE00FFCEAD0084524A0000000000000000000000000000000000000000000000
      00000084B5000084BD00219CC6000073A5000073A5000073A500006BA500006B
      9C005A9CB50000000000000000000000000000000000424AB5000808B5000800
      C6001000D6001000D6003929DE000000000000000000000000005A52E7003118
      DE004A31FF008C73FF000000000000000000000000000000000000000000A5A5
      9400FFFFD600FFFFE700FFFFEF00FFFFF70000000000FFFFF700FFFFF700FFFF
      EF00A5A594000000000000000000000000000000000000000000B54A3100FFEF
      DE009C9C9C009C9C9C00FFE7D6009C9C9C00F7E7D6009C9C9C009C9C9C00F7E7
      D600FFCEAD0084524A000000000000000000000000000000000000000000008C
      BD000094C6000094C60031ADCE00007BAD00007BAD00007BAD000073A500006B
      A500006B9C00086BA5000000000000000000000000005A63B5004A52C6000000
      B5000000BD000800C6001810CE0000000000000000003939CE000000C6001000
      D6001800E7005239EF008C7BF700000000000000000000000000A5A59400FFE7
      B500FFEFC600FFF7D600FFFFE700FFFFEF0000000000FFFFF700FFFFE700FFFF
      E700FFFFDE00A5A5940000000000000000000000000000000000BD5A3900FFEF
      E700FFEFE700FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7D600F7E7D600F7DE
      CE00FFCEAD0084524A00000000000000000000000000000000000094C600009C
      CE00009CCE0000A5D60042BDDE000084B500007BB500007BAD00007BAD000073
      A500006BA500006B9C00000000000000000000000000000000005A6BBD00424A
      BD001018AD000000AD000800C6000000000000000000424ABD000000BD000800
      C6001000D6001808D6004A39DE00000000000000000000000000A5A59400FFD6
      A500FFDEAD00FFEFBD00FFFFEF000000000000000000FFFFF700FFFFDE00FFF7
      CE00FFEFC600A5A5940000000000000000000000000000000000BD634200FFEF
      E7009C9C9C00FFEFDE009C9C9C009C9C9C009C9C9C00FFE7D600FFE7D6009C9C
      9C00FFCEB5008C5A5A000000000000000000000000000000000000A5D60000A5
      D60000ADDE0000ADDE0052CEE700008CBD000084BD000084B500007BB500007B
      AD000073A500006B9C0000000000000000000000000000000000000000006373
      C600636BC600636BC6000808BD0000000000000000005263B5003939BD000000
      B5000000BD000800C6002929CE000000000000000000A5A59400FFD69C00FFCE
      9C00FFCE9400FFE7C600EFEFEF00A5A59400A5A59400E7E7E700FFF7DE00FFDE
      B500FFD6AD00FFDEA500A5A59400000000000000000000000000C6735200FFEF
      E700FFEFEF00FFEFE700FFEFE700FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7
      D600FFCEB500945A5A000000000000000000000000000000000000ADDE0000B5
      E70000B5E70000B5E7005AD6EF000094C6000094C600008CBD000084B500007B
      AD000073A500006BA50000000000000000000000000000000000000000000000
      000000000000000000000800BD00000000000000000094A5C600636BBD003942
      B5001010AD000000AD001818CE000000000000000000A5A59400FFCE9C00FFCE
      9C00FFCE9400FFF7EF00A5A594000000000000000000A5A59400FFF7EF00FFCE
      9400FFCE9400FFD69C00A5A59400000000000000000000000000CE7B5A00FFF7
      EF009C9C9C00FFEFE700FFEFE7009C9C9C00FFEFDE00FFEFDE009C9C9C00FFE7
      D600FFCEB500946B63000000000000000000000000000000000000B5E70000B5
      E70000BDEF0000BDF7006BDEEF000094CE000094C600008CBD000084B500007B
      B500007BAD000073A50000000000000000000000000000000000000000000000
      000000000000000000000000BD0000000000000000000000000094A5C6006B7B
      C600737BCE00636BC6001818CE000000000000000000A5A59400FFCE9C00FFCE
      9400FFCE9400FFF7EF00A5A594000000000000000000A5A59400FFF7EF00FFCE
      9400FFCE9C00FFD69C00A5A59400000000000000000000000000CE846300FFF7
      EF00FFF7EF00FFF7EF00FFEFE700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEF
      DE00FFCEBD009C6B6B000000000000000000000000000000000000BDF70000C6
      F70000C6F70000CEFF0073E7F700009CCE000094C6000094C6000084BD00007B
      B500007BAD000073A50000000000000000000000000000000000000000000000
      000000000000000000000000B500000000000000000000000000000000000000
      000000000000000000001818C6000000000000000000A5A59400FFD6A500FFD6
      A500FFDEB500FFF7DE00E7E7EF00A5A59400A5A59400E7E7EF00FFEFCE00FFCE
      9400FFCE9C00FFD69C00A5A59400000000000000000000000000D68C6B00FFF7
      F7009C9C9C009C9C9C009C9C9C009C9C9C00FFEFE700FFEFE7009C9C9C00FFEF
      DE00FFCEBD00AD7B73000000000000000000000000000000000000CEFF0000CE
      FF0000D6FF0010E7FF007BE7F7000094CE000094C600008CBD000084B500007B
      B500007BAD00006BA50000000000000000000000000000000000000000000000
      000000000000000000000800BD00000000000000000000000000000000000000
      000000000000000000001818C600000000000000000000000000A5A59400FFEF
      BD00FFEFCE00FFFFDE00FFFFF7000000000000000000FFFFEF00FFEFBD00FFDE
      AD00FFD6A500A5A5940000000000000000000000000000000000DE9C7300FFF7
      F700FFF7F700FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700FFEFE700FFEF
      E700FFCEBD00AD7B73000000000000000000000000000000000000DEFF0000E7
      FF0039F7FF0073FFFF0052FFFF0063F7FF005ACEE70029A5CE000084B500007B
      B500007BAD00006BA50000000000000000000000000000000000000000000000
      000000000000000000000000B5006B63E7007384C60094A5C600000000000000
      000000000000000000001818CE00000000000000000000000000A5A59400FFFF
      D600FFFFDE00FFFFE700FFFFF70000000000FFFFEF00FFFFE700FFF7D600FFE7
      C600FFE7B500A5A5940000000000000000000000000000000000DEA58400FFFF
      F700FFF7F7009C9C9C00FFF7F700FFF7EF009C9C9C00FFEFEF00946B63009C6B
      6B009C6B6B00AD7B73000000000000000000000000000000000010F7FF0039FF
      FF0018FFFF0000F7FF0000EFF70000EFF70000E7F70018E7F70039DEEF0029BD
      D6001894BD00006BA50000000000000000000000000000000000000000000000
      000000000000000000000000B5001000D6000800C6000800C6000000AD002131
      AD00637BBD0094A5C6001818CE0000000000000000000000000000000000A5A5
      9400FFFFEF00FFFFEF00FFFFF70000000000FFFFF700FFFFEF00FFFFE700FFFF
      D600A5A594000000000000000000000000000000000000000000E7AD8C000000
      000000000000FFF7F700FFF7F700FFF7F700FFF7EF00FFF7EF009C6B6B00FFCE
      CE00DE8C3900000000000000000000000000000000000000000000E7F70000EF
      F70000EFF70000E7F70000DEEF0000D6E70000D6E70000CEE70000CEE70000C6
      DE0000ADCE0042A5CE0000000000000000000000000000000000000000000000
      000000000000000000000808C6001000D6001000D6000800C6000000AD000008
      9C000018840000296B001818C600000000000000000000000000000000000000
      0000A5A59400A5A59400000000000000000000000000FFFFF700A5A59400A5A5
      9400000000000000000000000000000000000000000000000000E7B594000000
      00000000000000000000FFF7F700FFF7F700FFF7F700FFF7EF00A57B7300C69C
      6300000000000000000000000000000000000000000000000000000000000000
      00007BB5C6004AC6DE0018BDDE0000C6DE0000BDDE0008ADCE0052ADCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094A5C6007384
      C6005263AD00214A84002929C600000000000000000000000000000000000000
      00000000000000000000A5A59400A5A59400A5A59400A5A59400000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00DEAD
      7B00DEA57300DEA57300DEA57300DEA57300DEA57300DEAD7B00B58C6B000000
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
      00000000000094B5CE0021639C00005AA5006B9CC60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003942290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084420000844200008442000084420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000073CE000084DE000084DE00006BB50000000000000000000000
      FF000000FF007B7BFF0000000000000000000000000000000000000000000000
      00003963310039AD390039422900944229009C4231009C42390094423900944A
      4200944A42008C4A4A008C5252008C52520000000000000000009C2910009429
      1800943118008C3121008C3921008C3929008439290084393100843931008439
      3900844239008442390000000000000000000000000000000000000000000000
      00008442000084420000FF8400007BA53900399C31004A9C3100844200008442
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063B5001094EF0052B5F7006BBDEF00216BAD00000000000000
      FF007B7BFF000000000000000000000000000000000000000000000000003963
      310039AD390084F78400399C420039422900E7D6C600F7E7D600F7E7D600F7E7
      D600F7E7D600F7DECE00FFCEAD0084524A0000000000000000009C391800D6B5
      A500D6B5A500D6B59C00D6B59C00CEB59C00CEB59C00CEB59C00CEB59C00CEAD
      9C00D69C84007B42390000000000000000000000000000000000000000008442
      0000E77B0000FF8C0000F7A5180031C64A0029B5290031B5310039A53100637B
      2100844200000000000000000000000000000000000000000000006BBD00216B
      AD00000000000063AD00A5DEFF009CDEFF0084D6FF0052B5F700000000000000
      00000000000000000000000000000000000000000000000000003963310039AD
      3900CEFFCE0052A5520039BD4200399C420039422900E7D6C600F7E7D600F7E7
      D600F7E7D600F7DECE00FFCEAD0084524A0000000000000000009C392100D6B5
      A500D6B5A500D6B5A500D6B59C00D6B59C00CEB59C00CEB59C00CEB59C00CEAD
      9C00D69C84007B42390000000000000000000000000000000000844200005ABD
      4200948C1000F78C0000CED67B0084EFB50031BD290029B5210018C652004AA5
      3900BD63000084420000000000000000000000000000006BBD000084DE000084
      DE00006BB5001073BD009CDEFF0073CEFF0063C6FF0063C6FF005AC6FF005AC6
      FF0063C6FF000873BD00004A8C0000000000000000003963310039AD39009CF7
      9C004AA54A0039422900398C390039BD4200399C420039422900E7D6C600F7E7
      D600F7E7D600F7E7D600FFCEAD0084524A000000000000000000A54A2900D6B5
      AD00D6B5AD00D6B5A500D6B5A500D6B59C00D6B59C00D6B59C00CEB59C00CEB5
      9C00D69C84007B423900000000000000000000000000000000008442000039DE
      63009C941000DE840000FFA50000FFE79C00D6FFF7004AD65200B5AD2900EF94
      1000EF63000084420000000000000000000094B5D6000084DE000084E7008CD6
      FF008CD6FF0063BDF70073CEFF005ABDFF0042ADEF0042ADEF00000000000000
      0000000000000000000000000000317BAD003963310039633100396331003952
      31003963310039AD39003942290039523100396331003963310039422900F7E7
      D600F7E7D600F7E7D600FFCEB5008C5A5A000000000000000000A5523100D6B5
      AD00D6B5AD00D6B5A500D6B5A500D6B5A500D6B5A500D6B59C00CEB59C00CEB5
      9C00D69C8400844A42000000000000000000000000008442000042EF7B004ABD
      1800ADB50800FFAD0000FFA50000FFA50000E7941000FFAD1000FF8C0000FF84
      0000EF7B0000CE6B00008442000000000000000000006BA5CE0052B5EF00CEEF
      FF008CD6FF0073CEFF00398CC600296B9C0094B5CE0000000000000000000000
      FF000000FF000000FF00000000000873B5000000000000000000000000003963
      310063CE630039EF4200398C390039422900E7DECE00FFEFDE00FFEFDE00FFEF
      DE00F7E7D600F7E7D600FFCEB500945A5A000000000000000000AD5A3900D6B5
      AD00D6B5B500D6B5AD00D6B5AD00D6B5A500D6B5A500D6B59C00D6B59C00D6B5
      9C00D69C8400844A42000000000000000000000000008442000084E77B00CEB5
      0000FFBD0000FFBD0000FFBD0000B5C608005A940800C66B0000FF9C0000FF94
      0000FF840000C65A0000844200000000000000000000000000000063AD0084CE
      FF007BCEFF00398CCE0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000006BB50000000000000000003963310052CE
      5A00CEFFCE0039D6420039BD4200398C390039422900E7DECE00FFEFDE00FFEF
      DE00FFEFDE00FFEFDE00FFCEB500946B63000000000000000000B5634200D6BD
      B500D6B5B500D6B5AD00D6B5AD00D6B5AD00D6B5A500D6B5A500D6B5A500D6B5
      9C00D69C840084524A0000000000000000000000000084420000FFCE2100FFC6
      0000FFD60000FFE70800F7DE08005AFF7B0021EF210063941800E77B0000FF8C
      0000E76B0000849421008442000000000000005AAD000073D6000073CE005ABD
      FF006BC6FF00397BB500000000000000000000000000316B9C00000000000000
      FF000000FF007B7BFF00000000008CADCE000000000039633100396331003963
      3100396331003963310039633100396331003963310039422900FFEFE700FFEF
      DE00FFEFDE00FFEFDE00FFCEBD009C6B6B000000000000000000B56B4A00D6BD
      B500D6BDB500D6BDB500D6B5AD00D6B5AD00D6B5AD00D6B5A500D6B5A500D6B5
      A500D69C8C008C52520000000000000000000000000084420000C69C0000DEAD
      0000FFE71000FFEF5A00FFDE0800E7FFFF0094FF94005ADE4200B56B0000CE73
      0000739C210042AD310084420000000000002173B5004AADF70073CEFF006BC6
      FF0063C6FF00005A9C000063AD000063B5000063B500000000000000FF000000
      FF007B7BFF007B7BFF007B7BFF00000000000000000000000000000000000000
      0000D68C6B00FFF7F700FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEFE700FFEF
      E700FFEFDE00FFEFDE00FFCEBD00AD7B73000000000000000000B56B5200D6BD
      B500D6BDB500D6BDB500D6B5B500D6B5B500D6B5AD00D6B5AD00D6B5AD00D6B5
      A500D69C8C009C6352000000000000000000000000000000000084420000DE9C
      0000F7D60800FFEF5A00FFD60000FFC60000FFC629008CEF63004AB521004ABD
      290021BD390084420000000000000000000094B5D6008CCEF70084D6FF0063C6
      FF005ABDFF002984C6000063B500007BD6000073CE00000000000000FF000000
      FF007B7BFF007B7BFF00B5B5FF00000000000000000000000000000000000000
      0000DE9C7300FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00FFEFE700FFEF
      E700FFEFE700FFEFDE00FFCEBD00AD7B73000000000000000000BD7B5200D6BD
      B500D6BDB500D6BDB500D6BDB500D6BDB500D6B5AD00D6B5AD00D6B5AD00D6B5
      A500D69C8C009C635200000000000000000000000000000000008442000084CE
      1800D6A50000FFD60000F7DE0000BD8C0000D6941000E7FFEF0039D6390031C6
      310052AD2900844200000000000000000000000000003994CE0073C6FF00429C
      E7004ABDFF004ABDFF00298CD6001873B500187BBD00000000000000FF000000
      FF007B7BFF007B7BFF00B5B5FF00000000000000000000000000000000000000
      0000DEA58400FFFFF700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00946B63009C6B6B009C6B6B00AD7B73000000000000000000BD846300D6C6
      B500D6BDB500D6BDB500D6BDB500D6BDB500D6BDB500D6B5AD0084524A008C52
      52008C5252009C63520000000000000000000000000000000000000000008442
      0000ADD61000DEA50000F7D6080063D65A00CE730000DEE7840031D6420031C6
      3100844200000000000000000000000000000000000000000000000000000052
      940042B5FF0039B5FF0031B5FF0029B5FF0021ADFF00000000000000FF000000
      FF007B7BFF007B7BFF00B5B5FF00000000000000000000000000000000000000
      0000E7AD8C00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7EF00FFF7
      EF009C6B6300FFCECE00DE8C3900000000000000000000000000C6846B00D6C6
      BD00D6C6BD00D6BDB500D6BDB500D6BDB500D6BDB500D6BDB5008C525200D69C
      9C00BD6B29000000000000000000000000000000000000000000000000000000
      00008442000084420000FFB50000ADCE4A009CAD1000DEDE6B00844200008442
      000000000000000000000000000000000000000000000000000000000000187B
      C6005AC6FF0042BDFF0031B5FF001884CE0010A5F700000000000000FF007B7B
      FF007B7BFF00B5B5FF00B5B5FF00000000000000000000000000000000000000
      0000E7B59400FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7
      EF00A57B7300C69C630000000000000000000000000000000000C68C6B00D6C6
      BD00D6C6BD00D6C6BD00D6C6B500D6BDB500D6BDB500D6BDB50094635200AD7B
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084420000844200008442000084420000000000000000
      00000000000000000000000000000000000000000000000000000000000073A5
      CE00318CCE004AB5F700319CDE0000000000006BB500000000007B7BFF007B7B
      FF00B5B5FF00B5B5FF0000000000000000000000000000000000000000000000
      0000E7AD7B00DEAD7B00DEAD7B00DEA57300DEA57300DEA57300DEA57300E7AD
      7B00B58C6B000000000000000000000000000000000000000000C6845A00BD84
      5A00BD845A00BD845200BD845200BD845200BD845200C6845A009C6B52000000
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
      000000000000000000000000000000000000000000000000000000A54200187B
      3900525A52002931310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018316300184A
      8400104A8400104A8400104A8400104284001042840010428400104284001042
      84001042840010316300000000000000000000000000BD949400BD949400B58C
      8C00B58C8C00B58C8C00BD949400DEC6C600A59C9C007B7B7B009C5A31007B73
      73009C949400EFDEDE000000000000000000000000009C9C9C00A5A5A500A5A5
      A500ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00A5A5
      A500A5A5A500A5A5A5009C9C9C00000000000000000042845A0010BD630010D6
      A50008BD630018B5520042845A00000000000000000000000000212921001021
      100000000000000000000000000000000000000000000000000018427B0018BD
      FF0010ADFF0008A5FF00089CFF00089CFF000894FF00088CFF00008CFF000084
      FF000084FF0010397B00000000000000000000000000BD8C8C00F7DEDE00FFEF
      EF00FFEFEF00FFE7E700FFF7F700FFF7F70084848400F7DECE00AD420000C673
      390084848400D6DEEF00A57B84000000000000000000CECECE00D6D6D600E7E7
      E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700EFEFEF00E7E7
      E700ADD6B5009CC6AD00CECECE00000000000073210029D694004AE7CE0052E7
      CE004AE7CE0042E7CE0029D69400007B2900000000003973310000941000189C
      290000000000000000000000000000000000000000000000000018427B0018BD
      FF0010ADFF0010ADFF0010ADFF0008A5FF0008A5FF00089CFF000894FF00008C
      FF00008CFF0010397B00000000000000000000000000BD8C8C00F7DEDE00FFE7
      E700FFE7E700FFE7E700FFE7E700FFEFEF0094948C00B5632900AD420000AD42
      0000AD6B4200DEE7FF00A5848C000000000000000000C6C6C600B59CA5009C42
      6B009C426B00A5527300A5527300A5527300A55A6B00C69C7300A55273009C42
      6B009C426B00B59CA500C6C6C6000000000021C673006BEFDE005AE7D6005AE7
      D60063E7D6005AE7D60063EFD60021C66B002994290000AD210000A52100184A
      1800000000000000000000000000000000000000000000000000184A7B0021D6
      FF0010BDFF0010BDFF0010BDFF0010BDFF0010BDFF0010BDFF0010ADFF000894
      FF00088CFF0010397B00000000000000000000000000C68C8C00F7DEDE00FFEF
      EF00FFEFEF00FFDEDE00FFEFEF00FFF7F700B5734A00AD420000BD6B3900B563
      2100C65A0000DEC6C600BD9CA5000000000000000000CECECE00A57B8C009C29
      6300A5316300A5396B00A5396B00A5396B00C68C7B00EFD68C009C316300A539
      6B009C296300A57B8C00CECECE000000000031C67300C6F7EF00B5F7EF00B5F7
      EF00B5F7EF00B5F7EF00BDF7EF0031C6730029BD520021BD4A0010B53900089C
      21004AA54A00182110000000000000000000000000000000000018528C0029E7
      FF0018D6FF0018D6FF0018D6FF0018D6FF0018D6FF0018D6FF0018D6FF0018CE
      FF0008A5FF00104A8C00000000000000000000000000C68C8C00F7E7E7000000
      0000FFF7F700F7F7FF00BDCEF70000000000B5633100B5733900C6C6C600BD94
      6300C6630800CE6B0000DEBDAD000000000000000000CECECE009C7384009C21
      5A00A5295A00A5316300A5316300A5316300CEA57300CE847300B56B6300A529
      5A009C215A009C738400CECECE0000000000002908007BD6A500E7FFF700EFFF
      FF00EFFFFF00E7FFF7007BD6A50018B54A0031C65A0039CE630042CE6B004ACE
      6B0029C6520010A52100427B4200000000000000000000000000216BA50031F7
      FF0021E7FF0021E7FF0021E7FF0021E7FF0021E7FF0021E7FF0021E7FF0021E7
      FF0021DEFF00105AA500000000000000000000000000C6949400FFEFEF000000
      000000000000EFF7FF000052FF0000000000DEBDA5008CADFF009CB5FF00A5B5
      FF00E7AD8400D66B0000DE7B00000000000000000000C6C69400AD9C6B00AD7B
      5200AD7B5200A55A5200AD396300AD396300E7C68400B5426B00D6BD7B00AD7B
      5200AD7B5200AD9C6B00D6D6CE0000000000000000002152290021B54A0052C6
      7B0052BD7B0021AD4A0010AD420018B54A0018BD4A0018B54A0018B54A0018BD
      4A0031C65A0039CE6B0018AD3100102110000000000000000000297BBD0063FF
      FF0031F7FF0039F7FF0039F7FF0039F7FF0039F7FF0039F7FF0039F7FF0031F7
      FF0031F7FF00217BBD00000000000000000000000000C6949400FFEFEF000000
      000000000000F7F7FF000063FF00F7F7FF00000000008CADFF000042FF00CED6
      FF00FFFFF700E7A56B00DE7300000000000000000000E7E7E700A5738400BD4A
      6B00C6637B00EFCE8C00BD637300C6737300E7AD8C00CE6B8400CE6B8400C663
      7B00BD4A6B00A5738400E7E7E7000000000000000000217B290029CE630029CE
      630029BD5A00CEEFD6005AC67B0094D6A5005AC67B005AC67B0094D6A50094D6
      A50029BD5A0031CE630039CE6B00217B29000000000000000000187BCE00298C
      CE00298CCE00298CCE00298CCE00298CCE00298CCE00298CCE00298CCE00298C
      CE00298CCE00187BCE00000000000000000000000000C6949400FFEFEF000000
      00008CBDFF005AA5FF001073FF00F7F7FF00EFF7FF00EFEFFF00BDC6FF000029
      FF00FFF7F70000000000D68442000000000000000000E7E7E700A57B8400D66B
      7B00D67B8C00E7AD9400DEAD8400E7B58C00DE9C9400DE849400DE849400D67B
      8C00D66B7B00A57B8400E7E7E700000000000000000029AD39004AD6730042D6
      730042CE6B009CDEAD0039BD63009CDEAD009CDEB50063C684009CDEAD0063C6
      840039C66B0042D673004AD6730029AD3900000000000000000000000000947B
      7B00B5A5A500BDBDC60073525200000000000000000073525200ADADB500AD9C
      9C00947B7B0000000000000000000000000000000000C6949400FFF7F7000000
      0000F7F7FF0073B5FF000873FF00F7F7FF00CED6FF00085AFF000852FF005A84
      FF000000000000000000D6BDBD000000000000000000EFEFEF00AD848400DE8C
      9400E79CA500E7A5AD00EFDE9400EFD68C00E7A5AD00E7A5AD00E7A5AD00E79C
      A500DE8C9400AD848400EFEFEF00000000000000000042AD4A0073DE9C005ADE
      840052CE7B00A5DEBD007BCE940073CE9400A5DEBD0052CE7B0073CE94007BCE
      94005AD684005ADE8C006BDE940042AD4A00000000000000000000000000947B
      7B00CEBDBD00DED6D6007B525200000000000000000073525200BDBDBD00C6B5
      AD00947B7B0000000000000000000000000000000000CE9C9C00FFF7F7000000
      000000000000F7F7EF00DEEFFF00C6C6C60000000000A5A59400FFF7EF009494
      8C00D6CECE0094949400BD9494000000000000000000F7F7F700A5848C00D684
      9400DE9CA500DEA5A500EFCE9C00F7DE9C00DEA5A500DEA5A500DEA5A500DE9C
      A500D6849400A5848C00F7F7F70000000000000000002152210084DEA50094E7
      B50073E79C0073E79C0073E79C007BE79C0073E79C0073E79C007BE79C0073E7
      9C0073E79C0094E7B50084DEA50021522100000000000000000000000000947B
      7B00CEBDBD00E7E7E7008C6B6B0000000000000000007B5A5A00CECECE00C6B5
      B500947B7B0000000000000000000000000000000000CE9C9C00000000009C9C
      9C00A5A5A50094949400B5B5B5008C8C8C00C6C6C6008C8C8C00DEC6C600736B
      6B00DECECE00635A5A00AD8484000000000000000000F7F7F700EFEFEF00E7E7
      E700D6D6D600E7E7E700DEDEDE00EFEFD600DEDEDE00E7E7E700D6D6D600E7E7
      E700D6D6D600EFEFEF00F7F7F70000000000000000000000000021732100ADE7
      BD00D6F7DE00B5EFCE00A5EFBD009CEFB50094E7B5009CEFB500A5EFBD00B5EF
      CE00CEF7DE00A5EFBD0021732100000000000000000000000000000000000000
      0000AD94940000000000B5ADAD00A58C8C00947B7B009C8C8C00EFEFEF00AD94
      94000000000000000000000000000000000000000000CE9C9C00DEB5B500D6BD
      BD005A525200CEA5A5005A525200B58C8C00635A5A0094737300847B7B008473
      7300B5A5A5008C848400000000000000000000000000CECECE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D6D6D60000000000000000000000000000000000317B
      310073C67B00CEF7D600DEF7E700E7FFEF00EFFFF700E7FFEF00DEF7E700C6F7
      D60073C67B00317B310000000000000000000000000000000000000000000000
      0000947B7B00947B7B00DED6D6000000000000000000DED6D600947B7B00947B
      7B00000000000000000000000000000000000000000000000000847B7B000000
      00005A5A5A00000000006B6B6B00000000008484840094949400949494008484
      8400949494009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000104A1000528C52006BBD6B0063BD6B006BBD6B00528C5200104A
      1000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000947B7B00947B7B00947B7B00947B7B00000000000000
      000000000000000000000000000000000000000000000000000000000000848C
      8C00A5A5A5009494940000000000ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000185A
      2100185A2100185A210010421800104218001042180010421800104218000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      420042424200424242004242420042424200000000000000000000000000185A
      210084D68C0084D68C0084D68C0084D68C0084D68C0084D68C005AC66B001042
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000087B52000842290008422900084229000842
      29000842290008422900084229000000000000000000000000000873DE00007B
      DE001894E7001894E7001894E700219CEF00219CEF00219CEF0021A5EF0021A5
      EF0031A5E700000000000000000000000000CED6D600CED6D600CED6D600CED6
      D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600CED6D600CED6D600CED6D60042424200000000000000000000000000185A
      21008CDE9C008CDE9C00A5DEAD009CDEA5008CDE9C008CDE9C006BCE730031AD
      4200104218000000000000000000000000000000000000000000000000000000
      000008422900084229000842290008422900107B4A00108C5A0010A56B0010A5
      6B0010A56B0010A56B0010845A0008422900000000000000000039A5EF00188C
      E70031BDFF004AC6FF004ACEFF0052CEFF0052CEFF0052CEFF0052CEFF005AD6
      FF004AC6F700000000000000000000000000CED6D600424242008C6B4200EFA5
      2900EFA52900EFA52900EFA52900EFA52900EFA52100EFA52100EFA52100EFA5
      2100EFA52100EFA52100CED6D600424242000000000000000000000000002173
      29008CDE9C008CDE9C00218C3100BDEFC600A5DEAD008CDE9C006BCE730031AD
      4200218C31001042180000000000000000000000000000000000000000000842
      2900107B4A0010945A0010A56B0018BD7B0018BD7B0018BD7B0018BD7B0018BD
      7B0018BD7B0018BD7B0021BD7B000842290000000000000000004AB5F7006BBD
      F70010A5F7005AD6FF0063D6FF006BD6FF0073DEFF0073DEFF007BDEFF007BDE
      FF007BDEFF004AB5E7000000000000000000CED6D600424242008C6B3900EF9C
      1800EF9C1800EF9C1800EF9C1800EF9C1800EF9C1800EF9C180000007B000000
      7B00EF9C1800EF9C1800CED6D600424242000000000000000000393939002173
      2900A5DEAD00A5DEAD0010391800319C4200D6F7D600A5DEAD006BCE7300299C
      390021732900104218000000000000000000000000000000000008422900108C
      5A0018BD7B0018CE8C0018CE840018CE840018CE840018CE840018CE840018CE
      840018CE840018CE840021845A0008422900000000007BB5E7005AC6FF008CD6
      FF001094EF005AD6FF0084E7FF008CE7FF008CE7FF0094E7FF0094E7FF009CEF
      FF009CEFFF007BDEFF000000000000000000CED6D60042424200846B3100E794
      1000E7941000E7941000E7941000E7941000E794100008089C00738CF7002118
      EF0000007B00E7941000CED6D6004242420039393900393939009C9C9C002173
      2900A5E7AD00ADE7B500103918001039180042AD5200C6EFCE006BCE7300218C
      31003939390010421800000000000000000000000000000000000842290018AD
      730018D68C0018D68C0018D68C0018D68C0018D68C0018D68C0018D68C0018D6
      8C0018D68C0018BD7B00084229000842290000000000318CE7005AC6FF006BCE
      FF004AB5F70021B5F700A5EFFF00A5EFFF00ADEFFF00ADEFFF00ADEFFF00B5F7
      FF00B5F7FF00BDF7FF0063C6EF0000000000CED6D6004242420084633100DE8C
      1000EFC68C00F7E7C600EFC68C00DE8C1000DE8C100008089C00BDCEFF005A7B
      F70000007B00DE8C1000CED6D60042424200B5B5B5009C9C9C00B5B5B5002184
      3100ADE7B500B5E7BD00185A2100185A210021843100A5E7AD006BCE7300218C
      3100848484003939390039393900393939000000000008422900187B520031E7
      9C0031E79C0031E79C0031E79C0039E79C0042E7A5004AE7AD005AEFB50063EF
      B50063EFB50021A56B000842290008422900000000000884EF0052BDFF0052BD
      FF0052BDFF00089CF7008CEFFF00C6F7FF00C6F7FF00C6F7FF00CEF7FF00CEF7
      FF00D6F7FF00D6F7FF00A5E7FF0000000000CED6D600424242007B633100CE84
      1000CE841000CE841000CE841000CE841000CE841000CE84100008089C000808
      9C00CE841000CE841000CED6D60042424200EFEFEF0000000000DEDEDE002184
      3100B5E7BD00CEEFD600185A21002184310094DE9C00CEEFD6006BCE7300218C
      3100949494009C9C9C00ADADAD00BDBDBD00000000000842290042C68C006BEF
      BD006BEFBD006BEFB5006BEFB50073EFBD007BEFC600ADF7D600C6F7E7009CEF
      CE00299C7300084229000852310008422900000000000894EF0039B5FF0039B5
      FF0039A5E700219CE70000B5F70000BDF70000BDF70000BDF70000BDF700009C
      EF000039D60000CEFF0000CEFF0021C6F700CED6D600424242007B633100CE84
      1000E7C68C00F7E7C600F7E7C600E7C68C00E7C68C00CE841000CE841000CE84
      1000CE841000CE841000CED6D600424242006B6B6B006B6B6B00DEDEDE002184
      3100C6EFCE00E7F7EF002184310094DE9C00E7F7EF00CEEFD6006BCE7300218C
      3100B5B5B500DEDEDE0000000000EFEFEF0008422900297B5A00A5F7D600BDFF
      E7000000000000000000E7FFF700C6FFE7008CF7CE006BDEAD0021845A000842
      29000842290008523100086339000842290000000000089CF70021ADFF00219C
      E70031739C004A6B63004A6B63004A6B630018A5FF00108CDE00086BC6001008
      DE002118F7003939B5000000000000000000CED6D600424242007B5A3100C684
      1000C6841000C6841000C6841000C6841000C6841000C684100000007B000000
      7B00C6841000C6841000CED6D6004242420000000000000000006B6B6B00218C
      3100C6EFCE000000000094DE9C0000000000CEEFD600C6EFCE006BCE7300218C
      3100B5B5B5006B6B6B006B6B6B006B6B6B00084229004A9C7B006BEFB5006BEF
      B5006BEFB5006BEFB5006BEFB5006BEFB5005AD6A500298C6300084229000852
      31000863390008734200087342000842290000000000009CFF0008A5FF000884
      CE008C520000A56B000094845A0000000000000000004A8CCE000808E7004231
      FF005A4AFF002118F7003131AD0000000000CED6D60042424200735A3100C67B
      1000C67B1000C67B1000C67B1000C67B1000C67B100008089C003942EF002118
      EF0000007B00C67B1000CED6D60042424200000000000000000000000000218C
      3100C6EFCE000000000000000000CEEFD600C6EFCE00C6EFCE006BCE7300218C
      31005A5A5A001042180000000000000000000000000008422900084229000842
      2900084229000842290008422900084229000842290008422900085231000873
      42000873420008734200107B5200084229000000000000000000638C9C006B73
      5A00BD840000C68C000094846B000000000000000000000000003939AD004231
      FF006B4AFF001818E7008C94E70000000000CED6D60042424200735A3100735A
      3100735A3100735A3100735A3100735A3100735A310008089C00425AF7002118
      EF0000007B00735A3100CED6D60042424200000000000000000000000000218C
      3100C6EFCE00C6EFCE00C6EFCE00C6EFCE00C6EFCE00C6EFCE006BCE730031AD
      4200218C3100185A210000000000000000000000000000000000085A39000873
      4A0008734A0008734A0008734A0008734A0008734A0008734A0008734A000873
      4A0010845200108C5A00108C5A00084229000000000000000000A58C5200A56B
      0000DEAD0000DEAD0000A56B00009C7B520000000000000000006B6B9C004231
      F700634AFF001810D6000000000000000000CED6D60042424200424242004242
      4200424242004242420042424200424242004242420008089C006384F700394A
      F70000007B0042424200CED6D60042424200000000000000000000000000218C
      31006BCE7B0073CE840073CE840073CE840073CE840073CE840073CE84004ABD
      5A00299C3900185A210000000000000000000000000000000000085A3900108C
      5A00108C5A00108C5A00108C5A00108C5A00108C5A00108C5A00108C5A001094
      63001094630010946300086B420008422900000000000000000000000000AD8C
      4A00CE940000CE940000947331000000000000000000000000006B6B9C004231
      F700634AF7001810C6000000000000000000CED6D600CED6D600CED6D600CED6
      D600CED6D600CED6D600CED6D600CED6D600CED6D60008089C007B94F7005A73
      F70000007B00CED6D600CED6D600000000000000000000000000000000000000
      0000218C31005AC66B005AC66B005AC66B005AC66B005AC66B005AC66B005AC6
      6B0031AD4200185A210000000000000000000000000000000000085A39000873
      4A0010946300109463001094630010946300088C5A00087B5200086B4200084A
      3100084A3100084A3100084A3100000000000000000000000000000000000000
      0000B58C4200B58C420000000000636394006363940063639400313194002921
      D6003129DE000808AD000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0008089C00BDCEFF006B8C
      F70000007B00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000218C310031AD420031AD420031AD420031AD420031AD420031AD
      420031AD4200185A21000000000000000000000000000000000000000000085A
      3900085A3900085A3900085A3900085A3900085A3900085A3900085A39000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A9C0000009C0000009C0000009C000800
      A5004A42B500000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0008089C00FFFFFF0094A5
      FF0000007B00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000218C3100218C31002184310021843100217329002173
      2900185A2100185A210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0008089C000808
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000031313100636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039A5E7000094E7000094
      E7000094E7000094E7000084DE00319CE7000084DE00008CE7000094E7000094
      E7000094E7000094E70039A5E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052394200735A63002921
      210000000000000000000000000000000000000000004ABDEF0000BDF70000BD
      F70000BDF70000ADEF0063C6F7009CDEF70063C6F70063C6F70000BDF70000BD
      F70000BDF70000BDF7004AB5EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002921210052394A0000000000AD9CA500ADADAD005242
      4A002918210052394A0000000000000000000821390039C6F70000C6FF0000C6
      FF0000C6FF0000B5F70063CEF70000A5EF0031B5EF0031B5F70000C6FF0000C6
      FF0000C6FF0000C6FF0039C6F700082139000000000000000000000000000000
      00000000000000000000737373006B6B6B00A5A5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD94A500AD9CA500AD949C00B5ADAD00B5B5B500AD9C
      A500AD9CA500AD9CA5005A424A0000000000184A730031D6FF0000CEFF0000CE
      FF0000CEFF0000BDF70063CEF70063CEF7009CDEFF0000BDF70000CEFF0000CE
      FF0000CEFF0000CEFF0031D6FF00184A73000000000000000000000000000000
      00000000000084848400CECECE008C8C8C00737373005A5A5A007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000948C9400C6C6C600C6C6C600D6CECE00D6C6CE00CECE
      CE00C6BDBD00CEC6CE0029292900000000000021310031BDF70031BDF70031BD
      F70031BDF70031BDF70031BDF70031BDF70031BDF70031BDF70031BDF70031BD
      F70031BDF70031BDF70031BDF700002131000000000000000000000000000000
      00008C8C8C00C6C6C600C6C6C6008C8C8C008484840084848400737373005A5A
      5A00525252008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A424A00846B7B00CECECE00D6C6CE002921290000000000947B
      8C00D6D6D600BDB5BD005A424A002921210000000000109CE7000084DE00528C
      BD00639CCE00639CCE00639CCE00639CCE00639CCE00639CCE00639CCE00639C
      CE00528CBD000084DE00109CE700000000000000000000000000000000009494
      9400D6D6D600B5B5B500CECECE008C8C8C00848484007B7B7B00737373007373
      7300636363005252520094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A0000005A0000000000000000000000000000000000
      00004A314200C6B5BD00D6CECE00D6D6D60063525A0000000000000000000000
      0000CEC6C600D6D6D600CEC6C6008C7B84000000000000426B000084DE00CECE
      CE00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700CECECE000084DE0000426B00000000000000000000000000A5A5A500DEDE
      DE00CECECE00CECECE00E7E7E700CECECE00ADADAD008C8C8C006B6B6B006B6B
      6B0063636300636363007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A000000940000005A0000000000000000000000291821005239
      42009C5A7300C6B5BD00DED6D600DEDEDE00947B840000000000000000002921
      2100CEC6CE00E7E7E700DED6D6006B5A630000000000102939000084DE00DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00007BDE00102939000000000000000000BDBDBD00C6C6C600DEDE
      DE00DEDEDE00DEDEDE00CECECE00C6C6C600C6C6C600BDBDBD00BDBDBD009C9C
      9C00737373005A5A5A006363630000000000000000009CADAD00000000009CAD
      AD00000000009CADAD00000000009CADAD00000000009CADAD00000000009CAD
      AD005A00000094000000940000005A00000000000000B5849400AD738C00B584
      9C00BD94A500AD6B84009C6B8400E7E7E700D6CED6008C6B7B005A425200C6AD
      BD00E7DEE700D6C6CE00000000000000000000000000000000001884DE00DEDE
      DE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE001884DE00000000000000000000000000A5A5A500EFEFEF00EFEF
      EF00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00B5B5B500ADAD
      AD00C6C6C600A5A5A5006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A000000940000005A000000000000008C6B7B00D6B5BD00CEAD
      B500C69CAD00CEA5B500CEB5BD00EFEFEF00F7EFEF00EFEFEF00EFE7E700F7EF
      EF00F7EFEF00EFE7E7005A4A520000000000000000000000000000396B00DEDE
      DE00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEF
      EF00DEDEDE0000396B00000000000000000000000000ADADAD0000000000F7F7
      F700E7E7E700D6D6D600CECECE00CECECE00CECECE00C6C6C600BDBDBD009C9C
      9C007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A0000005A0000008C6B7B00C69CAD00D6B5C6005A42
      4A0000000000C69CAD00BD94A500DECED6008C737B00EFE7E700F7F7F7009C94
      9C00AD9CA500DECED6002921290000000000000000000000000018293900DEDE
      DE00E7E7E700DEDEDE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0018293900000000000000000000000000A5A5A500CECECE00DEDE
      DE00E7E7E700DEDEDE00D6D6D600CECECE00CECECE00A5A5A500949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000312931009C849400DEBDCE008C63
      73005A394A00C69CAD00D6BDC600634A520000000000AD9CA500FFF7F7003121
      290000000000000000000000000000000000000000000000000000000000DEDE
      DE00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700DEDEDE000000000000000000000000000000000000000000000000000000
      0000BDBDBD00ADADAD009C9C9C009C9C9C00A5A5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C7B8400E7D6DE00DEC6
      CE00D6B5BD00E7D6DE00DEBDCE00292121000000000000000000291821000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031293100A58C94009C8C
      9400EFDEE70063525A00A58C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      2900C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6
      C600292929000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003129
      31009C8C94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000021212100212121002121210021212100000000002121
      2100212121002121210021212100000000000000000021212100212121002121
      2100212121000000000021212100212121002121210021212100000000002121
      21002121210021212100212121000000000000000000214A2100183118001831
      1800000000001831180018311800183118001831180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEC6BD00D6BDB500BDA58C00847B7B00A5A5A5000000
      0000000000000000000000000000000000002121210021212100525252007373
      7300212121002121210021212100E7520000FF6B180021212100212121002121
      2100525252007373730021212100212121002121210021212100E7520000FF6B
      1800212121002121210021212100525252007373730021212100212121002121
      21005252520073737300212121002121210000000000214A21004AB539004AB5
      3900183118004AB539008CCE7B0073C66300529C4A0018311800183118001831
      1800000000000000000000000000000000000000000000000000000000009C8C
      7B00B58C7300DEAD8C00F7C69C00FFDEAD00FFEFBD00AD948400848484006B6B
      6B00525252000000000000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121004242
      42005252520073737300B5B5B5002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242005252520073737300B5B5B500212121004242
      42005252520073737300B5B5B5002121210000000000295A21004AB539004AB5
      39001831180063BD5200ADDEA50084CE730063C65A0063C65A0042A531001831
      1800183118000000000000000000000000000000000000000000DECEC600E7B5
      8C00F7BD9C00FFCEA500FFD6AD00FFE7B500FFF7C600B59C8C00949494008484
      84007B7B7B006B6B6B0000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121004242
      42005252520073737300B5B5B5002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242005252520073737300B5B5B500212121004242
      42005252520073737300B5B5B5002121210000000000295A21006BC65A004AB5
      39001831180063BD5200DEF7DE0094CE84007BC66B0063C65A004AB53900398C
      1800183118000000000000000000000000000000000000000000DED6C600E7B5
      8C00F7BD9C00FFCEA500FFD6AD00FFE7B500FFF7C600B59C8C00949494008C8C
      8C007B7B7B007373730000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121004242
      42005252520073737300B5B5B5002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242005252520073737300B5B5B500212121004242
      42005252520073737300B5B5B5002121210000000000295A210084CE73004AB5
      39002142210063BD5200EFFFEF009CD694007BC66B0063C65A004AB53900398C
      1800183118001831180018311800000000000000000000000000DED6C600E7B5
      8C00FFBD9400FFCEA500FFD6AD00FFE7B500FFF7C600B5A5940094949C008C8C
      8C007B7B7B007B7B7B0000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121004242
      42002121210021212100B5B5B5002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242005252520073737300B5B5B500212121004242
      42002121210021212100B5B5B5002121210000000000295A210094D68C0063BD
      5200316B290063BD5200EFFFEF009CD694007BC66B0063C65A004AB53900398C
      180018311800397B000018311800000000000000000000000000DECEC600E7AD
      8C00FFBD9400FFCEA500FFD6AD00FFE7B500FFF7BD00B5A594009C9C9C008C8C
      8C00848484007B7B7B0000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121002121
      210073737300A5A5A500212121002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242005252520073737300B5B5B500212121002121
      210073737300A5A5A500212121002121210000000000295A2100D6EFCE0073C6
      6B00398C310052AD420084BD73006BB55A005AAD420063B54A004AB53900398C
      180029521000397B000018311800000000000000000000000000D6C6BD00E7AD
      7B00FFBD9400FFC69C00FFCEA500FFEFAD00FFF7BD00B5A58C009C9C9C008C8C
      9400848484007B7B7B0000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121004242
      42004242420073737300A5A5A5002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242005252520073737300B5B5B500212121004242
      42004242420073737300A5A5A5002121210000000000295A210084CE730094D6
      8C00429C2900398C1000317300003173000031730000398C1000429C2900398C
      1800295A0800397B000018311800000000000000000000000000C6B5AD00DEA5
      7B00F7BD8C00FFC69C00FFCEA500FFDEAD00FFF7BD00B5A58C009C9C9C008C8C
      9400848484007B7B7B0000000000000000002121210042424200525252007373
      7300B5B5B50021212100B51800002121210021212100FFB54A00212121002121
      21004242420042424200212121002121210021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242002121210021212100B5B5B500212121002121
      2100424242004242420021212100212121000000000000000000295A2100398C
      1800397B0800315A000018311800183118001831180018311800316B0000398C
      1800316B0800397B000018311800000000000000000000000000C6ADA500DEA5
      7B00F7B58C00FFBD8C00FFCE9400FFDEA500FFEFB500B59C8C009C9C9C008C8C
      8C00848484007B7B7B0000000000000000002121210042424200525252007373
      7300B5B5B5002121210021212100FF6B1800FFB54A0021212100212121002121
      21002121210021212100212121000000000021212100B5180000E7520000FF6B
      1800FFB54A00212121002121210073737300A5A5A50021212100212121002121
      210021212100212121002121210000000000000000000000000000000000295A
      21002952080018311800397B000052A5000052A500003173000018311800316B
      0000397B0000316B080018311800000000000000000000000000C6B5A500DEA5
      7B00F7B58C00FFBD8C00FFC69C00FFD69C00FFEFAD00BDA58C009C9C9C009494
      9400848C8C007B7B7B0000000000000000002121210042424200525252007373
      7300B5B5B50021212100B5180000E7520000FF6B1800FFB54A00212121000000
      00000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100424242004242420073737300A5A5A500212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029420800398410004AAD18004AB539004AB5390052A50000317300001831
      1800295A00002952100018311800000000000000000000000000C6ADA500CE9C
      7300DE9C7B00E7AD7B00E7B58400E7C69400E7CE9C00B59C8C00ADADAD009C9C
      9C00949494007B84840000000000000000002121210042424200212121002121
      2100B5B5B5002121210021212100B5180000E752000021212100212121000000
      00000000000000000000000000000000000021212100B5180000212121002121
      2100FFB54A002121210021212100424242004242420021212100212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000295218006BB529007BC66B007BC66B0063BD52004AB5390052A500001831
      1800183118001831180000000000000000000000000000000000C6ADA500C694
      7300CE9C7300DEA57B00F7B58C00FFCE9400FFDE9C00C6A58C0000FF00005A63
      7B000000FF008C8C8C000000000000000000212121002121210073737300A5A5
      A500212121002121210021212100212121002121210021212100000000000000
      0000000000000000000000000000000000002121210021212100FF6B1800FFB5
      4A00212121002121210021212100212121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000295A210084BD4A00CEE7BD009CCE84007BC66B004AB5390052A500001831
      1800000000000000000000000000000000000000000000000000C6ADA500DE9C
      6B00EFA57300FFB57B00FFBD8400FFCE9400FFDE9C00BD9C8C008C9494007B7B
      7B006B7373008484840000000000000000002121210042424200424242007373
      7300A5A5A5002121210000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000295A210073A54A0000000000B5D6A5007BC66B0052A50000317300001831
      1800000000000000000000000000000000000000000000000000C6ADA500E79C
      6B00F7AD7B00FFB57B00FFC68C00FFD69400FFE7A500C6A58C00ADB5B500A5A5
      A500949494007B84840000000000000000002121210021212100424242004242
      4200212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210021212100B5180000E752
      0000212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000295A210073A54A0084BD4A006BB5290031730000183118000000
      0000000000000000000000000000000000000000000000000000CEB5A500F7AD
      7B00FFBD8400FFCE8C00FFD69400FFEFA500FFF7B500CEB5A500CED6D600BDC6
      C600ADB5B5008C8C940000000000000000000000000021212100212121002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000295A210029522100214A2100214A2100000000000000
      000000000000000000000000000000000000000000000000000000000000DEC6
      AD00DEBD9C00DEBD9C00DEC6A500DECEAD00DECEAD00D6D6D600E7E7EF00D6DE
      E700CED6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000021212100212121002121210021212100000000002121
      2100212121002121210021212100000000000000000021212100212121002121
      2100212121000000000021212100212121002121210021212100000000002121
      2100212121002121210021212100000000000000000000000000000000000000
      0000000000000000000000000000108410000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210021212100E7520000FF6B
      1800212121002121210021212100E7520000FF6B180021212100212121002121
      2100E7520000FF6B180021212100212121002121210021212100525252007373
      7300212121002121210021212100525252007373730021212100212121002121
      2100E7520000FF6B180021212100212121000000000000000000000000000000
      000000000000000000001084100039E739001084100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFDEDE00FFE7E70000000000FFE7E700FFE7E700000000000000
      00000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121002121210042424200525252007373
      7300B5B5B50021212100424242005252520073737300B5B5B50021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000000000
      0000000000001084100084EF840039E7390018CE180010841000000000000000
      000000000000000000000000000000000000000000000000000000000000FFDE
      DE00FFD6D600FFDEDE00FFDEDE00AD949400FFE7E700FFEFEF00FFF7F700FFF7
      F7000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121002121210042424200525252007373
      7300B5B5B50021212100424242005252520073737300B5B5B50021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000000000
      000010841000ADF7AD008CEF8C0042E7420018CE180018AD1800108410000000
      0000000000000000000000000000000000000000000000000000F7CECE00FFCE
      CE0000000000FFCECE00FFD6D600FFE7E700FFEFEF00FFF7F70000000000FFF7
      F700FFF7F70000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121002121210042424200525252007373
      7300B5B5B50021212100424242005252520073737300B5B5B50021212100B518
      0000E7520000FF6B1800FFB54A00212121000000000000000000000000001084
      1000BDF7BD00ADF7AD008CEF8C004AE74A0018CE180018B51800109C10001084
      1000000000000000000000000000000000000000000000000000FFDEDE00FFD6
      D600FFCECE00FFCECE00FFE7E700FFEFEF00FFEFEF00948C8C00FFF7F700FFF7
      F700FFEFEF0000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      00002121210021212100FFB54A00212121002121210042424200525252007373
      7300B5B5B50021212100424242005252520073737300B5B5B50021212100B518
      00002121210021212100FFB54A0021212100000000000000000010841000C6F7
      C600BDF7BD00A5F7A5007BEF7B0039E7390018D6180018B51800109C1000108C
      10001084100000000000000000000000000000000000FFE7E700FFDEDE00FFDE
      DE00FFD6D600FFE7E700FFEFEF00FFEFEF0000000000FFF7F700FFF7F700FFF7
      F700FFEFEF00FFEFEF00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A00212121002121
      2100E7520000FFB54A0021212100212121002121210042424200525252007373
      7300B5B5B50021212100424242005252520073737300B5B5B500212121002121
      2100FF6B1800FFB54A0021212100212121000000000010841000B5F7B500ADF7
      AD00A5F7A50084EF840052EF520021E7210018CE180018AD1800109410001084
      1000107B1000107B1000000000000000000000000000FFE7E700FFE7E700FFDE
      DE00FFE7E700FFEFEF00B5A5A50000000000FFF7F700FFF7F700FFEFEF00FFEF
      EF00FFEFEF00FFEFEF00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A0021212100B518
      0000E7520000FF6B1800FFB54A00212121002121210042424200525252007373
      7300B5B5B50021212100424242005252520073737300B5B5B50021212100B518
      0000E7520000FF6B1800FFB54A00212121001084100094F794008CEF8C007BEF
      7B0073EF73005AEF5A0039E7390018D6180018BD1800189C1800108410001073
      100010731000106B1000107B100000000000000000000000000000000000FFE7
      E700FFE7E700FFEFEF000000000000000000FFEFEF00FFF7F700FFEFEF00FFEF
      EF000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B51800002121210021212100FFB54A00212121002121
      2100B5180000E752000021212100212121002121210042424200525252007373
      7300B5B5B50021212100424242002121210021212100B5B5B500212121002121
      2100B5180000E752000021212100212121001084100010841000108410001084
      1000108410005AEF5A0021E7210018CE180018AD1800189C1800106B10000863
      0800085A080008630800107310000000000000000000FFE7E700FFE7E700FFE7
      E700FFE7E700FFEFEF000000000000000000FFF7F700FFEFEF00FFEFEF00FFEF
      EF00FFEFEF00FFEFEF00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A002121210021212100FF6B1800FFB54A0021212100212121002121
      2100212121002121210021212100000000002121210042424200525252007373
      7300B5B5B500212121002121210073737300A5A5A50021212100212121002121
      2100212121002121210021212100000000000000000000000000000000000000
      00001084100029E7290018CE180018CE180018AD180018A51800107310000000
      00000000000000000000000000000000000000000000FFDEDE00FFE7E700FFEF
      EF00EFDEDE00EFDEDE000000000000000000FFF7F700FFEFEF00FFF7F700FFEF
      EF00FFEFEF00FFEFEF00000000000000000021212100B5180000E7520000FF6B
      1800FFB54A0021212100B5180000E7520000FF6B1800FFB54A00212121000000
      0000000000000000000000000000000000002121210042424200525252007373
      7300B5B5B50021212100424242004242420073737300A5A5A500212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001084100031E7310018CE180018BD180018AD180010941000086308000000
      0000000000000000000000000000000000000000000000000000FFEFEF00EFDE
      DE00EFDEDE00EFDEDE000000000000000000FFEFEF00FFEFEF00FFEFEF00FFEF
      EF00FFEFEF0000000000000000000000000021212100B5180000212121002121
      2100FFB54A002121210021212100B5180000E752000021212100212121000000
      0000000000000000000000000000000000002121210042424200212121002121
      2100B5B5B5002121210021212100424242004242420021212100212121000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001084100021E7210018BD180018BD180018AD1800108C1000085A08000000
      0000000000000000000000000000000000000000000000000000FFEFEF000000
      0000EFDEDE00EFDEDE00C6B5B50000000000FFEFEF00FFEFEF00FFEFEF000000
      0000FFEFEF000000000000000000000000002121210021212100FF6B1800FFB5
      4A00212121002121210021212100212121002121210021212100000000000000
      000000000000000000000000000000000000212121002121210073737300A5A5
      A500212121002121210021212100212121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001084100018CE180018AD180018AD180018AD180010841000085A08000000
      000000000000000000000000000000000000000000000000000000000000FFEF
      EF00EFDEDE00EFDEDE00FFEFEF00C6BDBD00FFEFEF00FFEFEF00FFEFEF00FFEF
      EF000000000000000000000000000000000021212100B5180000E7520000FF6B
      1800FFB54A002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210042424200424242007373
      7300A5A5A5002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010841000108410001084100010841000107B100010841000106B10000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFDEDE00FFF7F70000000000FFEFEF00FFEFEF00000000000000
      0000000000000000000000000000000000002121210021212100B5180000E752
      0000212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210021212100424242004242
      4200212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000635A4A00CECEC600BDB5AD009C9484005A4A4200423931000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004252000042520000425200004252000042520000425200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C0000008C0000008400000084000000840000007B0000007B0000007B000000
      7B0000005A000000000000000000000000000000000000000000000000000000
      000010108400101084001010840010108400101084001010840010106B000000
      0000000000000000000000000000000000000000000000425200004252000042
      5200006B84000094AD00009CBD00009CBD00009CBD00009CBD00004252004A21
      0800000000000000000000000000000000000000000000000000000000000000
      0000947B6B005A2910005A2910005A2910005A2910005A2910005A2910005A29
      10000000000000000000000000000000000000000000000000000000A5002121
      D6005252FF004242FF004242FF003939F7003131EF003131E7002121BD000000
      7B000000840000005A0000000000000000000000000000000000000000000000
      0000101084001821CE001818AD001818AD001818AD001010840008085A000000
      0000000000000000000000000000000000000000000000425200009CB500009C
      BD00009CBD00009CBD00009CBD00009CBD00009CBD00009CBD00004252005A29
      10004A2108004A210800000000000000000000000000000000005A2910005A29
      10007B4218007B4218007B4218007B4218007B4218007B4218007B4218005A29
      10004A2108004A2108000000000000000000000000000000A5002121D6003131
      EF000000D6000000B5000000B5000000B5000000B5000000D6001818E7002121
      BD0000007B0000008C0000005A00000000000000000000000000000000000000
      0000101084002129E7001821BD001818BD001818AD0010108C0008085A000000
      0000000000000000000000000000000000000000000000425200008CA500009C
      BD00009CBD00009CBD00009CBD00009CB5000094AD0000738400004252006B39
      10007B4218006B3910004A21080000000000000000005A2910005A2910007B42
      18007B4218007B4218007B4218007B4218007B4218007B4218007B4218006B39
      10007B4218006B3910004A21080000000000000000000000A5005252FF007373
      FF008C8CFF00A5A5FF00A5A5FF00A5A5FF00A5A5FF008C8CFF006363F7003131
      E70000007B0000009C0000005A00000000000000000000000000000000000000
      0000101084003139E7001821CE001818BD001818AD0010189C00081063000000
      0000000000000000000000000000000000005A29100052524200007B94000084
      9C0000637300004A5A00004A5A00004A5A00004A5A0000425200213131006B39
      10007B4218008C4A18007B4218004A2108005A2910007B4218007B4218007B42
      18007B4218004A2108004A2108004A2108004A2108004A2108007B4218006B39
      10007B4218008C4A18007B4218004A210800000000000000A5005252FF002929
      EF000000D6000000B5000000B5000000B5000000B5000000D6001818E7003131
      E70000007B000000A50000005A00000000000000000000000000000000000000
      0000101084002931E7001821CE001821CE001818AD001818A500101073000000
      0000000000000000000000000000000000005A291000845A390000425200005A
      6B000894AD0021BDCE0042EFF7004AF7FF004AF7FF0042CED600213131004A21
      08006B3910008C4A18008C4A18004A2108005A291000845A39007B4218004A21
      08004A2108004A2108004A2108004A2108004A2108004A2108004A2108004A21
      08006B3910008C4A18008C4A18004A210800000000000000A5005252FF007373
      FF008484FF009494FF009494FF009494FF009494FF008484FF006363F7003131
      E70000007B000000AD0000005A00000000001010840010108400101084001010
      8400101084005A5AEF002129E7001821CE001818AD001818A50010106B000810
      6300081063000810630010107300000000005A291000A56331002939390029A5
      B50039E7F7004AF7FF0042F7FF0042EFFF004AEFF70052A5A50031525200844A
      29004A2108004A2108007B4218004A2108005A291000A56331004A2108004A21
      0800EF9C6300EF9C6300EF9C6300EF9C6300F7A56B00FFAD7B00FFAD7B00844A
      29004A2108004A2108007B4218004A210800000000000000A5005252FF005252
      FF005252FF004242FF004242FF003939F7003131EF003131E7003131E7003131
      E70000007B000000AD0000005A0000000000101084009494F7008C8CEF007B7B
      EF007373EF005A5AEF003939E7002121D6001818BD001818A500101084001010
      73001010730010106B0010108400000000005A2910006B391000A5633900004A
      5A0039A5B50039E7FF0039E7FF0039E7FF004ADEEF00004A5A00AD845A00FFAD
      7B00DE9463009C6339004A2108004A2108005A2910006B391000A5633900EF9C
      6300EF9C6300EF9C6300EF9C6300EF9C6300F7A56B00FFAD7B00FFAD7B00FFAD
      7B00DE9463009C6339004A2108004A210800000000000000A5000000A5000000
      A5000000A500000094000000940000008C0000008C0000008C0000008C000000
      8C0000007B000000940000005A00000000000000000010108400B5B5F700ADAD
      F7009C9CF7008484EF00525AEF002121E7001821CE001818AD00101894001010
      8400101084001010840000000000000000005A291000AD6B3900EF9C6300CE84
      5200004A5A0039A5B50029D6EF0029D6EF004AADB500525A4A00EF9C6B00FFAD
      7B00FFAD7B00FFAD7B00AD6B42004A2108005A291000AD6B3900EF9C6300EF9C
      6300EF9C6300EF9C6B00EF9C6300EF9C6300F7A56B00FFAD7B00FFAD7B00FFAD
      7B00FFAD7B00EF9C6300AD6B42004A210800000000000000A5002121EF005252
      FF002121EF007373E7001010D6001010D6004242FF002121EF007373E7001010
      D6000808A50000007B0000005A0000000000000000000000000010108400C6C6
      F700BDBDF700A5A5F7007B7BEF003939E7001821CE001818B50010189C001010
      8C00101084000000000000000000000000006B391000D68C5200EF9C6300EF9C
      6300C67B5200004A5A0039A5B50031C6D600004A5A00C67B4A00F7A56B00F7A5
      6B00FFAD7B00FFAD7B00EF9C6B005A3110006B391000D68C5200EF9C6300EF9C
      6300EF9C6300EF9C6B00EF9C6B00EF9C6300F7A56B00FFAD7B00FFAD7B00FFAD
      7B00FFAD7B00FFAD7B00EF9C63005A29100000000000000000000000A5002121
      EF00635A9400E7DED600524A8C00000084000000DE00635A9400E7DED600524A
      8C00000084000000840000005A00000000000000000000000000000000001010
      8400BDBDF700ADADF7008C8CEF004A4AE7001821D6001818B50010189C001010
      8400000000000000000000000000000000007B421800C67B4200EF9C6300EF9C
      6300EF9C6300C67B4A0000425A0039A5B500525A4A00DE8C5A00F7A56B00F7A5
      6B00F7A56B00FFAD7B00FFAD7B006B3910007B421800C67B4200EF9C6300EF9C
      6300EF9C6300EF9C6300EF9C6B00EF9C6300F7A56B00F7A56B00FFAD7B00FFAD
      7B00FFAD7B00FFAD7B00FFAD7B006B3910000000000000000000000000000000
      A50073635200E7DED6005A4A42000000290000005A0073635200E7DED6005A4A
      42000000290000005A0000000000000000000000000000000000000000000000
      000010108400ADADF7008C8CEF00424AE7001821CE001818AD00101084000000
      0000000000000000000000000000000000008C4A1800AD633100E7945A00EF9C
      6300EF9C6300EF9C6300C67B4A0000425200CE845200EF9C6300EF9C6300F7A5
      6B00F7A56B00F7A56B00C67B4A008C4A18008C4A1800AD633100E7945A00EF9C
      6300EF9C6300EF9C6B00EF9C6B00EF9C6B00F7A56B00F7A56B00FFAD7B00FFAD
      7B00FFAD7B00FFAD7B00C67B4A00947B6B000000000000000000000000000000
      000073635200F7EFEF005A4A4200000000000000000073635200F7EFEF005A4A
      4200000000000000000000000000000000000000000000000000000000000000
      000000000000101084008484EF003942E7001821CE0010108400000000000000
      000000000000000000000000000000000000000000008C4A1800AD633100D684
      5200E7945A00EF9C6300EF9C6300BD7B4A00EF9C6300EF9C6300EF9C6300EF9C
      6300E7945A00B56B39008C4A180000000000000000008C4A1800AD633100D684
      5200EF9C6300EF9C6300EF9C6300EF9C6300F7A56B00FFAD7B00FFAD7B00FFAD
      7B00FFAD7B00A56339008C4A1800000000000000000000000000000000000000
      000073635200000000005A4A4200000000000000000073635200000000005A4A
      4200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000101084003942E7001010840000000000000000000000
      00000000000000000000000000000000000000000000000000008C4A18008C4A
      1800B56B3900CE844A00E7945A00E7945A00E7945A00E7945A00CE844A00B56B
      39008C4A18008C4A1800000000000000000000000000000000008C4A18008C4A
      1800AD6B3900B56B3900AD845A00DE8C5A00C67B4A00A5633100AD845A00AD84
      5A00845A3900845A390000000000000000000000000000000000000000000000
      000073635200BDB5AD005A4A4200000000000000000073635200BDB5AD005A4A
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C4A18008C4A18008C4A18008C4A18008C4A18008C4A18008C4A18008C4A
      1800000000000000000000000000000000000000000000000000000000000000
      000000000000844A2900845A3900845A3900845A3900845A3900845A39000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000736352005A4A4200000000000000000000000000736352005A4A
      4200000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000007B7B7B00BD7B8C006B636B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009CCE00088CB500297B
      9400297B9400297B940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000730000008C0000008400000084000000840000008400000039000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000394229000000000000000000000000000000
      0000000000000000000000000000000000003194F7005A6BAD00C6949C006B63
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009CCE007BD6FF0073DE
      FF0073DEFF004AC6EF0010A5D600297B9400297B9400297B9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C0000008C0000008C00000094000000940000008C000000840000007B000000
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000003963310039AD39003942290000000000000000000000
      00000000000000000000000000000000000052BDFF003194F7005A6BAD00C694
      9C006B636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084D6FF00D6F7FF007BE7
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF0063D6F70029B5DE00297B
      9400000000000000000000000000000000000000000000000000000094000000
      9400000094000000A5000000A5000000A50000009C000000940000008C000000
      840000008C000000000000000000000000000000000000000000000000000000
      0000000000003963310039AD390084F78400399C420039422900000000000000
      0000000000000000000000000000000000000000000052BDFF003194F7005A6B
      AD00C6949C006B636B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BD6FF00BDE7F70084EF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0039BD
      E700000000000000000000000000000000000000000000009C000000A5002121
      AD00FFFFFF000000A5000000AD000000B5000000AD004A4ABD00FFFFFF000000
      8C0000008C000000840000000000000000000000000000000000000000000000
      00003963310039AD3900CEFFCE0052A5520039BD4200399C4200394229000000
      000000000000000000000000000000000000000000000000000063C6FF003194
      F7005A6BAD00C6949C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094DEFF0031B5E70094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF008CD6EF0084DEFF0094F7FF00B5FF
      FF00297B94000000000000000000000000002929BD000000A5000000B500CECE
      A500FFFFFF00FFFFFF000000AD000000B5004A4ABD00FFFFFF00FFFFFF008484
      AD0000009C000000940000000800000000000000000000000000000000003963
      310039AD39009CF79C004AA54A00398C3900398C390039BD4200399C42003942
      29000000000000000000000000000000000000000000000000000000000052BD
      FF003194F700636B73006B636B00C6949400B58C8400AD7B7B00CE9C9C009C63
      63006B636B000000000000000000000000000000000094DEFF0052C6F700DEFF
      FF009CFFFF009CFFFF009CFFFF008CEFFF00FFD6A500FFCE9C0094F7FF00CEFF
      FF0018ADD6000000000000000000000000000000A5000000B5000000C6000000
      BD00C6C6A500FFFFFF00FFFFFF005252DE00FFFFF700FFFFFF006B6B94000000
      BD000000AD0000009C0000006B00000000000000000000000000396331003963
      3100396331003952310039633100394229003942290039523100396331003963
      3100394229000000000000000000000000000000000000000000000000000000
      000063BDF700B5B5B500B5848400FFDEAD00FFF7CE00FFFFD600FFFFD600FFFF
      DE00BD948C006B636B0000000000000000000000000094DEFF006BD6FF0052BD
      DE00DEF7FF00EFFFFF00CEFFFF00FFDEAD00FFE7AD00FFE7B500FFD6A500DEFF
      FF00DEFFFF00297B940000000000000000000808B5000000C6000000CE000000
      CE000000BD00D6D6BD00FFFFFF00FFFFFF00FFFFFF008484AD000000C6000000
      C6000000BD000000A50000009C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5949400FFDEAD00FFF7BD00FFFFCE00FFFFDE00FFFFEF00FFFF
      FF00FFFFFF00B58C84006B636B0000000000000000009CE7FF0084E7FF0084E7
      FF0084E7FF0073D6FF00CEB59C00CEEFF700FFDEBD00FFEFBD00FFF7C600FFDE
      BD00EFFFFF001094BD0000000000000000000808C6000808D6000808DE000000
      D6000000D600424AC600FFFFFF00FFFFFF00FFFFF7000000C6000000CE000000
      CE000000C6000000B5000000BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFC6A500FFF7C600FFEFB500FFFFCE00FFFFDE00FFFFF700FFFF
      FF00FFFFFF00FFFFD6009C6B6B000000000000000000A5F7FF0094FFFF0094FF
      FF0084EFFF00E7B58C00FFDEB500FFD6A500A5ADAD005AADC60063BDDE00ADDE
      F700FFFFF700EFFFFF00297B9400000000001010CE001010E7001010EF000000
      E7004242CE00FFFFF700FFFFFF00FFFFF700FFFFFF00FFFFFF000000CE000000
      D6000808CE000000BD000000B500000000000000000000000000394229003963
      3100396331003952310039422900394229003963310039523100396331003963
      3100396331000000000000000000000000000000000000000000000000000000
      0000D6A59C00FFE7BD00FFDEAD00FFEFB500FFFFCE00FFFFDE00FFFFEF00FFFF
      EF00FFFFE700FFFFD6009C6B6B000000000000000000B5FFFF009CFFFF0094FF
      FF00D6A58C00FFDEBD00FFD6A500FFD6A500FFCE9C00FFCE9C00FFCE9C00FFEF
      D600FFCE9C007373730000000000000000001818D6001818F7001818FF004A4A
      E700FFFFF700FFFFFF0073739C000000D600CECEAD00FFFFFF00FFFFFF000000
      E7000808DE000808C60000009400000000000000000000000000000000003942
      2900399C420039BD4200398C3900398C39004AA54A009CF79C0039AD39003963
      3100000000000000000000000000000000000000000000000000000000000000
      0000D6A59C00FFF7CE00FFD6A500FFE7AD00FFF7C600FFFFD600FFFFDE00FFFF
      DE00FFFFDE00FFFFCE009C6363000000000000000000BDE7F700B5FFFF00D6A5
      8C00FFEFD600FFEFDE00FFCE9C00FFCE9C00FFCE9C00FFD6A500FFD6AD00FFEF
      DE00D6B59C000000000000000000000000003131E7002929FF002929FF00D6D6
      BD00FFFFFF006B6B94000000EF000000E7000000D600BDBD9C00FFFFFF007373
      BD001010E7001010CE005A5A6B00000000000000000000000000000000000000
      000039422900399C420039BD420052A55200CEFFCE0039AD3900396331000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFEFBD00FFFFDE00FFDEB500FFE7B500FFF7C600FFFFCE00FFFF
      CE00FFFFC600FFF7C6009C637B00000000000000000000000000009CCE00FFB5
      5A00FFF7EF00FFF7EF00FFF7EF00FFD6A500FFD6AD00FFD6AD00FFE7C600F7E7
      CE0000000000000000000000000000000000000000002929FF004A4AFF004A4A
      FF006B6B84001010FF000000FF000000F7000808FF001818F7004A4A94002121
      FF002121EF001010D60000000000000000000000000000000000000000000000
      00000000000039422900399C420084F7840039AD390039633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6A59C00FFFFFF00FFFFFF00FFE7B500FFEFBD00FFE7B500FFE7
      B500FFFFCE00EFC6A50000000000000000000000000000000000000000000000
      0000FFB55A00FFFFF700FFFFF700FFFFF700FFDEB500FFE7C600FFF7EF000000
      00000000000000000000000000000000000000000000000000004242FF006B6B
      FF008484FF007373FF005252FF004242FF004A4AFF005252FF004A4AFF003939
      FF002121F7000000000000000000000000000000000000000000000000000000
      000000000000000000003942290039AD39003963310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFE7C600FFFFFF00FFF7DE00FFDEAD00FFEFB500FFFF
      D600FFCE9C00AD847B0000000000000000000000000000000000000000000000
      000000000000F7DEC600FFFFFF00FFF7EF00FFF7EF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      FF007B7BFF00A5A5FF00A5A5FF009C9CFF008484FF006B6BFF004A4AFF002121
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000394229000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5848400EFD6AD00FFE7B500FFDEB500D6A5
      9400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFE700FFB55A00FFB55A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003939FF006363FF008484FF007B7BFF006363FF003939FF006B6BF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B635A007373
      73009484A5006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0029AD290042BD42004ABD
      4A0039B53900218C21004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C423900B55A5A00734A
      3100000000000000000000000000000000000000000094521000633918003939
      3900313131003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B635A0052BD
      FF00427BCE009484A5006B6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000029A529004ABD4A0063CE63009CC6
      8C00298C290052C6520029A5290084635A009C737300634239004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C5A4A00C6737300E7C6BD000000
      00000000000000000000000000000000000000000000B5521800C67B4200D694
      6300AD4200007B3108004A312900313131003131310000000000000000000000
      000000000000000000000000000000000000000000006B6B6B00737373005A5A
      5A0052BDFF00427BCE009484A5006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000001894180063CE630042A54200FFFF
      FF007BB57B0073D6730029942900B5A5A500D6D6D600BD9C9C00BD8C8C004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C5A4A00CE8C8400DEB5AD00000000000000
      00000000000000000000000000000000000000000000C66B1800CE845200FFE7
      C600FFE7C600FFE7BD00EFB58C00C67339009C31000063391800313131000000
      000000000000000000000000000000000000B5420800C6421800E7523900F763
      4A007B5A5A005AC6FF00296BCE009484A5006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B00000000000000000000000000000000005A8C52000873AD00107B
      C600317B5200298C2900BDBDB500D6BDBD00CEADAD00CEADAD00CEADAD004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C5A4A00D6949400C67B7B0000000000000000000000
      00000000000000000000000000000000000000000000C66B1800DEA58C00FFE7
      CE00FFE7C600FFDEB500FFDEB500FFDEB500FFC67300E7AD6B004A3129000000
      000000000000000000000000000000000000C6421800E7523900FF6B5A00FF7B
      6300EF6B4A00847B73005AC6FF006384AD007B524A00A5736B00D6AD9C00E7CE
      BD009C8473006B6B6B00000000000000000000000000107BBD00319CFF00319C
      FF003194FF004A393100C6CECE00CEA5A500CE848400CE848400CEA5A5000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A009C636300DEB5AD00946363004A4A4A004A4A4A004A4A4A004A4A
      4A000000000000000000000000000000000000000000CE732900E7BD9400FFEF
      D600FFE7CE0042ADCE00FFE7BD00FFDEB500FFAD3100E7AD6B00423931000000
      000000000000000000000000000000000000AD391000FF6B5200FF7B6300FF94
      7300EFAD7300FFD6A500B56342009C847300E7BD9C00FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7D6BD0073737300000000000000000039A5FF0042A5FF0042AD
      FF0042A5FF0018425200BD8C7B00CE7B7B00C65A5A00C65A5A004A4A4A000000
      0000000000000000000000000000000000009C946B00C67B7B00C67B7B009C5A
      4A00B55A5A00E7C6BD008C523100C67B7B00C67B7B009C946B00C67B7B006B42
      39000000000000000000000000000000000000000000CE6B2100E7CEB500FFF7
      DE00ADD6D60018A5CE00E7DECE00FFC67300C6BDAD00DE945200393939000000
      00000000000000000000000000000000000000000000CE4A2100FF8C6B00BD4A
      1800FFCE9C00FFCE9C00AD523100CEA58C00FFFFC600FFF7BD00FFFFD600FFFF
      EF00FFFFFF00FFFFF700AD7B73006B6B6B00086BA5004AADFF0052BDFF0052BD
      FF0052BDFF003184AD00D6942900FFAD3100F7BD6B00C6737B004A3129000000
      000000000000000000000000000000000000CECEC600CEDEE700947B7B00C673
      7300E7C6BD009463630039D65200DEEFEF00DEEFEF00DEEFEF00DEEFEF008442
      18000000000000000000000000000000000063636300CE6B2100FFF7E700BDD6
      DE0042ADCE00FFE7D60042ADCE00E7CEB5007B7B5200FFD6AD00E78C39008452
      2900313131000000000000000000000000000000000000000000734229000008
      730008298C000008730073422900F7D6AD00FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00F7D6AD006B6B6B00086BA500107BC6001884D6002184
      B5001873B500314A4A00E7AD4A00FFC64A00FFC64A00D6AD52007B5A31004A4A
      4A0000000000000000000000000000000000CECEC6009C63630094848400D6A5
      9C0094636300DEEFEF00D6E7EF00BDDED60029C63900DEEFEF00DEEFEF008442
      18000000000000000000000000000000000063636300CE6B2100FFF7EF00FFF7
      EF00FFF7E700FFF7DE00009CCE00FFE7CE00FFE7C600DE843100FFDEB500FFE7
      C600E79C52008452290031313100000000000000000008080800000000001042
      AD001042AD001042AD0031186B00FFE7B500FFDEAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600F7D6AD006B6B6B0000000000298CBD0073BDE7007BBD
      E7003994CE00C69C5200FFCE6B00FFCE6B00FFCE6B00EFC6630042ADFF001073
      A5004A4A4A0000000000000000000000000094BDAD007373840094636300C6E7
      DE00DEEFEF0073D68C0073D68C0010AD1800BDDECE00A5E7F70000CEFF00009C
      CE0021C6EF0000000000000000000000000063636300C66B1800FFFFF700FFF7
      F700FFF7EF00FFF7E7007BC6D600D6DED600FFE7CE00D68C52005A4A3100DE84
      3100EFB57B00E7EFF700084AD6004A4A7B00101010001818180010318C00185A
      C600185AC600185AC6001852A500D6AD9C00FFFFEF00FFEFC600FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C68C8C006B6B6B0000000000000000003984A500427B
      9C00BD946B00FFCE7300FFDE7B00FFDE8400F7D68400A58C5A00219CCE0052BD
      FF0029526B00000000000000000000000000009CCE0000C6F700BDDECE006BCE
      7B00DEEFEF006BCE7B00DEEFEF00DEEFEF0052E7FF00009CCE00C6E7F7008442
      18000000000008B5E7005AC6DE000000000063636300BD520000FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E70018A5CE00FFEFD600D68C5200394242000000
      0000000000002931B5002931B5000000000021212100292929001852A5002173
      DE00297BDE00297BDE00216BD600634A4A00FFFFEF00FFFFFF00FFE7BD00FFD6
      A500FFFFC600FFDEAD005A5A5A0000000000000000000000000000000000C6BD
      BD00FFD67300FFDE8400FFEFA500FFEFA500A5BDA50073DEFF0073D6FF006BD6
      FF0052BDFF00219CEF004A4A4A000000000018B5E70031DEFF00DEEFEF00189C
      1800219421005AB56300BDDECE00D6EFEF0018B5E70000CEFF00DEEFEF008442
      18006BCEE700000000005AC6DE000000000063636300B54A0000FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7EF0031ADD600FFEFDE00C67B42004A4A4A000000
      000000000000000000000000000000000000313131003939390008101800319C
      FF00319CFF00319CFF00318CF7007B7B7B007B635A00D6AD9C00FFE7B500FFE7
      B500E7BD9C005A5A5A000000000000000000000000000000000000000000D6CE
      CE00E7C68400F7DE9400FFFFBD00FFFFCE0018ADDE0084EFFF0063D6F70039B5
      E70010A5D60052BDFF00219CEF004A4A4A0000B5EF0008D6FF0042E7FF00DEEF
      EF00D6E7EF0094BDAD00BDDECE0029BDE700FFFFFF0018B5E700DEEFEF006B42
      390029B5D60029B5D600000000000000000063636300BD520000CE845200E7CE
      B500FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00C67B42004A4A4A000000
      00000000000000000000000000000000000008080800424242004A4A4A001818
      180008296B001852CE001852A5000000000000000000000000009C6B6B009C6B
      6B0000000000000000000000000000000000000000000000000000000000C6BD
      BD00C6BDBD00CEBDBD00A58C8C00A58C8C0021ADD6008CF7FF006BDEF70039BD
      E70010A5D60010A5D60052BDFF004A4A4A006BBDBD0042E7FF004AEFFF0073F7
      FF00A5E7F700006B9C0052E7FF0021DEFF0000B5EF00C6E7F700DEEFEF008442
      18000000000000000000000000000000000063636300C65A0000C65A0000C65A
      0000C65A0000B54A0000B54A0000C67B4200DEA58C00C67339004A4A4A000000
      00000000000000000000000000000000000000000000424242006B6B6B008C8C
      8C00ADADAD006B6B6B0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6BDBD0063ADCE00D6FFFF0073E7F70039BD
      E70010A5D60010A5D6006BD6FF004A4A4A00EF8400002184A500008CB5005ABD
      D600006B9C001094C6006BBDBD00186B8C00219CC600EF840000EF8400008442
      18000000000000000000000000000000000063636300EFAD5A00DEC69400F7B5
      7300E7943900D66B0800C65A0000C65A0000C6630000C6630000525252000000
      0000000000000000000000000000000000000000000000000000181818007373
      73005A5A5A000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021ADD600D6EF
      F700D6EFF70039B5E7004A4A4A0000000000A54A2100DE8C4200DE8C4200219C
      C60029BDE70010A5D60084949400E79C4A00DE8C4200DE8C4200CE7B10004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000636363006363630063636300EFAD5A00CEAD7B00D6A56300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008C8C8C009494
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3100009C390000632910004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000DED6C6006363
      6300636363006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B8431006B8C3900848C42008C7331009C6B2100A5520800AD4A0000CE9C
      63000000000000000000000000000000000000000000C6949C00F7CEAD00FFC6
      9C00F7946B00BD7352009C5A42006B6363007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C390000CE6B0000A5421000E7C6BD00B56339009C310000842100006329
      10004A4A4A004A4A4A0000000000000000000000000000000000ADDEA500CEEF
      BD00FFFFDE00FFFFDE00FFFFE700FFFFFF00EFEFE700BDB5AD00636363006363
      630000000000000000000000000000000000000000000000000000000000314A
      0800849C4A008CB5630094A55A00948C4200A57B3100AD6B2100B5631800A54A
      00000000000000000000000000000000000000000000CE949C00EFFFF700C6EF
      C600A5EFAD00ADEFAD009CEF9400EFDEB500FFC69C00F7946B009C5A42000000
      000000000000000000000000000000000000000000000000000000000000A539
      0000DE730000D66B0000BD735200EFDED600E7CEC600E7C6B500DEB5A500D6A5
      8C00AD52290063423900000000000000000000000000D6A5A500EFF7CE00FFFF
      DE00FFFFDE00FFFFDE00EFF7DE00CEEFBD009CD69C00BDE7B500EFF7E7006363
      6300000000000000000000000000000000000000000000000000000000004A52
      10008CB55A00A5CE7B009CB573009C9452009C7B3900A5732900AD6318008C31
      0800ADA5730000000000000000000000000000000000CE949C00BDEFB500A5E7
      A500DEBD6300DEAD5A00EFBD5A00FFD68C00EFDE9C00A5E78C007B6331000000
      00000000000000000000000000000000000000000000000000009C421800EF84
      0000E77B0000DE730000BD7B5200F7E7DE00EFD6CE00E7C6BD00DEB5A500DEB5
      9C00D6A59400C69C9C00000000000000000000000000D6A5A500FFFFDE00FFFF
      DE00FFFFDE00CEC68C00ADD69C00ADDEA500CEEFBD00EFF7E700FFFFFF006363
      6300000000000000000000000000000000000000000000000000293900008484
      39008CB56300A5E79400A5C68C009CA563009C8442009C7331009C6318007331
      08009C6318009C4A1800000000000000000000000000CE949400A5EFAD00ADEF
      AD00DEAD5A00DE9C5A00C68C4A00CE945200BD8C3900C6943900D6843100E7B5
      7300E7B57300AD8C5A0000000000000000000000000000000000C6630000EF84
      0000EF840000E77B0000BD7B6300F7E7E700EFDED600A5948400DEBDAD00CE94
      7B00D6AD9C00CEA59C00000000000000000000000000D6A5A500FFFFDE00EFF7
      DE00E7E7DE00BD636300D6AD6B00EFC68C00EFF7E700FFFFFF00FFFFFF006363
      63000000000000000000000000000000000000000000000000007B944200A59C
      5200A5A55A00BDEFAD00ADD69C0094AD7300948C4A0094733100845A18004A18
      0000E773180000000000000000000000000000000000CE949400CEF7CE00E7EF
      BD00EFAD5A00E7A55A00CE9C4A00CE9C4200B5943900B5943900B5633100CE94
      6B00C6846300D6A56B0000000000000000000000000000000000CE630000F78C
      0000EF840000E77B000063423100F7EFEF00F7E7DE00EFD6CE00E7CEBD002984
      B500DEB5A500CEA59C00000000000000000000000000D6A5A500CEEFBD00ADDE
      A500ADDEA500E7E7DE00BD736B00EFB58400F7CE9C00FFFFFF00FFFFFF006363
      6300000000000000000000000000000000000000000073844A009CAD6300BD9C
      52008C8C4200BDEFAD00ADE7B5009CB584008C8C5200736B31006B4A18006B29
      08005218000000000000000000000000000000000000CE949400EFFFF700FFD6
      AD00EFB55A00E7AD5200C6A53900C6A53900C69C3900CE9C4200C6733100D69C
      6300DEA56B009C8C7B0000000000000000000000000000000000CE630000FF94
      0000F78C0000EF84000018080800FFF7F700F7EFE700EFDED600EFD6C600E7C6
      BD00DEBDAD00CEADA500000000000000000000000000D6A5A500ADDEA500CEEF
      BD00EFF7DE00EFF7DE00DEA55A00CE6B0000EFB57B00EFC69400EFF7E7006363
      630000000000000000000000000000000000000000006B843900B5CE8400B573
      29004A523100BDFFBD00BDFFCE009CB58400738C5A006B6331004A3110005231
      00000000000000000000000000000000000000000000CE949C00EFFFF700EFBD
      6300EFBD5200DEB54200C6AD2900D6AD4200DEAD4200DEAD4A00D6843100E7A5
      6B00F7BD73000000000000000000000000000000000000000000CE6B0000FF94
      0000F78C0000F78C0000F7CEA500DEAD8400BD846300E7BDA500E7CEC600E7CE
      C600DEBDAD00CEADA500000000000000000000000000D6A5A500CEEFBD00EFF7
      DE00FFFFE700FFFFFF00FFFFFF00D67B2100CE6B0000E7A56300DE9C52006363
      630000000000000000000000000000000000000000007B945200BDD68C00A54A
      00000000000000293100004A5A00104229006B8C63004A4A1800212908000000
      00000000000000000000000000000000000000000000CE949400D6F7CE00E7BD
      5200DEBD4A00DEBD4200DEB53900EFB54A00EFB54A00F7B55200DE8C3100EFB5
      6B00DEAD73000000000000000000000000000000000000000000CE6B0800FF9C
      0000FF940000FFE7D600FFFFFF00FFE7D600F7D6B500FFDEBD00A56B5200AD52
      1800943900004A4A4A00000000000000000000000000D6A5A500FFFFE700FFFF
      E700FFFFE700FFFFFF00EFF7E700D6EFC600D67B2100CE6B0000C6735200735A
      4200000000000000000000000000000000000000000000000000BDEFAD00DE42
      000000738C0018E7FF0018F7FF00088CC6000831000000000000000000000000
      00000000000000000000000000000000000000000000CE949400C6D67B00DECE
      6300E7C66300EFC66300E7BD5200F7C65A00FFBD5A00F7BD5200EF9C3100FFBD
      6B009C8C7B000000000000000000000000000000000000000000CE6B1000FFA5
      1000FF9C0000FF940000FFE7D600FFF7EF00FFE7CE00C6947B00D6AD9400D6AD
      9400CE9C84004A4A4A00000000000000000000000000D6A5A500FFFFE700EFF7
      E700DEF7D600CEEFC600ADDEA500ADDEA500ADDEA500D69C9400B5735A00AD7B
      6300634A4200000000000000000000000000000000000000000094D68C005294
      6B0021FFFF003100000000FFFF0008BDFF009C39000073000000000000000000
      00000000000000000000000000000000000000000000C6949C00D6C66300EFD6
      9400FFD68C00FFD68C00EFCE6B00FFCE7300F7C66B00EFC65A00EF9C3100FFC6
      7B00000000000000000000000000000000000000000000000000CE732100FFA5
      2100FF9C0800FF940000F7EFE700EFC6AD00CE9C8400CE9C8400D6A58C00D6AD
      9C00D6A58C004A4A4A00000000000000000000000000D6A5A500EFF7DE00CEEF
      C600BDE7B500ADDEA500ADDEA500ADDEA500CEEFC600EFF7E700D6842900CE6B
      0000735A42007B636300000000000000000000000000000000000000000008FF
      FF00000000006B7B29008C8C42009C7B2900B5631800C6420000A56B4A000000
      00000000000000000000000000000000000000000000CE949400F7D68400F7E7
      AD00FFDEA500FFDEA500EFD68400EFD68400E7CE6B00E7C66300EFAD4A00E7B5
      7300000000000000000000000000000000000000000000000000CE732100FFAD
      3100FFA51800FF9C0000F7EFEF00F7E7DE00B5B5C600848CAD003173B500DEB5
      A500D6AD94004A4A4A00000000000000000000000000D6A5A500ADDEA500ADDE
      A500ADDEA500CEEFC600EFF7E700EFF7E700FFFFFF00FFFFFF00FFFFFF00D673
      1000D67B2100BD9C94000000000000000000000000000000000029B5DE000852
      84001863390094B56300ADD69C00ADA57300A57B31009C4A18005A0800000000
      00000000000000000000000000000000000000000000CE8C8C00FFE7BD00FFE7
      BD00F7E7AD00EFDE9C00D6D68400E7D68400E7D67B00E7CE7300E7AD5200948C
      7300000000000000000000000000000000000000000000000000CE7B2900FFB5
      4A00FFAD3100FFA51000FFF7F700F7EFE700EFDED600EFD6CE00E7C6BD00DEBD
      AD00DEB59C004A4A4A00000000000000000000000000D6A5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006363
      6300D6731000636363000000000000000000000000000000000018E7FF0021FF
      FF001884A5008CB56300B5EFBD009CCE9C007B7B42006B4A18005A3118000000
      00000000000000000000000000000000000000000000D69C94008C7B7300FFF7
      CE008C94A500FFF7CE0094949C00FFE7AD00CECEBD00FFE7AD00EFA563008C8C
      8C00000000000000000000000000000000000000000000000000CE7B3100FFBD
      5A00FFB53900FFA52100FFC67B00FFC67300F7D6AD00EFCEAD00EFCEA500E7C6
      B500DEB5A5004A4A4A00000000000000000000000000D6A5A500E7BDBD001894
      B500E7C6C6006B94AD00CE949400D6E7EF00845A6B00FFFFFF001894B5006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000639C4A0084C69C0073B594004A734A0008180000000000000000
      00000000000000000000000000000000000000000000BD737300C68484009484
      9400C6847B0094849400C684840094949C009C949400EFA59400A5ADB5000000
      0000000000000000000000000000000000000000000000000000B5633100B563
      3100B5633100CE947300DEBDAD00DEBDAD00CE9C8400BD7B5200B56B4A00B55A
      3900AD522900000000000000000000000000000000000000000008C6DE006363
      630008C6DE006363630094B5C60063636300C6ADA500948484006B94AD006363
      6300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A734A00425A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000A5ADB5000000
      000063ADB500000000005ABDD600000000004ACEE700738C8C007BBDC6000000
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
      00000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000848484000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000008400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF0000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000848484000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000008484840000000000C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C600848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000000000000
      000000000000000000000000000000000000FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000084000000
      000000000000000000000000000000000000FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FFFF0084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000000000000
      000000000000000000000000000000000000FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000008484840000000000848484000000000084848400000000008484
      84000000000000000000000000000000000000000000848484000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000008484840000000000C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000008400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C60084848400C6C6C60084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000000000000000000084848400C6C6
      C600FFFFFF008484840000000000840000000000000000000000000000000000
      00000000840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600FFFFFF0084848400000000000000000000000000000000000000
      84000000840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60084848400000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60084848400848484000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF0084848400000000000000000000000000C6C6C600FFFFFF00FFFF
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      84000000840000000000000000000000840000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C60000000000000000000000000084848400C6C6
      C60084848400848484008484840084848400848484008484840084848400C6C6
      C600848484008484840000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000084000000000000000000000084000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C6000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000084000000FF0000C6C6
      C60084848400848484000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00848484000000000000000000000000000000000084848400C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000008400000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000008484840000000000C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600848484000000000000000000848484000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
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
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000C6C6C6008400000084000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000C6C6
      C600840000008400000084000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000C6C6C6008400
      0000840000008400000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084000000C6C6C600840000008400
      0000840000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      84008484840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600FFFFFF008484840084000000840000008400
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000084840000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      84008484840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C6C6C60000000000FFFFFF000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000FFFFFF0000000000C6C6
      C60000000000FFFFFF0000000000C6C6C60000000000C6C6C600000000000000
      00000000000000000000840000008400000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6
      C600C6C6C60000000000840000008400000000000000C6C6C600FFFFFF00FFFF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600840000008400000000000000C6C6C600FFFFFF00FFFF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFF0000FFFF0000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000008400000084000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
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
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100200000100010000000000801000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF801FFFFC001FFFFF801FFFF
      8000C00FF801CE1F10048007C001C00F10040003C001C00F100400038001C007
      100400038001E0071FF400018001E007000000010001E007000100010001E007
      000300010001E0033C0700030001E00781FF00070001E007C3FF81FF0E03F00F
      FFFFC3FF3F83F01FFFFFFFFFFFC7FFFFFF9FC001F81FC001FF1F8000E0078000
      FE1F0000C0030000F80F000080010000E003000180010000C001800100000000
      80018003000000000000C003000000000000C007000000010000E00700000001
      0000E00F000000010001F00F800180018001F01F8003C0018003F81FC007F001
      C007F83FE00FB001F01FFC7FF83FF003FFFFFFFFFFFFFFFFFFFFFFFFFF81FFFF
      FFFFEFFD8100EFFDFFFFC7FF0000C7FFFFFFC3FB0000C3FBFDFFE3F70000E3F7
      F9FFF1E70000F1E7F0FFF8CF0000F8CFE01FFC1F0000FC1FC007FE3F8000FE3F
      C003FC1FC000FC1FE005F8CFFE00F8CFF1FBE1E7FE00E1E7F9F5C3F3FE00C3F3
      FDFBC7FDFE01C7FDFFFFFFFFFF03FFFFFFFFFFFFFFFFFFFF87FFFEBFFFFF81F7
      301F800087E19DE3200F800087E1CFE30007800087E1E7C1800380008181F3C1
      800180008001B9F780018000800181F7800180008001FFF780018000800188F7
      80018001C1839CF78003E007E187C1F7C003F00FE187C9F7E007F01FE187E3F7
      F00DFC3FFFFFE3F7FC21FD7FFFFFF7F7FE01FFFFF1FFFFFFFC00FFFFC07FF01F
      FC0007FF803FE00F8000007F003FC0070000000F000380030000000780010001
      00000007C0010001000000038000000100000003800000010000000180000001
      000000018001000100000001000100010001000F00038003003F000F000FC007
      003F87FF003FE00F807FFFFFF03FF01F8001FF1F8000C0000000FF0720000000
      0000FF03000000000000FFC1000000008001FFF100000000FFFFFFF000000000
      FFFFFFF800000000FE7FFFF800000000FC3F01F800000000F80F01F800000000
      F00F01F000000000FC3F07F100000000FC3F01C100000000FC3F000300000000
      FC3F100700000000FFFF1C1F00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3F
      FF80FFFF80FFFC3FFF00FFEF007FFC3FF700FFE7006FFC3FE70080030067F00F
      C00100018003F81F800000000001FC3F000000010000FE7F800080030001FFFF
      C001FFE78003FFFFE700FFEF00678001F700FFFF006F0000FF00FFFF007F0000
      BF81FFFF80FF0000FFFFFFFFFFFF8001C003CFFFFC0FFFFF000087FFF87FFFFF
      000083FFF0FFFFFF000081FFF1FFFFFF0000C0FFF1FFF7FF0000E07FC07FE7FF
      0808F03FE0FFC0010000F811F1DF80008001FC01FB8F0000C003FE01FF078000
      E3C7FF03FE03C001F00FFF83FF8FE3FFF7CFFF03FF8FF7FFF00FFE07FF0FFFFF
      F78FFF3FFE1FFFFFF81FFFFFF03FF7FFFFFFFFFFFFFFFFFFFF7FFFFFFFFFFFFF
      FE3FFFFF8003E003FC1FFE010001C003F80FFC000001C003F007FC000001C003
      FC1FFC000001C003FC1FFE010000C003FC1F803F0000C013FC1F001F0000C813
      FC1F001F0000C013FC1F001F0003C813FC1F803F8007C013FC1FFFFFC087C003
      FE3FFFFFF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07EE0FDC3F8003F801C003
      CC3F8001F0008001043F8001F000A001CC3780018000E001DC3380018000E001
      EC0180018000E001E4008001F000E001000180018000E001E43380018000E001
      EC3780018000E001DC3F8001F000E001CC3F80038000E001043FD5038000E001
      CC3FE2FF8000E001DFFFFFFFF801F0038000FFFFFDFFFFFF8000FFFFF8FFC7FF
      0000FFFFF07FC3FF00000000F83FE1FF00000000FC1FF0FF00000000000EF87F
      000000000304FC0F000000000780FE070000000003C0FB030000000001E0C181
      0000000020C0E1E1100000007000C09B00000000F83FC30F00000000FC1FF30F
      0000FFFFFE3FF79F0180FFFFFF7FFFFFC81FFFFFF8FFFFFF8007801FF01FC03F
      0003A01FF003C03F0001A001E000C03F0001A001E000C03F0000A001C000C003
      0000A001C000F0030000BE01C000F0030000A001C000F0030000BE01C000C003
      0000BC018000C0038000BE01000EC00380008003E0E6D807C000F807E0E0DC0F
      E001F80FE0FFC01FF813FFFFE0FFFFFFFF07FF00FFFFFBFFF8010000F85FF1FF
      F0000000E08FE0FFF0000000C007C07FF00000008003803FF00000008001803F
      F00000000000F1FFF00000000001F11FC00000000001F11FC00000000001FF1F
      000000000001F803000000008003F803000000048003FC0700000004C007FE0F
      C0000004E00FFF1FC0010004F83FFFBFC307FFFEFFFFFF0780010002FC3FF801
      00000002F00FF00000000002E007F00000000002C003B00000000002C0031000
      800000028001B000C00000028001F000F00000028001B000F00000028001B000
      F0000002C0031000F0000002C0031000F0000002E0071000F0000002F00F1000
      F0000002FC3FB000F8000002FFFFF801FFFFFFFFFFFFFF80FFFFC003FF7F00A0
      F81F8001FE3F0010F0078001FC1F0000F0038001F80F0000DD018001F0070000
      8D01BC01E0030000A001BA01C0010000A001B60180030000A001BE01C0070004
      8001BE01E00F0004D0038001F01F0004E6278001F83F0004F00F8001FC7F0004
      FFFFC003FEFF0004FFFFFFFFFFFF0004FFFFFFFFFFFFFFFFFC7FC3FFFC3FC003
      F81F81FFF1CFC003F00781C3E087C003E0038181C083C003C003C181C183C003
      C003E1818001C003C003FD818181C003C003FDC18181C003C003FDFD8001C003
      C003FDFDC183C003C003FC3DC103C003C003FC01E107D807C003FC01F38FDC0F
      F01FFFC1FC3FC01FFFFFFFFFFFFFFFFFFFFFF841FBFFFFFFFC3FF841F000C003
      F00FF805E000C003E007C801C000C003C00380018000C003C00300000000C003
      80018040E000C0038001C3C0C000C003800103808000C00380010000F000C003
      C0030000F000C003C0038000F000C003E007E000F001C007F00FE000F003C00F
      FC3FE102F007C01FFFFFFF80FFFFFFFFFFFFFFFFFFFFFFFFFFFFC3FFC0038003
      800181CFC00380018001008FC00380018001000FC003800180010003C0039101
      80010001C003990180018000C003988180018000C003900580018000E187900D
      80018000E187988180018000E187A0018001C001F40F80038001E003F18FD503
      FFFFF80FFC3FE2FFFFFFFFFFFFFFFFFFE01FFFFFFFFF8000E00FFE01C0070000
      E007F000C0070000E003E000C0030000C003C000800300000003C00080010000
      0000800080010000400080008000000000020C0080030000C500000081810000
      E6038000C1C10000E003C000C0C30000E003C000E1C30001F003C001F2030000
      F803E01FFE070000FC03FFFFFFFF00008001FFFFFFFFFFFF8001FFFFFFFFFF8F
      8001FFFFFFFFFC830000FC7FFFFFFC010000F81FFFFFFC010000F003FFFFF820
      8001E001FFFCF0708001C001FFF8C0608FF18001AAA08003C0038001FFF88001
      C003A007FFFC0801C003801FFFFF008FE007F07FFFFF80DFE007FFFFFFFF81FF
      E007FFFFFFFFE7FFF00FFFFFFFFFFFFF84218421887FFC1F00000000800FE007
      000000008007C003000000008007C003000000008001C003000000008001C003
      000000008001C003000000008001C00300000000C001C00300010001E001C003
      001F001FF001C003001F001FF003C003003F003FF00FC00303FF03FFF20FC003
      03FF03FFF81FC00387FF87FFFC3FE007FFFFFFFF84218421FEFFF83F00000000
      FC7FE00F00000000F83FC00700000000F01F800300000000E00F800300000000
      C007000100000000800300010000000000010001000000000001000100010001
      F01F0001001F001FF01F8003001F001FF01F8003003F003FF01FC00703FF03FF
      F01FE00F03FF03FFFFFFF83F87FF87FFF81FFFFFF03FFFFFE007F01F800FF00F
      C003F01F8003C0038001F01F800180018001F01F000000008001F01F00000000
      8001000100000000800100010000000080018003000000008001C00700000000
      C001E00F00000000E003F01F00000000F18FF83F80018001F5AFFC7FC003C003
      F18FFEFFF00FF81FF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FFF83FFF01FFEFF
      0FFF803FE00FFC7F07FF800FC007F83F83FF800F8003F01FC3FF80070001E00F
      E00780070001C007F00380030001FFFFF80180030001FFFFF80180010001C007
      F00180030001E00FF00180070001F01FF801C00F8003F83FF803F01FC007FC7F
      FC03F83FE00FFEFFFE0FFC7FF01FFFFFE7FFFFFFFFDF9FFFC3FF01FFFF8F83FF
      C1FF001FFF1F807F80FF000FFE3F801F0007800FFC7F801F0003801F000F801F
      0001801F000F801F8000001F000F0007C000000F000F00018000800700070000
      0000C007000900190001E0010005001F0003E0000003001F01CFE000000F001F
      81FFFE00000F001FC3FFFFC1000FF01FFFFFFFFFFFFF8FFFF83FC1FFF00F807F
      F003C00FE00F801FE003800FE007801FC003800FC0038003C003800FC0078003
      C003800F80078003C003800F800F8007C003800F881F8007C003800FC07F8007
      C0038007C03F800FC0038003E81F800FC0038003C01F800FC0038003C01F800F
      C003800FF83F801FC007C00FFE7FD51FFFFFFFFFFFFFFFFFFFFFFFFFF01FFE7F
      E000FFFFE00FF81FC000FFFFC007F00FD000FDFF8003C003A000FCFF00018001
      A000FC7F000100004000FC3F0001C0037FE0FC1F000100000000FC3F0001E007
      A000FC7F0001F00FA07CFCFF0001F00FA081FDFF8003F81FDF7FFFFFC007F81F
      E0FFFFFFE00FFC3FFFFFFFFFF01FFE7FFFFFFFFFFFFFFFFFFF3FC007FFFFFFFF
      FE3F8003FFFF8001C07F0001FFFF000180F70001E007400100E70001C0034001
      00C10000C001400100E60000C001400100F68000C001400181FEC000C0014001
      C3BFE001E0014001FFB7E007F0037FF9FFB3F007FFFF0003FFC1F003FFFF80FF
      FFF3F803FFFFC1FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFF3C001000C000FFFE1
      80010008000FFFC180010001000FFF8380010003000FF00780010003000FC00F
      80010003000F801F80010003000F801F80010003000F000F800100070004000F
      8001000F0000000F8001000F0000000F8001000FF800801F8001001FFC00801F
      8001003FFE04C03FFFFF007FFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEFFDC007001FFFFFC7FFC007000FFFFFC3FBC0070007EFFFE3F7C0070003
      EF83F1E7C0070001DFC3F8CFC0070000DFE3FC1FC007001FDFD3FE3FC007001F
      EF3BFC1FC007001FF0FFF8CFC0078FF1FFFFE1E7C00FFFF9FFFFC3F3C01FFF75
      FFFFC7FDC03FFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00F9FFFFFFFFFF
      8000F6CFFE00FFFF0000F6B7FE00FFFF0000F6B7FE00FFFF0000F8B78000FFF7
      0001FE8F8000C1F70003FE3F8000C3FB0003FF7F8000C7FB0003FE3F8001CBFB
      0003FEBF8003DCF70003FC9F8007FF0F0003FDDF807FFFFF8007FDDF80FFFFFF
      F87FFDDF81FFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    AutoPopup = False
    Images = ImageList1
    Left = 344
    Top = 104
    object N1: TMenuItem
      Action = addtype
    end
    object N3: TMenuItem
      Action = edittype
    end
    object N2: TMenuItem
      Action = deltype
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 224
    Top = 16
    object addtype: TAction
      Caption = #28155#21152#21830#21697#20998#31867'...'
      ImageIndex = 16
      OnExecute = addtypeExecute
    end
    object deltype: TAction
      Caption = #21024#38500#21830#21697#20998#31867
      ImageIndex = 5
      OnExecute = deltypeExecute
    end
    object edittype: TAction
      Caption = #26356#25913#20998#31867#21517#31216
      ImageIndex = 10
      OnExecute = edittypeExecute
    end
    object NewIncoming: TAction
      Caption = #35745#20214#21830#21697#36827#36135#21333
      ImageIndex = 21
      OnExecute = NewIncomingExecute
    end
    object NewIncoming2: TAction
      Caption = #29983#40092#21830#21697#36827#36135#21333
      ImageIndex = 63
      OnExecute = NewIncoming2Execute
    end
    object EditIncoming: TAction
      Caption = #26597#30475#36827#36135#21333
      Enabled = False
      ImageIndex = 29
      OnExecute = EditIncomingExecute
    end
    object StatGoodSell: TAction
      Caption = #32479#35745#35813#29289#21697#38144#21806#24773#20917'...'
      ImageIndex = 10
    end
    object ExportLabels: TAction
      Caption = #23548#20986#26631#31614#25171#21360#25991#20214
      ImageIndex = 19
      OnExecute = ExportLabelsExecute
    end
    object CancelPrint: TAction
      Caption = #28165#38500#26631#31614#25171#21360
      ImageIndex = 5
      OnExecute = CancelPrintExecute
    end
    object EditPrint: TAction
      Caption = #35774#32622#26631#31614#25171#21360#37327
      ImageIndex = 2
      OnExecute = EditPrintExecute
    end
    object DayCalc: TAction
      Caption = #26085#32467#35745#31639
      Enabled = False
      ImageIndex = 19
      OnExecute = DayCalcExecute
    end
    object NewCheck: TAction
      Caption = #24320#22987#26032#24211#23384#30424#28857
      ImageIndex = 24
      OnExecute = NewCheckExecute
    end
    object MonthSellStat: TAction
      Caption = #26376#33829#19994#39069#24773#20917
      ImageIndex = 34
      OnExecute = MonthSellStatExecute
    end
    object PrividerManage: TAction
      Caption = #20379#24212#21830#31649#29702
      ImageIndex = 42
    end
    object NewChangePrice: TAction
      Caption = #26032#24314#35843#20215#21333
      ImageIndex = 50
      OnExecute = NewChangePriceExecute
    end
  end
  object ImageList2: TImageList
    Left = 600
    Top = 32
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      00000000000000000000000000000000000000000000CECEF7008C8CEF009C9C
      EF00BDBDF7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFD6CE00F7948C00F7A5
      9C00FFC6BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6ADEF00AD63E7008C21D6007B00
      D6009431DE00C68CEF00EFDEFF0000000000000000009C9CEF008C8CEF004242
      DE004242DE003131DE000000D6000000D6003131DE004242DE004242DE002121
      D6000000D6008C8CEF00000000000000000000000000F7A59C00F7948C00F752
      4200F7524200F7423100EF100000EF100000F7423100F7524200F7524200EF31
      2100EF100000F7948C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFDEFF00C68CEF008C21D6007B00D6007B00D6009431DE009C42
      DE009C42DE009C42DE009C42DE00D6ADEF000000000000000000000000000000
      0000DEDEFF00DEDEFF000000000000000000BDBDF7009C9CEF00BDBDF700BDBD
      F700BDBDF7000000000000000000000000000000000000000000000000000000
      0000FFE7DE00FFE7DE000000000000000000FFC6BD00F7A59C00FFC6BD00FFC6
      BD00FFC6BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C68CEF007B00D600AD63E700C68C
      EF009C42DE008410D6009431DE00A552E700E7CEF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006363E7002121D6001010D6002121D6001010D6005252E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7736300EF312100EF211000EF312100EF211000F7635200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CEF700DEBDF700C68CEF007B00
      D600CE9CEF0000000000A552E7007B00D600C68CEF0000000000000000000000
      0000E7CEF7000000000000000000000000000000000000000000000000000000
      00003131DE006363E700DEDEFF00000000006363E7001010D600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7423100F7736300FFE7DE0000000000F7736300EF211000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7CEF7008410
      D6000000000000000000C68CEF008C21D6008C21D600AD63E700EFDEFF009C42
      DE007B00D6000000000000000000000000000000000000000000000000000000
      00000000D6004242DE003131DE001010D6008C8CEF000000D600ADADEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF100000F7524200F7423100EF211000F7948C00EF100000FFB5AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C68CEF009C42
      DE000000000000000000D6ADEF009C42DE00000000009C42DE008410D6008410
      D600D6ADEF00000000000000000000000000ADADEF007373E700DEDEFF009C9C
      EF000000D6006363E7008C8CEF00BDBDF7009C9CEF000000D6003131DE000000
      000000000000000000000000000000000000FFB5AD00F7847300FFE7DE00F7A5
      9C00EF100000F7736300F7948C00FFC6BD00F7A59C00EF100000F74231000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C68CEF009431
      DE000000000000000000DEBDF7009C42DE00C68CEF008C21D600C68CEF00F7EF
      FF0000000000000000000000000000000000000000009C9CEF001010D6004242
      DE009C9CEF00BDBDF7005252E7003131DE003131DE001010D6005252E7004242
      DE004242DE005252E700BDBDF7000000000000000000F7A59C00EF211000F752
      4200F7A59C00FFC6BD00F7635200F7423100F7423100EF211000F7635200F752
      4200F7524200F7635200FFC6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9CEF009C42DE008C21D6007B00
      D600CE9CEF0000000000DEBDF7008C21D600F7EFFF00CE9CEF008C21D6008C21
      D600BD73E700F7EFFF0000000000000000000000000000000000EFEFFF005252
      E7001010D600CECEF7004242DE008C8CEF00000000009C9CEF000000D6000000
      D6006363E7009C9CEF00DEDEFF00000000000000000000000000FFEFEF00F763
      5200EF211000FFD6CE00F7524200F7948C0000000000F7A59C00EF100000EF10
      0000F7736300F7A59C00FFE7DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFDEFF00C68CEF008410
      D600CE9CEF0000000000DEBDF7007B00D6009C42DE008410D6009431DE00C68C
      EF008410D600EFDEFF0000000000000000000000000000000000000000000000
      00006363E7001010D6002121D6004242DE008C8CEF000000D6006363E700DEDE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F7736300EF211000EF312100F7524200F7948C00EF100000F7736300FFE7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEBDF7007B00D600EFDEFF00000000007B00D600DEBD
      F700000000000000000000000000000000000000000000000000EFEFFF00BDBD
      F700BDBDF7002121D6000000D6000000D6002121D600BDBDF700000000000000
      0000000000000000000000000000000000000000000000000000FFEFEF00FFC6
      BD00FFC6BD00EF312100EF100000EF100000EF312100FFC6BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7CE
      F7009C42DE0000000000DEBDF7007B00D600A552E7009C42DE008410D600BD73
      E7000000000000000000000000000000000000000000000000009C9CEF005252
      E7004242DE001010D6000000D6000000D6004242DE008C8CEF008C8CEF008C8C
      EF00000000000000000000000000000000000000000000000000F7A59C00F763
      5200F7524200EF211000EF100000EF100000F7524200F7948C00F7948C00F794
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE9CEF007B00
      D6008410D60000000000C68CEF007B00D600DEBDF700000000009C42DE008C21
      D600EFDEFF000000000000000000000000000000000000000000000000000000
      000000000000000000008C8CEF003131DE008C8CEF007373E7004242DE008C8C
      EF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7948C00F7423100F7948C00F7847300F7524200F794
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7CEF700DEBD
      F700F7EFFF0000000000DEBDF700C68CEF00AD63E7008410D6007B00D6008410
      D600EFDEFF000000000000000000000000000000000000000000000000000000
      000000000000000000008C8CEF001010D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7948C00EF2110000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEBDF700F7EF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000002121D6002121D600DEDEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EF312100EF312100FFE7DE0000000000000000000000
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
      0000FFD6CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7CEF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7948C00EF312100F7948C00EF524200EF524200EF180000EF18
      0000FFCECE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADEF006363E7002121D6000000
      CE003131D6008C8CE700DEDEF70000000000000000000000000000000000F794
      8C00EF100000FFC6BD00F7948C00FFE7DE000000000000000000000000000000
      0000F7948C00F7524200F7524200F7736300000000000000000000000000BD8C
      EF006B08CE00DEBDF700BD8CEF00EFDEFF000000000000000000000000000000
      0000BD8CEF00944ADE00944ADE00A56BE7000000000000000000000000000000
      000000000000EF423100F7948C00000000000000000000000000F7B5AD00EF18
      0000F7948C00FFEFEF0000000000000000000000000000000000000000000000
      000000000000DEDEF7008C8CE7002121D6000000CE000000CE003131D6004242
      DE004242DE004242DE004242DE00ADADEF000000000000000000FFE7DE00F752
      4200EF100000FFC6BD00F7948C00EF211000F7948C000000000000000000FFB5
      AD00EF100000EF100000F7847300FFD6CE000000000000000000EFDEFF00944A
      DE006B08CE00DEBDF700BD8CEF007318D600BD8CEF000000000000000000CEAD
      EF006B08CE006B08CE00B57BE700E7CEF7000000000000000000000000000000
      0000FFDEDE00EF180000EF423100EF180000EF524200EF524200EF524200EF18
      0000EF291000FFDEDE0000000000000000008C8CE7000000CE006363E7008C8C
      E7005252DE001010D6003131D6004242DE00CECEF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF100000FFB5AD0000000000FFD6CE00EF211000F7948C00FFE7DE00EF21
      1000F7423100FFE7DE0000000000000000000000000000000000000000000000
      00006B08CE00CEADEF0000000000E7CEF7007318D600BD8CEF00EFDEFF007318
      D6008C39D600EFDEFF0000000000000000000000000000000000000000000000
      0000FFDEDE00F7847300000000000000000000000000FFCECE00F7A59C00F794
      8C00FFDEDE00000000000000000000000000CECEF700BDBDEF008C8CE7000000
      CE009C9CEF00000000005252DE000000CE008C8CE70000000000000000000000
      0000CECEF700000000000000000000000000FFC6BD00EF100000EF312100FFD6
      CE00EF312100F7948C000000000000000000F7948C00EF100000F7423100F763
      5200FFEFEF00000000000000000000000000DEBDF7006B08CE007B29D600E7CE
      F7007B29D600BD8CEF000000000000000000BD8CEF006B08CE008C39D6009C5A
      DE00F7EFFF000000000000000000000000000000000000000000000000000000
      0000F7948C00EF312100F7948C00F7948C00F7948C00F7948C00F7A59C00F7BD
      BD00F7BDBD00F7BDBD0000000000000000000000000000000000CECEF7001010
      D60000000000000000008C8CE7002121D6002121D6006363E700DEDEF7004242
      DE000000CE00000000000000000000000000FFE7DE00F7A59C00EF312100EF21
      1000EF312100EF211000EF100000F7524200F7635200EF100000F7423100FFD6
      CE0000000000000000000000000000000000EFDEFF00C69CEF007B29D6007318
      D6007B29D6007318D6006B08CE00944ADE009C5ADE006B08CE008C39D600E7CE
      F700000000000000000000000000000000000000000000000000000000000000
      0000F7A59C00EF180000F7BDBD00F7BDBD00F7948C00EF180000EF423100EF52
      4200EF524200F7847300000000000000000000000000000000008C8CE7004242
      DE000000000000000000BDBDEF004242DE00000000004242DE001010D6001010
      D600ADADEF000000000000000000000000000000000000000000FFEFEF00F784
      7300EF100000F784730000000000F7847300F7736300F7423100EF211000F742
      3100EF100000EF100000EF100000FFB5AD000000000000000000F7EFFF00B57B
      E7006B08CE00B57BE70000000000B57BE700A56BE7008C39D6007318D6008C39
      D6006B08CE006B08CE006B08CE00CEADEF0000000000F7BDBD00000000000000
      0000F7BDBD00EF180000F7BDBD00EF524200F7847300EF180000F7948C00F7BD
      BD000000000000000000000000000000000000000000000000008C8CE7003131
      D6000000000000000000BDBDEF004242DE008C8CE7002121D6008C8CE700EFEF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F7524200EF100000FFB5AD00F7423100F7948C00F7948C00F7524200FFC6
      BD00EF100000FFE7DE0000000000000000000000000000000000000000000000
      0000944ADE006B08CE00CEADEF008C39D600BD8CEF00BD8CEF00944ADE00DEBD
      F7006B08CE00EFDEFF00000000000000000000000000F7736300EF524200FFDE
      DE00F7BDBD00EF180000FFEFEF00F7BDBD00F7A59C00EF180000EF423100EF52
      4200F78473000000000000000000000000009C9CEF004242DE002121D6000000
      CE009C9CEF0000000000BDBDEF002121D600EFEFFF009C9CEF002121D6002121
      D6007373E700EFEFFF0000000000000000000000000000000000FFC6BD00FFEF
      EF00F7524200F7948C00FFE7DE00EF100000F7948C00F7736300F76352000000
      0000EF100000F7948C0000000000000000000000000000000000DEBDF700F7EF
      FF00944ADE00BD8CEF00EFDEFF006B08CE00BD8CEF00A56BE7009C5ADE000000
      00006B08CE00BD8CEF0000000000000000000000000000000000F7736300EF29
      1000F7948C00EF180000F7B5AD00F7948C00F7948C00EF180000F7948C00FFDE
      DE000000000000000000000000000000000000000000DEDEF7008C8CE7001010
      D6009C9CEF0000000000BDBDEF000000CE004242DE001010D6003131D6008C8C
      E7001010D600DEDEF700000000000000000000000000FFB5AD00F7423100EF10
      0000EF100000F7524200FFB5AD00FFC6BD00F7948C00F7847300EF100000F752
      4200EF100000F7635200000000000000000000000000CEADEF008C39D6006B08
      CE006B08CE00944ADE00CEADEF00DEBDF700BD8CEF00B57BE7006B08CE00944A
      DE006B08CE009C5ADE000000000000000000000000000000000000000000F773
      6300EF180000EF291000FFDEDE00F7BDBD00F7A59C00EF180000EF423100EF52
      4200F78473000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDEF000000CE00CECEF700000000000000CE00BDBD
      EF0000000000000000000000000000000000000000000000000000000000FFEF
      EF00F7423100F7524200F7948C00FFB5AD00F784730000000000F7524200F763
      5200FFC6BD00FFEFEF000000000000000000000000000000000000000000F7EF
      FF008C39D600944ADE00BD8CEF00CEADEF00B57BE70000000000944ADE009C5A
      DE00DEBDF700F7EFFF000000000000000000000000000000000000000000FFEF
      EF00EF423100EF312100F7948C00EF524200F7847300EF180000F7948C00FFCE
      CE0000000000000000000000000000000000000000000000000000000000CECE
      F7004242DE0000000000BDBDEF000000CE005252DE004242DE001010D6007373
      E700000000000000000000000000000000000000000000000000000000000000
      0000F7524200F7948C0000000000FFEFEF00EF211000F7847300F7948C00EF10
      0000F77363000000000000000000000000000000000000000000000000000000
      0000944ADE00BD8CEF0000000000F7EFFF007318D600B57BE700BD8CEF006B08
      CE00A56BE7000000000000000000000000000000000000000000000000000000
      0000FFCECE00EF180000EF635200F7BDBD00F7A59C00F7736300EF524200EF18
      0000EF291000FFDEDE00000000000000000000000000000000009C9CEF000000
      CE001010D600000000008C8CE7000000CE00BDBDEF00000000004242DE002121
      D600DEDEF7000000000000000000000000000000000000000000000000000000
      0000F7423100F7948C000000000000000000F7A59C00EF100000EF312100EF21
      1000EF2110000000000000000000000000000000000000000000000000000000
      00008C39D600BD8CEF000000000000000000C69CEF006B08CE007B29D6007318
      D6007318D6000000000000000000000000000000000000000000000000000000
      000000000000F7736300EF1800000000000000000000F7A59C00EF1800000000
      0000000000000000000000000000000000000000000000000000CECEF700BDBD
      EF00EFEFFF0000000000BDBDEF008C8CE7006363E7001010D6000000CE001010
      D600DEDEF700000000000000000000000000000000000000000000000000FFEF
      EF00EF100000F7635200000000000000000000000000EF100000F77363000000
      000000000000000000000000000000000000000000000000000000000000F7EF
      FF006B08CE009C5ADE000000000000000000000000006B08CE00A56BE7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7BDBD00F7B5AD0000000000F7B5AD00EF180000EF6352000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDEF00EFEF
      FF0000000000000000000000000000000000000000000000000000000000FFEF
      EF00FFC6BD00FFEFEF00000000000000000000000000F7948C00FFEFEF000000
      000000000000000000000000000000000000000000000000000000000000F7EF
      FF00DEBDF700F7EFFF00000000000000000000000000BD8CEF00F7EFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF87FF87FF0000FF01800380030000
      F800F307F3070000007FF03FF03F00000477F13FF13F0000CC07F01FF01F0000
      CC87001F001F0000CC0F8001800100000403C081C08100008403F00FF00F0000
      FC4FC03FC03F0000E40FC00FC00F0000C447FC0FFC0F0000C407FCFFFCFF0000
      FFCFFC7FFC7F0000FFFFFFFFFFFF0000F81FFFFFF7FFF7FFF807FF01E0F0E0F0
      F9C3F800C060C060F003007FF203F203F387047703070307F003CC07000F000F
      F003CC87C200C200B00FCC0FF003F00380070403C013C013C00F840380038003
      E007FC4FE043E043E00FE40FF207F207F003C447F307F307F99FC407E39FE39F
      F91FFFCFE39FE39FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList1
    Left = 632
    Top = 32
    object N4: TMenuItem
      Action = StatGoodSell
    end
  end
  object ExportLabelDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt|*.txt'
    Left = 664
    Top = 32
  end
  object PopupMenu3: TPopupMenu
    Left = 200
    Top = 152
    object N5: TMenuItem
      Caption = #21482#26174#31034#35813#29289#21697#30340#20462#25913#24773#20917
      OnClick = N5Click
    end
  end
end
