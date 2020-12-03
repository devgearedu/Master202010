object FormBook: TFormBook
  Left = 0
  Top = 0
  Caption = #46020#49436#44288#47532' '#54868#47732
  ClientHeight = 629
  ClientWidth = 970
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
    Width = 970
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 926
    DesignSize = (
      970
      41)
    object LabelCaption: TLabel
      Left = 24
      Top = 11
      Width = 56
      Height = 19
      Caption = #46020#49436#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonAdd: TButton
      Left = 785
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #52628#44032
      TabOrder = 0
      OnClick = ButtonAddClick
      ExplicitLeft = 741
    end
    object ButtonClose: TButton
      Left = 877
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      OnClick = ButtonCloseClick
      ExplicitLeft = 833
    end
  end
  object PanelContent: TPanel
    Left = 0
    Top = 41
    Width = 970
    Height = 588
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 528
    ExplicitTop = 408
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Splitter1: TSplitter
      Left = 553
      Top = 1
      Width = 2
      Height = 586
      Align = alRight
      ExplicitLeft = 552
      ExplicitHeight = 607
    end
    object PanelMain: TPanel
      Left = 1
      Top = 1
      Width = 552
      Height = 586
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 136
      ExplicitTop = 184
      ExplicitWidth = 185
      ExplicitHeight = 41
      object PanelMainHeader: TPanel
        Left = 1
        Top = 1
        Width = 550
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 184
        ExplicitTop = 328
        ExplicitWidth = 185
        object LabelSearch: TLabel
          Left = 22
          Top = 13
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object EditSearch: TEdit
          Left = 59
          Top = 10
          Width = 198
          Height = 21
          TabOrder = 0
          OnKeyUp = EditSearchKeyUp
        end
        object CheckBoxSearchTitle: TCheckBox
          Left = 273
          Top = 12
          Width = 56
          Height = 17
          Caption = #51228#47785
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxSearchAuthor: TCheckBox
          Left = 337
          Top = 12
          Width = 64
          Height = 17
          Caption = #51200#51088
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object DBGridBook: TDBGrid
        Left = 1
        Top = 42
        Width = 550
        Height = 543
        Align = alClient
        DataSource = DataSourceBook
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
            Title.Caption = #51228#47785
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_AUTHOR'
            Title.Caption = #51200#51088
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_PRICE'
            Title.Caption = #44032#44201
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_RENT'
            Title.Caption = #45824#50668#50668#48512
            Visible = True
          end>
      end
    end
    object PanelInput: TPanel
      Left = 555
      Top = 1
      Width = 414
      Height = 586
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 560
      ExplicitHeight = 607
      DesignSize = (
        414
        586)
      object Label1: TLabel
        Left = 24
        Top = 29
        Width = 22
        Height = 13
        Caption = #51228#47785
      end
      object Label2: TLabel
        Left = 24
        Top = 85
        Width = 23
        Height = 13
        Caption = 'ISBN'
      end
      object Label3: TLabel
        Left = 24
        Top = 141
        Width = 22
        Height = 13
        Caption = #51200#51088
      end
      object Label4: TLabel
        Left = 24
        Top = 197
        Width = 22
        Height = 13
        Caption = #44032#44201
      end
      object Label5: TLabel
        Left = 24
        Top = 254
        Width = 22
        Height = 13
        Caption = #47553#53356
      end
      object Label6: TLabel
        Left = 24
        Top = 320
        Width = 22
        Height = 13
        Caption = #49444#47749
      end
      object LabelLink: TLabel
        Left = 168
        Top = 254
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #48148#47196#44032#44592
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnClick = LabelLinkClick
      end
      object DBEditTitle: TDBEdit
        Left = 24
        Top = 48
        Width = 357
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_TITLE'
        DataSource = DataSourceBook
        TabOrder = 0
        ExplicitWidth = 233
      end
      object DBEditISBN: TDBEdit
        Left = 24
        Top = 104
        Width = 184
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_ISBN'
        DataSource = DataSourceBook
        TabOrder = 1
        OnExit = DBEditISBNExit
        ExplicitWidth = 134
      end
      object DBEditAuthor: TDBEdit
        Left = 24
        Top = 160
        Width = 184
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_AUTHOR'
        DataSource = DataSourceBook
        TabOrder = 2
        ExplicitWidth = 134
      end
      object DBEditPrice: TDBEdit
        Left = 24
        Top = 216
        Width = 184
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_PRICE'
        DataSource = DataSourceBook
        TabOrder = 3
        ExplicitWidth = 134
      end
      object DBEditLink: TDBEdit
        Left = 24
        Top = 273
        Width = 184
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_LINK'
        DataSource = DataSourceBook
        TabOrder = 4
        ExplicitWidth = 134
      end
      object ButtonImageClear: TButton
        Left = 224
        Top = 271
        Width = 77
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52488#44592#54868
        TabOrder = 5
        OnClick = ButtonImageClearClick
        ExplicitLeft = 179
      end
      object ButtonImageLoad: TButton
        Left = 305
        Top = 271
        Width = 77
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #48520#47084#50724#44592
        TabOrder = 6
        OnClick = ButtonImageLoadClick
        ExplicitLeft = 260
      end
      object DBMemoDescription: TDBMemo
        Left = 24
        Top = 339
        Width = 363
        Height = 198
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_DESCRIPTION'
        DataSource = DataSourceBook
        ScrollBars = ssVertical
        TabOrder = 7
        ExplicitWidth = 313
      end
      object ButtonDelete: TButton
        Left = 23
        Top = 543
        Width = 75
        Height = 25
        Caption = #49325#51228
        TabOrder = 8
        OnClick = ButtonDeleteClick
      end
      object ButtonSave: TButton
        Left = 231
        Top = 543
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #51200#51109
        TabOrder = 9
        OnClick = ButtonSaveClick
        ExplicitLeft = 179
      end
      object ButtonCancel: TButton
        Left = 314
        Top = 543
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52712#49548
        TabOrder = 10
        OnClick = ButtonCancelClick
        ExplicitLeft = 262
      end
      object GroupBox1: TGroupBox
        Left = 224
        Top = 85
        Width = 158
        Height = 180
        TabOrder = 11
        object ImageBook: TImage
          Left = 2
          Top = 15
          Width = 154
          Height = 163
          Align = alClient
          Proportional = True
          Stretch = True
          ExplicitLeft = 64
          ExplicitTop = 72
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
      end
    end
  end
  object DataSourceBook: TDataSource
    DataSet = DataModuleDataAccess.FDQueryBook
    OnStateChange = DataSourceBookStateChange
    OnDataChange = DataSourceBookDataChange
    Left = 416
    Top = 360
  end
  object OpenDialogLoadImage: TOpenDialog
    Left = 824
    Top = 208
  end
end
