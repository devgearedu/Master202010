unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    btnMultiView: TSpeedButton;
    Panel1: TPanel;
    MultiView1: TMultiView;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle6: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
