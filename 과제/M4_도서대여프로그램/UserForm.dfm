object FormUser: TFormUser
  Left = 0
  Top = 0
  Caption = #54924#50896' '#44288#47532
  ClientHeight = 572
  ClientWidth = 929
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
    Width = 929
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 96
    ExplicitWidth = 185
    DesignSize = (
      929
      41)
    object LabelCaption: TLabel
      Left = 16
      Top = 14
      Width = 52
      Height = 18
      Caption = #54924#50896#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonAdd: TButton
      Left = 759
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49888#44508' '#46321#47197
      TabOrder = 0
      OnClick = ButtonAddClick
      ExplicitLeft = 727
    end
    object ButtonClose: TButton
      Left = 840
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      ExplicitLeft = 808
    end
  end
  object PanelContent: TPanel
    Left = 0
    Top = 41
    Width = 929
    Height = 531
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 312
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Splitter1: TSplitter
      Left = 559
      Top = 1
      Height = 529
      Align = alRight
      ExplicitLeft = 464
      ExplicitTop = 216
      ExplicitHeight = 100
    end
    object PanelGrid: TPanel
      Left = 1
      Top = 1
      Width = 558
      Height = 529
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 660
      object PanelGridHeader: TPanel
        Left = 1
        Top = 1
        Width = 556
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 216
        ExplicitTop = 224
        ExplicitWidth = 185
        object Label1: TLabel
          Left = 14
          Top = 14
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object EditSearch: TEdit
          Left = 46
          Top = 10
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyUp = EditSearchKeyUp
        end
        object CheckBoxSearchName: TCheckBox
          Left = 184
          Top = 12
          Width = 57
          Height = 17
          Caption = #51060#47492
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxSearchPhone: TCheckBox
          Left = 264
          Top = 12
          Width = 89
          Height = 17
          Caption = #51204#54868#48264#54840
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object DBGridList: TDBGrid
        Left = 1
        Top = 42
        Width = 556
        Height = 486
        Align = alClient
        DataSource = DataSourceUser
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
            FieldName = 'USER_NAME'
            Title.Caption = #51060#47492
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_BIRTH'
            Title.Caption = #49373#45380#50900#51068
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_SEX_STR'
            Title.Caption = #49457#48324
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_PHONE'
            Title.Caption = #51204#54868#48264#54840
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_MAIL'
            Title.Caption = #47700#51068#51452#49548
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_REG_DATE'
            Title.Caption = #46321#47197#51068#49884
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_OUT'
            Title.Caption = #53448#53748#50668#48512
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_OUT_DATE'
            Title.Caption = #53448#53748#51068#49884
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_RENT_COUNT'
            Title.Caption = #45824#50668#44428#49688
            Visible = True
          end>
      end
    end
    object PanelInput: TPanel
      Left = 562
      Top = 1
      Width = 366
      Height = 529
      Align = alRight
      TabOrder = 1
      DesignSize = (
        366
        529)
      object Label2: TLabel
        Left = 17
        Top = 14
        Width = 22
        Height = 13
        Caption = #51060#47492
      end
      object Label3: TLabel
        Left = 17
        Top = 70
        Width = 44
        Height = 13
        Caption = #49373#45380#50900#51068
      end
      object Label4: TLabel
        Left = 17
        Top = 198
        Width = 44
        Height = 13
        Caption = #51204#54868#48264#54840
      end
      object Label5: TLabel
        Left = 17
        Top = 254
        Width = 44
        Height = 13
        Caption = #47700#51068#51452#49548
      end
      object DBEditName: TDBEdit
        Left = 16
        Top = 33
        Width = 152
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_NAME'
        DataSource = DataSourceUser
        TabOrder = 0
        OnExit = DBEditNameExit
        ExplicitWidth = 154
      end
      object DBRadioGroupSex: TDBRadioGroup
        Left = 16
        Top = 142
        Width = 152
        Height = 35
        Anchors = [akLeft, akTop, akRight]
        Caption = #49457#48324
        Columns = 2
        DataField = 'USER_SEX'
        DataSource = DataSourceUser
        Items.Strings = (
          #45224
          #50668)
        TabOrder = 1
        Values.Strings = (
          'M'
          'F')
        ExplicitWidth = 154
      end
      object DBEditPhone: TDBEdit
        Left = 16
        Top = 217
        Width = 152
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_PHONE'
        DataSource = DataSourceUser
        TabOrder = 2
        ExplicitWidth = 154
      end
      object DBEditMail: TDBEdit
        Left = 16
        Top = 273
        Width = 151
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_MAIL'
        DataSource = DataSourceUser
        TabOrder = 3
        ExplicitWidth = 153
      end
      object GroupBox1: TGroupBox
        Left = 174
        Top = 15
        Width = 185
        Height = 206
        Anchors = [akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 176
        object ImageUser: TImage
          Left = 2
          Top = 15
          Width = 181
          Height = 189
          Align = alClient
          Proportional = True
          Stretch = True
          ExplicitLeft = 40
          ExplicitTop = 48
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
      end
      object ButtonClearImage: TButton
        Left = 174
        Top = 249
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52488#44592#54868
        TabOrder = 5
        OnClick = ButtonClearImageClick
        ExplicitLeft = 176
      end
      object ButtonLoadImage: TButton
        Left = 255
        Top = 249
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #48520#47084#50724#44592
        TabOrder = 6
        OnClick = ButtonLoadImageClick
        ExplicitLeft = 257
      end
      object ButtonDelete: TButton
        Left = 16
        Top = 320
        Width = 75
        Height = 25
        Caption = #54924#50896' '#53448#53748
        TabOrder = 7
        OnClick = ButtonDeleteClick
      end
      object ButtonSave: TButton
        Left = 175
        Top = 320
        Width = 75
        Height = 25
        Caption = #51200#51109
        TabOrder = 8
        OnClick = ButtonSaveClick
      end
      object ButtonCancel: TButton
        Left = 256
        Top = 320
        Width = 75
        Height = 25
        Caption = #52712#49548
        TabOrder = 9
        OnClick = ButtonCancelClick
      end
      object CalendarPickerBirth: TCalendarPicker
        Left = 16
        Top = 89
        Width = 152
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
        CalendarHeaderInfo.DaysOfWeekFont.Height = -13
        CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        CalendarHeaderInfo.DaysOfWeekFont.Style = []
        CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.Font.Color = clWindowText
        CalendarHeaderInfo.Font.Height = -20
        CalendarHeaderInfo.Font.Name = 'Segoe UI'
        CalendarHeaderInfo.Font.Style = []
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        OnCloseUp = CalendarPickerBirthCloseUp
        ParentFont = False
        TabOrder = 10
        TextHint = 'select a date'
      end
    end
  end
  object OpenDialogLoadImage: TOpenDialog
    Left = 808
    Top = 144
  end
  object DataSourceUser: TDataSource
    DataSet = DataModuleDataAccess.FDQueryUser
    OnStateChange = DataSourceUserStateChange
    OnDataChange = DataSourceUserDataChange
    Left = 400
    Top = 352
  end
end
