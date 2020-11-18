object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 320
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    513
    320)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 184
    Width = 32
    Height = 24
    Caption = #47700#45684
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 8
    Width = 450
    Height = 145
    Anchors = [akLeft, akTop, akRight]
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 208
    Top = 264
    Width = 121
    Height = 33
    Caption = #51200#51109
    TabOrder = 1
  end
  object Button2: TButton
    Left = 361
    Top = 264
    Width = 121
    Height = 33
    Caption = #52712#49548
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 232
    Top = 184
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 272
    Top = 56
  end
  object FDQuery1: TFDQuery
    Left = 368
    Top = 72
  end
end
