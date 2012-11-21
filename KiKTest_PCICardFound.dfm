object PCICardSelect: TPCICardSelect
  Left = -848
  Top = 236
  Width = 217
  Height = 194
  AutoSize = True
  Caption = 'Select PCI-Card'
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
    Width = 209
    Height = 121
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 129
      Height = 18
      Caption = 'PCI- Cards found  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 148
      Height = 18
      Caption = 'PCI- Cards Nr. used  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 8
      Top = 92
      Width = 131
      Height = 18
      Caption = 'PCI- Card chosse  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PCICardFound_Panel: TPanel
      Left = 151
      Top = 5
      Width = 49
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 0
    end
    object PCICardUse_Panel: TPanel
      Left = 151
      Top = 45
      Width = 49
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 1
    end
    object PCICardChoose_ComboBox: TComboBox
      Left = 152
      Top = 88
      Width = 49
      Height = 25
      ItemHeight = 17
      TabOrder = 2
      Text = '1'
    end
  end
  object OK_Button: TButton
    Left = 55
    Top = 127
    Width = 105
    Height = 33
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = OK_ButtonClick
  end
end
