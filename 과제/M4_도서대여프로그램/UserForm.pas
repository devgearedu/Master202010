unit UserForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.WinXCalendars, Vcl.Mask;

type
  TFormUser = class(TForm)
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
    CheckBoxSearchName: TCheckBox;
    CheckBoxSearchPhone: TCheckBox;
    Label2: TLabel;
    DBEditName: TDBEdit;
    Label3: TLabel;
    CalendarPickerBirth: TCalendarPicker;
    DBRadioGroupSex: TDBRadioGroup;
    Label4: TLabel;
    DBEditPhone: TDBEdit;
    Label5: TLabel;
    DBEditMail: TDBEdit;
    GroupBox1: TGroupBox;
    ButtonClearImage: TButton;
    ButtonLoadImage: TButton;
    ImageUser: TImage;
    OpenDialogLoadImage: TOpenDialog;
    ButtonDelete: TButton;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    DataSourceUser: TDataSource;
    procedure ButtonLoadImageClick(Sender: TObject);
    procedure ButtonClearImageClick(Sender: TObject);
    procedure DataSourceUserDataChange(Sender: TObject; Field: TField);
    procedure CalendarPickerBirthCloseUp(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure DataSourceUserStateChange(Sender: TObject);
    procedure DBEditNameExit(Sender: TObject);
    procedure EditSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function DuplicatedUser: Boolean;
  public
    { Public declarations }
  end;

var
  FormUser: TFormUser;

implementation

{$R *.dfm}

uses DataAccessModule, CommonFunctions;

procedure TFormUser.ButtonAddClick(Sender: TObject);
begin
  DataModuleDataAccess.FDQueryUser.Append;
  DBEditName.SetFocus;

end;

procedure TFormUser.ButtonCancelClick(Sender: TObject);
begin
  DataModuleDataAccess.FDQueryUser.Cancel;
end;

procedure TFormUser.ButtonClearImageClick(Sender: TObject);
var
  Field: TField;
begin
  ImageUser.Picture.Assign(nil);

  Field := DataModuleDataAccess.FDQueryUser.FieldByName('USER_IMAGE');
  if DataModuleDataAccess.FDQueryUser.State <> dsEdit then
    DataModuleDataAccess.FDQueryUser.Edit;
  Field.Assign(nil);
end;

procedure TFormUser.ButtonDeleteClick(Sender: TObject);
var
  RentCount: Integer;
  Name, Msg, OutYn: string;
begin
  RentCount := DataModuleDataAccess.FDQueryUser.FieldByName('USER_RENT_COUNT').AsInteger;
  Name := DataModuleDataAccess.FDQueryUser.FieldByName('USER_NAME').AsString;
  OutYn := DataModuleDataAccess.FDQueryUser.FieldByName('USER_OUT_YN').AsString;

  if OutYn = 'Y' then
  begin
    ShowMessage('이미 탈퇴한 회원입니다.');
    Exit;
  end;


  if RentCount > 0 then
  begin
    ShowMessage(Format('현재 대여중인 도서가 %d권 있습니다. 반납 후 탈퇴 가능합니다.', [RentCount]));
    Exit;
  end;

  Msg := Format('정말로 [%s]님의 탈퇴 처리하시겠습니까?', [Name]);
  if MessageDlg(Msg, mtInformation, [mbYes, mbNo], 0) = mrNo  then
    Exit;


  if DataModuleDataAccess.FDQueryUser.State <> dsEdit then
    DataModuleDataAccess.FDQueryUser.Edit;
  DataModuleDataAccess.FDQueryUser.Edit;
  DataModuleDataAccess.FDQueryUser.FieldByName('USER_OUT_YN').AsString := 'Y';
  DataModuleDataAccess.FDQueryUser.FieldByName('USER_OUT_DATE').AsDateTime := Now;
  DataModuleDataAccess.FDQueryUser.Post;
  DataModuleDataAccess.FDQueryUser.Refresh;



end;

procedure TFormUser.ButtonLoadImageClick(Sender: TObject);
var
  Field: TField;
begin
  if OpenDialogLoadImage.Execute then
  begin
    LoadImageFromFile(ImageUser, OpenDialogLoadImage.FileName);

    Field := DataModuleDataAccess.FDQueryUser.FieldByName('USER_IMAGE');
    SaveImageToBlobField(ImageUser, Field as TBlobField);
  end;

end;

procedure TFormUser.ButtonSaveClick(Sender: TObject);
begin
  if DBEditName.Text = '' then
  begin
    ShowMessage('이름을 입력하세요.');
    DBEditName.SetFocus;
    Exit;
  end;

  if CalendarPickerBirth.IsEmpty then
  begin
    ShowMessage('생년월일을 입력하세요.');
    CalendarPickerBirth.SetFocus;
    Exit;
  end;

  DataModuleDataAccess.FDQueryUser.Post;
  DataModuleDataAccess.FDQueryUser.Refresh;
end;

procedure TFormUser.CalendarPickerBirthCloseUp(Sender: TObject);
var
  Field: TField;
begin
  Field := DataModuleDataAccess.FDQueryUser.FieldByName('USER_BIRTH');

  if Field.AsDateTime <> CalendarPickerBirth.Date then
  begin
    if DataModuleDataAccess.FDQueryUser.State = dsBrowse then
    begin
      if DataModuleDataAccess.FDQueryUser.RecNo > 0 then
        DataModuleDataAccess.FDQueryUser.Edit
      else
        DataModuleDataAccess.FDQueryUser.Append;
    end;
    if CalendarPickerBirth.IsEmpty then
      Field.Assign(nil)
    else
      Field.AsDateTime := CalendarPickerBirth.Date;
  end;

  DuplicatedUser;
end;

procedure TFormUser.DataSourceUserDataChange(Sender: TObject; Field: TField);
var
  LField: TField;
begin
  if DataModuleDataAccess.FDQueryUser.State = dsEdit then
    Exit;

  LField := DataModuleDataAccess.FDQueryUser.FieldByName('USER_IMAGE');
  LoadImageFromBlobField(ImageUser, LField as TBlobField);

  LField := DataModuleDataAccess.FDQueryUser.FieldByName('USER_BIRTH');
  if LField.AsDateTime = 0 then
    CalendarPickerBirth.IsEmpty := True
  else
    CalendarPickerBirth.Date := LField.AsDateTime;

end;

procedure TFormUser.DataSourceUserStateChange(Sender: TObject);
var
  State: TDataSetState;

begin
  State := DataModuleDataAccess.FDQueryUser.State;

  ButtonAdd.Enabled := (State = dsBrowse);
  ButtonSave.Enabled := (State <> dsBrowse);
  ButtonDelete.Enabled := (State = dsBrowse);
  ButtonCancel.Enabled := (State <> dsBrowse);

end;

procedure TFormUser.DBEditNameExit(Sender: TObject);
begin
  DuplicatedUser;
end;

function TFormUser.DuplicatedUser: Boolean;
var
  Seq: Integer;
  Name: string;
  Birth: TDateTime;
begin
  Seq := DataModuleDataAccess.FDQueryUser.FieldByName('USER_SEQ').AsInteger;
  Name := DataModuleDataAccess.FDQueryUser.FieldByName('USER_NAME').AsString;
  Birth := DataModuleDataAccess.FDQueryUser.FieldByName('USER_BIRTH').AsDateTime;

  if (Name = '') or (Birth = 0) then
    Exit;

  if DataModuleDataAccess.DuplicatedUSER(Seq, Name, Birth) then
    ShowMessage('이미 등록된 회원입니다. (이름, 생년월일 중복)');


end;

procedure TFormUser.EditSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';
  if EditSearch.Text <> '' then
  begin
    if CheckBoxSearchName.Checked then
      Filter := Format('USER_NAME like ''%%%s%%''', [EditSearch.Text]);
    if CheckBoxSearchPhone.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ';
      Filter := Filter + Format('USER_PHONE like ''%%%s%%''', [EditSearch.Text]);
    end;
  end;

  DataModuleDataAccess.FDQueryUser.Filter := Filter;
  DataModuleDataAccess.FDQueryUser.Filtered := (Filter <> '');
end;

end.
