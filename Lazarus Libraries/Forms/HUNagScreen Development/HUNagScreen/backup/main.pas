unit Main;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit :
//
// Description :
//
// Called By :
//
// Calls :
//
// Ver. : 1.00
//
// Date :
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  HUNagscreen;

type

  { TForm1 }

  TForm1 = class(TForm)
    bbtTest: TBitBtn;
    procedure bbtTestClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bbtTestClick(Sender: TObject);
begin
  dlgHUNagScreen.ShowModal;
end;

end.

