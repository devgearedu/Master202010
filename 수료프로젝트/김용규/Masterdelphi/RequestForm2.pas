unit RequestForm2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask;

type
  TfrmRequest2 = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtName: TDBEdit;
    edtAddress: TDBEdit;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    edtPhone: TDBEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequest2: TfrmRequest2;

implementation

{$R *.dfm}

procedure TfrmRequest2.Button2Click(Sender: TObject);
begin
close;
end;

procedure TfrmRequest2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
