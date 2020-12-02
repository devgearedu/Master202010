unit SalesReportForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, uPOSDM, uPOSDatasnap_Client;

type
  TfrmSalesReport = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    dsSalesReport: TDataSource;
    btnSearch: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    cafeClass: TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmSalesReport: TfrmSalesReport;

implementation

{$R *.dfm}

procedure TfrmSalesReport.btnSearchClick(Sender: TObject);
var
  sDate: string;
  sCafecode: string;
begin
  sCafecode := FCAFECODE;
  sDate := FormatDateTime('yyyymmdd', DateTimePicker1.DateTime);

  posDM.cdsSalesReport.Close;
  posDM.cdsSalesReport.ParamByName('cafecode').AsString := sCafecode;
  posDM.cdsSalesReport.ParamByName('sdate').AsString := sDate;
  posDM.cdsSalesReport.Open;
end;


procedure TfrmSalesReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmSalesReport := nil;
end;

procedure TfrmSalesReport.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(posDM.SQLConnection1.DBXConnection);
end;

procedure TfrmSalesReport.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := Date;


end;

end.
