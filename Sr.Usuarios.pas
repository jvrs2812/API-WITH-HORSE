unit Sr.Usuarios;


interface


uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
     FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
     Sr.Connection,Sr.Padroes,Horse,FireDAC.DApt,System.Json;

     procedure Routes;
     procedure Get(Req:THorseRequest; Res:THorseResponse; next : TProc);
     procedure Post(Req:THorseRequest; Res:THorseResponse; next : TProc);

     type
  TUser = class
  private
    Fname : String;
    FEmail: string;
    FSenha: String;
    FCpf  : String;
  public
    property name: String read Fname write Fname;
    property email: String read FEmail write FEmail;
    property senha: String read FSenha write FSenha;
    property cpf: String read FCpf write FCpf;
  end;

  TAPIError = class
  private
    Ferror: string;
  public
    property error: string read Ferror write Ferror;
  end;

implementation


procedure Post(Req:THorseRequest; Res:THorseResponse; next : TProc);
var FDCon  : TFDConnection;
    Tabela : TFDQuery;
    JSonValue:TJSonValue;
    JSON   : String;
begin
  JSonValue := TJSonObject.ParseJSONValue(Req.Body);


  FDCon := GetConnection;

  Tabela := TFDQuery.Create(nil);
  Tabela.Close;
  Tabela.SQL.Clear;
  Tabela.SQL.Add('Select * from FTCADUSU');
  Tabela.SQL.Add('where 1 = 2');
  Tabela.CachedUpdates := True;
  Tabela.Connection := FDCon;
  Tabela.Open;

  Res.Send(ConverteTabelaJson(Tabela));
end;

procedure Get(Req:THorseRequest; Res:THorseResponse; next : TProc);
var FDCon  : TFDConnection;
    Tabela : TFDQuery;
    JSON   : String;
begin
  FDCon := GetConnection;

  Tabela := TFDQuery.Create(nil);
  Tabela.Close;
  Tabela.SQL.Clear;
  Tabela.SQL.Add('Select * from FTCADUSU');
  Tabela.Connection := FDCon;
  Tabela.Open;

  Res.Send(ConverteTabelaJson(Tabela));
end;

procedure Routes;
begin
  THorse.Group.Prefix('v1')
  .Get('User',Get)
  .Post('User',Post);
end;


end.
