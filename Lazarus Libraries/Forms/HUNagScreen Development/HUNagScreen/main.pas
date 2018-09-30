unit Main;

{$mode objfpc}{$H+}

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
  frmHUNagScreen.ShowModal;
end;

end.

