program Info;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Main},
  uLkJSON in 'uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
