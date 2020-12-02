program POS_Project;

uses
  Vcl.Forms,
  MenuForm in 'MenuForm.pas' {frmMenu},
  MainForm in 'MainForm.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  SalesReportForm in 'SalesReportForm.pas' {frmSalesReport},
  LoginForm in 'LoginForm.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
