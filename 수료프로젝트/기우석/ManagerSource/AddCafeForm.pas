unit AddCafeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDatasnap_Client,
  Vcl.CheckLst;

type
  TfrmAddCafe = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    btnRegister: TButton;
    edtCafeName: TEdit;
    edtPhone: TEdit;
    clbMenuList: TCheckListBox;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cafeClass : TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmAddCafe: TfrmAddCafe;

implementation

{$R *.dfm}

uses uDm;

procedure TfrmAddCafe.btnRegisterClick(Sender: TObject);
var
  sMenuList: string;
  str: string;
  strTmp: string;
  I: Integer;
begin
  if Application.MessageBox('저장하시겠습니까?', '저장확인', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    str := '';
    for I := 0 to clbMenuList.Items.Count - 1 do
    begin
      if clbMenuList.Checked[I] then
      begin
        strTmp := clbMenuList.Items.Strings[I];
        strTmp := copy(strTmp, 1, 3);
        str := str + strTmp + ',';
      end;
    end;
    if str.Length > 1 then
      str := copy(str, 1, Length(str) - 1);

    cafeClass.AddCafe(edtCafename.Text, edtPhone.Text, str);
    Close;

  end;

end;

procedure TfrmAddCafe.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
end;

end.
