object fRep: TfRep
  Left = 901
  Top = 150
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 703
  ClientWidth = 140
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 140
    Height = 700
    Caption = #1054#1090#1095#1077#1090
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 89
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1073#1086#1083#1090#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 600
      Width = 125
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 7
      Top = 625
      Width = 125
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Flat = True
      OnClick = SpeedButton2Click
    end
    object ListBox1: TListBox
      Left = 125
      Top = 32
      Width = 121
      Height = 545
      BevelKind = bkFlat
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object TreeView1: TTreeView
      Left = 8
      Top = 32
      Width = 121
      Height = 560
      Indent = 19
      TabOrder = 1
      OnClick = TreeView1Click
    end
  end
end
