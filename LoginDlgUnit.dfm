object LoginDlg: TLoginDlg
  Left = 337
  Top = 180
  BorderStyle = bsDialog
  Caption = #24080#25143#30331#24405
  ClientHeight = 305
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 225
    Shape = bsFrame
  end
  object SpeedButton1: TSpeedButton
    Left = 248
    Top = 40
    Width = 41
    Height = 41
    OnClick = SpeedButton1Click
  end
  object OKBtn: TButton
    Left = 71
    Top = 244
    Width = 75
    Height = 45
    Caption = #30331#24405
    Default = True
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 159
    Top = 244
    Width = 75
    Height = 45
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object User: TLabeledEdit
    Left = 48
    Top = 120
    Width = 225
    Height = 29
    EditLabel.Width = 48
    EditLabel.Height = 21
    EditLabel.Caption = #24080#25143#65306
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
  end
  object Password: TLabeledEdit
    Left = 48
    Top = 184
    Width = 225
    Height = 29
    EditLabel.Width = 48
    EditLabel.Height = 21
    EditLabel.Caption = #23494#30721#65306
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 3
  end
  object ServerDomain: TLabeledEdit
    Left = 48
    Top = 48
    Width = 201
    Height = 29
    EditLabel.Width = 96
    EditLabel.Height = 21
    EditLabel.Caption = #26381#21153#22120#22320#22336#65306
    Enabled = False
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 4
  end
  object http: TIdHTTP
    SendBufferSize = 1000000
    Request.Accept = 'text/html, */*'
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ProxyPort = 0
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Left = 264
    Top = 256
  end
end
