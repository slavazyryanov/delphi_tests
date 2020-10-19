object Form4: TForm4
  Left = 504
  Top = 356
  BorderStyle = bsNone
  Caption = 'Form4'
  ClientHeight = 106
  ClientWidth = 128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 134
    Height = 110
    Caption = 'Panel1'
    TabOrder = 2
  end
  object grbKts: TGroupBox
    Left = 2
    Top = 2
    Width = 129
    Height = 105
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 40
      Height = 13
      Caption = #1047#1072#1087#1072#1089#1072':'
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 40
      Height = 13
      Caption = #1058#1088#1077#1085#1080#1103':'
    end
    object Label6: TLabel
      Left = 16
      Top = 48
      Width = 55
      Height = 13
      Caption = #1041#1077#1079#1086#1087#1072#1089#1085'.:'
    end
    object Edit1: TEdit
      Left = 80
      Top = 16
      Width = 49
      Height = 13
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 0
      Text = '1,5'
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 80
      Top = 32
      Width = 49
      Height = 13
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 1
      Text = '0,15'
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Button1: TButton
      Left = 8
      Top = 72
      Width = 57
      Height = 25
      Caption = #1054#1050
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 64
      Top = 72
      Width = 59
      Height = 25
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090
      TabOrder = 3
      OnClick = Button2Click
    end
    object Edit4: TEdit
      Left = 80
      Top = 48
      Width = 49
      Height = 13
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 4
      Text = '2'
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
  end
  object grbMats: TGroupBox
    Left = 0
    Top = 0
    Width = 129
    Height = 105
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 61
      Height = 13
      Caption = #1055#1088#1077#1076#1077#1083' '#1090#1077#1082'.'
    end
    object Label4: TLabel
      Left = 80
      Top = 48
      Width = 6
      Height = 13
      Caption = '0'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 16
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = '<>'
      OnChange = ComboBox1Change
    end
    object Button3: TButton
      Left = 8
      Top = 72
      Width = 57
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 64
      Top = 72
      Width = 59
      Height = 25
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object grbBolt: TGroupBox
    Left = 0
    Top = 2
    Width = 129
    Height = 105
    Caption = #1055#1088#1077#1076#1077#1083' '#1090#1077#1082#1091#1095#1077#1089#1090#1080
    TabOrder = 3
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 39
      Height = 13
      Caption = 'SigmaT:'
    end
    object Edit3: TEdit
      Left = 64
      Top = 24
      Width = 49
      Height = 13
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 0
      Text = '240'
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Button5: TButton
      Left = 8
      Top = 72
      Width = 57
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button6: TButton
      Left = 64
      Top = 72
      Width = 59
      Height = 25
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Table1: TTable
    TableName = 'mats.db'
    Left = 136
    Top = 8
  end
end
