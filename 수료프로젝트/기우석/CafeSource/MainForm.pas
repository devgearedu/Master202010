unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList;

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
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure tbbtnExitClick(Sender: TObject);
    procedure tbbtnMenuClick(Sender: TObject);
    procedure tbbtnReceiptClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses MenuForm, SalesReportForm, LoginForm;

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

procedure TfrmMain.ToolButton2Click(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  frmLogin.Free;
end;

end.
