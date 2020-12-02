object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = #47196#44536#51064#52285
  ClientHeight = 210
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 97
    Top = 58
    Width = 19
    Height = 19
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPW: TLabel
    Left = 81
    Top = 98
    Width = 78
    Height = 19
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 87
    Top = 152
    Width = 309
    Height = 13
    Caption = #10004' '#50500#51060#46356' '#48143' '#48708#48128#48264#54840#47484' '#51082#50612#48260#47160#51012' '#49884' '#44288#44228#51088#50640#44172' '#47928#51032#54616#49464#50836
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtID: TEdit
    Left = 169
    Top = 55
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtPW: TEdit
    Left = 169
    Top = 100
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtPWKeyPress
  end
  object btnLogin: TButton
    Left = 326
    Top = 54
    Width = 80
    Height = 67
    Caption = #47196#44536#51064
    TabOrder = 2
    OnClick = btnLoginClick
  end
end
