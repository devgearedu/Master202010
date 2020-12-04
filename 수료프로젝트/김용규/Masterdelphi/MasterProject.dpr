program MasterProject;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  RequestForm in 'RequestForm.pas' {frmRequest},
  CompanyForm in 'CompanyForm.pas' {frmCompany},
  DMForm in 'DMForm.pas' {DataAccessModule: TDataModule},
  RequestForm2 in 'RequestForm2.pas' {frmRequest2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataAccessModule, DataAccessModule);
  Application.Run;
end.
