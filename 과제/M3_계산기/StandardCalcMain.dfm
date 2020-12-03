object StandardCalcMainForm: TStandardCalcMainForm
  Left = 0
  Top = 0
  Caption = 'StandardCalcMainForm'
  ClientHeight = 420
  ClientWidth = 450
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 420
    Align = alClient
    TabOrder = 0
    object Image1: TImage
      Left = 6
      Top = 11
      Width = 293
      Height = 49
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000001250000
        00310802000000133528190000001974455874536F6674776172650041646F62
        6520496D616765526561647971C9653C0000032269545874584D4C3A636F6D2E
        61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EF
        BBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964
        223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E73
        3A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520
        352E332D633031312036362E3134353636312C20323031322F30322F30362D31
        343A35363A32372020202020202020223E203C7264663A52444620786D6C6E73
        3A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F
        32322D7264662D73796E7461782D6E7323223E203C7264663A44657363726970
        74696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474
        703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
        3A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F
        312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365
        526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F
        746F73686F7020435336202857696E646F7773292220786D704D4D3A496E7374
        616E636549443D22786D702E6969643A30423633313034353136364431314542
        424137384433384138364238383632322220786D704D4D3A446F63756D656E74
        49443D22786D702E6469643A3042363331303436313636443131454242413738
        443338413836423838363232223E203C786D704D4D3A4465726976656446726F
        6D2073745265663A696E7374616E636549443D22786D702E6969643A30423633
        3130343331363644313145424241373844333841383642383836323222207374
        5265663A646F63756D656E7449443D22786D702E6469643A3042363331303434
        313636443131454242413738443338413836423838363232222F3E203C2F7264
        663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D
        706D6574613E203C3F787061636B657420656E643D2272223F3E48F093F30000
        00B24944415478DAEDD3C111802000C030991246644C7D3843B9D364827E3AE6
        9C179018CF6F7BEFD319F07D6B2DBF41C46FD0F11B74FC061DBF41C76FD0F11B
        74FC061DBF41C76FD0F11B74FC061DBF41C76FD0F11B74FC061DBF41C76FD0F1
        1B74FC061DBF41C76FD0F11B74FC061DBF41C76FD0F11B74FC061DBF41C76FD0
        F11B74FC061DBF41C76FD0F11B74FC061DBF41C76FD0F11B74FC061DBF41C76F
        D0F11B74FC061DBF41C76FD0797F3B9D017F7103C4C8BF27BB2B68FA00000000
        49454E44AE426082}
    end
    object LabelCalcProcess: TLabel
      Left = 13
      Top = 64
      Width = 277
      Height = 48
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object LabelStandardCalcNumber: TLabel
      Left = 14
      Top = 16
      Width = 276
      Height = 35
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ButtonDot: TButton
      Left = 13
      Top = 354
      Width = 60
      Height = 53
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = ButtonDotClick
    end
    object Button0: TButton
      Left = 85
      Top = 354
      Width = 60
      Height = 53
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = Button0Click
    end
    object ButtonEqual: TButton
      Left = 157
      Top = 354
      Width = 60
      Height = 53
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = ButtonEqualClick
    end
    object ButtonPlus: TButton
      Left = 230
      Top = 295
      Width = 60
      Height = 112
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = ButtonPlusClick
    end
    object Button3: TButton
      Left = 157
      Top = 295
      Width = 60
      Height = 53
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 85
      Top = 296
      Width = 60
      Height = 53
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      TabStop = False
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 13
      Top = 295
      Width = 60
      Height = 53
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      TabStop = False
      OnClick = Button1Click
    end
    object MemoValueList: TMemo
      Left = 304
      Top = 17
      Width = 129
      Height = 344
      TabStop = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 8
    end
    object Button6: TButton
      Left = 157
      Top = 236
      Width = 60
      Height = 53
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      TabStop = False
      OnClick = Button6Click
    end
    object Button5: TButton
      Left = 85
      Top = 237
      Width = 60
      Height = 53
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      TabStop = False
      OnClick = Button5Click
    end
    object Button4: TButton
      Left = 13
      Top = 236
      Width = 60
      Height = 53
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      TabStop = False
      OnClick = Button4Click
    end
    object ButtonMult: TButton
      Left = 230
      Top = 177
      Width = 60
      Height = 53
      Caption = #215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      TabStop = False
      OnClick = ButtonMultClick
    end
    object Button9: TButton
      Left = 157
      Top = 177
      Width = 60
      Height = 53
      Caption = '9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      TabStop = False
      OnClick = Button9Click
    end
    object Button8: TButton
      Left = 85
      Top = 178
      Width = 60
      Height = 53
      Caption = '8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      TabStop = False
      OnClick = Button8Click
    end
    object Button7: TButton
      Left = 13
      Top = 177
      Width = 60
      Height = 53
      Caption = '7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      TabStop = False
      OnClick = Button7Click
    end
    object ButtonDiv: TButton
      Left = 230
      Top = 118
      Width = 60
      Height = 53
      Caption = #247
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      TabStop = False
      OnClick = ButtonDivClick
    end
    object ButtonBackSpace: TButton
      Left = 157
      Top = 118
      Width = 60
      Height = 53
      Caption = #8592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      TabStop = False
      OnClick = ButtonBackSpaceClick
    end
    object ButtonClean: TButton
      Left = 13
      Top = 118
      Width = 132
      Height = 53
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = ButtonCleanClick
    end
    object ButtonMinus: TButton
      Left = 230
      Top = 236
      Width = 60
      Height = 53
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      TabStop = False
      OnClick = ButtonMinusClick
    end
    object ButtonReset: TButton
      Left = 304
      Top = 366
      Width = 129
      Height = 41
      Caption = 'RESET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
      TabStop = False
      OnClick = ButtonResetClick
    end
  end
end
