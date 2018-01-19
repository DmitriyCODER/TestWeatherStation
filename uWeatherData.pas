unit uWeatherData;

interface
uses
  uIntf, Contnrs, Classes;


type

  TWeatherData=class(TInterfacedObject, ISubject)
  private
    FObservers: TInterfaceList;
    FTemperature:Double;
    FHumidity:Double;
    FPressure:Double;
  public
    constructor Create;
    procedure MeasurementsChanged;
    procedure RegisterObserver(O:IObserver);
    procedure RemoveObserver(O:IObserver);
    procedure NotifyObservers;
    procedure SetMeasurements(const ATemp, AHumidity, APressure:Double);
  end;

implementation

{ TWeatherData }

constructor TWeatherData.Create;
begin
  FObservers:=TInterfaceList.Create;
end;

procedure TWeatherData.MeasurementsChanged;
begin
  NotifyObservers;
end;

procedure TWeatherData.NotifyObservers;
var
  i:Integer;
  Observer:IObserver;
begin
  for i:=0 to FObservers.Count-1 do
  begin
    Observer:=IObserver(FObservers.Items[i]);
    Observer.Update(FTemperature,FHumidity,FPressure);
  end;
end;

procedure TWeatherData.RegisterObserver(O: IObserver);
begin
  FObservers.Add(O);
end;

procedure TWeatherData.RemoveObserver(O: IObserver);
var
  i:Integer;
begin
  i:=FObservers.IndexOf(O);
  if i>=0 then
    FObservers.Delete(i);
end;

procedure TWeatherData.SetMeasurements(const ATemp, AHumidity,
  APressure: Double);
begin
  FTemperature:=ATemp;
  FHumidity:=AHumidity;
  FPressure:=APressure;
  MeasurementsChanged;
end;

end.
