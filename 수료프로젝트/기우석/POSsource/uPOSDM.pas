unit uPOSDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.DSConnect, uPOSDatasnap_Client;

type
  TposDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    cdsSalesReport: TClientDataSet;
    SqlServerMethod1: TSqlServerMethod;
    DSProviderConnection2: TDSProviderConnection;
    cdsCafeMenulist: TClientDataSet;
    DSProviderConnection3: TDSProviderConnection;
    cdsSavaSalesDetail: TClientDataSet;
  private
    { Private declarations }

  public
    { Public declarations }
    
  end;

var
  posDM: TposDM;

  FEMPCODE, FEMPNAME, FCAFECODE: String;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



end.
