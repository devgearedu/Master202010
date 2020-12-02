unit MenuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.Buttons, uPOSDatasnap_Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GridPanel1: TGridPanel;
    ToolBar1: TToolBar;
    btnOne: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    ImageList1: TImageList;
    btbtnAllCancel: TToolButton;
    tbbtnCash: TToolButton;
    tbbtnCredit: TToolButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    sgMenuList: TStringGrid;
    Panel9: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnCoffee: TBitBtn;
    btnCake: TBitBtn;
    gpCoffeegrid: TGridPanel;
    gpCakegrid: TGridPanel;
    pnlSales: TPanel;
    edtSales: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCoffeeClick(Sender: TObject);
    procedure btnCakeClick(Sender: TObject);
    procedure CreateCoffeeButtonGrid(const rowCount, colCount: integer);
    procedure CreateCakeButtonGrid(const rowCount, colCount: integer);
    procedure MenuButtonClick(Sender : TObject);
    procedure tbbtnCreditClick(Sender: TObject);
    procedure btbtnAllCancelClick(Sender: TObject);
  private
    { Private declarations }
    cafeClass: TServerMethods1Client;
    function GetSum: Integer;
    procedure gridinit;
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uPOSDM, MainForm;

procedure TfrmMenu.MenuButtonClick(Sender : TObject);
var
  iTag, I : integer;
  sMenuCode : string;
  sMenuName : string;
  sPrice : string;
  iRow, iCount, iPrice: Integer;
  blExist: Boolean;
begin
  blExist := False;
  iTag := TButton(Sender).Tag;
  sMenuCode := Format('%.3d', [iTag]);

  if sMenuCode[1] = '0' then
  begin
    sMenuName := frmMain.stlCoffeeMenuname.Values[sMenuCode];
    sPrice := frmMain.stlCoffeeMenuprice.Values[sMenuCode];
  end else if sMenuCode[1] = '1' then
  begin
    sMenuName := frmMain.stlCakeMenuname.Values[sMenuCode];
    sPrice := frmMain.stlCakeMenuprice.Values[sMenuCode];
  end;

  if sgMenuList.RowCount = 1 then
  begin
    iRow := sgMenuList.RowCount + 1;
    sgMenuList.RowCount := iRow;
    sgMenuList.Cells[0, iRow - 1] := sMenucode;
    sgMenuList.Cells[1, iRow - 1] := sMenuName;
    sgMenuList.Cells[2, iRow - 1] := '1';
    sgMenuList.Cells[3, iRow - 1] := sPrice;
    sgmenuList.Cells[4, iRow - 1] := sPrice;
  end else
  begin
    for I := 1 to sgMenuList.RowCount - 1 do
    begin
      if sgMenuList.Cells[0, I] = sMenucode then
      begin
        iCount := StrToInt(sgMenuList.Cells[2, I]) + 1;
        sgMenuList.Cells[2, I] := IntToStr(iCount);
        iPrice := StrToInt(sgmenuList.Cells[3, I]) + StrToInt(sPrice);
        sgMenuList.Cells[3, I] := IntToStr(iPrice);
        blExist := True;
        Break;
      end;
    end;

    if not blExist then
    begin
      iRow := sgMenuList.RowCount + 1;
      sgMenuList.RowCount := iRow;
      sgMenuList.Cells[0, iRow - 1] := sMenucode;
      sgMenuList.Cells[1, iRow - 1] := sMenuName;
      sgMenuList.Cells[2, iRow - 1] := '1';
      sgMenuList.Cells[3, iRow - 1] := sPrice;
      sgMenuList.Cells[4, iRow - 1] := sPrice;
    end;

  end;

  pnlSales.Caption := IntToStr(GetSum);

  //ShowMessage(sMenuName + '  ' + sPrice + ' 원');
end;


procedure TfrmMenu.tbbtnCreditClick(Sender: TObject);
var
  sDate, sTime, sSlipno: string;
  I: integer;
begin
  sDate := FormatDateTime('yyyymmdd', Date);
  sTime := FormatDateTime('hhmmss', Now);

  sSlipno := cafeClass.SaveSales(sDate, sTime, FCAFECODE, '01', StrToCurr(pnlSales.Caption));

  for I := 1 to sgMenuList.RowCount - 1 do
  begin
    posDM.cdsSavaSalesDetail.Close;
    posDM.cdsSavaSalesDetail.ParamByName('cafecode').AsString := FCAFECODE;
    posDM.cdsSavaSalesDetail.ParamByName('slipno').AsString := sSlipno;
    posDM.cdsSavaSalesDetail.ParamByName('seq').AsString := Format('%.2d', [I]);
    posDM.cdsSavaSalesDetail.ParamByName('menucode').AsString := sgMenuList.Cells[0, I];
    posDM.cdsSavaSalesDetail.ParamByName('unitprice').AsInteger := StrToInt(sgMenuList.Cells[4, I]);
    posDM.cdsSavaSalesDetail.ParamByName('count').AsInteger := StrToInt(sgMenuList.Cells[2, I]);
    posDM.cdsSavaSalesDetail.ParamByName('menutotal').AsCurrency := StrToCurr(sgMenuList.Cells[3, I]);
    posDM.cdsSavaSalesDetail.Execute;
  end;

  if TToolButton(Sender) = tbbtnCredit then
  begin
    ShowMessage('카드결제 되었습니다.');
    pnlSales.Caption := '';
  end
  else if TToolButton(Sender) = tbbtnCash then
  begin
    ShowMessage('현금결제 되었습니다.');
    pnlSales.Caption := '';
  end;

  gridinit;

