object frmCafeSales: TfrmCafeSales
  Left = 0
  Top = 0
  Caption = #51648#51216#48324' '#54788#54889
  ClientHeight = 467
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 57
    Align = alTop
    TabOrder = 0
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 57
    Width = 650
    Height = 410
    Title.Text.Strings = (
      'TDBChart')
    Align = alClient
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 6
    object Series1: TBarSeries
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'saleprice'
    end
  end
  object DataSource1: TDataSource
    Left = 592
    Top = 8
  end
end
