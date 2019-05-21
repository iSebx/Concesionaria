unit uFrmAddClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, Data.DB, uDMConexion, uValidator;

type
  TfrmAddClientes = class(TForm)
    pnlTitleBar: TPanel;
    btnClose: TImage;
    edtNombre: TDBEdit;
    lblNombre: TLabel;
    lblApellido: TLabel;
    edtApellido: TDBEdit;
    lblDNI: TLabel;
    edtDNI: TDBEdit;
    edtTelefono: TDBEdit;
    lblTelefono: TLabel;
    lblMail: TLabel;
    edtMail: TDBEdit;
    lblDireccion: TLabel;
    edtDireccion: TDBEdit;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure pnlTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    Fmoving: boolean;
    FValidator: TValidator;
  public
    Constructor Create (aOwner: TComponent; isModify: boolean);
  end;


var
  frmAddClientes: TfrmAddClientes;

implementation

{$R *.dfm}

Constructor TfrmAddClientes.Create (aOwner: TComponent; isModify: boolean);
begin
  inherited Create(aOwner);
  FValidator:= TValidator.Create;
  FValidator.Silent:=false;
  if isModify
  then begin
    pnlTitleBar.Caption:= 'Modificar Cliente';
    DMConexion.dsClientes.DataSet.Edit;
  end else begin
    pnlTitleBar.Caption:= 'Nuevo Cliente';
    DMConexion.dsClientes.DataSet.Insert;
  end;
end;

procedure TfrmAddClientes.btnAceptarClick(Sender: TObject);
begin
  try
    edtNombre.Color:= CL_INVALID;
    edtNombre.Text:= FValidator.Validate(edtNombre.Text, [vtNotNull, vtNonSpecialChars]);
    edtNombre.Color:= CL_VALID;

    edtApellido.Color:= CL_INVALID;
    edtApellido.Text:= FValidator.Validate(edtApellido.Text, [vtNotNull, vtNonSpecialChars]);
    edtApellido.Color:= CL_VALID;

    edtDNI.Color:= CL_INVALID;
    edtDNI.Text:= FValidator.Validate(edtDNI.Text, [vtNotNull]);
    edtDNI.Color:= CL_VALID;

    edtTelefono.Color:=CL_INVALID;
    edtTelefono.Text:= FValidator.Validate(edtTelefono.Text, [vtNotNull]);
    edtTelefono.Color:=CL_VALID;

    edtMail.Color:=CL_INVALID;
    edtMail.Text:= FValidator.Validate(edtMail.Text, []);
    edtMail.Color:= CL_VALID;

    edtDireccion.Color:=CL_INVALID;
    edtDireccion.Text:= FValidator.Validate(edtDireccion.Text, [vtNotNull]);
    edtDireccion.Color:=CL_VALID;

    DMConexion.dsClientes.DataSet.Post;
    ModalResult:= mrOk;
  except
    on e: ValidatorExceptionNotNull do
      ShowMessage('Algunos Valores aun son Nulos');
  end;
end;

procedure TfrmAddClientes.btnCancelarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmAddClientes.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddClientes.pnlTitleBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= true;
end;

procedure TfrmAddClientes.pnlTitleBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMoving then begin
    Self.Left:= Mouse.CursorPos.X - (self.Width div 2);
    self.Top:= Mouse.CursorPos.Y - (pnlTitleBar.Height div 2);
  end;
end;

procedure TfrmAddClientes.pnlTitleBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoving:=false
end;

end.
