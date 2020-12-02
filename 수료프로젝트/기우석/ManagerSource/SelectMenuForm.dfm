object frmSelectMenu: TfrmSelectMenu
  Left = 0
  Top = 0
  Caption = #47700#45684' '#49440#53469
  ClientHeight = 193
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 41
    Width = 507
    Height = 152
    Align = alClient
    Columns = 2
    ItemHeight = 13
    Items.Strings = (
      '001 '#50500#47700#47532#52852#45432'(H)'
      '002 '#50500#47700#47532#52852#45432'(I)'
      '003 '#52852#54168#46972#46524'(H)'
      '004 '#52852#54168#46972#46524'(I)'
      '005 '#52852#54392#52824#45432'(H)'
      '006 '#52852#54392#52824#45432'(I)'
      '007 '#53084#46300#48652#47336'(H)'
      '008 '#53084#46300#48652#47336'(I)'
      '009 '#53084#46300#48652#47336' '#46972#46524'(H)'
      '010 '#53084#46300#48652#47336' '#46972#46524'(I)'
      '011 '#50640#49828#54532#47112#49548
      '101 '#52824#51592#52992#51084
      '102 '#44256#44396#47560#52992#51084
      '103 '#49373#53356#47548#52992#51084
      '104 '#52488#53076#52992#51084
      '105 '#50500#51060#49828#53356#47548' '#52992#51084
      '106 '#51064#51208#48120#52992#51084)
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 208
      Top = 14
      Width = 91
      Height = 13
      Caption = #47700#45684#47484' '#49440#53469#54616#49464#50836
    end
    object btnSaveMenu: TButton
      Left = 400
      Top = 7
      Width = 95
      Height = 26
      Caption = #47700#45684' '#49688#51221#54616#44592
      TabOrder = 0
      OnClick = btnSaveMenuClick
    end
  end
end
