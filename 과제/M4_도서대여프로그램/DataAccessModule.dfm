object DataModuleDataAccess: TDataModuleDataAccess
  OldCreateOrder = False
  Height = 432
  Width = 616
  object FDConnectionBookRental: TFDConnection
    Params.Strings = (
      'Database=C:\delphiproject\HomeWork\M4\DB\BOOKRENTAL.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnectionBookRentalBeforeConnect
    Left = 88
    Top = 224
  end
  object FDQueryBook: TFDQuery
    Active = True
    OnCalcFields = FDQueryBookCalcFields
    Connection = FDConnectionBookRental
    UpdateOptions.AutoIncFields = 'BOOK_SEQ'
    SQL.Strings = (
      'select * from book')
    Left = 80
    Top = 312
    object FDQueryBookBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryBookBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      Required = True
      Size = 400
    end
    object FDQueryBookBOOK_ISBN: TStringField
      FieldName = 'BOOK_ISBN'
      Origin = 'BOOK_ISBN'
      FixedChar = True
      Size = 13
    end
    object FDQueryBookBOOK_AUTHOR: TWideStringField
      FieldName = 'BOOK_AUTHOR'
      Origin = 'BOOK_AUTHOR'
      Required = True
      Size = 120
    end
    object FDQueryBookBOOK_PRICE: TIntegerField
      FieldName = 'BOOK_PRICE'
      Origin = 'BOOK_PRICE'
      DisplayFormat = '#,##0'
    end
    object FDQueryBookBOOK_LINK: TWideStringField
      FieldName = 'BOOK_LINK'
      Origin = 'BOOK_LINK'
      Size = 1020
    end
    object FDQueryBookBOOK_RENT_YN: TStringField
      FieldName = 'BOOK_RENT_YN'
      Origin = 'BOOK_RENT_YN'
      FixedChar = True
      Size = 1
    end
    object FDQueryBookBOOK_IMAGE: TBlobField
      FieldName = 'BOOK_IMAGE'
      Origin = 'BOOK_IMAGE'
    end
    object FDQueryBookBOOK_DESCRIPTION: TWideMemoField
      FieldName = 'BOOK_DESCRIPTION'
      Origin = 'BOOK_DESCRIPTION'
      BlobType = ftWideMemo
    end
    object FDQueryBookBOOK_RENT: TStringField
      FieldKind = fkCalculated
      FieldName = 'BOOK_RENT'
      Calculated = True
    end
  end
  object FDQueryDuplicatedBook: TFDQuery
    Active = True
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'SELECT BOOK_SEQ FROM BOOK WHERE BOOK_ISBN = :ISBN')
    Left = 192
    Top = 312
    ParamData = <
      item
        Name = 'ISBN'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 13
      end>
  end
  object FDQueryUser: TFDQuery
    Active = True
    OnCalcFields = FDQueryUserCalcFields
    Connection = FDConnectionBookRental
    UpdateOptions.AutoIncFields = 'USER_SEQ'
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 328
    Top = 312
    object FDQueryUserUSER_SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryUserUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 120
    end
    object FDQueryUserUSER_BIRTH: TDateField
      FieldName = 'USER_BIRTH'
      Origin = 'USER_BIRTH'
    end
    object FDQueryUserUSER_SEX: TStringField
      FieldName = 'USER_SEX'
      Origin = 'USER_SEX'
      FixedChar = True
      Size = 1
    end
    object FDQueryUserUSER_PHONE: TStringField
      FieldName = 'USER_PHONE'
      Origin = 'USER_PHONE'
      Size = 15
    end
    object FDQueryUserUSER_MAIL: TWideStringField
      FieldName = 'USER_MAIL'
      Origin = 'USER_MAIL'
      Size = 1020
    end
    object FDQueryUserUSER_IMAGE: TBlobField
      FieldName = 'USER_IMAGE'
      Origin = 'USER_IMAGE'
    end
    object FDQueryUserUSER_REG_DATE: TDateField
      FieldName = 'USER_REG_DATE'
      Origin = 'USER_REG_DATE'
    end
    object FDQueryUserUSER_OUT_YN: TStringField
      FieldName = 'USER_OUT_YN'
      Origin = 'USER_OUT_YN'
      FixedChar = True
      Size = 1
    end
    object FDQueryUserUSER_OUT_DATE: TDateField
      FieldName = 'USER_OUT_DATE'
      Origin = 'USER_OUT_DATE'
    end
    object FDQueryUserUSER_RENT_COUNT: TIntegerField
      FieldName = 'USER_RENT_COUNT'
      Origin = 'USER_RENT_COUNT'
    end
    object FDQueryUserUSER_SEX_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_SEX_STR'
      Calculated = True
    end
    object FDQueryUserUSER_OUT: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_OUT'
      Calculated = True
    end
  end
  object FDQueryDuplicatedUser: TFDQuery
    Active = True
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'SELECT USER_SEQ FROM USERS'
      'WHERE USER_NAME = :NAME AND USER_BIRTH = :BIRTH')
    Left = 432
    Top = 312
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 120
        Value = Null
      end
      item
        Name = 'BIRTH'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FDQueryRent: TFDQuery
    Active = True
    OnCalcFields = FDQueryRentCalcFields
    Connection = FDConnectionBookRental
    UpdateOptions.AutoIncFields = 'RENT_SEQ'
    UpdateObject = FDUpdateSQLRent
    SQL.Strings = (
      'SELECT BOOK.BOOK_TITLE, USERS.USER_NAME, RENT.*'
      'FROM RENT, BOOK, USERS'
      'WHERE'
      ' RENT.BOOK_SEQ = BOOK.BOOK_SEQ AND'
      ' RENT.USER_SEQ = USERS.USER_SEQ')
    Left = 328
    Top = 32
    object FDQueryRentBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'RENT_RETURN_YN'
      ReadOnly = True
      Size = 400
    end
    object FDQueryRentUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      ReadOnly = True
      Size = 120
    end
    object FDQueryRentRENT_SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'RENT_SEQ'
      Origin = 'RENT_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryRentUSER_SEQ: TIntegerField
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      Required = True
    end
    object FDQueryRentBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      Required = True
    end
    object FDQueryRentRENT_DATE: TDateField
      FieldName = 'RENT_DATE'
      Origin = 'RENT_DATE'
    end
    object FDQueryRentRENT_RETURN_DATE: TDateField
      FieldName = 'RENT_RETURN_DATE'
      Origin = 'RENT_RETURN_DATE'
    end
    object FDQueryRentRENT_RETURN_YN: TStringField
      FieldName = 'RENT_RETURN_YN'
      Origin = 'RENT_RETURN_YN'
      FixedChar = True
      Size = 1
    end
    object FDQueryRentRENT_RETURN: TStringField
      FieldKind = fkCalculated
      FieldName = 'RENT_RETURN'
      Calculated = True
    end
  end
  object FDQueryRentBook: TFDQuery
    Active = True
    IndexFieldNames = 'BOOK_SEQ'
    MasterSource = DataSourceRent
    MasterFields = 'BOOK_SEQ'
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'SELECT * from book')
    Left = 328
    Top = 112
    object FDQueryRentBookBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryRentBookBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      Required = True
      Size = 400
    end
    object FDQueryRentBookBOOK_ISBN: TStringField
      FieldName = 'BOOK_ISBN'
      Origin = 'BOOK_ISBN'
      FixedChar = True
      Size = 13
    end
    object FDQueryRentBookBOOK_AUTHOR: TWideStringField
      FieldName = 'BOOK_AUTHOR'
      Origin = 'BOOK_AUTHOR'
      Required = True
      Size = 120
    end
    object FDQueryRentBookBOOK_PRICE: TIntegerField
      FieldName = 'BOOK_PRICE'
      Origin = 'BOOK_PRICE'
      DisplayFormat = '#,##0'
    end
    object FDQueryRentBookBOOK_LINK: TWideStringField
      FieldName = 'BOOK_LINK'
      Origin = 'BOOK_LINK'
      Size = 1020
    end
    object FDQueryRentBookBOOK_RENT_YN: TStringField
      FieldName = 'BOOK_RENT_YN'
      Origin = 'BOOK_RENT_YN'
      FixedChar = True
      Size = 1
    end
    object FDQueryRentBookBOOK_IMAGE: TBlobField
      FieldName = 'BOOK_IMAGE'
      Origin = 'BOOK_IMAGE'
    end
    object FDQueryRentBookBOOK_DESCRIPTION: TWideMemoField
      FieldName = 'BOOK_DESCRIPTION'
      Origin = 'BOOK_DESCRIPTION'
      BlobType = ftWideMemo
    end
  end
  object FDQueryRentUser: TFDQuery
    Active = True
    IndexFieldNames = 'USER_SEQ'
    MasterSource = DataSourceRent
    MasterFields = 'USER_SEQ'
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'select * from users')
    Left = 440
    Top = 120
  end
  object DataSourceRent: TDataSource
    DataSet = FDQueryRent
    Left = 432
    Top = 32
  end
  object FDUpdateSQLRent: TFDUpdateSQL
    Connection = FDConnectionBookRental
    InsertSQL.Strings = (
      'INSERT INTO RENT'
      '(RENT_SEQ, USER_SEQ, BOOK_SEQ, RENT_DATE, '
      '  RENT_RETURN_DATE, RENT_RETURN_YN)'
      
        'VALUES (:NEW_RENT_SEQ, :NEW_USER_SEQ, :NEW_BOOK_SEQ, :NEW_RENT_D' +
        'ATE, '
      '  :NEW_RENT_RETURN_DATE, :NEW_RENT_RETURN_YN)')
    ModifySQL.Strings = (
      'UPDATE RENT'
      
        'SET RENT_SEQ = :NEW_RENT_SEQ, USER_SEQ = :NEW_USER_SEQ, BOOK_SEQ' +
        ' = :NEW_BOOK_SEQ, '
      
        '  RENT_DATE = :NEW_RENT_DATE, RENT_RETURN_DATE = :NEW_RENT_RETUR' +
        'N_DATE, '
      '  RENT_RETURN_YN = :NEW_RENT_RETURN_YN'
      'WHERE RENT_SEQ = :OLD_RENT_SEQ')
    DeleteSQL.Strings = (
      'DELETE FROM RENT'
      'WHERE RENT_SEQ = :OLD_RENT_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT RENT_SEQ, USER_SEQ, BOOK_SEQ, RENT_DATE, RENT_RETURN_DATE' +
        ', RENT_RETURN_YN'
      'FROM RENT'
      'WHERE RENT_SEQ = :OLD_RENT_SEQ')
    Left = 536
    Top = 32
  end
  object FDQueryFindUser: TFDQuery
    Active = True
    OnCalcFields = FDQueryFindUserCalcFields
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'select * from users')
    Left = 320
    Top = 184
    object FDQueryFindUserUSER_SEQ: TIntegerField
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryFindUserUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 120
    end
    object FDQueryFindUserUSER_BIRTH: TDateField
      FieldName = 'USER_BIRTH'
      Origin = 'USER_BIRTH'
    end
    object FDQueryFindUserUSER_SEX: TStringField
      FieldName = 'USER_SEX'
      Origin = 'USER_SEX'
      FixedChar = True
      Size = 1
    end
    object FDQueryFindUserUSER_PHONE: TStringField
      FieldName = 'USER_PHONE'
      Origin = 'USER_PHONE'
      Size = 15
    end
    object FDQueryFindUserUSER_MAIL: TWideStringField
      FieldName = 'USER_MAIL'
      Origin = 'USER_MAIL'
      Size = 1020
    end
    object FDQueryFindUserUSER_IMAGE: TBlobField
      FieldName = 'USER_IMAGE'
      Origin = 'USER_IMAGE'
    end
    object FDQueryFindUserUSER_REG_DATE: TDateField
      FieldName = 'USER_REG_DATE'
      Origin = 'USER_REG_DATE'
    end
    object FDQueryFindUserUSER_OUT_YN: TStringField
      FieldName = 'USER_OUT_YN'
      Origin = 'USER_OUT_YN'
      FixedChar = True
      Size = 1
    end
    object FDQueryFindUserUSER_OUT_DATE: TDateField
      FieldName = 'USER_OUT_DATE'
      Origin = 'USER_OUT_DATE'
    end
    object FDQueryFindUserUSER_RENT_COUNT: TIntegerField
      FieldName = 'USER_RENT_COUNT'
      Origin = 'USER_RENT_COUNT'
    end
    object FDQueryFindUserUSER_SEX_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_SEX_STR'
      Calculated = True
    end
  end
  object FDQueryFindBook: TFDQuery
    Active = True
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'select * from book'
      'where BOOK_RENT_YN = '#39'N'#39)
    Left = 432
    Top = 184
    object FDQueryFindBookBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryFindBookBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      Required = True
      Size = 400
    end
    object FDQueryFindBookBOOK_ISBN: TStringField
      FieldName = 'BOOK_ISBN'
      Origin = 'BOOK_ISBN'
      FixedChar = True
      Size = 13
    end
    object FDQueryFindBookBOOK_AUTHOR: TWideStringField
      FieldName = 'BOOK_AUTHOR'
      Origin = 'BOOK_AUTHOR'
      Required = True
      Size = 120
    end
    object FDQueryFindBookBOOK_PRICE: TIntegerField
      FieldName = 'BOOK_PRICE'
      Origin = 'BOOK_PRICE'
      DisplayFormat = '#,##0'
    end
    object FDQueryFindBookBOOK_LINK: TWideStringField
      FieldName = 'BOOK_LINK'
      Origin = 'BOOK_LINK'
      Size = 1020
    end
    object FDQueryFindBookBOOK_RENT_YN: TStringField
      FieldName = 'BOOK_RENT_YN'
      Origin = 'BOOK_RENT_YN'
      FixedChar = True
      Size = 1
    end
    object FDQueryFindBookBOOK_IMAGE: TBlobField
      FieldName = 'BOOK_IMAGE'
      Origin = 'BOOK_IMAGE'
    end
    object FDQueryFindBookBOOK_DESCRIPTION: TWideMemoField
      FieldName = 'BOOK_DESCRIPTION'
      Origin = 'BOOK_DESCRIPTION'
      BlobType = ftWideMemo
    end
  end
  object FDQueryUpdateBookState: TFDQuery
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'UPDATE BOOK SET'
      'BOOK_RENT_YN = :RENT_YN'
      'WHERE BOOK_SEQ = :SEQ')
    Left = 72
    Top = 24
    ParamData = <
      item
        Name = 'RENT_YN'
        ParamType = ptInput
      end
      item
        Name = 'SEQ'
        ParamType = ptInput
      end>
  end
  object FDQueryUpdateUserRentCount: TFDQuery
    Connection = FDConnectionBookRental
    SQL.Strings = (
      'UPDATE USERS SET '
      
        'USER_RENT_COUNT = (SELECT COUNT(*) FROM RENT WHERE USER_SEQ = :S' +
        'EQ AND RENT_RETURN_YN = '#39'N'#39')'
      'WHERE USER_SEQ = :SEQ')
    Left = 72
    Top = 80
    ParamData = <
      item
        Name = 'SEQ'
        ParamType = ptInput
      end>
  end
end
