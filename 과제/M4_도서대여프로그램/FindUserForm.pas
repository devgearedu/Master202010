unit FindUserForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFormFindUser = class(TForm)
    PanelHeader: TPanel;
    DBGridList: TDBGrid;
    PanelBottom: TPanel;
    Label1: TLabel;
    EditSearch: TEdit;
    CheckBoxSearchName: TCheckBox;
    ButtonSelect: TButton;
    ButtonClose: TButton;
    DataSourceFindUser: TDataSource;
    procedure EditSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonSelectClick(Sender: TObject);
    procedure DBGridListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FSelectedSeq: Integer;

  public
    { Public declarations }
    property SelectedSeq: Integer read FSelectedSeq;
  end;

var
  FormFindUser: TFormFindUser;

implementation

{$R *.dfm}

uses DataAccessModule;

procedure TFormFindUser.ButtonSelectClick(Sender: TObject);
begin
  FSelectedSeq := DataModuleDataAccess.FDQueryFindUser.FieldByName('USER_SEQ').AsInteger;
end;

procedure TFormFindUser.DBGridListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN] then
    ButtonSelect.Click;

end;

procedure TFormFindUser.EditSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';
  if EditSearch.Text <> '' then
  begin
    if CheckBoxSearchName.Checked then
      Filter := Format('USER_NAME like ''%%%s%%''', [EditSearch.Text]);
  end;

  DataModuleDataAccess.FDQueryFindUser.Filter := Filter;
  DataModuleDataAccess.FDQueryFindUser.Filtered := (Filter <> '');

  if Key in [VK_DOWN, VK_RETURN] then
    DBGridList.SetFocus;


end;

end.
