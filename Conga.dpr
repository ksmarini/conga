program Conga;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  u99Permissions in 'Units\u99Permissions.pas',
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitLancamentos in 'UnitLancamentos.pas' {FrmLancamentos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
