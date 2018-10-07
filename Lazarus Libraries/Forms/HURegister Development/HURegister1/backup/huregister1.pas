unit HURegister1;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HURegister1.pas
//
// Description :
//
// Called By :
//
// Calls :
//
// Ver. : 1.00
//
// Date : 7 Oct 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls;

type

  { TdlgHURegister1 }

  TdlgHURegister1 = class(TForm)
    bbtOK: TBitBtn;
    bbtHelp: TBitBtn;
    Cancel: TBitBtn;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtCallSign: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure bbtHelpClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure edtCallSignKeyPress(Sender: TObject; var Key: char);
    procedure edtFirstNameKeyPress(Sender: TObject; var Key: char);
    procedure edtLastNameKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  dlgHURegister1: TdlgHURegister1;

implementation

{$R *.lfm}

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================

//========================================================================================
//          PUBLIC CONSTANTS
//========================================================================================

//========================================================================================
//          PRIVATE VARIABLES
//========================================================================================

//========================================================================================
//          PUBLIC VARIABLES
//========================================================================================

//========================================================================================
//          PRIVATE ROUTINES
//========================================================================================

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHURegister1.bbtOKClick(Sender: TObject);
begin

end;// procedure TdlgHURegister1.bbtOKClick

//========================================================================================
procedure TdlgHURegister1.bbtHelpClick(Sender: TObject);
begin

end;

procedure TdlgHURegister1.CancelClick(Sender: TObject);
begin

end;


//========================================================================================
//          CONTROL ROUTINES
//========================================================================================
procedure TdlgHURegister1.edtFirstNameKeyPress(Sender: TObject; var Key: char);
begin

end;// procedure TdlgHURegister1.edtFirstNameKeyPress

//========================================================================================
procedure TdlgHURegister1.edtCallSignKeyPress(Sender: TObject; var Key: char);
begin

end;// procedure TdlgHURegister1.edtCallSignKeyPress

//========================================================================================
procedure TdlgHURegister1.edtLastNameKeyPress(Sender: TObject; var Key: char);
begin

end;// procedure TdlgHURegister1.edtLastNameKeyPress

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegister1.FormShow(Sender: TObject);
begin
  edtFirstName.SetFocus;
end;// procedure TdlgHURegister1.FormShow

//========================================================================================
end.// unit HURegister1

