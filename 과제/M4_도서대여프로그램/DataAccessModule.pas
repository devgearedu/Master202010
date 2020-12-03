unit DataAccessModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModuleDataAccess = class(TDataModule)
    FDConnectionBookRental: TFDConnection;
    FDQueryBook: TFDQuery;
    FDQueryBookBOOK_SEQ: TIntegerField;
    FDQueryBookBOOK_TITLE: TWideStringField;
    FDQueryBookBOOK_ISBN: TStringField;
    FDQueryBookBOOK_AUTHOR: TWideStringField;
    FDQueryBookBOOK_PRICE: TIntegerField;
    FDQueryBookBOOK_LINK: TWideStringField;
    FDQueryBookBOOK_RENT_YN: TStringField;
    FDQueryBookBOOK_IMAGE: TBlobField;
    FDQueryBookBOOK_DESCRIPTION: TWideMemoField;
    FDQueryBookBOOK_RENT: TStringField;
    FDQueryDuplicatedBook: TFDQuery;
    FDQueryUser: TFDQuery;
    FDQueryUserUSER_SEQ: TIntegerField;
    FDQueryUserUSER_NAME: TWideStringField;
    FDQueryUserUSER_BIRTH: TDateField;
    FDQueryUserUSER_SEX: TStringField;
    FDQueryUserUSER_PHONE: TStringField;
    FDQueryUserUSER_MAIL: TWideStringField;
    FDQueryUserUSER_IMAGE: TBlobField;
    FDQueryUserUSER_REG_DATE: TDateField;
    FDQueryUserUSER_OUT_YN: TStringField;
    FDQueryUserUSER_OUT_DATE: TDateField;
    FDQueryUserUSER_RENT_COUNT: TIntegerField;
    FDQueryUserUSER_SEX_STR: TStringField;
    FDQueryUserUSER_OUT: TStringField;
    FDQueryDuplicatedUser: TFDQuery;
    FDQueryRent: TFDQuery;
    FDQueryRentBook: TFDQuery;
    FDQueryRentUser: TFDQuery;
    DataSourceRent: TDataSource;
    FDUpdateSQLRent: TFDUpdateSQL;
    FDQueryRentBOOK_TITLE: TWideStringField;
    FDQueryRentUSER_NAME: TWideStringField;
    FDQueryRentRENT_SEQ: TIntegerField;
    FDQueryRentUSER_SEQ: TIntegerField;
    FDQueryRentBOOK_SEQ: TIntegerField;
    FDQueryRentRENT_DATE: TDateField;
    FDQueryRentRENT_RETURN_DATE: TDateField;
    FDQueryRentRENT_RETURN_YN: TStringField;
    FDQueryRentRENT_RETURN: TStringField;
    FDQueryRentBookBOOK_SEQ: TIntegerField;
    FDQueryRentBookBOOK_TITLE: TWideStringField;
    FDQueryRentBookBOOK_ISBN: TStringField;
    FDQueryRentBookBOOK_AUTHOR: TWideStringField;
    FDQueryRentBookBOOK_PRICE: TIntegerField;
    FDQueryRentBookBOOK_LINK: TWideStringField;
    FDQueryRentBookBOOK_RENT_YN: TStringField;
    FDQueryRentBookBOOK_IMAGE: TBlobField;
    FDQueryRentBookBOOK_DESCRIPTION: TWideMemoField;
    FDQueryFindUser: TFDQuery;
    FDQueryFindUserUSER_SEQ: TIntegerField;
    FDQueryFindUserUSER_NAME: TWideStringField;
    FDQueryFindUserUSER_BIRTH: TDateField;
    FDQueryFindUserUSER_SEX: TStringField;
    FDQueryFindUserUSER_PHONE: TStringField;
    FDQueryFindUserUSER_MAIL: TWideStringField;
    FDQueryFindUserUSER_IMAGE: TBlobField;
    FDQueryFindUserUSER_REG_DATE: TDateField;
    FDQueryFindUserUSER_OUT_YN: TStringField;
    FDQueryFindUserUSER_OUT_DATE: TDateField;
    FDQueryFindUserUSER_RENT_COUNT: TIntegerField;
    FDQueryFindUserUSER_SEX_STR: TStringField;
    FDQueryFindBook: TFDQuery;
    FDQueryFindBookBOOK_SEQ: TIntegerField;
    FDQueryFindBookBOOK_TITLE: TWideStringField;
    FDQueryFindBookBOOK_ISBN: TStringField;
    FDQueryFindBookBOOK_AUTHOR: TWideStringField;
    FDQueryFindBookBOOK_PRICE: TIntegerField;
    FDQueryFindBookBOOK_LINK: TWideStringField;
    FDQueryFindBookBOOK_RENT_YN: TStringField;
    FDQueryFindBookBOOK_IMAGE: TBlobField;
    FDQueryFindBookBOOK_DESCRIPTION: TWideMemoField;
    FDQueryUpdateBookState: TFDQuery;
    FDQueryUpdateUserRentCount: TFDQuery;
    procedure FDQueryBookCalcFields(DataSet: TDataSet);
    procedure FDQueryUserCalcFields(DataSet: TDataSet);
    procedure FDQueryRentCalcFields(DataSet: TDataSet);
    procedure FDQueryFindUserCalcFields(DataSet: TDataSet);
    procedure FDConnectionBookRentalBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DuplicatedISBN(ASeq, AISBN: string): Boolean;
    function DuplicatedUSER(ASeq: Integer; AName: string; ABirth: TDateTime): Boolean;

    procedure ExecuteRent(AUserSeq, ABookSeq: Integer; ARentYn: Boolean);
  end;

