object Form1: TForm1
  Left = 0
  Top = 0
  Width = 873
  Height = 559
  AutoSize = True
  Caption = 'KickerTesT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 17
  object Loop_SpeedButton: TSpeedButton
    Left = 0
    Top = 456
    Width = 113
    Height = 49
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'LOOP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 865
    Height = 449
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = -1
      Top = 1
      Width = 866
      Height = 233
      BevelInner = bvLowered
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 31
        Width = 866
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
          Left = 128
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '123456'
        end
        object Counter1DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '123456'
        end
        object Counter1LatchMain_Panel: TPanel
          Left = 368
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 3
        end
        object Counter1CountMain_Panel: TPanel
          Left = 256
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 4
        end
        object Counter1CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 5
        end
        object Counter1LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 6
        end
        object Counter1Activ: TCheckBox
          Left = 816
          Top = 8
          Width = 49
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
      object TPanel
        Left = 0
        Top = 0
        Width = 866
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
          Left = 112
          Top = 8
          Width = 103
          Height = 18
          Caption = 'Delay main(ns)'
        end
        object Label3: TLabel
          Left = 248
          Top = 8
          Width = 80
          Height = 18
          Caption = 'Count main'
        end
        object Label4: TLabel
          Left = 368
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
          Left = 808
          Top = 8
          Width = 35
          Height = 18
          Caption = 'Activ'
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 71
        Width = 866
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
          Left = 128
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '123456'
        end
        object Counter2DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '123456'
        end
        object Counter2LatchMain_Panel: TPanel
          Left = 368
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 3
        end
        object Counter2CountMain_Panel: TPanel
          Left = 256
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 4
        end
        object Counter2CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 5
        end
        object Counter2LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 6
        end
        object Counter2Activ: TCheckBox
          Left = 816
          Top = 8
          Width = 49
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
      object Panel23: TPanel
        Left = 0
        Top = 111
        Width = 866
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
          Left = 128
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '123456'
        end
        object Counter3DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '123456'
        end
        object Counter3LatchMain_Panel: TPanel
          Left = 368
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 3
        end
        object Counter3CountMain_Panel: TPanel
          Left = 256
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 4
        end
        object Counter3CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 5
        end
        object Counter3LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 6
        end
        object Counter3Activ: TCheckBox
          Left = 816
          Top = 8
          Width = 49
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
      object Panel29: TPanel
        Left = 0
        Top = 151
        Width = 866
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
          Left = 128
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '123456'
        end
        object Counter4DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '123456'
        end
        object Counter4LatchMain_Panel: TPanel
          Left = 368
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 3
        end
        object Counter4CountMain_Panel: TPanel
          Left = 256
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 4
        end
        object Counter4CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 5
        end
        object Counter4LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 6
        end
        object Counter4Activ: TCheckBox
          Left = 816
          Top = 8
          Width = 49
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
      object Panel35: TPanel
        Left = 0
        Top = 191
        Width = 866
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
          Left = 128
          Top = 8
          Width = 65
          Height = 25
          TabOrder = 1
          Text = '123456'
        end
        object Counter5DelayDump_Edit: TEdit
          Left = 501
          Top = 8
          Width = 56
          Height = 25
          TabOrder = 2
          Text = '123456'
        end
        object Counter5LatchMain_Panel: TPanel
          Left = 368
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 3
        end
        object Counter5CountMain_Panel: TPanel
          Left = 256
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 4
        end
        object Counter5CountDump_Panel: TPanel
          Left = 608
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 5
        end
        object Counter5LatchDump_Panel: TPanel
          Left = 712
          Top = 8
          Width = 73
          Height = 25
          BevelInner = bvLowered
          Caption = '123456'
          TabOrder = 6
        end
        object Counter5Activ: TCheckBox
          Left = 816
          Top = 8
          Width = 49
          Height = 25
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
    end
    object Panel11: TPanel
      Left = 0
      Top = 232
      Width = 289
      Height = 217
      BevelInner = bvLowered
      TabOrder = 1
      object Bevel1: TBevel
        Left = 5
        Top = 120
        Width = 265
        Height = 81
      end
      object Label9: TLabel
        Left = 8
        Top = 16
        Width = 102
        Height = 18
        Caption = 'Loop Counter '
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
        Left = 10
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
      object LoopCounter_Panel: TPanel
        Left = 117
        Top = 12
        Width = 145
        Height = 25
        BevelInner = bvLowered
        Caption = '123456789'
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
        Caption = '123456789'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object CardID_Panel: TPanel
        Left = 115
        Top = 128
        Width = 145
        Height = 25
        BevelInner = bvLowered
        Caption = '123456789'
        TabOrder = 2
      end
      object CardClockPanel: TPanel
        Left = 115
        Top = 165
        Width = 44
        Height = 25
        BevelInner = bvLowered
        Caption = '123'
        TabOrder = 3
      end
    end
    object Panel16: TPanel
      Left = 454
      Top = 232
      Width = 242
      Height = 217
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
        Width = 225
        Height = 162
        ItemHeight = 17
        TabOrder = 0
      end
      object Clear_Button: TButton
        Left = 168
        Top = 194
        Width = 65
        Height = 19
        Caption = 'Clear'
        TabOrder = 1
      end
    end
    object Panel17: TPanel
      Left = 287
      Top = 232
      Width = 169
      Height = 217
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label15: TLabel
        Left = 96
        Top = 16
        Width = 36
        Height = 18
        Caption = 'IFKs '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 96
        Top = 80
        Width = 49
        Height = 18
        Caption = 'IFK Nr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 8
        Top = 16
        Width = 47
        Height = 18
        Caption = 'Online'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object IFKCount_Panel: TPanel
        Left = 93
        Top = 37
        Width = 39
        Height = 25
        BevelInner = bvLowered
        Caption = '123'
        TabOrder = 0
      end
      object IFKNr_ComboBox: TComboBox
        Left = 96
        Top = 104
        Width = 49
        Height = 25
        ItemHeight = 17
        TabOrder = 1
        Text = '123'
      end
      object IFKsOnline_ListBox: TListBox
        Left = 8
        Top = 32
        Width = 65
        Height = 169
        ItemHeight = 17
        TabOrder = 2
      end
      object Update_Button: TButton
        Left = 96
        Top = 176
        Width = 57
        Height = 25
        Caption = 'Update'
        TabOrder = 3
      end
    end
  end
  object Exit_Button: TButton
    Left = 744
    Top = 456
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
  end
  object Step_Button: TButton
    Left = 176
    Top = 456
    Width = 121
    Height = 49
    Caption = 'STEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 56
    object Datei1: TMenuItem
      Caption = 'Datei'
    end
    object About1: TMenuItem
      Caption = 'About'
    end
  end
end
