{*******************************************************}
{           M2: 모바일 앱 만들기(사원 조회 앱)          }
{                                        - 이준섭       }
{*******************************************************}

unit PhoneMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Permissions, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Fmx.Bind.GenData, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.ListView, FMX.Edit, System.Actions, FMX.ActnList,
  FMX.Gestures, FMX.Effects, FMX.ListBox, FMX.MultiView, FMX.PhoneDialer,
  FMX.Platform;

type
  TForm1 = class(TForm)
    loMain: TLayout;
    tcMain: TTabControl;
    tbMain: TToolBar;
    lbToolBar: TLabel;
    Button1: TButton;
    tiEmployeeList: TTabItem;
    tiEmployeeDetail: TTabItem;
    lvEmployeeList: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    icIDPicture: TImageControl;
    edTitle: TEdit;
    edName: TEdit;
    edPhoneNumber: TEdit;
    btPhoneCall: TButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    ShadowEffect1: TShadowEffect;
    StyleBook1: TStyleBook;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    btMultiViewClose: TButton;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    procedure Button1Click(Sender: TObject);
    procedure btMultiViewCloseClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure tcMainChange(Sender: TObject);
    procedure lvEmployeeListClick(Sender: TObject);
    procedure btPhoneCallClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    { Private declarations }
    FPhoneDialerService: IFMXPhoneDialerService;                        //전화 부분. 델파이 샘플PhoneDialer 발췌
    FCallPhonePermission: string;                                       //전화 부분. 델파이 샘플PhoneDialer 발췌

    procedure DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
    procedure MakePhoneCallPermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  {$IFDEF ANDROID}                                                      //전화 부분. 델파이 샘플PhoneDialer 발췌
  Androidapi.Helpers,                                                   //
  Androidapi.JNI.JavaTypes,                                             //
  Androidapi.JNI.Os,                                                    //
  {$ENDIF}                                                              //
  FMX.DialogService;                                                    //전화 부분. 델파이 샘플PhoneDialer 발췌

{$R *.fmx}

procedure TForm1.btMultiViewCloseClick(Sender: TObject);
begin
  MultiView1.HideMaster;
end;

procedure TForm1.btPhoneCallClick(Sender: TObject);                     //전화 부분. 델파이 샘플PhoneDialer 발췌
begin
  { test whether the PhoneDialer services are supported }
  if FPhoneDialerService <> nil then
  begin
    { if the Telephone Number is entered in the edit box then make the call, else
      display an error message }
    if edPhoneNumber.Text <> '' then
      PermissionsService.RequestPermissions([FCallPhonePermission], MakePhoneCallPermissionRequestResult, DisplayRationale)
    else
    begin
      TDialogService.ShowMessage('Please type in a telephone number.');
      edPhoneNumber.SetFocus;
    end;
  end
  else
    TDialogService.ShowMessage('PhoneDialer service not supported');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MultiView1.ShowMaster;
end;

procedure TForm1.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
begin
    // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
  TDialogService.ShowMessage('The app needs to be able to support your making phone calls',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IFDEF ANDROID}
  FCallPhonePermission := JStringToString(TJManifest_permission.JavaClass.CALL_PHONE);
{$ENDIF}
  { test whether the PhoneDialer services are supported }
  TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, FPhoneDialerService);
end;

procedure TForm1.ListBox1Click(Sender: TObject);                     //멀티뷰 클릭시 텝 아이템 변경
begin
  case ListBox1.ItemIndex of
    0: tcMain.ActiveTab := tiEmployeeList;

    1: tcMain.ActiveTab := tiEmployeeDetail;

  end;

  MultiView1.HideMaster;
end;

procedure TForm1.lvEmployeeListClick(Sender: TObject);               //사원 정보 클릭시 디테일로 변경
begin
  //TAction(ActionList1.Actions[0]).Execute;                         //모바일시 너무 민감하므로 수정
end;

procedure TForm1.MakePhoneCallPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  // 1 permission involved: CALL_PHONE
  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
    FPhoneDialerService.Call(edPhoneNumber.Text)
  else
    TDialogService.ShowMessage('Cannot make a phone call because the required permission has not been granted');
end;

procedure TForm1.tcMainChange(Sender: TObject);                      //텝 아이템 변경시 툴바 라벨 변경
begin
  if tcMain.ActiveTab = tiEmployeeList then
    lbToolBar.Text := '사원 정보'
  else
    lbToolBar.Text := '상세 정보';
end;

end.
