object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 541
  Width = 1119
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=dbmarek'
      'User_Name=marek'
      'Password=gixugo#!#59'
      'Server=db.dvr.raintin.co.kr'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 56
  end
  object qryAddCafe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into cafe (cafecode, cafename, phone, cafemenu)'
      'values (:cafecode, :cafename, :phone, :cafemenu);')
    Left = 64
    Top = 144
    ParamData = <
      item
        Name = 'CAFECODE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAFENAME'
        ParamType = ptInput
      end
      item
        Name = 'PHONE'
        ParamType = ptInput
      end
      item
        Name = 'CAFEMENU'
        ParamType = ptInput
      end>
  end
  object qryAddEmp: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'insert into staff (empcode, empdate, id, password, position, caf' +
        'ecode, nyear, nseq, sname)'
      
        'values (:empcode, :empdate, :id, :password, :position, :cafecode' +
        ', :nyear, :nseq, :sname)')
    Left = 160
    Top = 144
    ParamData = <
      item
        Name = 'EMPCODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPDATE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'POSITION'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAFECODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NYEAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NSEQ'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SNAME'
        ParamType = ptInput
      end>
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Dev\Delph\'#44060#51064' '#54532#47196#51229#53944'\Server\Win32\Debug\libmysql.dll'
    Left = 160
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 272
    Top = 56
  end
  object qryCafeseq: TFDQuery
    Connection = FDConnection1
    Left = 64
    Top = 216
  end
  object qryEmpseq: TFDQuery
    Connection = FDConnection1
    Left = 160
    Top = 216
  end
  object qryGetCafelist: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select cafecode, cafename from cafe '
      'order by cafecode;')
    Left = 272
    Top = 144
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qryCafe
    Left = 160
    Top = 360
  end
  object tbStaff: TFDTable
    IndexFieldNames = 'empcode'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'dbmarek.staff'
    TableName = 'dbmarek.staff'
    Left = 64
    Top = 448
    object tbStaffempcode: TWideStringField
      FieldName = 'empcode'
      Origin = 'empcode'
      Required = True
      Size = 7
    end
    object tbStaffempdate: TWideStringField
      FieldName = 'empdate'
      Origin = 'empdate'
      Required = True
      Size = 8
    end
    object tbStaffid: TWideStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
      Size = 10
    end
    object tbStaffpassword: TWideStringField
      FieldName = 'password'
      Origin = '`password`'
      Required = True
      Size = 200
    end
    object tbStaffposition: TWideStringField
      DisplayWidth = 1
      FieldName = 'position'
      Origin = 'position'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbStaffcafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tbStaffnyear: TIntegerField
      FieldName = 'nyear'
      Origin = 'nyear'
      Required = True
    end
    object tbStaffnseq: TIntegerField
      FieldName = 'nseq'
      Origin = 'nseq'
      Required = True
    end
    object tbStaffsname: TWideStringField
      FieldName = 'sname'
      Origin = 'sname'
      Required = True
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = tbStaff
    Left = 160
    Top = 448
  end
  object qryCafe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select A.cafecode, A.cafename, A.phone, ifnull(B.position, '#39#39') a' +
        's pposition, B.sname from cafe as A'#10
      'left join staff as B'
      #10'on B.cafecode = A.cafecode and B.position = '#39'1'#39
      'order by A.cafecode;')
    Left = 64
    Top = 360
    object qryCafecafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryCafecafename: TWideStringField
      FieldName = 'cafename'
      Origin = 'cafename'
      Required = True
      Size = 100
    end
    object qryCafephone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
      Required = True
    end
    object qryCafepposition: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'pposition'
      Origin = 'pposition'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qryCafesname: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'sname'
      Origin = 'sname'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryUpdatecafe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update cafe set cafename = :cafename, phone = :phone '
      'where cafecode = :cafecode')
    Left = 248
    Top = 360
    ParamData = <
      item
        Name = 'CAFENAME'
        ParamType = ptInput
      end
      item
        Name = 'PHONE'
        ParamType = ptInput
      end
      item
        Name = 'CAFECODE'
        ParamType = ptInput
      end>
  end
  object qrySelectMenu: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select cafemenu from cafe'
      'where cafecode = :cafecode;')
    Left = 536
    Top = 368
    ParamData = <
      item
        Name = 'CAFECODE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '03'
      end>
  end
end
