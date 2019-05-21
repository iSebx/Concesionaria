unit uFrmMarcaMod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, uDMConexion, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons, uFrmAgregarMarcaMod;

type
  TfrmMarcaMod = class(TForm)
    pnlTitleBar: TPanel;
    btnClose: TImage;
    grdMarcaMod: TDBGrid;
    edtBuscar: TEdit;
    imgLupa: TImage;
    btnAgregar: TButton;
    btnModify: TButton;
    btnEliminar: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAgregarModeloClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure grdMarcaModDblClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
  private
    procedure RecargarTabla;
  end;

var
  frmMarcaMod: TfrmMarcaMod;

implementation

{$R *.dfm}

procedure TfrmMarcaMod.btnAgregarClick(Sender: TObject);
begin
  if (TfrmAgregarMarcaMod.Create(self, ta_Agregar).ShowModal=mrOk) then
    RecargarTabla;
end;

procedure TfrmMarcaMod.btnAgregarModeloClick(Sender: TObject);
begin
  if (TfrmAgregarMarcaMod.Create(self, ta_Agregar).ShowModal=mrOk) then
    RecargarTabla;
end;

procedure TfrmMarcaMod.RecargarTabla;
begin
  DMConexion.QListarModelos.Active:=false;
  DMConexion.QListarModelos.Active:=true;
  grdMarcaMod.DataSource.DataSet.Last;
end;

procedure TfrmMarcaMod.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMarcaMod.btnEliminarClick(Sender: TObject);
var
  modeloID: Integer;
begin
  modeloID:= grdMarcaMod.DataSource.DataSet.FieldByName('ID').AsInteger;
  DMConexion.BorrarModelo(modeloID);
  RecargarTabla;
end;

procedure TfrmMarcaMod.btnModifyClick(Sender: TObject);
begin
  if (TfrmAgregarMarcaMod.Create(self, ta_Modificar).ShowModal=mrOk) then
    RecargarTabla;
end;

procedure TfrmMarcaMod.edtBuscarChange(Sender: TObject);
begin
  if length(edtBuscar.Text)<>0 then begin
    DMConexion.QListarModelos.Filter:=
      'Marca like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'Modelo like '+QuotedStr('*'+edtBuscar.Text+'*');
    DMConexion.QListarModelos.Filtered:=true;
  end
  else
    DMConexion.QListarModelos.Filtered:= false;
end;

procedure TfrmMarcaMod.grdMarcaModDblClick(Sender: TObject);
begin
  btnModify.Click;
end;

end.
