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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 859
    Height = 474
    Align = alClient
    DataSource = dsSalesReport
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cafecode'
        Title.Caption = #51648#51216#53076#46300
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'slipno'
        Title.Caption = #51204#54364#48264#54840
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'seq'
        Title.Caption = #51068#47144#48264#54840
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sdate'
        Title.Caption = #44208#51228#51068
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stime'
        Title.Caption = #44208#51228#49884#44036
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'posno'
        Title.Caption = 'pos'#48264#54840
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'saleprice'
        Title.Caption = #54032#47588#44552#50529
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vat'
        Title.Caption = #48512#44032#49464
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales'
        Title.Caption = #44552#50529
        Width = 62
        Visible = True
      end>
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
    object btnSearch: TButton
      Left = 304
      Top = 10
      Width = 81
      Height = 41
      Caption = #51312#54924
      TabOrder = 1
      OnClick = btnSearchClick
    end
  end
  object dsSalesReport: TDataSource
    DataSet = posDM.cdsSalesReport
    Left = 584
    Top = 8
  end
end
