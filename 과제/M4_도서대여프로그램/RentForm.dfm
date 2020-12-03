object FormRent: TFormRent
  Left = 0
  Top = 0
  Caption = #46020#49436#45824#50668' '#54868#47732
  ClientHeight = 550
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelHeader: TPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 328
    ExplicitTop = 144
    ExplicitWidth = 185
    DesignSize = (
      838
      41)
    object LabelCaption: TLabel
      Left = 24
      Top = 14
      Width = 47
      Height = 13
      Caption = #46020#49436' '#45824#50668
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonClose: TButton
      Left = 728
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 0
      OnClick = ButtonCloseClick
    end
    object ButtonAdd: TButton
      Left = 647
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49352' '#45824#52636
      TabOrder = 1
      OnClick = ButtonAddClick
    end
  end
  object PanelContent: TPanel
    Left = 0
    Top = 41
    Width = 838
    Height = 509
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Splitter1: TSplitter
      Left = 565
      Top = 1
      Height = 507
      Align = alRight
      ExplicitLeft = 264
      ExplicitTop = 224
      ExplicitHeight = 100
    end
    object PanelGrid: TPanel
      Left = 1
      Top = 1
      Width = 564
      Height = 507
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 56
      ExplicitTop = 200
      ExplicitWidth = 185
      ExplicitHeight = 41
      object PanelGridHeader: TPanel
        Left = 1
        Top = 1
        Width = 562
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 216
        ExplicitTop = 80
        ExplicitWidth = 185
        object Label1: TLabel
          Left = 17
          Top = 15
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object EditSearch: TEdit
          Left = 56
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyUp = EditSearchKeyUp
        end
        object CheckBoxSearchBook: TCheckBox
          Left = 191
          Top = 14
          Width = 82
          Height = 17
          Caption = #46020#49436' '#51228#47785
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxSearchUser: TCheckBox
          Left = 279
          Top = 14
          Width = 97
          Height = 17
          Caption = #54924#50896#47749
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object DBGridList: TDBGrid
        Left = 1
        Top = 42
        Width = 562
        Height = 464
        Align = alClient
        DataSource = DataSourceRent
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'BOOK_TITLE'
            Title.Caption = #46020#49436' '#51228#47785
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_NAME'
            Title.Caption = #54924#50896#47749
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENT_DATE'
            Title.Caption = #45824#50668' '#51068#51088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENT_RETURN_DATE'
            Title.Caption = #48152#45225' '#50696#51221#51068
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENT_RETURN'
            Title.Caption = #45824#50668' '#50668#48512
            Visible = True
          end>
      end
    end
    object PanelInput: TPanel
      Left = 568
      Top = 1
      Width = 269
      Height = 507
      Align = alRight
      TabOrder = 1
      ExplicitHeight = 477
      DesignSize = (
        269
        507)
      object GroupBoxUser: TGroupBox
        Left = 6
        Top = 5
        Width = 251
        Height = 228
        Anchors = [akLeft, akTop, akRight]
        Caption = #54924#50896' '#51221#48372
        TabOrder = 0
        DesignSize = (
          251
          228)
        object Label2: TLabel
          Left = 137
          Top = 68
          Width = 22
          Height = 13
          Caption = #51060#47492
        end
        object Label3: TLabel
          Left = 137
          Top = 116
          Width = 44
          Height = 13
          Caption = #49373#45380#50900#51068
        end
        object Label4: TLabel
          Left = 137
          Top = 164
          Width = 33
          Height = 13
          Caption = #50672#46973#52376
        end
        object ButtonFindUser: TButton
          Left = 11
          Top = 22
          Width = 214
          Height = 25
          Caption = #54924#50896' '#44160#49353
          TabOrder = 0
          OnClick = ButtonFindUserClick
        end
        object GroupBox1: TGroupBox
          Left = 10
          Top = 53
          Width = 121
          Height = 148
          TabOrder = 1
          object ImageUser: TImage
            Left = 2
            Top = 15
            Width = 117
            Height = 131
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 4
          end
        end
        object DBEditUserName: TDBEdit
          Left = 137
          Top = 87
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'USER_NAME'
          DataSource = DataSourceRentUser
          TabOrder = 2
        end
        object DBEditUserBirth: TDBEdit
          Left = 137
          Top = 135
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'USER_BIRTH'
          DataSource = DataSourceRentUser
          TabOrder = 3
        end
        object DBEditUserPhone: TDBEdit
          Left = 137
          Top = 183
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'USER_PHONE'
          DataSource = DataSourceRentUser
          TabOrder = 4
        end
      end
      object GroupBoxBook: TGroupBox
        Left = 6
        Top = 239
        Width = 251
        Height = 217
        Anchors = [akLeft, akTop, akRight]
        Caption = #46020#49436' '#51221#48372
        TabOrder = 1
        DesignSize = (
          251
          217)
        object Label5: TLabel
          Left = 137
          Top = 68
          Width = 22
          Height = 13
          Caption = #51228#47785
        end
        object Label6: TLabel
          Left = 137
          Top = 116
          Width = 22
          Height = 13
          Caption = #51200#51088
        end
        object Label7: TLabel
          Left = 137
          Top = 164
          Width = 22
          Height = 13
          Caption = #44032#44201
        end
        object ButtonFindBook: TButton
          Left = 11
          Top = 22
          Width = 214
          Height = 25
          Caption = #46020#49436' '#44160#49353
          TabOrder = 0
          OnClick = ButtonFindBookClick
        end
        object GroupBox3: TGroupBox
          Left = 10
          Top = 53
          Width = 121
          Height = 148
          TabOrder = 1
          object ImageBook: TImage
            Left = 2
            Top = 15
            Width = 117
            Height = 131
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 4
          end
        end
        object DBEditBookTitle: TDBEdit
          Left = 137
          Top = 87
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BOOK_TITLE'
          DataSource = DataSourceRentBook
          TabOrder = 2
        end
        object DBEditBookAuthor: TDBEdit
          Left = 137
          Top = 135
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BOOK_AUTHOR'
          DataSource = DataSourceRentBook
          TabOrder = 3
        end
        object DBEditBookPrice: TDBEdit
          Left = 137
          Top = 180
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BOOK_PRICE'
          DataSource = DataSourceRentBook
          TabOrder = 4
        end
      end
      object ButtonRent: TButton
        Left = 6
        Top = 462
        Width = 75
        Height = 25
        Caption = #45824#52636
        TabOrder = 2
        OnClick = ButtonRentClick
      end
      object ButtonReturn: TButton
        Left = 87
        Top = 462
        Width = 75
        Height = 25
        Caption = #48152#45225
        TabOrder = 3
        OnClick = ButtonReturnClick
      end
      object ButtonCancel: TButton
        Left = 184
        Top = 462
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52712#49548
        TabOrder = 4
        OnClick = ButtonCancelClick
      end
    end
  end
  object DataSourceRent: TDataSource
    DataSet = DataModuleDataAccess.FDQueryRent
    OnStateChange = DataSourceRentStateChange
    Left = 416
    Top = 280
  end
  object DataSourceRentUser: TDataSource
    DataSet = DataModuleDataAccess.FDQueryRentUser
    OnDataChange = DataSourceRentUserDataChange
    Left = 632
    Top = 168
  end
  object DataSourceRentBook: TDataSource
    DataSet = DataModuleDataAccess.FDQueryRentBook
    OnDataChange = DataSourceRentBookDataChange
    Left = 632
    Top = 400
  end
end
