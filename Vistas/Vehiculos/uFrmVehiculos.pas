unit uFrmVehiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,  uFrmAddVehiculos, uDMConexion,
  Vcl.DBCtrls, UMessageBoxEx;

type
  TfrmVehiculos = class(TForm)
    pnlTitleBar: TPanel;
    btnClose: TImage;
    imgLupa: TImage;
    edtBuscar: TEdit;
    grdVehiculos: TDBGrid;
    btnAgregar: TButton;
    btnModify: TButton;
    btnEliminar: TButton;
    dsDetalleVehiculo: TDataSource;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdVehiculosDblClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
  private
    procedure ReOpenDBGrid;
  end;

var
  frmVehiculos: TfrmVehiculos;

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

procedure TfrmVehiculos.ReOpenDBGrid;
begin
  DMConexion.QListarVehiculos.active:=false;
  DMConexion.QListarVehiculos.Active:=true;
  grdVehiculos.DataSource:= dsDetalleVehiculo;
  FitGrid(grdVehiculos);
end;

procedure TfrmVehiculos.btnAgregarClick(Sender: TObject);
begin
  if TFrmAddVehiculos.Create(self, false).ShowModal=mrOk
    then
      ReOpenDBGrid;
end;

procedure TfrmVehiculos.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVehiculos.btnEliminarClick(Sender: TObject);
begin
  DMConexion.dsVehiculos.DataSet.First;
  while DMConexion.dsVehiculos.DataSet.Fields[0].AsInteger<>grdVehiculos.Fields[0].AsInteger do
    DMConexion.dsVehiculos.DataSet.Next;
  if (TfrmMessageBoxEx.create(self,'Atencion!','Esta Seguro que desea eliminar el Registro', bm_AcceptCancel).ShowModal=mrOk)
  then begin
    DMConexion.dsVehiculos.DataSet.Delete;
    ReOpenDBGrid;
  end;
end;

procedure TfrmVehiculos.btnModifyClick(Sender: TObject);
begin
  DMConexion.dsVehiculos.DataSet.First;
  while DMConexion.dsVehiculos.DataSet.Fields[0].AsInteger<>grdVehiculos.Fields[0].AsInteger do
    DMConexion.dsVehiculos.DataSet.Next;
  if (TFrmAddVehiculos.Create(self, true).ShowModal= mrOk)
    then
      ReOpenDBGrid;
end;

procedure TfrmVehiculos.edtBuscarChange(Sender: TObject);
begin
  if length(edtBuscar.Text)<>0 then begin
    DMConexion.QListarVehiculos.Filter:=
      'Marca like '+QuotedStr('*'+edtBuscar.Text+'*')+ ' or ' +
      'Modelo like '+QuotedStr('*'+edtBuscar.Text+'*') + ' or ' +
      'Color like '+QuotedStr('*'+edtBuscar.Text+'*') + ' or ' +
      'Tipo like '+QuotedStr('*'+edtBuscar.Text+'*');
    DMConexion.QListarVehiculos.Filtered:=true;
  end
  else
    DMConexion.QListarVehiculos.Filtered:= false;
end;

procedure TfrmVehiculos.FormCreate(Sender: TObject);
begin
  ReOpenDBGrid;
end;

procedure TfrmVehiculos.FormResize(Sender: TObject);
begin
  ReOpenDBGrid;
end;

procedure TfrmVehiculos.grdVehiculosDblClick(Sender: TObject);
begin
  btnModify.Click;
end;
end.
