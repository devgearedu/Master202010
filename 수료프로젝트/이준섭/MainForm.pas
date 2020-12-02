unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.Menus, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    pnlLeft: TPanel;
    pnlCenter: TPanel;
    tlbBigMenu: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses MainLeftForm, NewsForm;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not Assigned(frmMainLeft) then
    frmMainLeft := TfrmMainLeft.Create(Self);
  frmMainLeft.Parent := pnlLeft;
  frmMainLeft.BorderStyle := bsNone;
  frmMainLeft.Align := alClient;
  frmMainLeft.Show;

  if not Assigned(frmNews) then
    frmNews := TfrmNews.Create(Self);
  frmNews.Parent := pnlCenter;
  frmNews.BorderStyle := bsNone;
  frmNews.Align := alClient;
  frmNews.Show;
end;

end.
