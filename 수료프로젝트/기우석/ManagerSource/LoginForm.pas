unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDatasnap_Client;

type
  TfrmLogin = class(TForm)
    lblID: TLabel;
    lblPW: TLabel;
    edtID: TEdit;
    edtPW: TEdit;
    btnLogin: TButton;
    Label1: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses uDm, MainForm;

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
    //frmLogin.Hide;

    ModalResult := mrOK;
  end;


end;

procedure TfrmLogin.edtPWKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnLoginClick(Self);
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //action := caFree;
  //frmLogin := nil;
end;

end.
