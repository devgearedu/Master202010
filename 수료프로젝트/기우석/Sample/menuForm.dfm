object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = #47700#45684#54268
  ClientHeight = 448
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    601
    448)
  PixelsPerInch = 96
  TextHeight = 13
  object lblMenuName: TLabel
    Left = 195
    Top = 278
    Width = 33
    Height = 13
    Anchors = [akBottom]
    Caption = #47700#45684#47749
    ExplicitLeft = 208
    ExplicitTop = 259
  end
  object dgMenu: TDBGrid
    Left = 16
    Top = 24
    Width = 567
    Height = 220
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnAdd: TButton
    Left = 57
    Top = 368
    Width = 113
    Height = 49
    Anchors = [akLeft, akBottom]
    Caption = #52628#44032
    TabOrder = 1
    ExplicitTop = 336
  end
  object btnSave: TButton
    Left = 310
    Top = 368
    Width = 113
    Height = 49
    Anchors = [akRight, akBottom]
    Caption = #51200#51109
    TabOrder = 2
    ExplicitLeft = 320
    ExplicitTop = 336
  end
  object btnCancel: TButton
    Left = 458
    Top = 368
    Width = 113
    Height = 49
    Anchors = [akRight, akBottom]
    Caption = #52712#49548
    TabOrder = 3
    ExplicitLeft = 464
    ExplicitTop = 336
  end
  object DBEdit1: TDBEdit
    Left = 275
    Top = 275
    Width = 121
    Height = 21
    Anchors = [akBottom]
    TabOrder = 4
    ExplicitLeft = 296
    ExplicitTop = 256
  end
end
