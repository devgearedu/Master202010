program BookRental;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FrmMain},
  DataAccessModule in 'DataAccessModule.pas' {DataModuleDataAccess: TDataModule},
  BookForm in 'BookForm.pas' {FormBook},
  CommonFunctions in 'CommonFunctions.pas',
  UserForm in 'UserForm.pas' {FormUser},
  RentForm in 'RentForm.pas' {FormRent},
  FindUserForm in 'FindUserForm.pas' {FormFindUser},
  FindBookForm in 'FindBookForm.pas' {FormFindBook},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleDataAccess, DataModuleDataAccess);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
