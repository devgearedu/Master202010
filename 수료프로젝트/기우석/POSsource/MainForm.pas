unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, uPOSDatasnap_Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    tbMain: TToolBar;
    pnlLayout: TPanel;
    tbbtnMenu: TToolButton;
    tbbtnReceipt: TToolButton;
    tbbtnExit: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    procedure tbbtnExitClick(Sender: TObject);
    procedure tbbtnMenuClick(Sender: TObject);
    procedure tbbtnReceiptClick(Sender: TObject);
    //procedure ToolButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    cafeClass: TServerMethods1Client;
    stlCoffeeMenuname: TStrings;
    stlCakeMenuname: TStrings;
    stlCoffeeMenuprice: TStrings;
    stlCakeMenuprice: TStrings;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses MenuForm, SalesReportForm, LoginForm, uPOSDM;


procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmMain := nil;
end;

procedure TfrmMain.FormCreate(Sender: TObject);   // 여기서 procedure를 function 으로 바꿀 수 있는지.
begin
  cafeClass := TServerMethods1Client.Create(posDM.SQLConnection1.DBXConnection);

  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  if frmLogin.ModalResult <> mrOk then
  begin
    frmLogin.Close;
    Application.Terminate;
  end;

  // Result := cafeClass.Loginidpw('ddd', '123');    // 20200101 : 기우석 : 01
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  ds: TDataSet;
  sMenuname: string;
  sMenucode: string;
  sMenuprice: string;
begin

  frmMain.Height := 768;
  frmMain.Width := 1024;

  stlCoffeeMenuname := TStringList.Create;
  stlCoffeeMenuprice := TStringList.Create;
  stlCakeMenuname := TStringList.Create;
  stlCakeMenuprice := TStringList.Create;

  ds := cafeClass.GetCafeMenulist(FCAFECODE);

  while not ds.Eof do
  begin
    sMenucode := ds.FieldByName('menucode').AsString;
    sMenuname := ds.FieldByName('menuname').AsString;
    sMenuprice := ds.FieldByName('unitprice').AsString;

    if sMenucode[1] = '0' then
    begin
      stlCoffeeMenuname.Add(sMenucode + '=' + sMenuname);
      stlCoffeeMenuprice.Add(sMenucode + '=' + sMenuprice);
    end else if sMenucode[1] = '1' then
    begin
      stlCakeMenuname.Add(sMenucode + '=' + sMenuname);
      stlCakeMenuprice.Add(sMenucode + '=' + sMenuprice);
    end;

    ds.Next;
  end;

end;

procedure TfrmMain.tbbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.tbbtnMenuClick(Sender: TObject);
begin
  if not Assigned(frmMenu) then
    frmMenu := TfrmMenu.Create(Self);
  frmMenu.Parent := pnlLayout;
  frmMenu.BorderStyle := bsNone;
  frmMenu.Align := alClient;
  frmMenu.Show;
end;

procedure TfrmMain.tbbtnReceiptClick(Sender: TObject);
begin
  if not Assigned(frmSalesReport) then
    frmSalesReport := TfrmSalesReport.Create(Self);
  frmSalesReport.Parent := pnlLayout;
  frmSalesReport.BorderStyle := bsNone;
  frmSalesReport.Align := alClient;
  frmSalesReport.Show;
end;


end.
