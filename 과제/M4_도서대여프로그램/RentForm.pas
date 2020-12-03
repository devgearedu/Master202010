unit RentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFormRent = class(TForm)
    PanelHeader: TPanel;
    PanelContent: TPanel;
    LabelCaption: TLabel;
    ButtonAdd: TButton;
    ButtonClose: TButton;
    PanelGrid: TPanel;
    PanelInput: TPanel;
    Splitter1: TSplitter;
    PanelGridHeader: TPanel;
    DBGridList: TDBGrid;
    Label1: TLabel;
    EditSearch: TEdit;
    CheckBoxSearchBook: TCheckBox;
    CheckBoxSearchUser: TCheckBox;
    GroupBoxUser: TGroupBox;
    GroupBoxBook: TGroupBox;
    ButtonFindUser: TButton;
    GroupBox1: TGroupBox;
    ImageUser: TImage;
    Label2: TLabel;
    DBEditUserName: TDBEdit;
    DBEditUserBirth: TDBEdit;
    Label3: TLabel;
    DBEditUserPhone: TDBEdit;
    Label4: TLabel;
    ButtonFindBook: TButton;
    GroupBox3: TGroupBox;
    ImageBook: TImage;
    Label5: TLabel;
    DBEditBookTitle: TDBEdit;
    Label6: TLabel;
    DBEditBookAuthor: TDBEdit;
    Label7: TLabel;
    DBEditBookPrice: TDBEdit;
    ButtonRent: TButton;
    ButtonReturn: TButton;
    ButtonCancel: TButton;
    DataSourceRent: TDataSource;
    DataSourceRentUser: TDataSource;
    DataSourceRentBook: TDataSource;
    procedure DataSourceRentUserDataChange(Sender: TObject; Field: TField);
    procedure DataSourceRentBookDataChange(Sender: TObject; Field: TField);
    procedure ButtonFindUserClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonFindBookClick(Sender: TObject);
    procedure DataSourceRentStateChange(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonRentClick(Sender: TObject);
    procedure ButtonReturnClick(Sender: TObject);
    procedure EditSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRent: TFormRent;

implementation

{$R *.dfm}

uses DataAccessModule, CommonFunctions, FindUserForm, FindBookForm;

procedure TFormRent.ButtonAddClick(Sender: TObject);
begin
  DataModuleDataAccess.FDQueryRent.Append;
end;

procedure TFormRent.ButtonCancelClick(Sender: TObject);
begin
  DataModuleDataAccess.FDQueryRent.Cancel;
end;

procedure TFormRent.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRent.ButtonFindBookClick(Sender: TObject);
begin
  FormFindBook := TFormFindBook.Create(nil);
  try
    FormFindBook.ShowModal;

    if DataModuleDataAccess.FDQueryRent.State <> dsEdit then
      DataModuleDataAccess.FDQueryRent.Edit;


    DataModuleDataAccess.FDQueryRent.FieldByName('BOOK_SEQ').AsInteger := FormFindBook.SelectedSeq;

  finally
    FormFindBook.Free;
  end;
end;

procedure TFormRent.ButtonFindUserClick(Sender: TObject);
begin
  FormFindUser := TFormFindUser.Create(nil);
  try
    FormFindUser.ShowModal;

    if DataModuleDataAccess.FDQueryRent.State <> dsEdit then
      DataModuleDataAccess.FDQueryRent.Edit;


    DataModuleDataAccess.FDQueryRent.FieldByName('USER_SEQ').AsInteger := FormFindUser.SelectedSeq;

  finally
    FormFindUser.Free;
  end;
end;

procedure TFormRent.ButtonRentClick(Sender: TObject);
var
  UserSeq, BookSeq: Integer;
begin
  UserSeq := DataModuleDataAccess.FDQueryRent.FieldByName('USER_SEQ').AsInteger;
  BookSeq := DataModuleDataAccess.FDQueryRent.FieldByName('BOOK_SEQ').AsInteger;

  DataModuleDataAccess.ExecuteRent(UserSeq, BookSeq, True);
end;

procedure TFormRent.ButtonReturnClick(Sender: TObject);
var
  UserSeq, BookSeq: Integer;
begin
  UserSeq := DataModuleDataAccess.FDQueryRent.FieldByName('USER_SEQ').AsInteger;
  BookSeq := DataModuleDataAccess.FDQueryRent.FieldByName('BOOK_SEQ').AsInteger;

  DataModuleDataAccess.ExecuteRent(UserSeq, BookSeq, False);
end;

procedure TFormRent.DataSourceRentBookDataChange(Sender: TObject;
  Field: TField);
var
  LField: TField;
begin
  if DataModuleDataAccess.FDQueryRentBook.State <> dsBrowse then
    Exit;

  LField := DataModuleDataAccess.FDQueryRentBook.FieldByName('BOOK_IMAGE');

  LoadImageFromBlobField(ImageBook, LField as TBlobField);
end;

procedure TFormRent.DataSourceRentStateChange(Sender: TObject);
var
  State: TDataSetState;
begin
  State := DataModuleDataAccess.FDQueryRent.State;

  ButtonAdd.Enabled := (State = dsBrowse);
  ButtonRent.Enabled := (State <> dsBrowse);
  ButtonReturn.Enabled := (State = dsBrowse);
  ButtonCancel.Enabled := (State <> dsBrowse);

  ButtonFindUser.Enabled := (State <> dsBrowse);
  ButtonFindBook.Enabled := (State <> dsBrowse);


end;

procedure TFormRent.DataSourceRentUserDataChange(Sender: TObject;
  Field: TField);
var
  LField: TField;
begin
  if DataModuleDataAccess.FDQueryRentUser.State <> dsBrowse then
    Exit;

  LField := DataModuleDataAccess.FDQueryRentUser.FieldByName('USER_IMAGE');

  LoadImageFromBlobField(ImageUser, LField as TBlobField);
end;

procedure TFormRent.EditSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if EditSearch.Text <> '' then
  begin
    if CheckBoxSearchBook.Checked then
      Filter := Format('BOOK_TITLE like ''%%%s%%''', [EditSearch.Text]);
    if CheckBoxSearchUser.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ' ;
      Filter := Format('USER_NAME like ''%%%s%%''', [EditSearch.Text]);
    end;
  end;

  DataModuleDataAccess.FDQueryRent.Filter := Filter;
  DataModuleDataAccess.FDQueryRent.Filtered := (Filter <> '');

end;

end.
