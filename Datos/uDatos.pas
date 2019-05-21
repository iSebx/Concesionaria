unit uDatos;

interface

type

  TPropietarios = class
  private
    fID: Integer;
    fDireccion: String;
    fApellido: String;
    fDNI: String;
    fTelefono: String;
    fMail: String;
    fNombre: String;
    procedure SetID(const Value: Integer);
    procedure SetApellido(const Value: String);
    procedure setDireccion(const Value: String);
    procedure setDNI(const Value: String);
    procedure setMail(const Value: String);
    procedure SetNombre(const Value: String);
    procedure setTelefono(const Value: String);
  public
    constructor Create(aID: integer);
  published
    property ID: Integer      read fID        write SetID;
    property Nombre: String   read fNombre    write SetNombre;
    Property Apellido: String read fApellido  write SetApellido;
    Property DNI: String      read fDNI       write setDNI;
    Property Telefono: String read fTelefono  write setTelefono;
    Property Mail:String      read fMail      write setMail;
    Property Direccion:String read fDireccion write setDireccion;
  end;
implementation

{ TPropietarios }

constructor TPropietarios.Create(aID: integer);
begin
  ///Falta Implementacion
end;

procedure TPropietarios.SetApellido(const Value: String);
begin
  fApellido := Value;
end;

procedure TPropietarios.setDireccion(const Value: String);
begin
  fDireccion := Value;
end;

procedure TPropietarios.setDNI(const Value: String);
begin
  fDNI := Value;
end;

procedure TPropietarios.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TPropietarios.setMail(const Value: String);
begin
  fMail := Value;
end;

procedure TPropietarios.SetNombre(const Value: String);
begin
  fNombre := Value;
end;

procedure TPropietarios.setTelefono(const Value: String);
begin
  fTelefono := Value;
end;

end.
