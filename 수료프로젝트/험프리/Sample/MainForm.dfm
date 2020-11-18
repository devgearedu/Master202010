object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #52852#54168
  ClientHeight = 413
  ClientWidth = 488
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
  object Button1: TButton
    Left = 48
    Top = 24
    Width = 145
    Height = 25
    Caption = #47700#45684#46321#47197
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 24
    Width = 153
    Height = 25
    Caption = #51648#51216#46321#47197
    TabOrder = 1
    OnClick = Button2Click
  end
  object cbxShops: TComboBox
    Left = 32
    Top = 104
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    OnChange = cbxShopsChange
  end
  object stgMenus: TStringGrid
    Left = 32
    Top = 131
    Width = 249
    Height = 238
    TabOrder = 3
  end
  object qryShopMenu: TFDQuery
    Connection = dmDatabase.FDConnection1
    SQL.Strings = (
      'SELECT SHOP_NAME, MENU_NAME FROM SHOPMENU, MENUS, SHOPS'
      'WHERE '
      '  SHOPMENU.SHOP_SEQ = SHOPS.SHOP_SEQ '
      '  AND SHOPMENU.MENU_SEQ = MENUS.MENU_SEQ'
      '  AND SHOPS.SHOP_NAME LIKE :PSHOP_NAME')
    Left = 56
    Top = 264
    ParamData = <
      item
        Name = 'PSHOP_NAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 200
        Value = Null
      end>
  end
  object qryShops: TFDQuery
    Connection = dmDatabase.FDConnection1
    SQL.Strings = (
      'SELECT * FROM SHOPS')
    Left = 48
    Top = 168
  end
end
