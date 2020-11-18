unit MenuInputForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormMenuInput = class(TForm)
    DBGrid1: TDBGrid;
    Label2: TLabel;
    EdtMemuNameInput: TEdit;
    BtnInput: TButton;
    BtnCancel: TButton;
    BtnSave: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnInputClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuInput: TFormMenuInput;

implementation

{$R *.dfm}

procedure TFormMenuInput.BtnCancelClick(Sender: TObject);
begin
  //취소
end;

procedure TFormMenuInput.BtnInputClick(Sender: TObject);
var
  NewMenu: string;
begin
  //추가

end;

procedure TFormMenuInput.BtnSaveClick(Sender: TObject);
begin
  //저장


end;

procedure TFormMenuInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
