unit SelectMenuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  Data.DB, uDatasnap_Client;

type
  TfrmSelectMenu = class(TForm)
    CheckListBox1: TCheckListBox;
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cafeClass: TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmSelectMenu: TfrmSelectMenu;

implementation

{$R *.dfm}

uses uDm;

procedure TfrmSelectMenu.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
end;

procedure TfrmSelectMenu.FormDestroy(Sender: TObject);
begin
  cafeClass.Free;
end;

procedure TfrmSelectMenu.FormShow(Sender: TObject);
var
  sMenulist: string;
  stlList : TStringList;
begin
  stlList := TStringList.Create;
  sMenuList := cafeClass.GetSelectedMenu('02');

  ExtractStrings([','], [], pwideChar(sMenulist), stlList);

  //
end;

end.
