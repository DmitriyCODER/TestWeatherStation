unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uWeatherData,uDisplayElements, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  WeatherData:TWeatherData;
  CurrentDisplay:TCurrentConditionsDisplay;
begin
  WeatherData:=TWeatherData.Create;
  CurrentDisplay:=TCurrentConditionsDisplay.Create(WeatherData);

  WeatherData.SetMeasurements(80, 65, 30.4);
  WeatherData.SetMeasurements(82, 70, 29.2);
  WeatherData.SetMeasurements(78, 90, 30.4);
end;

end.
