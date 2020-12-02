unit MenuSalesForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.Grids, Vcl.DBGrids,
  VCLTee.Series, Vcl.ComCtrls;

type
  TfrmMenuSales = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    cbxCafelist: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    DBChart1: TDBChart;
    DBGrid1: TDBGrid;
    dsSalesReportManager: TDataSource;
    Series1: TBarSeries;
    btnSearch: TButton;
    dtpTo: TDateTimePicker;
    dtpFrom: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuSales: TfrmMenuSales;

implementation

{$R *.dfm}

uses uDm, MainForm;

procedure TfrmMenuSales.btnSearchClick(Sender: TObject);
var
  sDateTo, sDateFrom, sCafecode, str: string;
begin

  //sCafecode := FCAFECODE;
  sDateFrom := FormatDateTime('yyyymmdd', dtpFrom.Date);
  sDateTo := FormatDateTime('yyyymmdd', dtpTo.Date);

  str := cbxCafelist.Items.Strings[cbxCafelist.ItemIndex];
  sCafecode := Copy(str, 1, 2);


  //dsSalesReportManager.DataSet := frmMain.cafeClass.GetSalesReportManager(sDate, sCafecode);
  if sCafecode <> '01' then
  begin
    dsSalesReportManager.DataSet := DM.cdsSalesTotalByCafe;
    DBChart1.Series[0].DataSource := DM.cdsSalesTotalByCafe;
    DM.cdsSalesTotalByCafe.Close;
    DM.cdsSalesTotalByCafe.ParamByName('sdatefrom').AsWideString := sDateFrom;
    DM.cdsSalesTotalByCafe.ParamByName('sdateto').AsWideString := sDateto;
    DM.cdsSalesTotalByCafe.ParamByName('cafecode').AsWideString := sCafecode;
    DM.cdsSalesTotalByCafe.Open;
  end else if sCafecode = '01' then
  begin
    dsSalesReportManager.DataSet := DM.cdsSalesTotal;
    DBChart1.Series[0].DataSource := DM.cdsSalesTotal;
    DM.cdsSalesTotal.Close;
    DM.cdsSalesTotal.ParamByName('sdatefrom').AsWideString := sDateFrom;
    DM.cdsSalesTotal.ParamByName('sdateto').AsWideString := sDateto;
    DM.cdsSalesTotal.Open;
  end;

  {if sCafecode = '00' then
  begin
    DM.cdsSalesReportManager.Close;
    DM.cdsSalesReportManager.ParamByName('cafecode').AsString := sCafecode;
    DM.cdsSalesReportManager.ParamByName('sdate').AsString := sDate;
    DM.cdsSalesReportManager.Open;
  end else
  begin
    DM.cdsSalesReportManager.Close;
    DM.cdsSalesReportManager.ParamByName('cafecode').AsString := sCafecode;
    DM.cdsSalesReportManager.ParamByName('sdate').AsString := sDate;
    DM.cdsSalesReportManager.Open;
  end; }

  

  {if rdgTerm.ItemIndex = 0 then
  begin
    sToDate := FormatDateTime('yyyymmdd', Date - 7);
    DM.cdsSalesList.Close;
    DM.cdsSalesList.ParamByName('sdate').AsString := sToDate;
    DM.cdsSalesList.Open;
  end else if rdgTerm.ItemIndex = 1 then
  begin

  end else
  begin

  end;}

  //frmMain.cafeClass.Get (pdate, pcafecode: String);      // 그 카페의 카페코드,

  
end;

procedure TfrmMenuSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  frmMenuSales := nil;
end;

procedure TfrmMenuSales.FormShow(Sender: TObject);
var
  sCafeList : TStringList;
  str, Result, sTemp : string;
  I: Integer;
begin
  dtpFrom.Date := Date;
  dtpTo.Date := Date;

  sCafeList := TStringList.Create;

  str := frmMain.CafeClass.GetCafelist; //'01 asa:02 ee:03 tgr'

    ExtractStrings([':'], [], PChar(str), sCafeList);
  cbxCafelist.Items := sCafeList;
  if cbxCafelist.Items.Count > 0 then
  begin
    if FCAFECODE = '01' then
      cbxCafelist.ItemIndex := 0
    else if FCAFECODE <> '01' then
    begin
      cbxCafelist.ItemIndex := StrToInt(FCAFECODE) - 1;
      cbxCafelist.Enabled := False;
    end;
  end;

end;

end.
