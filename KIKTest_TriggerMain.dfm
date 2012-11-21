object TriGGerMain: TTriGGerMain
  Left = -659
  Top = 39
  Width = 570
  Height = 578
  AutoSize = True
  Caption = 'Trigger Karte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 488
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 561
      Height = 33
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 40
        Height = 18
        Caption = 'Kanal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 72
        Top = 7
        Width = 57
        Height = 18
        Caption = 'Kanal In'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 152
        Top = 7
        Width = 101
        Height = 18
        Caption = 'Trigger Level '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 264
        Top = 7
        Width = 72
        Height = 18
        Caption = 'Hysterese'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 352
        Top = 7
        Width = 77
        Height = 18
        Caption = 'Komp Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 448
        Top = 7
        Width = 47
        Height = 18
        Caption = 'ECL In'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 510
        Top = 8
        Width = 35
        Height = 18
        Caption = 'Activ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 31
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 1
      object Label7: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel4: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '1'
        TabOrder = 0
      end
      object K1KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K1TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        Color = clWhite
        TabOrder = 2
        Text = '0'
        OnExit = K1TriggerLevel_EditExit
        OnKeyPress = K1TriggerLevel_EditKeyPress
      end
      object K1Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K1KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K1ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K1Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = K1Activ_CheckBoxClick
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 70
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 2
      object Label9: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel6: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '2'
        TabOrder = 0
      end
      object K2KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K2TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        TabOrder = 2
        Text = '0'
        OnExit = K2TriggerLevel_EditExit
        OnKeyPress = K2TriggerLevel_EditKeyPress
      end
      object K2Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K2KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K2ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K2Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = K2Activ_CheckBoxClick
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 109
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 3
      object Label10: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel8: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '3'
        TabOrder = 0
      end
      object K3KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K3TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        TabOrder = 2
        Text = '0'
        OnExit = K3TriggerLevel_EditExit
        OnKeyPress = K3TriggerLevel_EditKeyPress
      end
      object K3Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K3KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K3ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K3Activ_CheckBox: TCheckBox
        Left = 520
        Top = 12
        Width = 25
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = K3Activ_CheckBoxClick
      end
    end
    object Panel11: TPanel
      Left = 0
      Top = 187
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 4
      object Label12: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel12: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '5'
        TabOrder = 0
      end
      object K5KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K5TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        Enabled = False
        TabOrder = 2
        Text = '0'
        OnKeyPress = K5TriggerLevel_EditKeyPress
      end
      object K5Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K5KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K5ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K5Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 6
      end
    end
    object Panel13: TPanel
      Left = 0
      Top = 226
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 5
      object Label13: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel14: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '6'
        TabOrder = 0
      end
      object K6KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K6TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        Enabled = False
        TabOrder = 2
        Text = '0'
        OnKeyPress = K6TriggerLevel_EditKeyPress
      end
      object K6Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K6KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K6ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K6Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 6
      end
    end
    object Panel17: TPanel
      Left = 0
      Top = 304
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 6
      object Label15: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel18: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '8'
        TabOrder = 0
      end
      object K8KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K8TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        Enabled = False
        TabOrder = 2
        Text = '0'
        OnKeyPress = K8TriggerLevel_EditKeyPress
      end
      object K8Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 23
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K8KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K8ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K8Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 6
      end
    end
    object Panel19: TPanel
      Left = 0
      Top = 343
      Width = 561
      Height = 145
      BevelInner = bvLowered
      TabOrder = 7
      object Label16: TLabel
        Left = 288
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
      object TriggerSysMessages_ListBox: TListBox
        Left = 288
        Top = 32
        Width = 265
        Height = 81
        ItemHeight = 17
        TabOrder = 0
      end
      object Clear_Button: TButton
        Left = 488
        Top = 118
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
      object Panel20: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 145
        BevelInner = bvLowered
        TabOrder = 2
        object Label17: TLabel
          Left = 12
          Top = 55
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
        object Label18: TLabel
          Left = 14
          Top = 13
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
        object TriggerCardID_Panel: TPanel
          Left = 70
          Top = 51
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
          TabOrder = 0
        end
        object TriggerIFKUse_Panel: TPanel
          Left = 71
          Top = 9
          Width = 39
          Height = 25
          BevelInner = bvLowered
          Caption = '---'
          TabOrder = 1
        end
        object Edit_Button: TButton
          Left = 216
          Top = 120
          Width = 41
          Height = 17
          Caption = 'Edit'
          TabOrder = 2
          OnClick = Edit_ButtonClick
        end
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 148
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 8
      object Label11: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel10: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '4'
        TabOrder = 0
      end
      object K4KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K4TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        TabOrder = 2
        Text = '0'
        OnExit = K4TriggerLevel_EditExit
        OnKeyPress = K4TriggerLevel_EditKeyPress
      end
      object K4Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K4KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K4ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K4Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = K4Activ_CheckBoxClick
      end
    end
    object Panel15: TPanel
      Left = 0
      Top = 265
      Width = 561
      Height = 41
      BevelInner = bvLowered
      TabOrder = 9
      object Label14: TLabel
        Left = 222
        Top = 11
        Width = 24
        Height = 17
        Caption = 'Volt'
      end
      object Panel16: TPanel
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        BevelInner = bvLowered
        Caption = '7'
        TabOrder = 0
      end
      object K7KanalIn_CheckBox: TCheckBox
        Left = 95
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object K7TriggerLevel_Edit: TEdit
        Left = 161
        Top = 8
        Width = 56
        Height = 25
        Enabled = False
        TabOrder = 2
        Text = '0'
        OnExit = K1TriggerLevel_EditExit
        OnKeyPress = K7TriggerLevel_EditKeyPress
      end
      object K7Hysterese_CheckBox: TCheckBox
        Left = 296
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 3
      end
      object K7KompTest_CheckBox: TCheckBox
        Left = 390
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 4
      end
      object K7ECLIn_CheckBox: TCheckBox
        Left = 464
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 5
      end
      object K7Activ_CheckBox: TCheckBox
        Left = 520
        Top = 8
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 6
        OnClick = K1Activ_CheckBoxClick
      end
    end
  end
  object Close_Button: TButton
    Left = 441
    Top = 495
    Width = 121
    Height = 49
    Caption = 'CLOSE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Close_ButtonClick
  end
  object Send_Button: TButton
    Left = 1
    Top = 495
    Width = 152
    Height = 49
    Caption = 'SEND'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Send_ButtonClick
  end
end
