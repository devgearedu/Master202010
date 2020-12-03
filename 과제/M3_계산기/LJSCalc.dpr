program LJSCalc;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  Vcl.Themes,
  Vcl.Styles,
  StandardCalcMain in 'StandardCalcMain.pas' {StandardCalcMainForm},
  Splash in 'Splash.pas' {SplashForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  SplashForm := TSplashForm.create(Application);
  SplashForm.Show;
  SplashForm.Refresh;
  Application.CreateForm(TFormMain, FormMain);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
