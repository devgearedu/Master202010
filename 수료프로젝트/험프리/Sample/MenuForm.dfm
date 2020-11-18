object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = #47700#45684' '#46321#47197
  ClientHeight = 417
  ClientWidth = 590
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 590
    Height = 303
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 303
    Width = 590
    Height = 57
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 360
    ExplicitWidth = 681
    DesignSize = (
      590
      57)
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 36
      Height = 13
      Caption = #47700#45684' '#47749
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 552
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'MENU_NAME'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 360
    Width = 590
    Height = 57
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 681
    DesignSize = (
      590
      57)
    object btnAppend: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 0
      OnClick = btnAppendClick
    end
    object btnSave: TButton
      Left = 405
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #51200#51109
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitLeft = 496
    end
    object btnCancel: TButton
      Left = 493
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #52712#49548
      TabOrder = 2
      OnClick = btnCancelClick
      ExplicitLeft = 584
    end
  end
  object qryMenus: TFDQuery
    Active = True
    Connection = dmDatabase.FDConnection1
    SQL.Strings = (
      'SELECT * FROM MENUS')
    Left = 112
    Top = 64
    object qryMenusMENU_SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #51068#47144#48264#54840
      FieldName = 'MENU_SEQ'
      Origin = 'MENU_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMenusMENU_NAME: TWideStringField
      DisplayLabel = #47700#45684' '#47749
      DisplayWidth = 50
      FieldName = 'MENU_NAME'
      Origin = 'MENU_NAME'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = qryMenus
    Left = 336
    Top = 216
  end
end
