program API;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  DataSet.Serialize,
  Horse.GBSwagger,
  Sr.Connection in 'Sr.Connection.pas',
  Sr.Usuarios in 'Sr.Usuarios.pas',
  Sr.Padroes in 'Sr.Padroes.pas';

var App : THorse;
begin
  Sr.Usuarios.Routes;

  THorse.Use(HorseSwagger);
    Swagger
      .BasePath('v1')
      .Path('User')
        .Tag('User')
        .GET('List All', 'List All Users')
          .AddResponse(200, 'successful operation')
            .Schema(TUser)
            .IsArray(True)
          .&End
          .AddResponse(400, 'Bad Request')
            .Schema(TAPIError)
          .&End
          .AddResponse(500, 'Internal Server Error')
            .Schema(TAPIError)
          .&End
        .&End
        .POST('Add user', 'Add a new user')
          .AddParamBody('User data', 'User data')
            .Required(True)
            .Schema(TUser)
          .&End
          .AddResponse(201, 'Created')
            .Schema(TUser)
          .&End
          .AddResponse(400, 'Bad Request')
            .Schema(TAPIError)
          .&End
          .AddResponse(500, 'Internal Server Error')
            .Schema(TAPIError)
          .&End
        .&End
      .&End
    .&End;

  THorse.Listen(2512);
end.
