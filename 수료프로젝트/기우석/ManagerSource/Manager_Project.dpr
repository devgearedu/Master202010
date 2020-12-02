program Manager_Project;

uses
  Vcl.Forms,
  Vcl.Controls,
  Vcl.Themes,
  Vcl.Styles,
  MainForm in 'MainForm.pas' {frmMain},
  MenuSalesForm in 'MenuSalesForm.pas' {frmMenuSales},
  UpdatecafeForm in 'UpdatecafeForm.pas' {frmUpdatecafe},
  AddstaffForm in 'AddstaffForm.pas' {frmAddStaff},
  LoginForm in 'LoginForm.pas' {frmLogin},
  UpdateStaffForm in 'UpdateStaffForm.pas' {frmUpdateStaff},
  AddCafeForm in 'AddCafeForm.pas' {frmAddCafe},
  uDm in 'uDm.pas' {DM: TDataModule},
  uDatasnap_Client in 'uDatasnap_Client.pas',
  SelectMenuForm in 'SelectMenuForm.pas' {frmSelectMenu},
  CafeSalesForm in 'CafeSalesForm.pas' {frmCafeSales};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cyan Dusk');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
