program Sample_Project;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {frmMain},
  menuForm in 'menuForm.pas' {frmMenu},
  uDm in 'uDm.pas' {dm: TDataModule},
  shopForm in 'shopForm.pas' {frmShop};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
