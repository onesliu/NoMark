object PrinterForm: TPrinterForm
  Left = 577
  Top = 181
  Width = 287
  Height = 299
  Caption = 'PrinterForm'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 12
  object ReceiptRep: TQuickRep
    Left = 32
    Top = 16
    Width = 219
    Height = 209
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = d.q
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'TAIL')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [LastPageFooter, Compression]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      10
      553
      10
      579
      40
      40
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object Title: TQRBand
      Left = 15
      Top = 4
      Width = 189
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.9583333333333
        500.0625)
      BandType = rbTitle
      object QRLabel4: TQRLabel
        Left = 47
        Top = 2
        Width = 95
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.4375
          124.354166666667
          5.29166666666667
          251.354166666667)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = #38144' '#36135' '#28165' '#21333
        Color = clWhite
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #24494#36719#38597#40657
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 14
      end
    end
    object Column: TQRBand
      Left = 15
      Top = 38
      Width = 189
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.8541666666667
        500.0625)
      BandType = rbColumnHeader
      object QRLabel1: TQRLabel
        Left = 0
        Top = 4
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          0
          10.5833333333333
          256.645833333333)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = #21697#21517
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 152
        Top = 4
        Width = 28
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          402.166666666667
          10.5833333333333
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #25968#37327
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 99
        Top = 4
        Width = 51
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          261.9375
          10.5833333333333
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #21333#20215
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object Detail: TQRBand
      Left = 15
      Top = 61
      Width = 189
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.2083333333333
        500.0625)
      BandType = rbDetail
      object GoodName: TQRDBText
        Left = 0
        Top = 3
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          0
          9
          256.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = d.q
        DataField = 'name'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 152
        Top = 3
        Width = 28
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          402.166666666667
          9
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = d.q
        DataField = 'counts'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 99
        Top = 3
        Width = 51
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          261.9375
          9
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = d.q
        DataField = 'price'
        Mask = '#.00'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object Tail: TQRBand
      Left = 15
      Top = 83
      Width = 189
      Height = 94
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        248.708333333333
        500.0625)
      BandType = rbSummary
      object QRLabel6: TQRLabel
        Left = 0
        Top = 8
        Width = 30
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          0
          21.1666666666667
          79.375)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = #21512#35745':'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 33
        Top = 8
        Width = 144
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          87.3125
          21.1666666666667
          381)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'SUM(price * counts)'
        Mask = '#.00'
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 0
        Top = 26
        Width = 30
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          0
          68.7916666666667
          79.375)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = #26102#38388':'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 33
        Top = 26
        Width = 144
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          87.3125
          70
          381)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDateTime
        Transparent = True
        FontSize = 10
      end
    end
  end
end
