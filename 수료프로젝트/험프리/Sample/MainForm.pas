unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    qryShopMenu: TFDQuery;
    cbxShops: TComboBox;
    qryShops: TFDQuery;
    stgMenus: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxShopsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses MenuForm, ShopForm, DBModule;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if not Assigned(frmMenu) then
    frmMenu := TfrmMenu.Create(Self);
  frmMenu.Show;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  if not Assigned(frmShop) then
    frmShop := TfrmShop.Create(Self);
  frmShop.Show;
end;

procedure TfrmMain.cbxShopsChange(Sender: TObject);
var
  Idx: Integer;
  ShopName: string;
begin
  ShopName := cbxShops.Text;

  qryShopMenu.Close;
  if ShopName = '전체' then
    qryShopMenu.ParamByName('PSHOP_NAME').AsString := '%'
  else
    qryShopMenu.ParamByName('PSHOP_NAME').AsString := ShopName;
  qryShopMenu.Open;

  stgMenus.RowCount := qryShopMenu.RecordCount + 1;
  stgMenus.ColCount := 2;

  stgMenus.Cells[0, 0] := '지점명';
  stgMenus.Cells[1, 0] := '메뉴명';
  Idx := 1;
  qryShopMenu.First;
  while not qryShopMenu.Eof do
  begin
    stgMenus.Cells[0, Idx] := qryShopMenu.FieldByName('SHOP_NAME').AsString;
    stgMenus.Cells[1, Idx] := qryShopMenu.FieldByName('MENU_NAME').AsString;
    Inc(Idx);
    qryShopMenu.Next;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cbxShops.Items.Clear;
  cbxShops.Items.Add('전체');
  cbxShops.ItemIndex := 0;
  qryShops.Open;
  qryShops.First;
  while not qryShops.Eof do
  begin
    cbxShops.Items.Add(qryShops.FieldByName('SHOP_NAME').AsString);
    qryShops.Next;
  end;
  qryShops.Close;
end;

end.
