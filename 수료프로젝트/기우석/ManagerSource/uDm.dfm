object DM: TDM
  OldCreateOrder = False
  Height = 483
  Width = 779
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211')
    Connected = True
    Left = 80
    Top = 80
    UniqueId = '{B70B8C79-6A7D-40B7-A8A3-AF885C8EDE73}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 200
    Top = 80
  end
  object cdsUpdateCafe: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DatasetProvider1'
    RemoteServer = DSProviderConnection1
    Left = 312
    Top = 80
    object cdsUpdateCafecafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsUpdateCafecafename: TWideStringField
      FieldName = 'cafename'
      Origin = 'cafename'
      Required = True
      Size = 100
    end
    object cdsUpdateCafephone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
      Required = True
    end
    object cdsUpdateCafepposition: TWideStringField
      FieldName = 'pposition'
      Origin = 'pposition'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object cdsUpdateCafesname: TWideStringField
      FieldName = 'sname'
      Origin = 'sname'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object SqlServerMethod1: TSqlServerMethod
    Params = <>
    SQLConnection = SQLConnection1
    Left = 480
    Top = 80
  end
  object cdsUpdateStaff: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Name = 'FD__WN_EMPCODE'
        ParamType = ptInput
        Size = 7
        Value = '2020007'
      end>
    ProviderName = 'DataSetProvider2'
    RemoteServer = DSProviderConnection2
    OnCalcFields = cdsUpdateStaffCalcFields
    Left = 312
    Top = 168
    object cdsUpdateStaffempcode: TWideStringField
      FieldName = 'empcode'
      Origin = 'empcode'
      Required = True
      Size = 7
    end
    object cdsUpdateStaffempdate: TWideStringField
      FieldName = 'empdate'
      Origin = 'empdate'
      Required = True
      Size = 8
    end
    object cdsUpdateStaffid: TWideStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
      Size = 10
    end
    object cdsUpdateStaffpassword: TWideStringField
      FieldName = 'password'
      Origin = '`password`'
      Required = True
      Size = 200
    end
    object cdsUpdateStaffposition: TWideStringField
      DisplayWidth = 1
      FieldName = 'position'
      Origin = 'position'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsUpdateStaffcafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsUpdateStaffnyear: TIntegerField
      FieldName = 'nyear'
      Origin = 'nyear'
      Required = True
    end
    object cdsUpdateStaffnseq: TIntegerField
      FieldName = 'nseq'
      Origin = 'nseq'
      Required = True
    end
    object cdsUpdateStaffsname: TWideStringField
      FieldName = 'sname'
      Origin = 'sname'
      Required = True
    end
    object cdsUpdateStaffposition_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'position_name'
      Calculated = True
    end
  end
  object DSProviderConnection2: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 200
    Top = 168
  end
end
