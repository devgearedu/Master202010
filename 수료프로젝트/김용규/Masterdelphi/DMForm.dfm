object DataAccessModule: TDataAccessModule
  OldCreateOrder = False
  Height = 292
  Width = 337
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Masterdelphi\DB\REQUEST.IB'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 240
    Top = 32
  end
  object qryEMP: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMP')
    Left = 64
    Top = 120
  end
  object qryODER: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM ODER')
    Left = 208
    Top = 120
  end
end
