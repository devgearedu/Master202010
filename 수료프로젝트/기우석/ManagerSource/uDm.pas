unit uDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FMTBcd, Datasnap.DBClient, Datasnap.DSConnect;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    cdsUpdateCafe: TClientDataSet;
    SqlServerMethod1: TSqlServerMethod;
    cdsUpdateStaff: TClientDataSet;
    DSProviderConnection2: TDSProviderConnection;
    cdsUpdateStaffempcode: TWideStringField;
    cdsUpdateStaffempdate: TWideStringField;
    cdsUpdateStaffid: TWideStringField;
    cdsUpdateStaffpassword: TWideStringField;
    cdsUpdateStaffposition: TWideStringField;
    cdsUpdateStaffcafecode: TWideStringField;
    cdsUpdateStaffnyear: TIntegerField;
    cdsUpdateStaffnseq: TIntegerField;
    cdsUpdateStaffsname: TWideStringField;
    cdsUpdateStaffposition_name: TStringField;
    cdsUpdateCafecafecode: TWideStringField;
    cdsUpdateCafecafename: TWideStringField;
    cdsUpdateCafephone: TWideStringField;
    cdsUpdateCafepposition: TWideStringField;
    cdsUpdateCafesname: TWideStringField;
    procedure cdsUpdateStaffCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.cdsUpdateStaffCalcFields(DataSet: TDataSet);
begin
  if DM.cdsUpdateStaff.FieldByName('position').AsString = '0' then
    DM.cdsUpdateStaff.FieldByName('position_name').AsString := '본사'
  else if DM.cdsUpdateStaff.FieldByName('position').AsString = '1' then
    DM.cdsUpdateStaff.FieldByName('position_name').AsString := '점주'
  else
    DM.cdsUpdateStaff.FieldByName('position_name').AsString := '점원';
end;

end.
