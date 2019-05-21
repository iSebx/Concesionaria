unit uConnection;

interface

uses
  ADODB, INIFiles, SysUtils;

type

  TConexion = Class
    private
      conexion: TADOConnection;
      strConexion: String;
      function GetStringConnectionFromINIFile: String;
    public
      constructor Create;
      function OpenConnection: TADOConnection;
      function CloseConnection: TADOConnection;
  End;

implementation

{ TConexion }

constructor TConexion.Create;
begin
  conexion:= TADOConnection.Create(nil);
  conexion.ConnectionString:= GetStringConnectionFromINIFile;
end;

function TConexion.CloseConnection: TADOConnection;
begin
  conexion.Close;
  result:= conexion;
end;

function TConexion.OpenConnection: TADOConnection;
begin
  conexion.Open('','');
  result:=conexion;
end;


function TConexion.GetStringConnectionFromINIFile: String;
var
  iniFile: TIniFile;
  strConnection: String;
  DBName: String;
  Server: String;
begin
  strConnection:= '';
  if (FileExists(ExtractFilePath(ParamStr(0))+'\Connection.ini')) then
  begin
    iniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'\Connection.ini');

    DBName:= iniFile.ReadString('DATABASE','DBName','');
    Server:= iniFile.ReadString('SERVER','ServerName','');

    StrConnection:= 'Provider=SQLNCLI11.1;Integrated Security=SSPI;'+
                    'Persist Security Info=False;User ID="";'+
                    'Initial Catalog='+DBName+ ';Data '+
                    'Source='+Server+';'+
                    'Initial File Name="";Server SPN=""';
  end;
  result:= strConnection;
end;

end.
