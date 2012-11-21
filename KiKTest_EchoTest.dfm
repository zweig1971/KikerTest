object KickerEchoTest: TKickerEchoTest
  Left = -862
  Top = 170
  Width = 569
  Height = 267
  AutoSize = True
  Caption = 'Kicker Echo TesT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Loop_SpeedButton: TSpeedButton
    Left = 0
    Top = 192
    Width = 89
    Height = 41
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'LOOP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Loop_SpeedButtonClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 185
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 18
      Width = 62
      Height = 17
      Caption = 'Send Off '
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 93
      Height = 17
      Caption = 'Error Counter '
    end
    object Label3: TLabel
      Left = 304
      Top = 16
      Width = 121
      Height = 17
      Caption = 'System Messages'
    end
    object LoopCounter_Panel: TPanel
      Left = 112
      Top = 14
      Width = 161
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 0
    end
    object ErrorCounter_Panel: TPanel
      Left = 112
      Top = 58
      Width = 161
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 1
    end
    object ResetKicker_Button: TButton
      Left = 16
      Top = 144
      Width = 105
      Height = 25
      Caption = 'Reset Kicker'
      TabOrder = 2
      OnClick = ResetKicker_ButtonClick
    end
    object SystemMess_ListBox: TListBox
      Left = 304
      Top = 40
      Width = 241
      Height = 129
      ItemHeight = 17
      TabOrder = 3
    end
    object Clear_Button: TButton
      Left = 168
      Top = 144
      Width = 105
      Height = 25
      Caption = 'Clear'
      TabOrder = 4
      OnClick = Clear_ButtonClick
    end
    object ErrorStop_CheckBox: TCheckBox
      Left = 184
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Error Stop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Close_Button: TButton
    Left = 472
    Top = 192
    Width = 89
    Height = 41
    Caption = 'CLOSE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Close_ButtonClick
  end
  object Step_Button: TButton
    Left = 112
    Top = 192
    Width = 89
    Height = 41
    Caption = 'STEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Step_ButtonClick
  end
end
