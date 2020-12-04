unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, RequestForm, Vcl.Menus, Vcl.Mask,
  Vcl.DBCtrls, DMForm;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit1: TDBEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses CompanyForm;

procedure TfrmMain.Button1Click(Sender: TObject);
var frmRequest: TfrmRequest;
begin
 frmRequest:= TfrmRequest.Create(self);
 frmRequest.Show;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var frmCompany: TfrmCompany;
begin
 frmCompany:= TfrmCompany.Create(self);
 frmCompany.Show;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
Close;
end;

end.
