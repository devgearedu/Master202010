object frmRequest: TfrmRequest
  Left = 0
  Top = 0
  Caption = #50836#52397#49436' '#51089#49457
  ClientHeight = 386
  ClientWidth = 454
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
    Width = 454
    Height = 41
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 9
      Width = 75
      Height = 25
      Caption = #46321#47197
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 10
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 1
    end
    object Button3: TButton
      Left = 368
      Top = 10
      Width = 75
      Height = 25
      Caption = #45803#44592
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 454
    Height = 345
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DataAccessModule.qryODER
    Left = 330
    Top = 152
  end
end
