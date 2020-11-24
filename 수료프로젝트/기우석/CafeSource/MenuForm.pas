unit MenuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.Buttons;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GridPanel1: TGridPanel;
    ToolBar1: TToolBar;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Edit2: TEdit;
    Edit1: TEdit;
    sgMenuList: TStringGrid;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure prButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.prButtonClick(Sender: TObject);
var
  I: integer;
begin
  i := sgMenuList.RowCount;
  sgMenuList.RowCount := i + 1;
  sgMenuList.Cells[0,i] := TButton(Sender).Caption;
  sgMenuList.Cells[1,i] := '1';
  sgMenuList.Cells[2,i] := '1000';
end;

procedure TfrmMenu.SpeedButton1Click(Sender: TObject);
begin
  pageControl1.ActivePage := tabsheet1;
end;

procedure TfrmMenu.SpeedButton2Click(Sender: TObject);
begin
  pageControl1.ActivePage := tabsheet2;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmMenu := nil;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  sgMenuList.Cells[0,0] := '메뉴';
  sgMenuList.Cells[1,0] := '수량';
  sgMenuList.Cells[2,0] := '가격';
  PageControl1.ActivePage := TabSheet1;
end;

end.
