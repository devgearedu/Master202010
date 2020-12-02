program Goshiwon;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  MainDataModule in 'MainDataModule.pas' {dmMain: TDataModule},
  MainLeftForm in 'MainLeftForm.pas' {frmMainLeft},
  NewsForm in 'NewsForm.pas' {frmNews},
  LoginForm in 'LoginForm.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
