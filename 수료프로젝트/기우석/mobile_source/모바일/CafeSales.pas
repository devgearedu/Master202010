unit CafeSales;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmCafeSales = class(TForm)
    Rectangle1: TRectangle;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCafeSales: TfrmCafeSales;

implementation

{$R *.fmx}

procedure TfrmCafeSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCafeSales := nil;
end;

end.
