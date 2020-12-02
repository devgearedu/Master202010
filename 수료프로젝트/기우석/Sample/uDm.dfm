object dm: Tdm
  OldCreateOrder = False
  Height = 345
  Width = 483
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SSample')
    Connected = True
    Left = 72
    Top = 56
  end
  object MenuSource: TDataSource
    Left = 168
    Top = 136
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM MENUS')
    Left = 80
    Top = 136
  end
end
