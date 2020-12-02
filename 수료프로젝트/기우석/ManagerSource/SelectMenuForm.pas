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
    btnSaveMenu: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveMenuClick(Sender: TObject);
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

procedure TfrmSelectMenu.btnSaveMenuClick(Sender: TObject);
var
  sMenuList: string;
  str: string;
  strTmp: string;
  I: Integer;
begin
  if Application.MessageBox('저장하시겠습니까?', '저장확인', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    str := '';
    for I := 0 to CheckListBox1.Items.Count - 1 do
    begin
      if CheckListBox1.Checked[I] then
      begin
        strTmp := CheckListBox1.Items.Strings[I];
        strTmp := copy(strTmp, 1, 3);
        str := str + strTmp + ',';
      end;
    end;
    if str.Length > 1 then
      str := copy(str, 1, Length(str) - 1);

    cafeClass.GetSelectedMenu(FCAFECODE, str);
    Close;

  end;
end;

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
  {stlList := TStringList.Create;
  sMenuList := cafeClass.GetSelectedMenu(FCAFECODE);

  ExtractStrings([','], [], pwideChar(sMenulist), stlList);

  // }
end;

end.
