unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, uMessageBoxEX,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, uFrmPropietarios, uFrmVehiculos, uFrmMarcaMod,
  Vcl.Imaging.jpeg;

type
  TfrmMain = class(TForm)
    pnlTitleBar: TPanel;
    pnlMenuBar: TPanel;
    pnlFrmContainer: TPanel;
    sbInfo: TStatusBar;
    btnClose: TImage;
    tmrMenu: TTimer;
    btnMenu: TImage;
    btnClientes: TBitBtn;
    tmrDateTime: TTimer;
    lblHour: TLabel;
    lblDate: TLabel;
    btnVehiculos: TBitBtn;
    btnMarcasMod: TBitBtn;
    imgLogo: TImage;
    procedure tmrMenuTimer(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure pnlTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnClientesClick(Sender: TObject);
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure btnVehiculosClick(Sender: TObject);
    procedure btnMarcasModClick(Sender: TObject);
  private
    FMoving: Boolean;
    FMenuHide: Boolean;
    FFormShowing: TForm;
    procedure DestruirFormularioActivo;
    procedure AssignarFormularioActivo (var wdw:TForm);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnClientesClick(Sender: TObject);
var
  wdw: TfrmPropietarios;
begin
  wdw:= TfrmPropietarios.Create(pnlFrmContainer);
  wdw.Parent:= pnlFrmContainer;
  wdw.Align:= alClient;
  DestruirFormularioActivo;
  AssignarFormularioActivo(TForm(wdw));
  wdw.Show;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  if (TfrmMessageBoxEx.create(self, 'Atencion', 'Esta seguro que desea Salir?', bm_AcceptCancel).ShowModal=mrOk)
    then
      Application.Terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  pnlMenuBar.Width:=0;
  FMoving:= false;
  FMenuHide:= true;
end;

procedure TfrmMain.btnMarcasModClick(Sender: TObject);
var
  wdw: TfrmMarcaMod;
begin
  wdw:= TfrmMarcaMod.Create(pnlFrmContainer);
  wdw.Parent:= pnlFrmContainer;
  wdw.Align:= alClient;
  DestruirFormularioActivo;
  AssignarFormularioActivo(TForm(wdw));
  wdw.Show;
end;

procedure TfrmMain.btnMenuClick(Sender: TObject);
begin
  if FMenuHide
  then begin
    tmrMenu.Enabled:= true;
    FMenuHide:= false;
  end else begin
    pnlMenuBar.Width:=0;
    FMenuHide:= true;
  end;
end;

procedure TfrmMain.btnVehiculosClick(Sender: TObject);
var
  wdw: TfrmVehiculos;
begin
  wdw:= TfrmVehiculos.Create(pnlFrmContainer);
  wdw.Parent:= pnlFrmContainer;
  wdw.Align:= alClient;
  DestruirFormularioActivo;
  AssignarFormularioActivo(TForm(wdw));
  wdw.Show;
end;

procedure TfrmMain.pnlTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= true;
end;

procedure TfrmMain.pnlTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FMoving then begin
    frmMain.Left:= Mouse.CursorPos.X - (frmMain.Width div 2);
    frmMain.Top:= Mouse.CursorPos.Y - (pnlTitleBar.Height div 2);
  end;
end;

procedure TfrmMain.pnlTitleBarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= false;
end;

procedure TfrmMain.tmrDateTimeTimer(Sender: TObject);
begin
  lblHour.Caption:= TimeToStr(GetTime);
  lblDate.Caption:= DateToStr(Date)
end;

procedure TfrmMain.tmrMenuTimer(Sender: TObject);
begin
  if (pnlMenuBar.Width>=185)
  then
    tmrMenu.Enabled:= False
  else
    pnlMenuBar.Width:= pnlMenuBar.Width + 15;
end;

procedure TfrmMain.DestruirFormularioActivo;
begin
  if FFormShowing<>nil then
  begin
    FFormShowing.Close;
    FFormShowing:=nil;
  end;
end;

procedure TfrmMain.AssignarFormularioActivo (var wdw:TForm);
begin
  FFormShowing:=wdw;
end;

end.
