unit MenuSalesForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMenuSales = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Panel2: TPanel;
    Panel4: TPanel;
    DBChart1: TDBChart;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuSales: TfrmMenuSales;

implementation

{$R *.dfm}

procedure TfrmMenuSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  frmMenuSales := nil;
end;

end.
