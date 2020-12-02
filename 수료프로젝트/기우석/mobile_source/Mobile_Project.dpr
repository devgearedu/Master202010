program Mobile_Project;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form1},
  uMobileDM in 'uMobileDM.pas' {MobileDM: TDataModule},
  Unit2 in 'Unit2.pas' {Form2},
  uMobile_Client in 'uMobile_Client.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMobileDM, MobileDM);
  Application.Run;
end.
