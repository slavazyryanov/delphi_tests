object PlaceF: TPlaceF
  Left = 535
  Top = 397
  BorderStyle = bsToolWindow
  Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
  ClientHeight = 242
  ClientWidth = 121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnApply: TButton
    Left = 0
    Top = 152
    Width = 121
    Height = 33
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
    OnClick = btnApplyClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 145
    BorderStyle = bsSingle
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 70
      Height = 13
      Caption = #1063#1080#1089#1083#1086' '#1073#1086#1083#1090#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 82
      Width = 49
      Height = 13
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 42
      Width = 65
      Height = 13
      Caption = #1063#1080#1089#1083#1086' '#1082#1086#1083#1077#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpinEdit1: TSpinEdit
      Left = 24
      Top = 18
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 10
    end
    object SpinEdit2: TSpinEdit
      Left = 24
      Top = 98
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 100
    end
    object CheckBox1: TCheckBox
      Left = 0
      Top = 124
      Width = 113
      Height = 17
      Caption = #1042' '#1076#1088#1091#1075#1091#1102' '#1089#1090#1086#1088#1086#1085#1091
      Enabled = False
      TabOrder = 2
    end
    object SpinEdit3: TSpinEdit
      Left = 24
      Top = 58
      Width = 81
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 184
    Width = 121
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Kind = bkCancel
  end
end
