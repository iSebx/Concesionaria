program ValidatorTest;

uses
  Vcl.Forms,
  uMain in 'test\uMain.pas' {Form2},
  uValidator in 'uValidator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
