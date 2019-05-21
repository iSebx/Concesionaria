unit uFrmAgregarMarcaMod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, UDMConexion, Vcl.Mask;

type
  TTipoAccion = (ta_Agregar, ta_Modificar);
  TfrmAgregarMarcaMod = class(TForm)
    pnlTitleBar: TPanel;
    btnClose: TImage;
    btnAceptar: TBitBtn;
    BitBtn1: TBitBtn;
    pnlModificar: TPanel;
    lblModificarMarca: TLabel;
    lbModificarlModelo: TLabel;
    pnlAgregar: TPanel;
    lblAgregarMarca: TLabel;
    lblAgregarModelo: TLabel;
    edtNombreModelo: TEdit;
    cbAgregarMarca: TComboBox;
    edtModificarMarca: TDBEdit;
    DBEdit1: TDBEdit;
    procedure pnlTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    fMoving: boolean;
    fTipoAccion: TTipoAccion;
    fActualMarcaID: Integer;
    procedure CargarMarcasEnCB;
    procedure PrepararFrmAgregar;
    procedure PrepararFrmModificar;
    procedure AgregarMarcaMod;
  public
    Constructor Create (AOwner: TComponent; ATipo: TTipoAccion);
  end;

var
  frmAgregarMarcaMod: TfrmAgregarMarcaMod;

implementation

{$R *.dfm}
type
  TData = class
    private
      FValue : Integer;
    public
      constructor Create(aValue: Integer);
    published
      property Value: Integer read FValue;
  end;

constructor TData.Create(aValue: Integer);
begin
  FValue:= aValue;
end;

procedure TfrmAgregarMarcaMod.PrepararFrmAgregar;
begin
  pnlModificar.Visible:= false;
  pnlAgregar.Visible:= true;
  pnlTitleBar.Caption:= 'Agregar Marca/Modelo';
  CargarMarcasEnCB;
end;

procedure TfrmAgregarMarcaMod.PrepararFrmModificar;
begin
  pnlModificar.Visible:= true;
  pnlAgregar.Visible:= false;
  pnlTitleBar.Caption:= 'Modificar Marca/Modelo';
end;

procedure TfrmAgregarMarcaMod.AgregarMarcaMod;
var
  id: Integer;
begin
  if (cbAgregarMarca.ItemIndex<>-1)
    then begin
      id:= TData(cbAgregarMarca.Items.Objects[cbAgregarMarca.ItemIndex]).Value;
      DMConexion.AgregarModelo(id, edtNombreModelo.Text);
    end else begin
      DMConexion.AgregarMarcaModelo(cbAgregarMarca.Text, edtNombreModelo.Text);
    end;
end;

procedure TfrmAgregarMarcaMod.btnAceptarClick(Sender: TObject);
begin
  if fTipoAccion = ta_Agregar
  then
    AgregarMarcaMod
  else
    DMConexion.dsListarModelos.DataSet.Post;
end;

procedure TfrmAgregarMarcaMod.btnCloseClick(Sender: TObject);
begin
  Close;
end;

Constructor TfrmAgregarMarcaMod.Create (AOwner: TComponent; ATipo: TTipoAccion);
begin
  inherited create(aOwner);
  Self.fTipoAccion:= ATipo;
  if ATipo=ta_Agregar
    then
      PrepararFrmAgregar
    else
      PrepararFrmModificar;
end;

procedure TfrmAgregarMarcaMod.CargarMarcasEnCB;
begin
  cbAgregarMarca.Clear;
  DMConexion.dsMarcas.DataSet.First;
  while not DMConexion.dsMarcas.DataSet.Eof do
    with DMConexion.dsMarcas do begin
      cbAgregarMarca.AddItem(DataSet.FieldByName('Nombre').Value, TData.Create(DataSet.FieldByName('MarcaID').Value));
      DataSet.Next;
    end;
  cbAgregarMarca.ItemIndex:=0;
end;

procedure TfrmAgregarMarcaMod.pnlTitleBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  fMoving:= true;
end;

procedure TfrmAgregarMarcaMod.pnlTitleBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if fMoving
  then begin
    Self.Left := Mouse.CursorPos.X - (self.Width div 2);
    self.Top  := Mouse.CursorPos.Y - (Self.pnlTitleBar.Height div 2);
  end;
end;

procedure TfrmAgregarMarcaMod.pnlTitleBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  fMoving:= false
end;

procedure TfrmAgregarMarcaMod.SpeedButton1Click(Sender: TObject);
begin
  CargarMarcasEnCB;
end;

end.
