unit FindBookForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFormFindBook = class(TForm)
    PanelHeader: TPanel;
    Label1: TLabel;
    EditSearch: TEdit;
    CheckBoxSearchTitle: TCheckBox;
    DBGridList: TDBGrid;
    PanelBottom: TPanel;
    ButtonSelect: TButton;
    ButtonClose: TButton;
    DataSourceFindBook: TDataSource;
    CheckBoxSearchAuthor: TCheckBox;
    procedure EditSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonSelectClick(Sender: TObject);
  private
    { Private declarations }
    FSelectedSeq: Integer;
  public
    { Public declarations }
     property SelectedSeq: Integer read FSelectedSeq;
  end;

var
  FormFindBook: TFormFindBook;

implementation

{$R *.dfm}

uses DataAccessModule;

procedure TFormFindBook.ButtonSelectClick(Sender: TObject);
begin
  FSelectedSeq := DataModuleDataAccess.FDQueryFindBook.FieldByName('BOOK_SEQ').AsInteger;
end;

procedure TFormFindBook.DBGridListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN] then
    ButtonSelect.Click;
end;

procedure TFormFindBook.EditSearchKeyUp(Sender: TObject; var Key: Word;
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

  DataModuleDataAccess.FDQueryFindBook.Filter := Filter;
  DataModuleDataAccess.FDQueryFindBook.Filtered := (Filter <> '');

  if Key in [VK_DOWN, VK_RETURN] then
    DBGridList.SetFocus;

end;
end.
