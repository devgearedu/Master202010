object frmMainLeft: TfrmMainLeft
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 779
  ClientWidth = 330
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
  object lblClock: TLabel
    Left = 32
    Top = 32
    Width = 69
    Height = 25
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tmrNow: TTimer
    OnTimer = tmrNowTimer
    Left = 216
    Top = 144
  end
end
