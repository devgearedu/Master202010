unit SalesReportForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmSalesReport = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalesReport: TfrmSalesReport;

implementation

{$R *.dfm}

procedure TfrmSalesReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmSalesReport := nil;
end;

end.
