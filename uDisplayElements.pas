unit uDisplayElements;

interface
uses
  uIntf, Windows, SysUtils;

type

  TCurrentConditionsDisplay=class(TInterfacedObject, IObserver, IDisplayElements)
  private
    FTemperature:Double;
    FHumidity:Double;
    FWeatherData:ISubject;
  public
    constructor Create(AWeatherData:ISubject);
    procedure Update(const ATemp, AHumidity, APressure:Double);
    procedure Display;
  end;

implementation

{ TCurrentConditionsDisplay }

constructor TCurrentConditionsDisplay.Create(AWeatherData:ISubject);
begin
  FWeatherData:=AWeatherData;
  FWeatherData.RegisterObserver(Self);
end;

procedure TCurrentConditionsDisplay.Display;
begin
  MessageBox(0,PChar('Current conditions: '+FloatToStr(FTemperature)+
    'F degrees and '+FloatToStr(FHumidity)+'% humidity'),'WetherData',MB_OK);
end;

procedure TCurrentConditionsDisplay.Update(const ATemp, AHumidity,
  APressure: Double);
begin
  FTemperature:=ATemp;
  FHumidity:=AHumidity;
  Display;
end;

end.
