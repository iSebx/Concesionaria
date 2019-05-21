unit uConnection;

interface

uses
  ADODB, INIFiles, SysUtils;

type

  TConexion = Class
    private
      conexion: TADOConnection;
      function GetStringConnectionFromINIFile: String;
    public
      strConexion: String;
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
  strConexion:= conexion.ConnectionString;
  conexion.LoginPrompt:= false;
end;

function TConexion.GetStringConnectionFromINIFile: String;
var
  iniFile: TIniFile;
  strConnection: String;
begin
  strConnection:= '';
  if (FileExists(ExtractFilePath(ParamStr(0))+'\Connection.ini')) then
  begin
    iniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'\Connection.ini');
    StrConnection:= 'Provider=SQLNCLI11.1;Integrated Security=SSPI;'+
                    'Persist Security Info=False;User ID="";'+
                    'Initial Catalog='+ iniFile.ReadString('DATABASE','DBName','')+ ';Data '+
                    'Source='+iniFile.ReadString('SERVER','ServerName','')+';'+
                    'Initial File Name="";Server SPN=""';
  end;
  result:= strConnection;
end;

function TConexion.CloseConnection: TADOConnection;
begin
  conexion.Close;
  result:= conexion;
end;

function TConexion.OpenConnection: TADOConnection;
begin
  conexion.Connected:=true;
  conexion.Open('','');
  result:= conexion;
end;

end.