end;

procedure TfrmMenu.CreateCoffeeButtonGrid(const rowCount, colCount: integer);
var
  i : integer;
  aButton: TButton;
  sMenu : string;
begin
  gpCoffeegrid.RowCollection.BeginUpdate;
  gpCoffeegrid.ColumnCollection.BeginUpdate;

  for i := 0 to -1 + gpCoffeegrid.ControlCount do
    gpCoffeegrid.Controls[0].Free;

  //btw, cannot clear if there are controls, so first remove "old" controls above
  gpCoffeegrid.RowCollection.Clear;
  gpCoffeegrid.ColumnCollection.Clear;

  for i := 1 to rowCount do
    with gpCoffeegrid.RowCollection.Add do
    begin
      SizeStyle := ssPercent;
      Value := 100 / rowCount; //have cells evenly distributed
    end;

  for i := 1 to colCount do
    with gpCoffeegrid.ColumnCollection.Add do
    begin
      SizeStyle := ssPercent;
      Value := 100 / colCount; //have cells evenly distributed
    end;

  if True then


  for i := 0 to rowCount * colCount - 1 do
  begin
    aButton := TButton.Create(self);
    aButton.Parent := gpCoffeegrid; //magic: place in the next empty cell
    if i > frmMain.stlCoffeeMenuname.Count - 1 then
    begin
      aButton.Visible := False;
    end else
    begin
      aButton.Visible := true;
      sMenu := frmMain.stlCoffeeMenuname.Strings[i];
      aButton.Caption := Copy(sMenu, 5, 100);
      aButton.Tag := StrToInt(Copy(sMenu, 1, 3));
    end;
    aButton.Align := alClient;
    aButton.AlignWithMargins := true;
    aButton.OnClick := MenuButtonClick;
  end;


  gpCoffeegrid.RowCollection.EndUpdate;
  gpCoffeegrid.ColumnCollection.EndUpdate;
end;

procedure TfrmMenu.CreateCakeButtonGrid(const rowCount, colCount: integer);
var
  i : integer;
  aButton: TButton;
  sMenu : string;
begin
  gpCakegrid.RowCollection.BeginUpdate;
  gpCakegrid.ColumnCollection.BeginUpdate;

  for i := 0 to -1 + gpCakegrid.ControlCount do
    gpCakegrid.Controls[0].Free;

  //btw, cannot clear if there are controls, so first remove "old" controls above
  gpCakegrid.RowCollection.Clear;
  gpCakegrid.ColumnCollection.Clear;

  for i := 1 to rowCount do
    with gpCakegrid.RowCollection.Add do
    begin
      SizeStyle := ssPercent;
      Value := 100 / rowCount; //have cells evenly distributed
    end;

  for i := 1 to colCount do
    with gpCakegrid.ColumnCollection.Add do
    begin
      SizeStyle := ssPercent;
      Value := 100 / colCount; //have cells evenly distributed
    end;

  if True then


  for i := 0 to -1 + rowCount * colCount do
  begin
    aButton := TButton.Create(self);
    aButton.Parent := gpCakegrid; //magic: place in the next empty cell
    if i > frmMain.stlCakeMenuname.Count - 1 then
    begin
      aButton.Visible := False;
    end else
    begin
      aButton.Visible := true;
      sMenu := frmMain.stlCakeMenuname.Strings[i];
      aButton.Caption := Copy(sMenu, 5, 100);
      aButton.Tag := StrToInt(Copy(sMenu, 1, 3));
    end;
    //aButton.Caption := 'Btn ' + IntToStr(i);
    aButton.Align := alClient;
    aButton.AlignWithMargins := true;
    aButton.OnClick := MenuButtonClick;
  end;


  gpCakegrid.RowCollection.EndUpdate;
  gpCakegrid.ColumnCollection.EndUpdate;
end;

procedure TfrmMenu.btbtnAllCancelClick(Sender: TObject);
begin
  gridinit;
  pnlSales.Caption := '';
end;

procedure TfrmMenu.btnCakeClick(Sender: TObject);
begin
  pageControl1.ActivePage := tabsheet2;
end;

procedure TfrmMenu.btnCoffeeClick(Sender: TObject);
begin
  pageControl1.ActivePage := tabsheet1;
end;


procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmMenu := nil;
end;

procedure TfrmMenu.gridinit;
begin
  sgMenuList.RowCount := 1;
  sgMenuList.ColWidths[0] := 50;
  sgMenuList.ColWidths[1] := 120;
  sgMenuList.ColWidths[2] := 50;
  sgMenuList.ColWidths[3] := 100;
  sgMenuList.ColWidths[4] := 1;

  sgMenuList.Cells[0,0] := '코드';
  sgMenuList.Cells[1,0] := '메뉴';
  sgMenuList.Cells[2,0] := '수량';
  sgMenuList.Cells[3,0] := '가격';
  sgMenuList.Cells[4,0] := '단가';
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  gridinit;

  PageControl1.ActivePage := TabSheet1;

  cafeClass := TServerMethods1Client.Create(posDM.SQLConnection1.DBXConnection);

  gpCoffeegrid.Caption := '';
  gpCakegrid.Caption := '';

  CreateCoffeeButtonGrid(3,5);
  CreateCakeButtonGrid(3,5);
end;


function TfrmMenu.GetSum: Integer;
var
  I, Sum: Integer;
begin
  Sum := 0;
  for I := 1 to sgMenuList.RowCount - 1 do
    Sum := Sum + StrToInt(sgMenuList.Cells[3, I]);

  Result := Sum;
end;











end.
