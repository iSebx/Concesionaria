unit uFrmPropietarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,uFrmAddClientes,
  dxGDIPlusClasses, Vcl.ExtCtrls, Data.DB,  uMessageBoxEx,
  Vcl.DBCtrls, uDMConexion;

type
  TfrmPropietarios = class(TForm)
    pnlTitleBar: TPanel;
    btnClose: TImage;
    grdClientes: TDBGrid;
    btnModify: TButton;
    btnAgregar: TButton;
    btnEliminar: TButton;
    edtBuscar: TEdit;
    imgLupa: TImage;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure grdClientesDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBuscarChange(Sender: TObject);
  private
    procedure ReOpenDBGrid;
  end;

var
  frmPropietarios: TfrmPropietarios;

implementation

{$R *.dfm}

procedure FitGrid(Grid: TDBGrid);
const
  C_Add=3;
var
  ds: TDataSet;
  bm: TBookmark;
  i: Integer;
  w: Integer;
  a: Array of Integer;
begin
  ds := Grid.DataSource.DataSet;
  if Assigned(ds) then
  begin
    ds.DisableControls;
    bm := ds.GetBookmark;
    try
      ds.First;
      SetLength(a, Grid.Columns.Count);
      while not ds.Eof do
      begin
        for I := 0 to Grid.Columns.Count - 1 do
        begin
          if Assigned(Grid.Columns[i].Field) then
          begin
            w :=  Grid.Canvas.TextWidth(ds.FieldByName(Grid.Columns[i].Field.FieldName).DisplayText);
            if a[i] < w  then
               a[i] := w ;
          end;
        end;
        ds.Next;
      end;
      for I := 0 to Grid.Columns.Count - 1 do
        Grid.Columns[i].Width := a[i] + C_Add + 40;
        ds.GotoBookmark(bm);
    finally
      ds.FreeBookmark(bm);
      ds.EnableControls;
    end;
  end;
end;

procedure TfrmPropietarios.ReOpenDBGrid;
begin
  DMConexion.QListarVehiculos.active:=false;
  DMConexion.QListarVehiculos.Active:=true;
  grdClientes.DataSource:= DMConexion.dsClientes;
  FitGrid(grdClientes);
end;

procedure TfrmPropietarios.btnAgregarClick(Sender: TObject);
var
  wdw: TfrmAddClientes;
begin
  wdw:= TfrmAddClientes.Create(self, false);
  wdw.ShowModal;
  if ( wdw.ModalResult = mrOk)
  then begin
    ReOpenDBGrid;
    TfrmMessageBoxEx.create(self, 'Clientes', 'Nuevo cliente ha sido registrado', bm_OnlyOk).ShowModal;
  end;
end;

procedure TfrmPropietarios.btnModifyClick(Sender: TObject);
begin
  if (TfrmAddClientes.Create(self, true).ShowModal = mrOk)
  then begin
    TfrmMessageBoxEx.create(self, 'Clientes', 'Un cliente ha sido modificado', bm_OnlyOk).ShowModal;
    ReOpenDBGrid;
  end;
end;

procedure TfrmPropietarios.edtBuscarChange(Sender: TObject);
begin
  if length(edtBuscar.Text)<>0 then begin
    DMConexion.tblClientes.Filter:=
      'Nombre like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'Apellido like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'DNI like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'Telefono like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'Mail like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'Direccion like '+QuotedStr('*'+edtBuscar.Text+'*');
    DMConexion.tblClientes.Filtered:=true;
  end
  else
    DMConexion.tblClientes.Filtered:= false;
end;

procedure TfrmPropietarios.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPropietarios.btnEliminarClick(Sender: TObject);
begin
  if (TfrmMessageBoxEx.create(self, 'Atencion', 'Esta Seguro que desea Eliminar un Cliente', bm_AcceptCancel).ShowModal=mrOk)
    then
      DMConexion.dsClientes.DataSet.Delete;
end;

procedure TfrmPropietarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmPropietarios.FormCreate(Sender: TObject);
begin
  ReOpenDBGrid;
end;

procedure TfrmPropietarios.grdClientesDblClick(Sender: TObject);
begin
  btnModify.Click;
end;

end.
