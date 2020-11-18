unit MenuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmMenu = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    btnAppend: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    qryMenus: TFDQuery;
    qryMenusMENU_SEQ: TIntegerField;
    qryMenusMENU_NAME: TWideStringField;
    DataSource1: TDataSource;
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
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses DBModule;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmMenu := nil;
end;

procedure TfrmMenu.btnSaveClick(Sender: TObject);
begin
  qryMenus.Post;
end;

procedure TfrmMenu.btnAppendClick(Sender: TObject);
begin
  qryMenus.Append;
end;

procedure TfrmMenu.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
