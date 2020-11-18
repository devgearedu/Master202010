object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #47700#51064#54268
  ClientHeight = 309
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    379
    309)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnMenuInput: TButton
    Left = 24
    Top = 24
    Width = 137
    Height = 57
    Caption = #47700#45684#46321#47197
    TabOrder = 0
    OnClick = BtnMenuInputClick
  end
  object BtnShopInput: TButton
    Left = 216
    Top = 24
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = #51648#51216#46321#47197
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 152
    Width = 329
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 112
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 3
    Text = #51204#52404
    Items.Strings = (
      #51204#52404)
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Cafe')
    Connected = True
    LoginPrompt = False
    Left = 200
    Top = 96
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from menus')
    Left = 255
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 311
    Top = 96
  end
end
