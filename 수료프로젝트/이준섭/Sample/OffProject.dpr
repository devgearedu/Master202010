program OffProject;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  MenuInputForm in 'MenuInputForm.pas' {FormMenuInput};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
