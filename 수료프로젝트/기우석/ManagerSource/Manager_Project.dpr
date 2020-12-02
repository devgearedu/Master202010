program Manager_Project;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  MenuSalesForm in 'MenuSalesForm.pas' {frmMenuSales},
  UpdatecafeForm in 'UpdatecafeForm.pas' {frmUpdatecafe},
  AddstaffForm in 'AddstaffForm.pas' {frmAddStaff},
  LoginForm in 'LoginForm.pas' {frmLogin},
  UpdateStaffForm in 'UpdateStaffForm.pas' {frmUpdateStaff},
  AddCafeForm in 'AddCafeForm.pas' {frmAddCafe},
  uDm in 'uDm.pas' {DM: TDataModule},
  uDatasnap_Client in 'uDatasnap_Client.pas',
  SelectMenuForm in 'SelectMenuForm.pas' {frmSelectMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSelectMenu, frmSelectMenu);
  Application.Run;
end.
