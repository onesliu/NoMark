object StoreStatForm: TStoreStatForm
  Left = 397
  Top = 199
  BorderStyle = bsDialog
  Caption = #24211#23384#32479#35745
  ClientHeight = 398
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 667
    Height = 357
    ActivePage = TabSheet5
    Align = alClient
    TabIndex = 4
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #20840#23616#32479#35745
      object Label1: TLabel
        Left = 176
        Top = 112
        Width = 72
        Height = 12
        Caption = #24211#23384#24635#25968#37327#65306
      end
      object TotalNumber: TLabel
        Left = 256
        Top = 112
        Width = 66
        Height = 12
        Caption = 'TotalNumber'
      end
      object Label2: TLabel
        Left = 176
        Top = 152
        Width = 72
        Height = 12
        Caption = #24211#23384#24635#20215#20540#65306
      end
      object TotalCost: TLabel
        Left = 256
        Top = 152
        Width = 54
        Height = 12
        Caption = 'TotalCost'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26376#38144#21806#24773#20917#25968#25454
      ImageIndex = 1
      object MonthSellStat: TDBGrid
        Left = 0
        Top = 0
        Width = 659
        Height = 330
        Align = alClient
        DataSource = d.SellStatSource
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
            FieldName = 'YEARS'
            Title.Caption = #24180#20221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTHS'
            Title.Caption = #26376#20221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TC'
            Title.Caption = #26376#38144#21806#25104#26412
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TP'
            Title.Caption = #26376#24635#33829#19994#39069
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TF'
            Title.Caption = #26376#24635#27611#21033
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER'
            Title.Caption = #21033#28070#27604#20363
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26376#33829#19994#39069#36235#21183#22270#34920
      ImageIndex = 2
      object DBChart3: TDBChart
        Left = 0
        Top = 0
        Width = 659
        Height = 330
        BackWall.Gradient.EndColor = 11118482
        Border.Color = clNavy
        Border.Width = 6
        Border.Visible = True
        BorderRound = 10
        BottomWall.Gradient.EndColor = 16580349
        BottomWall.Gradient.StartColor = 3114493
        Gradient.EndColor = clGray
        Gradient.Visible = True
        LeftWall.Gradient.EndColor = 2413052
        LeftWall.Gradient.StartColor = 900220
        Title.Font.Color = clYellow
        Title.Text.Strings = (
          #26376#33829#19994#39069#36235#21183#22270#34920)
        BottomAxis.LabelsAngle = 90
        BottomAxis.TickLength = 5
        Legend.Gradient.Direction = gdTopBottom
        Legend.Gradient.EndColor = clYellow
        Legend.Gradient.StartColor = clWhite
        Legend.Gradient.Visible = True
        Shadow.Color = clBlack
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        PrintMargins = (
          15
          27
          15
          27)
        ColorPaletteIndex = 2
        object LineSeries1: TLineSeries
          Depth = 0
          Marks.Callout.Brush.Color = clBlack
          Marks.Font.Color = clMaroon
          Marks.Gradient.Direction = gdBottomTop
          Marks.Gradient.Visible = True
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = d.SellStatQuery2
          SeriesColor = clBlue
          ShowInLegend = False
          XLabelsSource = 'YM'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'TP'
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #26376#27611#21033#28070#36235#21183#22270#34920
      ImageIndex = 3
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 659
        Height = 330
        BackWall.Gradient.EndColor = 11118482
        Border.Color = clNavy
        Border.Width = 6
        Border.Visible = True
        BorderRound = 10
        BottomWall.Gradient.EndColor = 16580349
        BottomWall.Gradient.StartColor = 3114493
        Gradient.EndColor = clGray
        Gradient.Visible = True
        LeftWall.Gradient.EndColor = 2413052
        LeftWall.Gradient.StartColor = 900220
        Title.Font.Color = clYellow
        Title.Text.Strings = (
          #26376#27611#21033#28070#36235#21183#22270#34920)
        BottomAxis.LabelsAngle = 90
        BottomAxis.TickLength = 5
        Legend.Gradient.Direction = gdTopBottom
        Legend.Gradient.EndColor = clYellow
        Legend.Gradient.StartColor = clWhite
        Legend.Gradient.Visible = True
        Shadow.Color = clBlack
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        PrintMargins = (
          15
          27
          15
          27)
        ColorPaletteIndex = 2
        object BarSeries1: TLineSeries
          Depth = 0
          Marks.Callout.Brush.Color = clBlack
          Marks.Font.Color = clMaroon
          Marks.Gradient.Direction = gdBottomTop
          Marks.Gradient.Visible = True
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = d.SellStatQuery2
          SeriesColor = 12615680
          ShowInLegend = False
          XLabelsSource = 'YM'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'TF'
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #26376#27611#21033#29575#36235#21183#22270#34920
      ImageIndex = 4
      object DBChart2: TDBChart
        Left = 0
        Top = 0
        Width = 659
        Height = 330
        BackWall.Gradient.EndColor = 11118482
        Border.Color = clNavy
        Border.Width = 6
        Border.Visible = True
        BorderRound = 10
        BottomWall.Gradient.EndColor = 16580349
        BottomWall.Gradient.StartColor = 3114493
        Gradient.EndColor = clGray
        Gradient.Visible = True
        LeftWall.Gradient.EndColor = 2413052
        LeftWall.Gradient.StartColor = 900220
        Title.Font.Color = clYellow
        Title.Text.Strings = (
          #26376#27611#21033#29575#36235#21183#22270#34920)
        BottomAxis.LabelsAngle = 90
        BottomAxis.TickLength = 5
        Legend.Gradient.Direction = gdTopBottom
        Legend.Gradient.EndColor = clYellow
        Legend.Gradient.StartColor = clWhite
        Legend.Gradient.Visible = True
        Shadow.Color = clBlack
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        PrintMargins = (
          15
          25
          15
          25)
        ColorPaletteIndex = 2
        object BarSeries2: TLineSeries
          Depth = 0
          Marks.Callout.Brush.Color = clBlack
          Marks.Font.Color = clMaroon
          Marks.Gradient.Direction = gdBottomTop
          Marks.Gradient.Visible = True
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = d.SellStatQuery2
          SeriesColor = 33023
          ShowInLegend = False
          XLabelsSource = 'YM'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'PER'
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 667
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Ok: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450'(&O)'
      ModalResult = 1
      TabOrder = 0
    end
  end
end
