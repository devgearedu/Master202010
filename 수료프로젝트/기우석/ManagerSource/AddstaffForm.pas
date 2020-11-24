unit AddstaffForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  uDatasnap_Client, DateUtils;

type
  TfrmAddStaff = class(TForm)
    lblID: TLabel;
    lblPW: TLabel;
    lblPWC: TLabel;
    edtId: TEdit;
    edtPW: TEdit;
    edtPWC: TEdit;
    rdgPosition: TRadioGroup;
    btnRegister: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    dtpEmpdate: TDateTimePicker;
    Label3: TLabel;
    cboCafename: TComboBox;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    staffClass : TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmAddStaff: TfrmAddStaff;

implementation

{$R *.dfm}

uses uDm;

procedure TfrmAddStaff.btnRegisterClick(Sender: TObject);
var
  sCafecode: string;
  sEmpdate: string;
begin
  if Application.MessageBox('저장하시겠습니까?', '저장확인', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    sCafecode := cboCafename.Items.Strings[cboCafename.ItemIndex];
    sCafecode := copy(sCafecode, 1, 2);  // 1번째부터 2개를 가져오겠다는 뜻, 맨 앞이 1이다.
    sEmpdate := FormatDateTime('yyyymmdd', dtpEmpdate.DateTime);
    staffClass.AddStaff(sCafecode, edtName.Text, edtID.Text, edtPW.Text,
      sEmpdate, IntToStr(rdgPosition.ItemIndex), Yearof(dtpEmpdate.DateTime));
    Close;
  end;
end;

procedure TfrmAddStaff.FormCreate(Sender: TObject);
begin
  staffClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
end;

procedure TfrmAddStaff.FormShow(Sender: TObject);
var
  sList : TStringList;
  str : string;
begin
  dtpEmpdate.Date := Date;

  sList := TStringList.Create;
  sList.StrictDelimiter := True;
  str := staffClass.GetCafelist; //'01 asa:02 ee:03 tgr'

  ExtractStrings([':'], [], PChar(str), sList);   //
  cboCafename.Items := sList;
  if cboCafename.Items.Count > 0 then
    cboCafeName.ItemIndex := 0;
end;

end.


