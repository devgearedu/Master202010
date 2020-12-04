unit RequestForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DMForm;

type
  TfrmRequest = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequest: TfrmRequest;

implementation

{$R *.dfm}

uses RequestForm2;

procedure TfrmRequest.Button1Click(Sender: TObject);
var frmRequest2: TfrmRequest2;
begin
 frmRequest2:= TfrmRequest2.Create(Application);
 frmRequest2.Show;
end;

procedure TfrmRequest.Button3Click(Sender: TObject);
begin
Close;
end;

procedure TfrmRequest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

end.
