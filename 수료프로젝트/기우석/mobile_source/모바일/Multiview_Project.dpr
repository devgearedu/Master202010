program Multiview_Project;

uses
  System.StartUpCopy,
  FMX.Forms,
  MultiView in 'MultiView.pas' {Form1},
  FMX.MultiView.CustomPresentation in 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samples\Object Pascal\Multi-Device Samples\User Interface\MultiView\FMX.MultiView.CustomPresentation.pas',
  CafeSales in 'CafeSales.pas' {frmCafeSales};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCafeSales, frmCafeSales);
  Application.Run;
end.
