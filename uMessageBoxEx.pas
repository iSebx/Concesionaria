unit uMessageBoxEx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls;

type
  TButtonMode = (bm_OnlyOk, bm_AcceptCancel);
  TfrmMessageBoxEx = class(TForm)
    pnlTitleBar: TPanel;
    pnlMain: TPanel;
    btnClose: TImage;
    btnCancel: TButton;
    btnOk: TButton;
    btnAceptar: TButton;
    lblMessage: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlTitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTitleBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FMoving: boolean;
  public
    constructor create (aOwner: TWinCOntrol; aTitle: String; aCaption: String; aButtonType: TButtonMode);
  end;

var
  frmMessageBoxEx: TfrmMessageBoxEx;

implementation

{$R *.dfm}

procedure TfrmMessageBoxEx.btnAceptarClick(Sender: TObject);
begin
  self.ModalResult:= mrOk;
end;

procedure TfrmMessageBoxEx.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmMessageBoxEx.btnCloseClick(Sender: TObject);
begin
  CloseModal;
end;

procedure TfrmMessageBoxEx.btnOkClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

constructor TfrmMessageBoxEx.create(aOwner: TWinCOntrol; aTitle,
  aCaption: String; aButtonType: TButtonMode);
begin
  inherited create(aOwner);
  pnlTitleBar.Caption:= aTitle;
  lblMessage.Caption:= aCaption;
  if aButtonType=bm_OnlyOk
  then begin
    btnCancel.Visible:= false;
    btnAceptar.Visible:= false;
    btnOk.Visible:= true;
  end else begin
    btnCancel.Visible:= true;
    btnAceptar.Visible:= true;
    btnOk.Visible:= false;
  end;
end;

procedure TfrmMessageBoxEx.FormCreate(Sender: TObject);
begin
  FMoving:= false;
end;

procedure TfrmMessageBoxEx.pnlTitleBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= true;
end;

procedure TfrmMessageBoxEx.pnlTitleBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMoving
  then begin
    Self.Left:= Mouse.CursorPos.X - (self.Width div 2);
    Self.Top:= Mouse.CursorPos.Y - (self.pnlTitleBar.Height div 2);
  end
end;

procedure TfrmMessageBoxEx.pnlTitleBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoving:= false;
end;

end.
