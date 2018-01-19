unit uWeatherData;

interface

type

  TWeatherData=class
  public
    procedure MeasurementsChanged;
  end;

implementation

{ TWeatherData }

procedure TWeatherData.MeasurementsChanged;
var
  temp:Double;
  humidity:Double;
  pressure:Double;
begin
  temp:=GetTemperature;
  humidity:=GetHumidity;
  pressure:=GetPressure;

  CurrentConditionsDisplay.Update(temp, humidity, pressure);
  StatisticsDisplay.Update(temp, humidity, pressure);
  ForecastDisplay.Update(temp, humidity, pressure);
end;

end.
