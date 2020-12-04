unit CompanyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DMForm, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCompany = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    Button3: TButton;
    DataSource1: TDataSource;
    edtName: TDBEdit;
    edtAddress: TDBEdit;
    edtPhone: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryCP: TFDQuery;
    qryCPCP_SEQ: TIntegerField;
    qryCPCP_NAME: TStringField;
    qryCPCP_ADDRESS: TStringField;
    qryCPCP_PHONE: TStringField;
    Button4: TButton;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompany: TfrmCompany;

implementation

{$R *.dfm}

procedure TfrmCompany.Button1Click(Sender: TObject);
begin
  qryCP.Post;
  qryCP.Refresh;
end;

procedure TfrmCompany.Button2Click(Sender: TObject);
var seq,name,address,phone,mag:string;
begin
 seq:=qryCP.FieldByName('CP_SEQ').AsString;
 name:=qryCP.FieldByName('CP_NAME').AsString;
 address:=qryCP.FieldByName('CP_address').AsString;

 mag:=Format('[%s]을 삭제하시겠습니까?',[name]);
 if MessageDlg(mag,mtInformation,[mbYes,mbNo],0)=mrNo then
 Exit;

 qryCP.Delete;
 if qryCP.State <> dsEdit then
    qryCP.Edit;

 end;

procedure TfrmCompany.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCompany.Button4Click(Sender: TObject);
begin
  qryCP.Append;
  edtName.SetFocus;
  edtAddress.SetFocus;
  edtPhone.SetFocus;
end;



procedure TfrmCompany.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Filter:string;
begin
  Filter:='';

if Edit1.Text<>'' then
  begin
     if CheckBox1.Checked then
       Filter := Format('CP_NAME like''%%%s%%''',[Edit1.Text]);
     if CheckBox2.Checked then
     begin
      if Filter <>'' then
         Filter:= Filter+' or ';
      Filter := Filter+Format('CP_PHONE like''%%%s%%''',[Edit1.Text]);
      // CP_PHOME LIKE '%tet%'
     end;
  end;

  qryCP.Filter:= Filter;
  qryCP.Filtered:=(Filter<>'');
end;

procedure TfrmCompany.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action :=caFree;

end;

end.
