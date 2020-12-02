unit menuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMenu = class(TForm)
    dgMenu: TDBGrid;
    btnAdd: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    lblMenuName: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses uDm;

procedure TfrmMenu.btnSaveClick(Sender: TObject);
begin
  //post
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  frmMenu := nil;
end;

end.
