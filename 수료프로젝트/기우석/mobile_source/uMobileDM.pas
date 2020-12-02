unit uMobileDM;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.DSConnect, Data.DB, Data.SqlExpr, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient;

type
  TMobileDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SqlServerMethod1: TSqlServerMethod;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MobileDM: TMobileDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
