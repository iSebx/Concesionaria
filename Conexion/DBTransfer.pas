unit DBTransfer;

interface
uses
  DB, ADODB, uConnection;

  type

  TDBTransfer = class
    public
      function ListarPropietarios: TDataSource; overload;
      procedure ListarPropietarios (var ADataSource: TDataSource); overload;
      procedure ListarVehiculos (var ADataSource: TDataSource);
  end;

implementation

{ TDBTransfer }

function TDBTransfer.ListarPropietarios: TDataSource;
var
  ADOQuery: TADOQuery;
  DataSrc: TDataSource;
  cnx: TConexion;
begin
  ADOQuery:= TADOQuery.Create(nil);
  cnx:= TConexion.Create;
  ADOQuery.Connection:= cnx.OpenConnection;
  ADOQuery.SQL.Add('select * from vehiculos');
  ADOQuery.Active:=true;

  DataSrc:= TDataSource.Create(nil);
  DataSrc.DataSet:= ADOQuery;
  DataSrc.Enabled:= true;

  result:= DataSrc;
end;

procedure TDBTransfer.ListarPropietarios (var ADataSource: TDataSource);
var
  ADOQuery: TADOQuery;
  cnx: TConexion;
begin
  ADOQuery:= TADOQuery.Create(nil);
  cnx:= TConexion.Create;
  ADOQuery.Connection:= cnx.OpenConnection;
  ADOQuery.SQL.Add('select * from propietarios');
  ADOQuery.Active:=true;

  ADataSource.DataSet:= ADOQuery;
  ADataSource.Enabled:= TRUE;
end;

procedure TDBTransfer.ListarVehiculos (var ADataSource: TDataSource);
var
  ADOQuery: TADOQuery;
  cnx: TConexion;
begin
  ADOQuery:= TADOQuery.Create(nil);
  cnx:= TConexion.Create;
  ADOQuery.Connection:= cnx.OpenConnection;
  ADOQuery.SQL.Add('select VehiculoID [ID], ma.Nombre [Marca], m.nombre [Modelo], v.Color [Color], v.Tipo [Tipo], v.KM [Kilometros], v.Precio [Valor], p.Nombre+'' ''+p.Apellido [Propietario]');
  ADOQuery.SQL.Add('from Vehiculos as v Inner Join modelos as m on (m.ModID=v.ModID)');
  ADOQuery.SQL.Add('					Inner Join Marcas as ma on (m.MarcaID=ma.MarcaID)');
  ADOQuery.SQL.Add('					Left Join Propietarios as p on (v.PropID=p.PropID)');

  ADOQuery.Active:=true;

  ADataSource.DataSet:= ADOQuery;
  ADataSource.Enabled:= TRUE;
end;

end.
