program CafeSample;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  MenuForm in 'MenuForm.pas' {frmMenu},
  DBModule in 'DBModule.pas' {dmDatabase: TDataModule},
  ShopForm in 'ShopForm.pas' {frmShop};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
