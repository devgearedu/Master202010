unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider;

type
  TServerMethods1 = class(TDSServerModule)
    FDConnection1: TFDConnection;
    qryAddCafe: TFDQuery;
    qryAddEmp: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCafeseq: TFDQuery;
    qryEmpseq: TFDQuery;
    qryGetCafelist: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    tbStaff: TFDTable;
    DataSetProvider2: TDataSetProvider;
    tbStaffempcode: TWideStringField;
    tbStaffempdate: TWideStringField;
    tbStaffid: TWideStringField;
    tbStaffpassword: TWideStringField;
    tbStaffposition: TWideStringField;
    tbStaffcafecode: TWideStringField;
    tbStaffnyear: TIntegerField;
    tbStaffnseq: TIntegerField;
    tbStaffsname: TWideStringField;
    qryCafe: TFDQuery;
    qryCafecafecode: TWideStringField;
    qryCafecafename: TWideStringField;
    qryCafephone: TWideStringField;
    qryCafepposition: TWideStringField;
    qryCafesname: TWideStringField;
    qryUpdatecafe: TFDQuery;
    qrySelectMenu: TFDQuery;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure AddCafe(pcafename, pphone, pCafemenu: string);
    procedure AddStaff(pcafecode, psname, pId, ppassword, pempdate, pposition: string; pempyear: integer);
    function GetCafelist: string;
    procedure UpdateCafe(pCafecode, pCafename, pPhone: string);
    function GetSelectedMenu(pcafecode: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, MainUnit;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TServerMethods1.UpdateCafe(pCafecode, pCafename, pPhone: string);
begin
  qryUpdatecafe.Close;
  qryUpdatecafe.ParamByName('cafecode').AsString := pCafecode;
  qryUpdatecafe.ParamByName('cafename').AsString := pCafename;
  qryUpdatecafe.ParamByName('phone').AsString := pPhone;
  qryUpdatecafe.ExecSQL;
end;

procedure TServerMethods1.AddCafe(pcafename, pphone, pCafemenu: string);
var
  cafecode: string;
  sSEQ: string;
begin
  qryCafeseq.Close;
  qryCafeseq.SQL.Clear;
  qryCafeseq.SQL.Add('select ifnull(max(cafecode), ''0'') code from cafe');
  qryCafeseq.Open;
  sSEQ := qryCafeseq.FieldByName('code').AsString;
  cafecode := format('%.2d',[StrToInt(sSEQ) + 1]);


  qryAddCafe.Close;
  qryAddCafe.ParamByName('cafecode').AsString := cafecode;
  qryAddCafe.ParamByName('cafename').AsString := pcafename;
  qryAddCafe.ParamByName('phone').AsString := pphone;
  qryAddCafe.ParamByName('cafemenu').AsString := pCafemenu;
  qryAddCafe.ExecSQL;

end;

procedure TServerMethods1.AddStaff(pcafecode, psname, pId, ppassword, pempdate, pposition: string; pempyear: integer);
var
  empcode: string;
  seq: Integer;
begin
  qryEmpseq.Close;
  qryEmpseq.SQL.Clear;
  qryEmpseq.SQL.Add('select ifnull(max(nseq), 0) empcode from staff');
  qryEmpseq.SQL.Add('where nyear = :pyear');
  qryEmpseq.ParamByName('pyear').AsInteger := pempyear;
  qryEmpseq.Open;
  seq := qryEmpseq.FieldByName('empcode').AsInteger + 1;
  empcode := IntToStr(pempyear) + format('%.3d', [seq]);

  qryAddEmp.Close;
  qryAddEmp.ParamByName('id').AsString := pId;
  qryAddEmp.ParamByName('password').AsString := ppassword;
  qryAddEmp.ParamByName('sname').AsString := psname;
  qryAddEmp.ParamByName('empcode').AsString := empcode;
  qryAddEmp.ParamByName('empdate').AsString := pempdate;
  qryAddEmp.ParamByName('position').AsString := pposition;
  qryAddEmp.ParamByName('cafecode').AsString := pcafecode;
  qryAddEmp.ParamByName('nyear').AsInteger := pempyear;
  qryAddEmp.ParamByName('nseq').AsInteger := seq;
  qryAddEmp.ExecSQL;
end;



procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  if not FDConnection1.Connected then
    FDConnection1.Connected := True;
end;

function TServerMethods1.GetCafelist: string;
var
  str : string;
  sCode, sName: string;
begin
  str := '';
  qryGetCafelist.Close;
  qryGetCafelist.Open;
  while not qryGetCafelist.EOF do
  begin
    sCode := qryGetCafelist.FieldByName('cafecode').AsString;
    sName := qryGetCafelist.FieldByName('cafename').AsString;
    str := str + sCode + ' ' + sName+':';
    qryGetCafelist.Next;
  end;
  str := Copy(str, 1, Length(str)-1);
  Result := str;
end;


function TServerMethods1.GetSelectedMenu(pcafecode: string): string;
begin
  Result := '';
  qrySelectMenu.Close;
  qrySelectmenu.ParamByName('cafecode').AsString := pcafecode;
  qrySelectMenu.Open;
  if qrySelectMenu.RecordCount > 0 then
    Result := qrySelectMenu.FieldByName('cafemenu').AsString;
end;

end.

