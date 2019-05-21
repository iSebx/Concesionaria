unit uDMConexion;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, INIFiles, Dialogs, uMessageBoxEx;

type
  TDMConexion = class(TDataModule)
    Conexion: TADOConnection;
    dsClientes: TDataSource;
    dsVehiculos: TDataSource;
    tblClientes: TADOTable;
    tblVehiculos: TADOTable;
    QListarVehiculos: TADOQuery;
    tblVehiculosVehiculoID: TAutoIncField;
    tblVehiculosModID: TIntegerField;
    tblVehiculosTipo: TStringField;
    tblVehiculosColor: TStringField;
    tblVehiculosKM: TIntegerField;
    tblVehiculosPropID: TIntegerField;
    tblVehiculosPrecio: TBCDField;
    spAgregarModelo: TADOStoredProc;
    spAgregarMarcaModelo: TADOStoredProc;
    tblMarcas: TADOTable;
    tblModelos: TADOTable;
    dsMarcas: TDataSource;
    dsModelos: TDataSource;
    QListarModelos: TADOQuery;
    dsListarModelos: TDataSource;
    QListarModelosID: TAutoIncField;
    QListarModelosMarca: TStringField;
    QListarModelosModelo: TStringField;
    spBorrarMarcaMod: TADOStoredProc;
    spNombreToIDMarca: TADOStoredProc;
    tblClientesPropID: TAutoIncField;
    tblClientesNombre: TStringField;
    tblClientesApellido: TStringField;
    tblClientesDNI: TStringField;
    tblClientesTelefono: TStringField;
    tblClientesMail: TStringField;
    tblClientesDireccion: TStringField;
    QListarVehiculosID: TAutoIncField;
    QListarVehiculosMarca: TStringField;
    QListarVehiculosModelo: TStringField;
    QListarVehiculosColor: TStringField;
    QListarVehiculosTipo: TStringField;
    QListarVehiculosKilometros: TIntegerField;
    QListarVehiculosValor: TBCDField;
    QListarVehiculosPropietario: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  public
    procedure AgregarModelo(AMarcaID: integer; ANombreModelo: String);
    procedure AgregarMarcaModelo (ANombreMarca: String; ANombreModelo: String);
    procedure BorrarModelo (AModeloID: Integer);
    function NombreToIdMarca (ANombreMarca: String): integer;
  end;

var
  DMConexion: TDMConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConexion.AgregarModelo(AMarcaID: integer; ANombreModelo: String);
begin
  with spAgregarModelo do begin
    Parameters.Refresh;
    Parameters.ParamByName('@MarcaID').Value:= AMarcaID;
    Parameters.ParamByName('@ModeloNombre').Value:= ANombreModelo;
    ExecProc;
  end;
end;

procedure TDMConexion.BorrarModelo (AModeloID: Integer);
begin
  with spBorrarMarcaMod do begin
    Parameters.Refresh;
    Parameters.ParamByName('@_ModeloID').Value:=AModeloID;
    ExecProc;
  end;
end;

procedure TDMConexion.DataModuleCreate(Sender: TObject);
var
  LiniFile : TIniFile;
  LStrConnection : string;
begin
  try
    LiniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\..\..\Connection.ini');;
    LStrConnection := 'Provider=SQLNCLI11.1;Integrated Security=SSPI;'+
                      'Persist Security Info=False;User ID='+LiniFile.ReadString('USERNAME', 'Username', '')+';'+
                      'Initial Catalog='+ LiniFile.ReadString('DATABASE','DBName','')+ ';Data '+
                      'Source='+LiniFile.ReadString('SERVER','ServerName','')+';'+
                      'Initial File Name="";Server SPN=""';
    Conexion.ConnectionString := LStrConnection;
    tblClientes.Active:=true;
    tblVehiculos.Active:=true;
    tblModelos.Active:=true;
    tblMarcas.Active:=true;
    QListarVehiculos.Active:=true;
    QListarModelos.Active:=true;
  Except
    on e : Exception do
      TfrmMessageBoxEx.create(nil, 'ERROR DE CONEXCION', 'Un Problema ha ocurrido durante la conexion', bm_OnlyOk).ShowModal;
  end;
end;

procedure TDMConexion.AgregarMarcaModelo (ANombreMarca: String; ANombreModelo: String);
begin
  with spAgregarMarcaModelo do begin
    Parameters.Refresh;
    Parameters.ParamByName('@MarcaNombre').Value:= ANombreMarca;
    Parameters.ParamByName('@ModeloNombre').Value:= ANombreModelo;
    ExecProc;
  end;
end;

function TDMConexion.NombreToIdMarca (ANombreMarca: String): integer;
var
  resultado: Integer;
begin
  with spNombreToIDMarca do begin
    Parameters.Refresh;
    Parameters.ParamByName('@_Nombre').Value:= ANombreMarca;
    Parameters.ParamByName('@_MarcaID').Value:= resultado;
    ExecProc;
    resultado:= FieldByName('@_MarcaID').AsInteger;
  end;
end;

end.
