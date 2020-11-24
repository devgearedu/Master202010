unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmMain = class(TForm)
    pnlHead: TPanel;
    btnClose: TBitBtn;
    btnMenuSales: TBitBtn;
    btnAddStaff: TBitBtn;
    btnUpdateCafe: TBitBtn;
    btnLogin: TBitBtn;
    btnUpdateStaff: TBitBtn;
    btnAddCafe: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMenuSalesClick(Sender: TObject);
    procedure btnAddStaffClick(Sender: TObject);
    procedure btnUpdateCafeClick(Sender: TObject);
    procedure btnUpdateStaffClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnAddCafeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses MenuSalesForm, UpdatecafeForm, AddstaffForm, LoginForm,
  UpdateStaffForm, AddCafeForm, SelectMenuForm;

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

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  FreeAndNil(frmLogin);
end;

procedure TfrmMain.btnUpdateStaffClick(Sender: TObject);
begin
  frmUpdateStaff := TfrmUpdateStaff.Create(Self);
  frmUpdateStaff.ShowModal;
  FreeAndNil(frmUpdateStaff);
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
  Close;
end;

end.
