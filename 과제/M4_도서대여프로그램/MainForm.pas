unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TFrmMain = class(TForm)
    ToolBarMainMenu: TToolBar;
    PanelLayout: TPanel;
    ToolButtonMenuRent: TToolButton;
    ToolButtonMenuBook: TToolButton;
    ToolButtonMenuUser: TToolButton;
    ToolButton4: TToolButton;
    ToolButtonMenuClose: TToolButton;
    ImageListToolbar: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    c1: TMenuItem;
    F1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StyleMenu: TMenuItem;
    procedure ToolButtonMenuCloseClick(Sender: TObject);
    procedure ToolButtonMenuBookClick(Sender: TObject);
    procedure ToolButtonMenuUserClick(Sender: TObject);
    procedure ToolButtonMenuRentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure c1Click(Sender: TObject);
  private
    { Private declarations }
    procedure StyleClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  BookForm, UserForm, RentForm, Vcl.Themes;

procedure TFrmMain.c1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  Style: string;
  Item: TMenuItem;

begin
   //Add child menu items based on available styles.
  for Style in TStyleManager.StyleNames do
  begin
    Item := TMenuItem.Create(StyleMenu);
    Item.Caption := Style;
    Item.OnClick := StyleClick;
    if TStyleManager.ActiveStyle.Name = Style then
      Item.Checked := true;
    StyleMenu.Add(Item);
  end;
end;

procedure TFrmMain.StyleClick(Sender: TObject);
var
  StyleName: String;
  i: Integer;
begin
  //get style name
  StyleName := StringReplace(TMenuItem(Sender).Caption, '&', '',
    [rfReplaceAll, rfIgnoreCase]);
  //set active style
  TStyleManager.SetStyle(StyleName);
  //check the currently selected menu item
  (Sender as TMenuItem).Checked := true;
  //uncheck all other style menu items
  for I := 0 to StyleMenu.Count -1 do begin
    if not StyleMenu.Items[i].Equals(Sender) then
      StyleMenu.Items[i].Checked := false;
  end;
end;

procedure TFrmMain.ToolButtonMenuBookClick(Sender: TObject);
begin
  if not Assigned(FormBook) then
    FormBook := TFormBook.Create(Self);
  FormBook.Parent := PanelLayout;
  FormBook.BorderStyle := bsNone;
  FormBook.Align := alClient;
  FormBook.Show;

end;

procedure TFrmMain.ToolButtonMenuCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.ToolButtonMenuRentClick(Sender: TObject);
begin
  if not Assigned(FormRent) then
    FormRent := TFormRent.Create(Self);
  FormRent.Parent := PanelLayout;
  FormRent.BorderStyle := bsNone;
  FormRent.Align := alClient;
  FormRent.Show;
end;

procedure TFrmMain.ToolButtonMenuUserClick(Sender: TObject);
begin
  if not Assigned(FormUser) then
    FormUser := TFormUser.Create(Self);
  FormUser.Parent := PanelLayout;
  FormUser.BorderStyle := bsNone;
  FormUser.Align := alClient;
  FormUser.Show;
end;

end.
