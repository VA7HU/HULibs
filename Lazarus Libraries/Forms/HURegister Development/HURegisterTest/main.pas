unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons{,
  HURegister};

type

  { TfrmMain }

  TfrmMain = class(TForm)
    bbtTest1: TBitBtn;
    procedure bbtTest1Click(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.bbtTest1Click(Sender: TObject);
begin
  //dlgHURegister.ShowModal;
end;

end.

