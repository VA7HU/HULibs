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
// Calls : HUValidations : ValidNameCharacter
//
// Ver. : 1.00
//
// Date : 7 Oct 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls,
  HUValidations;

type

  { TdlgHURegister1 }

  TdlgHURegister1 = class(TForm)
    bbtOK: TBitBtn;
    bbtHelp: TBitBtn;
    Cancel: TBitBtn;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtCallSign: TEdit;
    edtRegKey: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure bbtHelpClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure edtCallSignExit(Sender: TObject);
    procedure edtCallSignKeyPress(Sender: TObject; var Key: char);
    procedure edtFirstNameExit(Sender: TObject);
    procedure edtFirstNameKeyPress(Sender: TObject; var Key: char);
    procedure edtLastNameExit(Sender: TObject);
    procedure edtLastNameKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fRegistrationKey : string;
    function GetRegistrationKey : string;
    procedure SetRegistrationKey(RegKey : string);
  public
    property pRegistrationKey : string read GetRegistrationKey
                                     write SetRegistrationKey;
  end;// TdlgHURegister1

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
function GenerateKey (SeedVal : string) : string;
begin

end;// function GenerateKey

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================
function TdlgHURegister1.GetRegistrationKey: string;
begin
   Result := fRegistrationKey;
end;// function TfrmAppSetup.GetRegistrationKey

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.SetRegistrationKey(RegKey: string);
begin
    fRegistrationKey := RegKey;
end;// procedure TfrmAppSetup.SetRegistrationKey

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

end;// procedure TdlgHURegister1.bbtHelpClick

//========================================================================================
procedure TdlgHURegister1.CancelClick(Sender: TObject);
begin

end;// procedure TdlgHURegister1.CancelClick

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================
procedure TdlgHURegister1.edtFirstNameKeyPress(Sender: TObject; var Key: char);
begin
  Key := ValidNameCharacter(Key);
end;// procedure TdlgHURegister1.edtFirstNameKeyPress

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtCallSignKeyPress(Sender: TObject; var Key: char);
begin
  Key := ValidCallsignCharacter(Key);
end;// procedure TdlgHURegister1.edtCallSignKeyPress

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtLastNameKeyPress(Sender: TObject; var Key: char);
begin
  Key := ValidNameCharacter(Key);
end;// procedure TdlgHURegister1.edtLastNameKeyPress

//========================================================================================
procedure TdlgHURegister1.edtFirstNameExit(Sender: TObject);
begin

end;// procedure TdlgHURegister1.edtFirstNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtLastNameExit(Sender: TObject);
begin

end;// procedure TdlgHURegister1.edtLastNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtCallSignExit(Sender: TObject);
begin

end;// procedure TdlgHURegister1.edtCallSignExit

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegister1.FormCreate(Sender: TObject);
begin
  //fRegistrationKey := '';
end;// procedure TdlgHURegister1.FormCreate

//========================================================================================
procedure TdlgHURegister1.FormShow(Sender: TObject);
begin
  fRegistrationKey := '';
  edtRegKey.Text := fRegistrationKey;
  edtFirstName.SetFocus;
  bbtOK.Enabled := False;
end;// procedure TdlgHURegister1.FormShow

//========================================================================================
end.// unit HURegister1

