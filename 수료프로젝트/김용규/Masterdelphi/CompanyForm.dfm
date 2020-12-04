object frmCompany: TfrmCompany
  Left = 0
  Top = 0
  Caption = #50629#52404' '#46321#47197
  ClientHeight = 615
  ClientWidth = 589
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
    Width = 589
    Height = 129
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 36
      Height = 13
      Caption = #50629#52404' '#47749
    end
    object Label2: TLabel
      Left = 24
      Top = 43
      Width = 22
      Height = 13
      Caption = #51452#49548
    end
    object Label3: TLabel
      Left = 24
      Top = 70
      Width = 44
      Height = 13
      Caption = #51204#54868#48264#54840
    end
    object Label4: TLabel
      Left = 323
      Top = 43
      Width = 22
      Height = 13
      Caption = #44160#49353
    end
    object Button1: TButton
      Left = 200
      Top = 40
      Width = 89
      Height = 51
      Caption = #46321#47197
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 351
      Top = 88
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 439
      Top = 88
      Width = 75
      Height = 25
      Caption = #45803#44592
      TabOrder = 2
      OnClick = Button3Click
    end
    object edtName: TDBEdit
      Left = 73
      Top = 13
      Width = 121
      Height = 21
      DataField = 'CP_NAME'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edtAddress: TDBEdit
      Left = 73
      Top = 40
      Width = 121
      Height = 21
      DataField = 'CP_ADDRESS'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edtPhone: TDBEdit
      Left = 73
      Top = 67
      Width = 121
      Height = 21
      DataField = 'CP_PHONE'
      DataSource = DataSource1
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 323
      Top = 13
      Width = 97
      Height = 17
      Caption = #50629#52404#47749
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object CheckBox2: TCheckBox
      Left = 411
      Top = 13
      Width = 97
      Height = 17
      Caption = #51204#54868#48264#54840
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object Edit1: TEdit
      Left = 360
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 8
      OnKeyUp = Edit1KeyUp
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 596
    Width = 589
    Height = 19
    Panels = <>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 589
    Height = 467
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button4: TButton
    Left = 200
    Top = 9
    Width = 89
    Height = 25
    Caption = #49888#44508' '#52628#44032
    TabOrder = 3
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    DataSet = qryCP
    Left = 448
    Top = 200
  end
  object qryCP: TFDQuery
    Active = True
    Connection = DataAccessModule.FDConnection1
    UpdateOptions.AutoIncFields = 'CP_SEQ'
    SQL.Strings = (
      'SELECT * FROM CP')
    Left = 448
    Top = 272
    object qryCPCP_SEQ: TIntegerField
      DisplayLabel = #51068#47144#48264#54840
      DisplayWidth = 8
      FieldName = 'CP_SEQ'
      Origin = 'CP_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCPCP_NAME: TStringField
      DisplayLabel = #50629#52404' '#47749
      DisplayWidth = 16
      FieldName = 'CP_NAME'
      Origin = 'CP_NAME'
      Size = 30
    end
    object qryCPCP_PHONE: TStringField
      DisplayLabel = #50629#52404' '#51204#54868#48264#54840
      FieldName = 'CP_PHONE'
      Origin = 'CP_PHONE'
      Size = 15
    end
    object qryCPCP_ADDRESS: TStringField
      DisplayLabel = #50629#52404' '#51452#49548
      DisplayWidth = 60
      FieldName = 'CP_ADDRESS'
      Origin = 'CP_ADDRESS'
      Size = 300
    end
  end
end
