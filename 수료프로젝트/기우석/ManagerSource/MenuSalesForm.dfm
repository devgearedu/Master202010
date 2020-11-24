object frmMenuSales: TfrmMenuSales
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 530
  ClientWidth = 1117
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1117
    Height = 530
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 731
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1115
      Height = 54
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 608
      DesignSize = (
        1115
        54)
      object Label1: TLabel
        Left = 693
        Top = 20
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #51648#51216#49440#53469
        ExplicitLeft = 303
      end
      object Label2: TLabel
        Left = 901
        Top = 20
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #47700#45684#49440#53469
        ExplicitLeft = 511
      end
      object RadioGroup1: TRadioGroup
        Left = 14
        Top = 1
        Width = 230
        Height = 48
        Caption = 'RadioGroup1'
        Columns = 3
        Items.Strings = (
          #51068#48324
          #51452#48324
          #50900#48324)
        TabOrder = 0
      end
      object ComboBox1: TComboBox
        Left = 743
        Top = 17
        Width = 145
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
        Text = 'ComboBox1'
        ExplicitLeft = 353
      end
      object ComboBox2: TComboBox
        Left = 951
        Top = 17
        Width = 145
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 2
        Text = 'ComboBox2'
        ExplicitLeft = 561
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 55
      Width = 839
      Height = 474
      Align = alClient
      TabOrder = 1
      ExplicitTop = 56
      object DBChart1: TDBChart
        Left = 1
        Top = 1
        Width = 837
        Height = 472
        Title.Text.Strings = (
          'TDBChart')
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 216
        ExplicitTop = 112
        ExplicitWidth = 400
        ExplicitHeight = 250
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
      end
    end
    object Panel4: TPanel
      Left = 840
      Top = 55
      Width = 276
      Height = 474
      Align = alRight
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 274
        Height = 472
        Align = alClient
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end
