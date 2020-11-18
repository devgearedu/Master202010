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
  object Menu: TFDTable
    Connection = FDConnection1
    Left = 72
    Top = 136
  end
  object MenuSource: TDataSource
    DataSet = Menu
    Left = 168
    Top = 136
  end
end
