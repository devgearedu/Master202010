object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #50836#52397#49436' '#54532#47196#44536#47016
  ClientHeight = 507
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 97
    Align = alTop
    TabOrder = 0
    DesignSize = (
      690
      97)
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 89
      Height = 57
      Caption = #49888#44508' '#50836#52397#49436' '#46321#47197
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 127
      Top = 16
      Width = 90
      Height = 57
      Caption = #49888#44508' '#50629#52404' '#46321#47197
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 594
      Top = 16
      Width = 81
      Height = 57
      Anchors = [akTop, akRight]
      Caption = #51333#47308
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 383
      Top = 16
      Width = 75
      Height = 25
      Caption = #44160#49353
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 256
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 488
    Width = 690
    Height = 19
    Panels = <>
  end
end
