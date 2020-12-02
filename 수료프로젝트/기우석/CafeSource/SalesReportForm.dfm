object frmSalesReport: TfrmSalesReport
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 531
  ClientWidth = 859
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
    Top = 57
    Width = 859
    Height = 474
    Align = alClient
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
    Top = 0
    Width = 859
    Height = 57
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 33
      Top = 22
      Width = 44
      Height = 13
      Caption = #51312#54924#51068#51088
    end
    object DateTimePicker1: TDateTimePicker
      Left = 101
      Top = 17
      Width = 186
      Height = 21
      Date = 44156.799072002320000000
      Time = 44156.799072002320000000
      TabOrder = 0
    end
  end
end
