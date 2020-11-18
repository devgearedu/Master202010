unit ShopForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmShop = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    btnAppend: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    qryShops: TFDQuery;
    DataSource1: TDataSource;
    qryShopsSHOP_SEQ: TIntegerField;
    qryShopsSHOP_NAME: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShop: TfrmShop;

implementation

{$R *.dfm}

uses DBModule;

procedure TfrmShop.btnAppendClick(Sender: TObject);
begin
  qryShops.Append;
end;

procedure TfrmShop.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmShop.btnSaveClick(Sender: TObject);
begin
  qryShops.Post;
end;

procedure TfrmShop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmShop := nil;
end;

end.
