unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  uDatasnap_Client;

type
  TfrmMain = class(TForm)
    pnlHead: TPanel;
    btnClose: TBitBtn;
    btnMenuSales: TBitBtn;
    btnAddStaff: TBitBtn;
    btnUpdateCafe: TBitBtn;
    btnUpdateStaff: TBitBtn;
    btnAddCafe: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    StatusBar1: TStatusBar;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMenuSalesClick(Sender: TObject);
    procedure btnAddStaffClick(Sender: TObject);
    procedure btnUpdateCafeClick(Sender: TObject);
    procedure btnUpdateStaffClick(Sender: TObject);
    procedure btnAddCafeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cafeClass: TServerMethods1Client;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses MenuSalesForm, UpdatecafeForm, AddstaffForm, LoginForm,
  UpdateStaffForm, AddCafeForm, SelectMenuForm, CafeSalesForm, uDm;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  if not Assigned(frmSelectMenu) then
    frmSelectMenu := TfrmSelectMenu.Create(Self);
  frmSelectMenu.ShowModal;
  if frmSelectMenu.ModalResult = mrOk then
  begin
    frmSelectMenu.Free;
    frmSelectMenu := Nil;
  end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  if not Assigned(frmCafeSales) then
    begin
      frmCafeSales := TfrmCafeSales.Create(Self);
    end;
    frmCafeSales.Show;
end;

procedure TfrmMain.btnAddCafeClick(Sender: TObject);
begin
  frmAddCafe := TfrmAddCafe.Create(Self);
  frmAddCafe.ShowModal;
  FreeAndNil(frmAddCafe);
end;

procedure TfrmMain.btnAddStaffClick(Sender: TObject);
begin
  frmAddStaff:= TfrmAddStaff.Create(Self);
  frmAddStaff.ShowModal;
  FreeAndNil(frmAddStaff);
end;

procedure TfrmMain.btnMenuSalesClick(Sender: TObject);
begin
  if not Assigned(frmMenuSales) then
    begin
      frmMenuSales := TfrmMenuSales.Create(Self);
    end;
    frmMenuSales.Show;
end;

procedure TfrmMain.btnUpdateStaffClick(Sender: TObject);
begin
  frmUpdateStaff := TfrmUpdateStaff.Create(Self);
  frmUpdateStaff.ShowModal;
  FreeAndNil(frmUpdateStaff);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  frmMain := nil;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);

  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  if frmLogin.ModalResult <> mrOK then
  begin
    //frmLogin.Free;
    frmLogin.Close;
    Application.Terminate;
  end;

  //if FCAFECODE then



end;


procedure TfrmMain.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := '현재 사용자 : ' + FEMPNAME;

  if FCAFECODE <> '01' then
  begin
    btnAddCafe.Enabled := False;
    btnUpdateCafe.Enabled := False;
  end;



end;

procedure TfrmMain.btnUpdateCafeClick(Sender: TObject);
begin
  if not assigned(frmUpdatecafe) then
    frmUpdatecafe := TfrmUpdateCafe.Create(Self);
  frmUpdatecafe.ShowModal;
  if frmUpdatecafe.ModalResult = mrOk then
  begin
    frmUpdatecafe.Free;
    frmUpdatecafe := Nil;
  end;
end;


procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
