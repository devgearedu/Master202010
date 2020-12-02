object frmSort: TfrmSort
  Left = 0
  Top = 0
  Caption = 'Sorting program'
  ClientHeight = 448
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblBubbleSort: TLabel
    Left = 104
    Top = 144
    Width = 90
    Height = 19
    Caption = 'BubbleSort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSelectionSort: TLabel
    Left = 329
    Top = 144
    Width = 109
    Height = 19
    Caption = 'SelectionSort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblResult: TLabel
    Left = 553
    Top = 144
    Width = 52
    Height = 19
    Caption = 'Result'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BubbleSort_ListBox: TListBox
    Left = 104
    Top = 184
    Width = 118
    Height = 201
    ItemHeight = 13
    TabOrder = 0
  end
  object SelectionSort_ListBox: TListBox
    Left = 329
    Top = 184
    Width = 118
    Height = 201
    ItemHeight = 13
    TabOrder = 1
  end
  object Result_ListBox: TListBox
    Left = 553
    Top = 184
    Width = 118
    Height = 201
    ItemHeight = 13
    TabOrder = 2
  end
  object btnStart: TButton
    Left = 312
    Top = 32
    Width = 153
    Height = 73
    Caption = 'Srart'
    TabOrder = 3
    OnClick = btnStartClick
  end
end
