program POS_Project;

uses
  Vcl.Forms,
  Vcl.Controls,
  MenuForm in 'MenuForm.pas' {frmMenu},
  MainForm in 'MainForm.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  SalesReportForm in 'SalesReportForm.pas' {frmSalesReport},
  LoginForm in 'LoginForm.pas' {frmLogin},
  uPOSDM in 'uPOSDM.pas' {posDM: TDataModule},
  uPOSDatasnap_Client in 'uPOSDatasnap_Client.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TposDM, posDM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
