program TestWeatherStation;

uses
  Forms,
  main in 'main.pas' {Form1},
  uWeatherData in 'uWeatherData.pas',
  uIntf in 'uIntf.pas',
  uDisplayElements in 'uDisplayElements.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
