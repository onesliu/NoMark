object ChangeForm: TChangeForm
  Left = 204
  Top = 162
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #25442#36135#20132#26131#21333
  ClientHeight = 356
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object title: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = #25442#36135#20132#26131#21333
    Color = 13339492
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -33
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 559
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object OrderGuide: TPageControl
      Left = 328
      Top = 0
      Width = 231
      Height = 299
      ActivePage = TabSheet2
      Align = alRight
      Style = tsFlatButtons
      TabIndex = 1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #25442#36135#36807#31243
        object NumberLabel: TLabel
          Left = 8
          Top = 7
          Width = 54
          Height = 12
          Caption = #29289#21697#32534#21495':'
        end
        object PriceLabel: TLabel
          Left = 8
          Top = 55
          Width = 54
          Height = 12
          Caption = #25442#36135#21333#20215':'
        end
        object Label20: TLabel
          Left = 8
          Top = 94
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
          Left = 88
          Top = 94
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
          Left = 120
          Top = 94
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
        object Label1: TLabel
          Left = 8
          Top = 136
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
          Left = 8
          Top = 168
          Width = 78
          Height = 12
          Caption = #25353#38190': '#32467#24080'(+)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 192
          Width = 78
          Height = 12
          Caption = #25353#38190': '#28165#38500'(*)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 102
          Top = 192
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
          Left = 102
          Top = 168
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
        object Label15: TLabel
          Left = 8
          Top = 240
          Width = 78
          Height = 12
          Caption = #25353#38190': '#21462#28040'(/)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 102
          Top = 240
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
          Left = 8
          Top = 216
          Width = 78
          Height = 12
          Caption = #25353#38190': '#22238#21024'(-)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 102
          Top = 216
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
        object Label23: TLabel
          Left = 8
          Top = 264
          Width = 60
          Height = 12
          Caption = #25353#38190': '#19978#19979
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 102
          Top = 264
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
        object Number: TEdit
          Left = 8
          Top = 24
          Width = 193
          Height = 18
          Color = clWhite
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = NumberKeyPress
        end
        object Price: TEdit
          Left = 8
          Top = 71
          Width = 193
          Height = 18
          Color = clGray
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          OnKeyDown = PriceKeyDown
          OnKeyPress = PriceKeyPress
        end
      end
      object TabSheet2: TTabSheet
        Caption = #32467#24080#36807#31243
        ImageIndex = 1
        object TotalLabel: TLabel
          Left = 8
          Top = 55
          Width = 54
          Height = 12
          Caption = #24212#25910#24046#20215':'
        end
        object Label4: TLabel
          Left = 8
          Top = 136
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
          Left = 105
          Top = 168
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
          Left = 105
          Top = 216
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
        object Label19: TLabel
          Left = 105
          Top = 192
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
          Left = 8
          Top = 168
          Width = 78
          Height = 12
          Caption = #25353#38190': '#32467#24080'(+)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 8
          Top = 192
          Width = 78
          Height = 12
          Caption = #25353#38190': '#22238#21024'(-)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 8
          Top = 216
          Width = 78
          Height = 12
          Caption = #25353#38190': '#21462#28040'(/)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object AddupLabel: TLabel
          Left = 8
          Top = 7
          Width = 30
          Height = 12
          Caption = #21512#35745':'
        end
        object GetMoneyLabel: TLabel
          Left = 112
          Top = 55
          Width = 54
          Height = 12
          Caption = #23454#25910#29616#37329':'
        end
        object Label11: TLabel
          Left = 8
          Top = 98
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
          Left = 56
          Top = 98
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
        object Total: TEdit
          Left = 8
          Top = 72
          Width = 89
          Height = 18
          Color = clWhite
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = TotalKeyPress
        end
        object Addup: TEdit
          Left = 8
          Top = 24
          Width = 193
          Height = 18
          Color = clWhite
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object GetMoney: TEdit
          Left = 112
          Top = 72
          Width = 89
          Height = 18
          Color = clWhite
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          OnChange = GetMoneyChange
          OnKeyPress = GetMoneyKeyPress
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 328
      Height = 299
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 1
      object ChangeList: TListView
        Left = 0
        Top = 0
        Width = 328
        Height = 299
        Align = alClient
        Columns = <
          item
            Caption = #21697#21517
            Width = 150
          end
          item
            Caption = #25442#36135#20215
            Width = 100
          end
          item
            Caption = #25968#37327
            Width = 60
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
  object ImageList2: TImageList
    Left = 432
    Top = 24
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7B5AD00EF423100F7BDBD00F7BDBD00F7BDBD00FFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6E7CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7948C00EF312100F7948C00EF524200EF524200EF180000EF18
      0000FFCECE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADEF006363E7002121D6000000
      CE003131D6008C8CE700DEDEF7000000000000000000000000000000000094C6
      8C00218C0800C6DEBD0094C68C00DEEFDE000000000000000000000000000000
      000094C68C005AAD4A005AAD4A0073BD6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF423100F7948C00000000000000000000000000F7B5AD00EF18
      0000F7948C00FFEFEF0000000000000000000000000000000000000000000000
      000000000000DEDEF7008C8CE7002121D6000000CE000000CE003131D6004242
      DE004242DE004242DE004242DE00ADADEF000000000000000000DEEFDE005AAD
      4A00218C0800C6DEBD0094C68C002994180094C68C000000000000000000B5D6
      AD00218C08002994180084C67B00D6E7CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFDEDE00EF180000EF423100EF180000EF524200EF524200EF524200EF18
      0000EF291000FFDEDE0000000000000000008C8CE7000000CE006363E7008C8C
      E7005252DE001010D6003131D6004242DE00CECEF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000218C0800B5D6AD0000000000D6E7CE002994180094C68C00DEEFDE002994
      18004AA53900DEEFDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFDEDE00F7847300000000000000000000000000FFCECE00F7A59C00F794
      8C00FFDEDE00000000000000000000000000CECEF700BDBDEF008C8CE7000000
      CE009C9CEF00000000005252DE000000CE008C8CE70000000000000000000000
      0000CECEF700000000000000000000000000C6DEBD00218C0800399C2900D6E7
      CE00399C290094C68C00000000000000000094C68C00218C08004AA539006BB5
      5A00EFF7EF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7948C00EF312100F7948C00F7948C00F7948C00F7948C00F7A59C00F7BD
      BD00F7BDBD00F7BDBD0000000000000000000000000000000000CECEF7001010
      D60000000000000000008C8CE7002121D6002121D6006363E700DEDEF7004242
      DE000000CE00000000000000000000000000DEEFDE00A5CE9C00399C29002994
      1800399C290029941800218C08004AA539006BB55A00218C08004AA53900D6E7
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7A59C00EF180000F7BDBD00F7BDBD00F7948C00EF180000EF423100EF52
      4200EF524200F7847300000000000000000000000000000000008C8CE7004242
      DE000000000000000000BDBDEF004242DE00000000004242DE001010D6001010
      D600ADADEF000000000000000000000000000000000000000000EFF7EF0084C6
      7B00218C080084C67B000000000084C67B0073BD6B004AA53900299418004AA5
      3900218C0800218C0800218C0800B5D6AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7BDBD00000000000000
      0000F7BDBD00EF180000F7BDBD00EF524200F7847300EF180000F7948C00F7BD
      BD000000000000000000000000000000000000000000000000008C8CE7003131
      D6000000000000000000BDBDEF004242DE008C8CE7002121D6008C8CE700EFEF
      FF00000000000000000000000000000000000000000000000000000000000000
      00005AAD4A00218C0800B5D6AD004AA5390094C68C0094C68C005AAD4A00C6DE
      BD00218C0800DEEFDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7736300EF524200FFDE
      DE00F7BDBD00EF180000FFEFEF00F7BDBD00F7A59C00EF180000EF423100EF52
      4200F78473000000000000000000000000009C9CEF004242DE002121D6000000
      CE009C9CEF0000000000BDBDEF002121D600EFEFFF009C9CEF002121D6002121
      D6007373E700EFEFFF0000000000000000000000000000000000C6DEBD00EFF7
      EF005AAD4A0094C68C00DEEFDE00218C080094C68C0073BD6B006BB55A000000
      0000218C080094C68C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7736300EF29
      1000F7948C00EF180000F7B5AD00F7948C00F7948C00EF180000F7948C00FFDE
      DE000000000000000000000000000000000000000000DEDEF7008C8CE7001010
      D6009C9CEF0000000000BDBDEF000000CE004242DE001010D6003131D6008C8C
      E7001010D600DEDEF700000000000000000000000000B5D6AD004AA53900218C
      0800218C08005AAD4A00B5D6AD00C6DEBD0094C68C0084C67B00218C08005AAD
      4A00218C08006BB55A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F773
      6300EF180000EF291000FFDEDE00F7BDBD00F7A59C00EF180000EF423100EF52
      4200F78473000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDEF000000CE00CECEF700000000000000CE00BDBD
      EF0000000000000000000000000000000000000000000000000000000000EFF7
      EF004AA539005AAD4A0094C68C00B5D6AD0084C67B00000000005AAD4A006BB5
      5A00C6DEBD00EFF7EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFEF
      EF00EF423100EF312100F7948C00EF524200F7847300EF180000F7948C00FFCE
      CE0000000000000000000000000000000000000000000000000000000000CECE
      F7004242DE0000000000BDBDEF000000CE005252DE004242DE001010D6007373
      E700000000000000000000000000000000000000000000000000000000000000
      00005AAD4A0094C68C0000000000EFF7EF002994180084C67B0094C68C00218C
      080073BD6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFCECE00EF180000EF635200F7BDBD00F7A59C00F7736300EF524200EF18
      0000EF291000FFDEDE00000000000000000000000000000000009C9CEF000000
      CE001010D600000000008C8CE7000000CE00BDBDEF00000000004242DE002121
      D600DEDEF7000000000000000000000000000000000000000000000000000000
      00004AA5390094C68C000000000000000000A5CE9C00218C0800399C29002994
      1800299418000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7736300EF1800000000000000000000F7A59C00EF1800000000
      0000000000000000000000000000000000000000000000000000CECEF700BDBD
      EF00EFEFFF0000000000BDBDEF008C8CE7006363E7001010D6000000CE001010
      D600DEDEF700000000000000000000000000000000000000000000000000EFF7
      EF00218C08006BB55A00000000000000000000000000218C080073BD6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7BDBD00F7B5AD0000000000F7B5AD00EF180000EF6352000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDEF00EFEF
      FF0000000000000000000000000000000000000000000000000000000000EFF7
      EF00C6DEBD00EFF7EF0000000000000000000000000094C68C00EFF7EF000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81FFFFFF7FF0000F807FF01E0F00000
      F9C3F800C0600000F003007FF2030000F387047703070000F003CC07000F0000
      F003CC87C2000000B00FCC0FF003000080070403C0130000C00F840380030000
      E007FC4FE0430000E00FE40FF2070000F003C447F3070000F99FC407E39F0000
      F91FFFCFE39F0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
