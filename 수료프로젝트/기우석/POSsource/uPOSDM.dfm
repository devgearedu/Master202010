object posDM: TposDM
  OldCreateOrder = False
  Height = 517
  Width = 668
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211')
    Connected = True
    Left = 96
    Top = 96
    UniqueId = '{1F2CC8EE-7380-4437-98B9-9930197257F3}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 232
    Top = 96
  end
  object cdsSalesReport: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cafecode'
        Attributes = [faRequired, faFixed]
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'slipno'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 12
      end
      item
        Name = 'seq'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'sdate'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 8
      end
      item
        Name = 'stime'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 6
      end
      item
        Name = 'posno'
        Attributes = [faRequired, faFixed]
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'saleprice'
        DataType = ftFloat
      end
      item
        Name = 'vat'
        DataType = ftFloat
      end
      item
        Name = 'sales'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'PRIMARY_KEY'
        Fields = 'cafecode;slipno'
        Options = [ixUnique]
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'cafecode;slipno'
    Params = <
      item
        DataType = ftString
        Name = 'CAFECODE'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'SDATE'
        ParamType = ptInput
        Value = '20201126'
      end>
    ProviderName = 'dspSalesReport'
    RemoteServer = DSProviderConnection1
    StoreDefs = True
    Left = 360
    Top = 96
  end
  object SqlServerMethod1: TSqlServerMethod
    Params = <>
    SQLConnection = SQLConnection1
    Left = 504
    Top = 96
  end
  object DSProviderConnection2: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 232
    Top = 192
  end
  object cdsCafeMenulist: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGetMenulist'
    RemoteServer = DSProviderConnection2
    Left = 360
    Top = 192
  end
  object DSProviderConnection3: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 240
    Top = 312
  end
  object cdsSavaSalesDetail: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CAFECODE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SLIPNO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEQ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MENUCODE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UNITPRICE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COUNT'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'MENUTOTAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspSaveSales_detail'
    RemoteServer = DSProviderConnection3
    Left = 360
    Top = 312
  end
end
