unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uPOSdatasnap_Client;

type
  TfrmLogin = class(TForm)
    lblID: TLabel;
    lblPW: TLabel;
    edtID: TEdit;
    edtPW: TEdit;
    btnLogin: TButton;
    Label1: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure edtPWKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uPOSDM, MainForm;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  Check: string;
begin
  Check := frmMain.cafeClass.Loginidpw(edtID.Text, edtPW.Text);
  if Check = '' then
  begin
    ShowMessage('아이디와 비밀번호가 다릅니다.');
  end else
  begin
    FEMPCODE := Copy(Check, 1, 7);
    Delete(Check, 1, 8);
    FEMPNAME := Copy(Check, 1, Pos(':', Check) - 1);
    FCAFECODE := Copy(Check, Pos(':', Check) + 1, 2);

    ModalResult := mrOk;
  end;


end;


procedure TfrmLogin.edtPWKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnLoginClick(Self);      // 2020-11-29
  end;
end;


end.
