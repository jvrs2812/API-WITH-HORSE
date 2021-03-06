unit Sr.Connection;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client;

  function GetConnection : TFDConnection;

implementation


function GetConnection : TFDConnection;
var FDCon : TFDConnection;
begin
  FDCon := TFDConnection.Create(nil);

  with FDCon.Params do
  begin
      Add('DriverID=MySQL');
      Add('Server=127.0.0.1');
      Add('Port=3306');
      Add('Database=Dados');
  end;

  FDCon.Params.UserName := 'root';
  FDCon.Params.Password := 'root';

  Result := FDCon;
end;

end.
