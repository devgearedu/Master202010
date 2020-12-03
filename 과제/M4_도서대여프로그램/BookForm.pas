unit BookForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormBook = class(TForm)
    PanelHeader: TPanel;
    PanelContent: TPanel;
    PanelMain: TPanel;
    PanelInput: TPanel;
    PanelMainHeader: TPanel;
    DBGridBook: TDBGrid;
    LabelCaption: TLabel;
    ButtonAdd: TButton;
    ButtonClose: TButton;
    LabelSearch: TLabel;
    EditSearch: TEdit;
    CheckBoxSearchTitle: TCheckBox;
    CheckBoxSearchAuthor: TCheckBox;
    Label1: TLabel;
    Splitter1: TSplitter;
    DBEditTitle: TDBEdit;
    DBEditISBN: TDBEdit;
    Label2: TLabel;
    DBEditAuthor: TDBEdit;
    Label3: TLabel;
    DBEditPrice: TDBEdit;
    Label4: TLabel;
    DBEditLink: TDBEdit;
    Label5: TLabel;
    ButtonImageClear: TButton;
    ButtonImageLoad: TButton;
    Label6: TLabel;
    DBMemoDescription: TDBMemo;
    ButtonDelete: TButton;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    GroupBox1: TGroupBox;
    ImageBook: TImage;
    DataSourceBook: TDataSource;
    OpenDialogLoadImage: TOpenDialog;
    LabelLink: TLabel;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonImageLoadClick(Sender: TObject);
    procedure ButtonImageClearClick(Sender: TObject);
    procedure DataSourceBookDataChange(Sender: TObject; Field: TField);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure DataSourceBookStateChange(Sender: TObject);
    procedure DBEditISBNExit(Sender: TObject);
    procedure EditSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBook: TFormBook;

implementation

{$R *.dfm}

uses
  DataAccessModule, CommonFunctions, WinAPI.ShellAPI;

procedure TFormBook.ButtonAddClick(Sender: TObject);
begin
  DataModuleDataAccess.FDQueryBook.Append;
  DBEditTitle.SetFocus;
end;

procedure TFormBook.ButtonCancelClick(Sender: TObject);
begin
  DataModuleDataAccess.FDQueryBook.Cancel;
end;

procedure TFormBook.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormBook.ButtonDeleteClick(Sender: TObject);
var
  RentYn, Title, Msg: string;
begin
  RentYn := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_RENT_YN').AsString;
  if RentYn = 'Y' then
  Begin
    ShowMessage('대여 중인 도서는 삭제할 수 없습니다. 도서 반납 후 삭제 가능합니다.');
    Exit;
  End;

  Title := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_TITLE').AsString;
  Msg := Format('[%s] 도서를 삭제하시겠습니까?', [Title]);
  if MessageDlg(Msg, mtInformation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  DataModuleDataAccess.FDQueryBook.Delete;

end;

procedure TFormBook.ButtonImageClearClick(Sender: TObject);
var
  Field: TField;
begin
  ImageBook.Picture.Assign(nil);

  Field := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_IMAGE');
  if DataModuleDataAccess.FDQueryBook.State <> dsEdit then
    DataModuleDataAccess.FDQueryBook.Edit;
  Field.Assign(nil);
end;

procedure TFormBook.ButtonImageLoadClick(Sender: TObject);
var
  Field: TField;
begin
  if OpenDialogLoadImage.Execute then
  begin
    LoadImageFromFile(ImageBook, OpenDialogLoadImage.FileName);

    Field := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_IMAGE');
    SaveImageToBlobField(ImageBook, Field as TBlobField);
  end;
end;

procedure TFormBook.ButtonSaveClick(Sender: TObject);
begin
  if DBEditTitle.Text = '' then
  begin
    ShowMessage('제목을 입력하세요.');
    DBEditTitle.SetFocus;
    Exit;
  end;

  if DBEditAuthor.Text = '' then
  begin
    ShowMessage('저자를 입력하세요.');
    DBEditAuthor.SetFocus;
    Exit;
  end;

  DataModuleDataAccess.FDQueryBook.Post;
  DataModuleDataAccess.FDQueryBook.Refresh;
end;

procedure TFormBook.DataSourceBookDataChange(Sender: TObject; Field: TField);
var
  LField: TField;
begin
  if DataModuleDataAccess.FDQueryBook.State = dsEdit then
    Exit;

  LField := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_IMAGE');
  if LField is TBlobField then
    LoadImageFromBlobField(ImageBook, LField as TBlobField);
end;

procedure TFormBook.DataSourceBookStateChange(Sender: TObject);
var
  State: TDataSetState;
begin
  State := DataModuleDataAccess.FDQueryBook.State;

  ButtonAdd.Enabled := (State = dsBrowse);
  ButtonSave.Enabled := (State <> dsBrowse);
  ButtonCancel.Enabled := (State <> dsBrowse);

  ButtonAdd.Enabled := (State = dsBrowse) and (DataModuleDataAccess.FDQueryBook.RecordCount > 0);
end;

procedure TFormBook.DBEditISBNExit(Sender: TObject);
var
  Seq, ISBN: string;
begin
  Seq := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_SEQ').AsString;
  ISBN := DataModuleDataAccess.FDQueryBook.FieldByName('BOOK_ISBN').AsString;

  if DataModuleDataAccess.FDQueryBook.State = dsBrowse then
    Exit;

  if DataModuleDataAccess.DuplicatedISBN(Seq, ISBN) then
  begin
    ShowMessage('이미 등록된 도서 입니다. (ISBN 중복입니다.)');
    DBEditISBN.Text := '';
    DBEditISBN.SetFocus;
  end;
end;

procedure TFormBook.EditSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if EditSearch.Text <> '' then
  begin
    if CheckBoxSearchTitle.Checked then
      Filter := Format('BOOK_TITLE like ''%%%s%%''', [EditSearch.Text]);
    if CheckBoxSearchAuthor.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ';
      Filter := Filter + Format('BOOK_AUTHOR like ''%%%s%%''', [EditSearch.Text]);
    end;
  end;

  DataModuleDataAccess.FDQueryBook.Filter := Filter;
  DataModuleDataAccess.FDQueryBook.Filtered := (Filter <> '');


end;

procedure TFormBook.LabelLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(DBEditLink.Text), nil, nil, SW_SHOW);
end;

end.
