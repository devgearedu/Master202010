object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = #47196#44536#51064
  ClientHeight = 182
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 102
    Top = 42
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
    Left = 75
    Top = 82
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
    Left = 75
    Top = 135
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
    Left = 166
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtPW: TEdit
    Left = 166
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtPWKeyPress
  end
  object btnLogin: TButton
    Left = 312
    Top = 38
    Width = 85
    Height = 63
    Caption = #47196#44536#51064
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoginClick
  end
end
