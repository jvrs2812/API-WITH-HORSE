unit Sr.Padroes;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
     FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,Sr.Connection,
     DBClient,System.JSON,DataSet.Serialize;

     function ConverteTabelaJson(Tabela:TFDQuery) : String;

implementation

function ConverteTabelaJson(Tabela:TFDQuery) : String;
begin
  Result := Tabela.ToJSONArrayString();
end;
end.

