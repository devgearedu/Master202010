object FormMenuInput: TFormMenuInput
  Left = 0
  Top = 0
  Caption = #47700#45684#46321#47197
  ClientHeight = 358
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    603
    358)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 232
    Width = 40
    Height = 13
    Caption = #47700#45684#47749' :'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 20
    Width = 553
    Height = 185
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object EdtMemuNameInput: TEdit
    Left = 72
    Top = 229
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnInput: TButton
    Left = 24
    Top = 280
    Width = 97
    Height = 54
    Caption = #52628#44032
    TabOrder = 2
    OnClick = BtnInputClick
  end
  object BtnCancel: TButton
    Left = 480
    Top = 280
    Width = 97
    Height = 54
    Caption = #52712#49548
    TabOrder = 3
    OnClick = BtnCancelClick
  end
  object BtnSave: TButton
    Left = 360
    Top = 280
    Width = 97
    Height = 54
    Caption = #51200#51109
    TabOrder = 4
    OnClick = BtnSaveClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Cafe')
    Connected = True
    LoginPrompt = False
    Left = 312
    Top = 216
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from menus')
    Left = 384
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 448
    Top = 216
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 520
    Top = 216
  end
end
