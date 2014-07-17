object SysSetForm: TSysSetForm
  Left = 266
  Top = 200
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #31995#32479#35774#32622
  ClientHeight = 349
  ClientWidth = 451
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
  object Panel1: TPanel
    Left = 0
    Top = 318
    Width = 451
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Ok: TButton
      Left = 144
      Top = 6
      Width = 75
      Height = 22
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = OkClick
    end
    object Cancel: TButton
      Left = 232
      Top = 6
      Width = 75
      Height = 22
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 318
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #22522#26412#37197#32622
      object GroupBox1: TGroupBox
        Left = 32
        Top = 16
        Width = 377
        Height = 57
        Caption = #21033#28070#35774#32622
        TabOrder = 0
        object Label1: TLabel
          Left = 27
          Top = 24
          Width = 72
          Height = 12
          Caption = #26368#20302#21033#28070#27604#20363
        end
        object LowestProfit: TEdit
          Left = 107
          Top = 21
          Width = 73
          Height = 20
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          Text = '0'
          OnKeyPress = LowestProfitKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 32
        Top = 82
        Width = 377
        Height = 201
        Caption = #25910#38134#26465#35774#32622
        TabOrder = 1
        object Label2: TLabel
          Left = 24
          Top = 24
          Width = 48
          Height = 12
          Caption = #21488#22836#20449#24687
        end
        object Label3: TLabel
          Left = 24
          Top = 102
          Width = 48
          Height = 12
          Caption = #32467#23614#20449#24687
        end
        object PrintHead: TMemo
          Left = 24
          Top = 40
          Width = 329
          Height = 49
          Ctl3D = True
          Lines.Strings = (
            'PrintHead')
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object PrintTail: TMemo
          Left = 24
          Top = 118
          Width = 329
          Height = 65
          Ctl3D = True
          Lines.Strings = (
            'PrintTail')
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #31649#29702#21592#37197#32622
      ImageIndex = 1
      object Label4: TLabel
        Left = 24
        Top = 16
        Width = 60
        Height = 12
        Caption = #31649#29702#21592#21015#34920
      end
      object AdminList: TListView
        Left = 24
        Top = 32
        Width = 393
        Height = 150
        Columns = <
          item
            Caption = #31649#29702#21592#21517#31216
            Width = 130
          end
          item
            Caption = #32423#21035
            Width = 40
          end
          item
            AutoSize = True
            Caption = #25551#36848
          end>
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageList1
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = AdminListSelectItem
      end
      object AdminName: TLabeledEdit
        Left = 24
        Top = 208
        Width = 153
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #21517#31216
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
        Text = 'AdminName'
        OnChange = AdminNameChange
        OnKeyPress = AdminNameKeyPress
      end
      object AdminPwd: TLabeledEdit
        Left = 192
        Top = 208
        Width = 137
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #21475#20196
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        PasswordChar = '*'
        TabOrder = 2
        Text = 'AdminPwd'
        OnChange = AdminPwdChange
        OnKeyPress = AdminNameKeyPress
      end
      object AdminDesp: TLabeledEdit
        Left = 24
        Top = 248
        Width = 201
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #25551#36848
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 3
        Text = 'AdminDesp'
        OnChange = AdminDespChange
        OnKeyPress = AdminNameKeyPress
      end
      object AddAdmin: TButton
        Left = 341
        Top = 206
        Width = 75
        Height = 22
        Caption = #28155' '#21152
        TabOrder = 4
        OnClick = AddAdminClick
      end
      object DelAdmin: TButton
        Left = 341
        Top = 246
        Width = 75
        Height = 22
        Caption = #21024' '#38500
        Enabled = False
        TabOrder = 5
        OnClick = DelAdminClick
      end
      object Level: TLabeledEdit
        Left = 240
        Top = 248
        Width = 73
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #32423#21035
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 6
        Text = '0'
        OnChange = LevelChange
        OnKeyPress = LowestProfitKeyPress
      end
      object LevelUpDown: TUpDown
        Left = 313
        Top = 248
        Width = 15
        Height = 20
        Associate = Level
        Enabled = False
        Min = 0
        Max = 5
        Position = 0
        TabOrder = 7
        Wrap = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25910#38134#21592#37197#32622
      ImageIndex = 2
      object Label5: TLabel
        Left = 24
        Top = 16
        Width = 60
        Height = 12
        Caption = #25910#38134#21592#21015#34920
      end
      object UserList: TListView
        Left = 24
        Top = 32
        Width = 393
        Height = 150
        Columns = <
          item
            Caption = #25910#38134#21592#32534#21495
            Width = 100
          end
          item
            AutoSize = True
            Caption = #25910#38134#21592#21517#31216
          end
          item
            AutoSize = True
            Caption = #22791#27880
          end>
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageList1
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = UserListSelectItem
      end
      object UserName: TLabeledEdit
        Left = 176
        Top = 208
        Width = 153
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #21517#31216
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 2
        OnChange = UserNameChange
        OnKeyPress = AdminNameKeyPress
      end
      object UserSerial: TLabeledEdit
        Left = 24
        Top = 208
        Width = 137
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #32534#21495
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
        OnChange = UserSerialChange
        OnKeyPress = AdminNameKeyPress
      end
      object UserDesp: TLabeledEdit
        Left = 24
        Top = 248
        Width = 305
        Height = 20
        EditLabel.Width = 24
        EditLabel.Height = 12
        EditLabel.Caption = #25551#36848
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 3
        OnChange = UserDespChange
        OnKeyPress = AdminNameKeyPress
      end
      object AddUser: TButton
        Left = 341
        Top = 206
        Width = 75
        Height = 22
        Caption = #28155' '#21152
        TabOrder = 4
        OnClick = AddUserClick
      end
      object DelUser: TButton
        Left = 341
        Top = 246
        Width = 75
        Height = 22
        Caption = #21024' '#38500
        Enabled = False
        TabOrder = 5
        OnClick = DelUserClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = #36827#36135#35774#32622
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 32
        Top = 16
        Width = 377
        Height = 153
        Caption = #36827#36135#33258#21160#21442#25968
        TabOrder = 0
      end
    end
  end
  object ImageList1: TImageList
    Left = 368
    Top = 24
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      00000000000000000000000000000000000000000000000000006B2D6B2D6B2D
      6B2D6B2D6B2D6B2D000000000000000000000000000000000000292508212925
      2925292508212925000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B2D6B2DE922E922A406
      A406A406A406A4066B2D6B2D6B2D000000000000000008212925734E734E734E
      734E734E734E524A292529252925000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2DE922E9224B0B4B0B4B0B
      4B0BA406A406A406A406A406A4066B2D000000008C31734E734EB556B556B556
      B556734E734E734E524A524A1042292500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2DA4064B0B4B0B4B0B4B0B
      4B0B4B0B4B0B7246E922A406A4066B2D00000000AD35734ED65AD65AD65AD65A
      B556B556B5561863734E524A1042292500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2D4B0B4B0B4B0B4B0B4B0B
      4B0B4B0BE92200007246A406A4066B2D00000000AD35D65AD65AD65AD65AD65A
      D65AD65AF75E0000B556524A524A292500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000072464B0B4B0B4B0B4B0B4B0B
      4B0BA406000000007246A406A4066B2D00000000CE39D65AD65A186318631863
      1863D65ABD7700003967524A524A292500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B2D4B0B4B0B4B0B4B0B
      72460000724600007246A4066B2D0000000000000000CE39D65A186318631863
      D65A1863F75E1863D65A524A4A29000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000006B2D4B0B4B0BE476
      E07FE476E07F7246A4066B2D000000000000000000000000CE39D65AD65A7B6F
      7B6F7B6F7B6F734E734E6B2D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B2DE4768B7F
      E4768B7F8B7F8B7F6B2D00000000000000000000000000000000CE399C739C73
      9C739C739C739C736B2D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000006B2D8B7F8B7F8B7F
      8B7F8B7F8B7F8B7F8B7F6B2D000000000000000000000000EF3D9C737B6F9C73
      7B6F9C739C739C739C738C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000072468B7F8B7F8B7F
      8B7F8B7F8B7F8B7F8B7F6B2D00000000000000000000000010429C739C739C73
      9C739C739C739C739C738C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000007246E476E476E476
      8B7F8B7F8B7F8B7F8B7F6B2D00000000000000000000000010421863D65A1863
      9C739C73BD779C739C738C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000007246E476E476E476
      E476E476E4768B7F8B7F6B2D000000000000000000000000314694529452D65A
      1863186318639C73BD77AD350000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007246E476E476
      E476E476E476E47672460000000000000000000000000000000031469452D65A
      18635A6B5A6BD65ACE3900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000072467246E476
      E476E476E47672466B2D0000000000000000000000000000000031463146D65A
      186318631863EF3DEF3D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007246
      7246724672460000000000000000000000000000000000000000000000003146
      1042104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F01FF01F00000000C003C00300000000
      8001800100000000800180010000000080218021000000008061802100000000
      C0A3C00300000000E007E00700000000F00FF00F00000000E007E00700000000
      E007E00700000000E007E00700000000E007E00700000000F00FF00F00000000
      F00FF00F00000000FC3FFC3F0000000000000000000000000000000000000000
      000000000000}
  end
end
