unit UpdateStaffForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  uDatasnap_Client;

type
  TfrmUpdateStaff = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtSearchStaff: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dsStaff: TDataSource;
    btnSave: TButton;
    dbedtName: TDBEdit;
    dbedtCafecode: TDBEdit;
    dbedtPosition: TDBEdit;
    cbxOnwork: TCheckBox;
    DBEdit1: TDBEdit;
    btnSearch: TBitBtn;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtSearchStaffKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSearchStaffKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    cafeClass: TServerMethods1Client;
  end;

var
  frmUpdateStaff: TfrmUpdateStaff;

implementation

{$R *.dfm}

uses uDm;

procedure TfrmUpdateStaff.btnSearchClick(Sender: TObject);
begin
  dbedtName.SetFocus;
end;

procedure TfrmUpdateStaff.btnSaveClick(Sender: TObject);
var
  CheckOnWork: String;
  sEmpcode: String;
begin
  if dbedtName.Text = '' then
    ShowMessage('�̸��� �Է��ϼ���');

  // �����ڵ� �Է�

  if cbxOnwork.Checked then
    CheckOnWork := '0'
  else
    CheckOnWork := '1';

  sEmpcode := dsStaff.DataSet.FieldByName('empcode').AsString;

  DM.cdsUpdateStaff.DisableControls;

  DM.cdsUpdateStaff.Edit;
  cafeClass.UpdateStaff(dbedtName.Text, dbedtCafecode.Text,
                        dbedtPosition.Text, CheckOnWork, sEmpcode);

  DM.cdsUpdateStaff.Post;
//  DM.cdsUpdateStaff.ApplyUpdates(-1);
  DM.cdsUpdateStaff.Refresh;

  DM.cdsUpdateStaff.EnableControls;
end;

procedure TfrmUpdateStaff.edtSearchStaffKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnSearchClick(Self);
  end;
end;

procedure TfrmUpdateStaff.edtSearchStaffKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if edtSearchStaff.Text <> '' then
  begin
    Filter := Format('sname like ''%%%s%%''', [edtSearchStaff.Text]);
  end;

  DM.cdsUpdateStaff.Filter := Filter;
  DM.cdsUpdateStaff.Filtered := (Filter <> '');
end;

procedure TfrmUpdateStaff.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
end;

procedure TfrmUpdateStaff.FormShow(Sender: TObject);
begin
  if FCAFECODE <> '01' then
  begin
    DM.cdsUpdateStaff.Filter := 'cafecode = ' + FCAFECODE;
    DM.cdsUpdateStaff.Filtered := True;
  end;
end;

end.
