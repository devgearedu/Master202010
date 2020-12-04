object frmRequest2: TfrmRequest2
  Left = 0
  Top = 0
  Caption = 'RequestForm2'
  ClientHeight = 436
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 666
    Height = 65
    Align = alTop
    TabOrder = 0
    DesignSize = (
      666
      65)
    object Button1: TButton
      Left = 24
      Top = 21
      Width = 81
      Height = 28
      Caption = #51200#51109
      TabOrder = 0
    end
    object Button2: TButton
      Left = 548
      Top = 20
      Width = 89
      Height = 28
      Anchors = [akTop, akRight]
      Caption = #51333#47308
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 417
    Width = 666
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 666
    Height = 352
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 50
      Top = 32
      Width = 36
      Height = 13
      Caption = #50629#52404' '#47749
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 50
      Top = 80
      Width = 22
      Height = 13
      Caption = #51452#49548
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 57
      Top = 160
      Width = 47
      Height = 13
      Caption = #50836#44396' '#49324#54637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 50
      Top = 120
      Width = 44
      Height = 13
      Caption = #51204#54868#48264#54840
    end
    object edtName: TDBEdit
      Left = 216
      Top = 29
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtAddress: TDBEdit
      Left = 216
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 216
      Top = 157
      Width = 377
      Height = 164
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edtPhone: TDBEdit
      Left = 216
      Top = 117
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
end
