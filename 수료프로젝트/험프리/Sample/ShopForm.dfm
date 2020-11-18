object frmShop: TfrmShop
  Left = 0
  Top = 0
  Caption = #49345#51216#44288#47532
  ClientHeight = 346
  ClientWidth = 550
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
    Width = 550
    Height = 264
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
    Top = 264
    Width = 550
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitTop = 160
    ExplicitWidth = 185
    DesignSize = (
      550
      41)
    object Label1: TLabel
      Left = 25
      Top = 11
      Width = 33
      Height = 13
      Caption = #49345#51216#47749
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 6
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SHOP_NAME'
      DataSource = DataSource1
      TabOrder = 0
      ExplicitWidth = 475
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 305
    Width = 550
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 185
    DesignSize = (
      550
      41)
    object btnAppend: TButton
      Left = 24
      Top = 6
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 0
      OnClick = btnAppendClick
    end
    object btnSave: TButton
      Left = 379
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #51200#51109
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitLeft = 391
    end
    object btnCancel: TButton
      Left = 460
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #52712#49548
      TabOrder = 2
      OnClick = btnCancelClick
      ExplicitLeft = 472
    end
  end
  object qryShops: TFDQuery
    Active = True
    Connection = dmDatabase.FDConnection1
    SQL.Strings = (
      'SELECT * FROM SHOPS')
    Left = 160
    Top = 96
    object qryShopsSHOP_SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #51068#47144#48264#54840
      FieldName = 'SHOP_SEQ'
      Origin = 'SHOP_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryShopsSHOP_NAME: TWideStringField
      DisplayLabel = #49345#51216#47749
      DisplayWidth = 50
      FieldName = 'SHOP_NAME'
      Origin = 'SHOP_NAME'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = qryShops
    Left = 264
    Top = 96
  end
end
