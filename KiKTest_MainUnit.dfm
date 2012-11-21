object KickerTesT: TKickerTesT
  Left = -1153
  Top = 110
  Width = 1001
  Height = 615
  AutoSize = True
  Caption = 'KickerTesT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = KickerIFKMBK
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Loop_SpeedButton: TSpeedButton
    Left = 0
    Top = 512
    Width = 113
    Height = 49
    AllowAllUp = True
    GroupIndex = 2
    Caption = 'LOOP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Loop_SpeedButtonClick
  end
  object Step_SpeedButton: TSpeedButton
    Left = 160
    Top = 512
    Width = 121
    Height = 49
    AllowAllUp = True
    GroupIndex = 2
    Caption = 'STEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Step_SpeedButtonClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 993
    Height = 505
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = -1
      Top = 1
      Width = 994
      Height = 233
      BevelInner = bvLowered
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 31
        Width = 993
        Height = 42
        BevelInner = bvLowered
        TabOrder = 0
        object Panel4: TPanel
          Left = 16
          Top = 8
          Width = 41
          Height = 25
          BevelInner = bvLowered
          Caption = '1'
          TabOrder = 0
        end
        object Counter1DelayMain_Edit: TEdit
          Left = 96
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '0'
          OnChange = Counter1DelayMain_EditChange
        end
        object Counter1DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '0'
          OnChange = Counter1DelayDump_EditChange
        end
        object Counter1LatchMain_Panel: TPanel
          Left = 296
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 3
        end
        object Counter1CountMain_Panel: TPanel
          Left = 200
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 4
        end
        object Counter1CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 5
        end
        object Counter1LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object Counter1Activ: TCheckBox
          Left = 967
          Top = 8
          Width = 18
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
          OnClick = Counter1ActivClick
        end
        object Counter1DumpStrbNeg_CheckBox: TCheckBox
          Left = 819
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 8
          OnClick = Counter1DumpStrbNeg_CheckBoxClick
        end
        object Counter1MainStrbNeg_CheckBox: TCheckBox
          Left = 403
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 9
          OnClick = Counter1MainStrbNeg_CheckBoxClick
        end
        object Counter1HWNeg_CheckBox: TCheckBox
          Left = 910
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 10
          OnClick = Counter1HWNeg_CheckBoxClick
        end
      end
      object TPanel
        Left = 0
        Top = 0
        Width = 993
        Height = 33
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 58
          Height = 18
          Caption = 'Counter'
        end
        object Label2: TLabel
          Left = 80
          Top = 8
          Width = 103
          Height = 18
          Caption = 'Delay main(ns)'
        end
        object Label3: TLabel
          Left = 200
          Top = 8
          Width = 80
          Height = 18
          Caption = 'Count main'
        end
        object Label4: TLabel
          Left = 296
          Top = 8
          Width = 76
          Height = 18
          Caption = 'Latch main'
        end
        object Label5: TLabel
          Left = 472
          Top = 8
          Width = 111
          Height = 18
          Caption = 'Delay Dump(ns)'
        end
        object Label6: TLabel
          Left = 600
          Top = 8
          Width = 88
          Height = 18
          Caption = 'Count Dump'
        end
        object Label7: TLabel
          Left = 704
          Top = 8
          Width = 84
          Height = 18
          Caption = 'Latch Dump'
        end
        object Label8: TLabel
          Left = 953
          Top = 8
          Width = 35
          Height = 18
          Caption = 'Activ'
        end
        object Label19: TLabel
          Left = 380
          Top = 8
          Width = 63
          Height = 18
          Caption = 'Strb Neg'
        end
        object Label20: TLabel
          Left = 796
          Top = 8
          Width = 63
          Height = 18
          Caption = 'Strb Neg'
        end
        object Label21: TLabel
          Left = 888
          Top = 8
          Width = 57
          Height = 18
          Caption = 'HW Neg'
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 71
        Width = 993
        Height = 42
        BevelInner = bvLowered
        TabOrder = 2
        object Panel10: TPanel
          Left = 16
          Top = 8
          Width = 41
          Height = 25
          BevelInner = bvLowered
          Caption = '2'
          TabOrder = 0
        end
        object Counter2DelayMain_Edit: TEdit
          Left = 96
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '0'
          OnChange = Counter2DelayMain_EditChange
        end
        object Counter2DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '0'
          OnChange = Counter2DelayDump_EditChange
        end
        object Counter2LatchMain_Panel: TPanel
          Left = 296
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 3
        end
        object Counter2CountMain_Panel: TPanel
          Left = 200
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 4
        end
        object Counter2CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 5
        end
        object Counter2LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 6
        end
        object Counter2Activ: TCheckBox
          Left = 968
          Top = 8
          Width = 17
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
          OnClick = Counter2ActivClick
        end
        object Counter2MainStrbNeg_CheckBox: TCheckBox
          Left = 403
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 8
          OnClick = Counter2MainStrbNeg_CheckBoxClick
        end
        object Counter2DumpStrbNeg_CheckBox: TCheckBox
          Left = 819
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 9
          OnClick = Counter2DumpStrbNeg_CheckBoxClick
        end
        object Counter2HWNeg_CheckBox: TCheckBox
          Left = 910
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 10
          OnClick = Counter2HWNeg_CheckBoxClick
        end
      end
      object Panel23: TPanel
        Left = 0
        Top = 111
        Width = 993
        Height = 42
        BevelInner = bvLowered
        TabOrder = 3
        object Panel24: TPanel
          Left = 16
          Top = 8
          Width = 41
          Height = 25
          BevelInner = bvLowered
          Caption = '3'
          TabOrder = 0
        end
        object Counter3DelayMain_Edit: TEdit
          Left = 96
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '0'
          OnChange = Counter3DelayMain_EditChange
        end
        object Counter3DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '0'
          OnChange = Counter3DelayDump_EditChange
        end
        object Counter3LatchMain_Panel: TPanel
          Left = 296
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 3
        end
        object Counter3CountMain_Panel: TPanel
          Left = 200
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 4
        end
        object Counter3CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 5
        end
        object Counter3LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 6
        end
        object Counter3Activ: TCheckBox
          Left = 968
          Top = 8
          Width = 17
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
          OnClick = Counter3ActivClick
        end
        object Counter3MainStrbNeg_CheckBox: TCheckBox
          Left = 403
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 8
          OnClick = Counter3MainStrbNeg_CheckBoxClick
        end
        object Counter3DumpStrbNeg_CheckBox: TCheckBox
          Left = 819
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 9
          OnClick = Counter3DumpStrbNeg_CheckBoxClick
        end
        object Counter3HWNeg_CheckBox: TCheckBox
          Left = 910
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 10
          OnClick = Counter3HWNeg_CheckBoxClick
        end
      end
      object Panel29: TPanel
        Left = 0
        Top = 151
        Width = 993
        Height = 42
        BevelInner = bvLowered
        TabOrder = 4
        object Panel30: TPanel
          Left = 16
          Top = 8
          Width = 41
          Height = 25
          BevelInner = bvLowered
          Caption = '4'
          TabOrder = 0
        end
        object Counter4DelayMain_Edit: TEdit
          Left = 96
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '0'
          OnChange = Counter4DelayMain_EditChange
        end
        object Counter4DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '0'
          OnChange = Counter4DelayDump_EditChange
        end
        object Counter4LatchMain_Panel: TPanel
          Left = 296
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 3
        end
        object Counter4CountMain_Panel: TPanel
          Left = 200
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 4
        end
        object Counter4CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 5
        end
        object Counter4LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 6
        end
        object Counter4Activ: TCheckBox
          Left = 968
          Top = 8
          Width = 17
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
          OnClick = Counter4ActivClick
        end
        object Counter4MainStrbNeg_CheckBox: TCheckBox
          Left = 403
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 8
          OnClick = Counter4MainStrbNeg_CheckBoxClick
        end
        object Counter4DumpStrbNeg_CheckBox: TCheckBox
          Left = 819
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 9
          OnClick = Counter4DumpStrbNeg_CheckBoxClick
        end
        object Counter4HWNeg_CheckBox: TCheckBox
          Left = 910
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 10
          OnClick = Counter4HWNeg_CheckBoxClick
        end
      end
      object Panel35: TPanel
        Left = 0
        Top = 191
        Width = 993
        Height = 42
        BevelInner = bvLowered
        TabOrder = 5
        object Panel36: TPanel
          Left = 16
          Top = 8
          Width = 41
          Height = 25
          BevelInner = bvLowered
          Caption = '5'
          TabOrder = 0
        end
        object Counter5DelayMain_Edit: TEdit
          Left = 96
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '0'
          OnChange = Counter5DelayMain_EditChange
        end
        object Counter5DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '0'
          OnChange = Counter5DelayDump_EditChange
        end
        object Counter5LatchMain_Panel: TPanel
          Left = 296
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 3
        end
        object Counter5CountMain_Panel: TPanel
          Left = 200
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 4
        end
        object Counter5CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 5
        end
        object Counter5LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '0'
          TabOrder = 6
        end
        object Counter5Activ: TCheckBox
          Left = 968
          Top = 8
          Width = 17
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
          OnClick = Counter5ActivClick
        end
        object Counter5MainStrbNeg_CheckBox: TCheckBox
          Left = 403
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 8
          OnClick = Counter5MainStrbNeg_CheckBoxClick
        end
        object Counter5DumpStrbNeg_CheckBox: TCheckBox
          Left = 819
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 9
          OnClick = Counter5DumpStrbNeg_CheckBoxClick
        end
        object Counter5HWNeg_CheckBox: TCheckBox
          Left = 910
          Top = 8
          Width = 25
          Height = 25
          TabOrder = 10
          OnClick = Counter5HWNeg_CheckBoxClick
        end
      end
    end
    object Panel11: TPanel
      Left = 0
      Top = 232
      Width = 305
      Height = 273
      BevelInner = bvLowered
      TabOrder = 1
      object Bevel1: TBevel
        Left = 5
        Top = 88
        Width = 292
        Height = 177
      end
      object Label9: TLabel
        Left = 8
        Top = 16
        Width = 88
        Height = 18
        Caption = 'Count Read '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 56
        Width = 99
        Height = 18
        Caption = 'Error Counter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 12
        Top = 132
        Width = 57
        Height = 18
        Caption = 'Card ID '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 12
        Top = 168
        Width = 82
        Height = 18
        Caption = 'Card Clock '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 162
        Top = 169
        Width = 32
        Height = 18
        Caption = 'MHz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 14
        Top = 101
        Width = 45
        Height = 18
        Caption = 'IFKNr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 14
        Top = 232
        Width = 88
        Height = 18
        Caption = 'Revision Nr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 14
        Top = 200
        Width = 79
        Height = 18
        Caption = 'Version Nr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CounterRead_Panel: TPanel
        Left = 117
        Top = 12
        Width = 145
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ErrorCounter_Panel: TPanel
        Left = 117
        Top = 52
        Width = 145
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object MBXID_Panel: TPanel
        Left = 115
        Top = 128
        Width = 174
        Height = 25
        BevelInner = bvLowered
        Caption = '------'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object CardClockPanel: TPanel
        Left = 115
        Top = 165
        Width = 44
        Height = 25
        BevelInner = bvLowered
        Caption = '---'
        TabOrder = 3
      end
      object IFKUse_Panel: TPanel
        Left = 115
        Top = 97
        Width = 39
        Height = 25
        BevelInner = bvLowered
        Caption = '---'
        TabOrder = 4
      end
      object Edit_Button: TButton
        Left = 254
        Top = 246
        Width = 41
        Height = 17
        Caption = 'Edit'
        TabOrder = 5
        OnClick = Edit_ButtonClick
      end
      object Version_Panel: TPanel
        Left = 115
        Top = 197
        Width = 44
        Height = 25
        BevelInner = bvLowered
        Caption = '---'
        TabOrder = 6
      end
      object Revision_Panel: TPanel
        Left = 115
        Top = 229
        Width = 44
        Height = 25
        BevelInner = bvLowered
        Caption = '---'
        TabOrder = 7
      end
    end
    object Panel16: TPanel
      Left = 455
      Top = 232
      Width = 410
      Height = 273
      BevelInner = bvLowered
      TabOrder = 2
      object Label14: TLabel
        Left = 8
        Top = 8
        Width = 127
        Height = 18
        Caption = 'System Messages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SystemMessages_ListBox: TListBox
        Left = 8
        Top = 27
        Width = 393
        Height = 214
        ItemHeight = 17
        TabOrder = 0
      end
      object Clear_Button: TButton
        Left = 338
        Top = 252
        Width = 65
        Height = 19
        Caption = 'Clear'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Clear_ButtonClick
      end
    end
    object Panel6: TPanel
      Left = 303
      Top = 232
      Width = 154
      Height = 257
      BevelInner = bvLowered
      TabOrder = 3
      object Label18: TLabel
        Left = 48
        Top = 16
        Width = 53
        Height = 18
        Caption = 'LogFile'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LogFile_SpeedButton: TSpeedButton
        Left = 16
        Top = 42
        Width = 121
        Height = 31
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Record'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = LogFile_SpeedButtonClick
      end
      object LogFileClear_Button: TButton
        Left = 16
        Top = 200
        Width = 121
        Height = 33
        Caption = 'Clear'
        TabOrder = 0
        OnClick = LogFileClear_ButtonClick
      end
      object LogFileSave_Button: TButton
        Left = 16
        Top = 136
        Width = 121
        Height = 33
        Caption = 'Save'
        TabOrder = 1
        OnClick = LogFileSave_ButtonClick
      end
      object LogFileShow_Button: TButton
        Left = 16
        Top = 88
        Width = 121
        Height = 33
        Caption = 'Show'
        TabOrder = 2
        OnClick = LogFileShow_ButtonClick
      end
    end
  end
  object Exit_Button: TButton
    Left = 872
    Top = 512
    Width = 121
    Height = 49
    Caption = 'EXIT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Exit_ButtonClick
  end
  object KickerIFKMBK: TMainMenu
    Left = 592
    Top = 528
    object sonstiges1: TMenuItem
      Caption = 'sonstiges'
      object PCICardSelect2: TMenuItem
        Caption = 'PCI-Card Select'
        OnClick = PCICardSelect2Click
      end
      object EchoTesT2: TMenuItem
        Caption = 'EchoTesT'
        OnClick = EchoTesT2Click
      end
      object TriggerKarte1: TMenuItem
        Caption = 'Trigger Karte'
        OnClick = TriggerKarte1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 536
    Top = 528
  end
end
