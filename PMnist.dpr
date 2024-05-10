program PMnist;

uses
  Vcl.Forms,
  UnitMnist in 'UnitMnist.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
