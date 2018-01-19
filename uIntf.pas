unit uIntf;

interface

type

  IObserver=interface
    procedure Update(const ATemp, AHumidity, APressure:Double);
  end;

  ISubject=interface
    procedure RegisterObserver(O:IObserver);
    procedure RemoveObserver(O:IObserver);
    procedure NotifyObservers;
  end;

  IDisplayElements=interface
    procedure Display;
  end;

implementation

end.
