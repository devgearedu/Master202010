unit CafeSalesForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, VCLTee.Series;

type
  TfrmCafeSales = class(TForm)
    Panel1: TPanel;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCafeSales: TfrmCafeSales;

implementation

{$R *.dfm}

uses uDm;

procedure TfrmCafeSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  frmCafeSales := nil;
end;

end.
