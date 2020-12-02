unit MainLeftForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMainLeft = class(TForm)
    lblClock: TLabel;
    tmrNow: TTimer;
    procedure tmrNowTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainLeft: TfrmMainLeft;

implementation

{$R *.dfm}

procedure TfrmMainLeft.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree
end;

procedure TfrmMainLeft.tmrNowTimer(Sender: TObject);
begin
  lblClock.Caption := FormatDateTime('yyyy-mm-dd, HH:MM:SS', Now);
end;

end.
