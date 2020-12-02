unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmMain = class(TForm)
    btnMenu: TButton;
    btnShot: TButton;
    DBComboBox1: TDBComboBox;
    procedure btnMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses menuForm;

procedure TfrmMain.btnMenuClick(Sender: TObject);
begin
  if not Assigned(frmMenu) then
  begin
    frmMenu := TfrmMenu.Create(Application);
  end;
  frmMenu.Show;
end;

end.
