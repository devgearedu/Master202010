//
// Created by the DataSnap proxy generator.
// 2020-11-24 ¿ÀÈÄ 11:15:36
//

unit uDatasnap_Client;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FAddCafeCommand: TDBXCommand;
    FAddStaffCommand: TDBXCommand;
    FGetCafelistCommand: TDBXCommand;
    FUpdateCafeCommand: TDBXCommand;
    FGetSelectedMenuCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure AddCafe(pcafename: string; pphone: string; pCafemenu: string);
    procedure AddStaff(pcafecode: string; psname: string; pId: string; ppassword: string; pempdate: string; pposition: string; pempyear: Integer);
    function GetCafelist: string;
    procedure UpdateCafe(pCafecode: string; pCafename: string; pPhone: string);
    function GetSelectedMenu(pcafecode: string): string;
  end;

implementation

procedure TServerMethods1Client.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TServerMethods1.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.AddCafe(pcafename: string; pphone: string; pCafemenu: string);
begin
  if FAddCafeCommand = nil then
  begin
    FAddCafeCommand := FDBXConnection.CreateCommand;
    FAddCafeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddCafeCommand.Text := 'TServerMethods1.AddCafe';
    FAddCafeCommand.Prepare;
  end;
  FAddCafeCommand.Parameters[0].Value.SetWideString(pcafename);
  FAddCafeCommand.Parameters[1].Value.SetWideString(pphone);
  FAddCafeCommand.Parameters[2].Value.SetWideString(pCafemenu);
  FAddCafeCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.AddStaff(pcafecode: string; psname: string; pId: string; ppassword: string; pempdate: string; pposition: string; pempyear: Integer);
begin
  if FAddStaffCommand = nil then
  begin
    FAddStaffCommand := FDBXConnection.CreateCommand;
    FAddStaffCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddStaffCommand.Text := 'TServerMethods1.AddStaff';
    FAddStaffCommand.Prepare;
  end;
  FAddStaffCommand.Parameters[0].Value.SetWideString(pcafecode);
  FAddStaffCommand.Parameters[1].Value.SetWideString(psname);
  FAddStaffCommand.Parameters[2].Value.SetWideString(pId);
  FAddStaffCommand.Parameters[3].Value.SetWideString(ppassword);
  FAddStaffCommand.Parameters[4].Value.SetWideString(pempdate);
  FAddStaffCommand.Parameters[5].Value.SetWideString(pposition);
  FAddStaffCommand.Parameters[6].Value.SetInt32(pempyear);
  FAddStaffCommand.ExecuteUpdate;
end;

function TServerMethods1Client.GetCafelist: string;
begin
  if FGetCafelistCommand = nil then
  begin
    FGetCafelistCommand := FDBXConnection.CreateCommand;
    FGetCafelistCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetCafelistCommand.Text := 'TServerMethods1.GetCafelist';
    FGetCafelistCommand.Prepare;
  end;
  FGetCafelistCommand.ExecuteUpdate;
  Result := FGetCafelistCommand.Parameters[0].Value.GetWideString;
end;

procedure TServerMethods1Client.UpdateCafe(pCafecode: string; pCafename: string; pPhone: string);
begin
  if FUpdateCafeCommand = nil then
  begin
    FUpdateCafeCommand := FDBXConnection.CreateCommand;
    FUpdateCafeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUpdateCafeCommand.Text := 'TServerMethods1.UpdateCafe';
    FUpdateCafeCommand.Prepare;
  end;
  FUpdateCafeCommand.Parameters[0].Value.SetWideString(pCafecode);
  FUpdateCafeCommand.Parameters[1].Value.SetWideString(pCafename);
  FUpdateCafeCommand.Parameters[2].Value.SetWideString(pPhone);
  FUpdateCafeCommand.ExecuteUpdate;
end;

function TServerMethods1Client.GetSelectedMenu(pcafecode: string): string;
begin
  if FGetSelectedMenuCommand = nil then
  begin
    FGetSelectedMenuCommand := FDBXConnection.CreateCommand;
    FGetSelectedMenuCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSelectedMenuCommand.Text := 'TServerMethods1.GetSelectedMenu';
    FGetSelectedMenuCommand.Prepare;
  end;
  FGetSelectedMenuCommand.Parameters[0].Value.SetWideString(pcafecode);
  FGetSelectedMenuCommand.ExecuteUpdate;
  Result := FGetSelectedMenuCommand.Parameters[1].Value.GetWideString;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FAddCafeCommand.DisposeOf;
  FAddStaffCommand.DisposeOf;
  FGetCafelistCommand.DisposeOf;
  FUpdateCafeCommand.DisposeOf;
  FGetSelectedMenuCommand.DisposeOf;
  inherited;
end;

end.

