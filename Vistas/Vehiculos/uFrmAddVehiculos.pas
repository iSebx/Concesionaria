unit uFrmAddVehiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, DB, Bde.DBTables,
  Data.Win.ADODB, UDMConexion, uFrmAddClientes, uFrmAgregarMarcaMod;

type

  TFrmAddVehiculos = class(TForm)
    pnlTitleBar: TPanel;
    btnClose: TImage;
    lblCapID: TLabel;
    lblID: TDBText;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAgregarModelo: TImage;
    btnAgregarCliente: TImage;
    QModelos: TADOQuery;
    deModelos: TDataSource;
    QMarcas: TADOQuery;
    dsMarcas: TDataSource;
    lblModelo: TLabel;
    lblTipo: TLabel;
    edtTipo: TDBEdit;
    lblColor: TLabel;
    edtColor: TDBEdit;
    lblPrecio: TLabel;
    edtPrecio: TDBEdit;
    lblCliente: TLabel;
    cbModelos: TDBLookupComboBox;
    lblMarca: TLabel;
    cbMarcas: TDBLookupComboBox;
    lblKM: TLabel;
    edtKM: TDBEdit;
    cbCliente: TDBLookupComboBox;
    dsClientes: TDataSource;
    QClientes: TADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure pnlTitleBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbMarcasClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAgregarClienteClick(Sender: TObject);
    procedure btnAgregarModeloClick(Sender: TObject);
  private
    Fmoving: Boolean;
 //   FDataSource: TDataSource;
  public
    Constructor Create (aOwner: TComponent; isModify:Boolean);
  end;

var
  FrmAddVehiculos: TFrmAddVehiculos;

implementation

{$R *.dfm}

Constructor TFrmAddVehiculos.Create (aOwner: TComponent; isModify:Boolean);
begin
  inherited create(aOwner);
  if isModify=false
  then begin
    pnlTitleBar.Caption:='Nuevo Vehiculo';
    lblCapID.Visible:=false;
    lblID.Visible:=false;
    DMConexion.dsVehiculos.DataSet.Insert
  end else begin
    pnlTitleBar.Caption:='Modificar Vehiculo';
    lblCapID.Visible:=true;
    lblID.Visible:=true;
    DMConexion.dsVehiculos.DataSet.Edit;
  end;
end;

procedure TFrmAddVehiculos.btnAgregarModeloClick(Sender: TObject);
begin
  if TfrmAgregarMarcaMod.Create(self, ta_Agregar).ShowModal=mrOk
  then begin
    QModelos.Active:= false;
    QMarcas.Active:= false;
    QModelos.Active:= true;
    QMarcas.Active:= true;
    cbModelos.ListSource.DataSet.Refresh;
    cbMarcas.DataSource.DataSet.Refresh;
    cbMarcas.ListSource.DataSet.Refresh;
    DMConexion.dsVehiculos.DataSet.Insert;
  end;
end;

procedure TFrmAddVehiculos.btnAgregarClienteClick(Sender: TObject);
begin
  if TfrmAddClientes.Create(self, false).ShowModal = mrOk
  then begin
    QClientes.Active:= false;
    QClientes.Active:= true;
    cbCliente.ListSource.DataSet.Refresh;
  end;
end;

procedure TFrmAddVehiculos.btnAceptarClick(Sender: TObject);
begin

  DMConexion.dsVehiculos.DataSet.Post;
end;

procedure TFrmAddVehiculos.btnCancelarClick(Sender: TObject);
begin
  DMConexion.dsVehiculos.DataSet.Cancel;
end;

procedure TFrmAddVehiculos.btnCloseClick(Sender: TObject);
begin
  DMConexion.dsVehiculos.DataSet.Cancel;
  Close;
end;

procedure TFrmAddVehiculos.cbMarcasClick(Sender: TObject);
var
  str: String;
  keyValue: String;
begin
  with QModelos do begin
    keyValue:= VarToStr(cbMarcas.KeyValue);
    sql.Clear;
    str:='select * from Modelos '+'where MarcaID='+ keyValue;
    sql.Add(str);
    ExecSQL;
    Active:=true;
  end;
end;

procedure TFrmAddVehiculos.pnlTitleBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= true;
end;

procedure TFrmAddVehiculos.pnlTitleBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMoving then begin
    Self.Left:= Mouse.CursorPos.X - (Self.Width div 2);
    self.Top:= Mouse.CursorPos.Y - (pnlTitleBar.Height div 2);
  end;
end;

procedure TFrmAddVehiculos.pnlTitleBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= false;
end;

end.
