program HUNagScreenTest;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main, HUNagScreen, HURegister;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdlgHUNagScreen, dlgHUNagScreen);
  Application.CreateForm(TdlgRegister, dlgRegister);
  Application.Run;
end.

