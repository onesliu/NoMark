object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView: TTreeView
    Left = 56
    Top = 24
    Width = 209
    Height = 401
    Indent = 19
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnContextPopup = TreeViewContextPopup
    Items.Data = {
      01000000210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      08CBF9D3D0B7D6C0E0}
  end
  object Button1: TButton
    Left = 328
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'I:\development\Bussiness\db\GOODS.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=nb33l2l3')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 376
    Top = 32
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 424
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    AutoPopup = False
    Left = 312
    Top = 136
    object N1: TMenuItem
      Caption = #28155#21152#20998#31867
      OnClick = N1Click
    end
  end
  object q: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 32
  end
end