var
  DataModuleDataAccess: TDataModuleDataAccess;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses
  System.StrUtils, System.IOUtils, Vcl.Forms, Vcl.Dialogs;

function TDataModuleDataAccess.DuplicatedISBN(ASeq, AISBN: string): Boolean;
begin
  FDQueryDuplicatedBook.Close;
  FDQueryDuplicatedBook.ParamByName('ISBN').AsString := AISBN;
  FDQueryDuplicatedBook.Open;

  if (FDQueryDuplicatedBook.RecordCount > 0)
    and (FDQueryDuplicatedBook.Fields[0].AsString <> AISBN) then
    Result := True;

end;

function TDataModuleDataAccess.DuplicatedUSER(ASeq: Integer; AName: string;
  ABirth: TDateTime): Boolean;
begin
  Result := False;
  FDQueryDuplicatedUser.Close;
  FDQueryDuplicatedUser.ParamByName('NAME').AsString := AName;
  FDQueryDuplicatedUser.ParamByName('BIRTH').AsDateTime := ABirth;
  FDQueryDuplicatedUser.Open;

  if (FDQueryDuplicatedUser.RecordCount > 0)
    and (FDQueryDuplicatedUser.Fields[0].AsInteger <> ASeq) then
    Result := True;

end;

procedure TDataModuleDataAccess.ExecuteRent(AUserSeq, ABookSeq: Integer;
  ARentYn: Boolean);
begin
  //대여 정보 업데이트
  if ARentYn then
  begin
    //대출
    FDQueryRent.FieldByName('RENT_DATE').AsDateTime := Now;
    FDQueryRent.FieldByName('RENT_RETURN_DATE').AsDateTime := Now + 20;
    FDQueryRent.FieldByName('RENT_RETURN_YN').AsString := 'N';
  end
  else
  begin
    //반납
    if FDQueryRent.State <> dsEdit then
      FDQueryRent.Edit;
    FDQueryRent.FieldByName('RENT_RETURN_DATE').AsDateTime := Now;
    FDQueryRent.FieldByName('RENT_RETURN_YN').AsString := 'Y';
  end;
  FDQueryRent.Post;
  FDQueryRent.Refresh;

  //도서 업데이트
  FDQueryUpdateBookState.ParamByName('RENT_YN').AsString := IfThen(ARentYn, 'Y', 'N');
  FDQueryUpdateBookState.ParamByName('SEQ').AsInteger := ABookSeq;
  FDQueryUpdateBookState.ExecSQL;

  //회원 업데이트
  FDQueryUpdateUserRentCount.ParamByName('SEQ').AsInteger := AUserSeq;
  FDQueryUpdateUserRentCount.ExecSQL;


  //값변화가 있으니 나머지들 리플래쉬
  FDQueryBook.Refresh;
  FDQueryUser.Refresh;

end;

procedure TDataModuleDataAccess.FDConnectionBookRentalBeforeConnect(
  Sender: TObject);
var
  Path: string;
begin
  Path := TPath.GetFullPath('..\');
  Path := TPath.Combine(Path, 'DB');
  Path := TPath.Combine(Path, 'BOOKRENTAL.IB');

  if not TFile.Exists(Path) then
  begin
    ShowMessage(Format('데이터 베이스를 찾을 수 없습니다.(경로: %s', [Path]));
    Application.Terminate;
  end;

  FDConnectionBookRental.Params.Values['Database'] := Path;
end;

procedure TDataModuleDataAccess.FDQueryBookCalcFields(DataSet: TDataSet);
var
  RentYN: string;
begin
  RentYN := FDQueryBook.FieldByName('BOOK_RENT_YN').AsString;
  if RentYN = 'Y' then
    FDQueryBook.FieldByName('BOOK_RENT').AsString := '대여 중'
  else
    FDQueryBook.FieldByName('BOOK_RENT').AsString := '대여 가능';

end;

procedure TDataModuleDataAccess.FDQueryFindUserCalcFields(DataSet: TDataSet);
begin
  if FDQueryFindUserUSER_SEX.AsString = 'M' then
    FDQueryFindUserUSER_SEX_STR.AsString := '남자'
  else
    FDQueryFindUserUSER_SEX_STR.AsString := '여자';

end;

procedure TDataModuleDataAccess.FDQueryRentCalcFields(DataSet: TDataSet);
begin
  if FDQueryRentRENT_RETURN_YN.AsString = 'Y' then
    FDQueryRentRENT_RETURN.AsString := '반납'
  else
    FDQueryRentRENT_RETURN.AsString := '대여';
end;

procedure TDataModuleDataAccess.FDQueryUserCalcFields(DataSet: TDataSet);
begin
  if FDQueryUser.FieldByName('USER_SEX').AsString = 'M' then
    FDQueryUser.FieldByName('USER_SEX_STR').AsString := '남자'
  else
    FDQueryUser.FieldByName('USER_SEX_STR').AsString := '여자';

  if FDQueryUserUSER_OUT_YN.AsString = 'Y' then
    FDQueryUserUSER_OUT.AsString := '탈퇴'
  else
    FDQueryUserUSER_OUT.AsString := '회원';
end;

end.
