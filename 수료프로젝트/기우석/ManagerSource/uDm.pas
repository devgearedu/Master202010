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
    dspSalesTotal: TDSProviderConnection;
    cdsUpdateStaffonwork: TWideStringField;
    DSProviderConnection4: TDSProviderConnection;
    cdsSalesList: TClientDataSet;
    cdsUpdateCafeclosed: TWideStringField;
    cdsUpdateCafeclosed_yn: TWideStringField;
    cdsSalesTotal: TClientDataSet;
    dspSalesTotalByCafe: TDSProviderConnection;
    cdsSalesTotalByCafe: TClientDataSet;
    cdsSalesTotalsdate: TWideStringField;
    cdsSalesTotalsalesum: TFloatField;
    cdsSalesTotalByCafesdate: TWideStringField;
    cdsSalesTotalByCafesalesum: TFloatField;
    ㅇㅇㅇㅇㅇ: TStringField;
    procedure cdsUpdateStaffCalcFields(DataSet: TDataSet);
    procedure cdsSalesTotalsdateGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsSalesTotalByCafesdateGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

  FEMPCODE, FEMPNAME, FCAFECODE: String;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.cdsSalesTotalByCafesdateGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  sDate: string;
begin
  sDate := TField(Sender).AsString;
  Text := Copy(sDate, 1, 4) + '-'
          + Copy(sDate, 5, 2) + '-'
          + Copy(sDate, 7, 2);

  DisplayText := True;
end;

procedure TDM.cdsSalesTotalsdateGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  sDate: string;
begin
  sDate := TField(Sender).AsString;
  Text := Copy(sDate, 1, 4) + '-'
          + Copy(sDate, 5, 2) + '-'
          + Copy(sDate, 7, 2);

  DisplayText := True;
end;

procedure TDM.cdsUpdateStaffCalcFields(DataSet: TDataSet);
begin
  if DM.cdsUpdateStaff.FieldByName('position').AsString = '0' then
    DM.cdsUpdateStaff.FieldByName('position_name').AsString := '본사'
  else if DM.cdsUpdateStaff.FieldByName('position').AsString = '1' then
    DM.cdsUpdateStaff.FieldByName('position_name').AsString := '점주'
  else
    DM.cdsUpdateStaff.FieldByName('position_name').AsString := '점원';

  if DM.cdsUpdateStaff.FieldByName('onwork').AsString = '1' then
    DM.cdsUpdateStaff.FieldByName('onwork_yn').AsString := '재직'
  else if DM.cdsUpdateStaff.FieldByName('onwork').AsString = '0' then
    DM.cdsUpdateStaff.FieldByName('onwork_yn').AsString := '퇴사';

end;

end.
