program DelphiAutos;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  uMessageBoxEx in 'uMessageBoxEx.pas' {frmMessageBoxEx},
  uFrmPropietarios in 'Vistas\Propietarios\uFrmPropietarios.pas' {frmPropietarios},
  uFrmAddClientes in 'Vistas\Propietarios\uFrmAddClientes.pas' {frmAddClientes},
  uFrmVehiculos in 'Vistas\Vehiculos\uFrmVehiculos.pas' {frmVehiculos},
  uFrmAddVehiculos in 'Vistas\Vehiculos\uFrmAddVehiculos.pas' {FrmAddVehiculos},
  uDMConexion in 'Conexion\uDMConexion.pas' {DMConexion: TDataModule},
  uFrmMarcaMod in 'Vistas\MarcaMod\uFrmMarcaMod.pas' {frmMarcaMod},
  uFrmAgregarMarcaMod in 'Vistas\MarcaMod\uFrmAgregarMarcaMod.pas' {frmAgregarMarcaMod},
  uValidator in 'Validador\uValidator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMConexion, DMConexion);
  Application.Run;
end.
