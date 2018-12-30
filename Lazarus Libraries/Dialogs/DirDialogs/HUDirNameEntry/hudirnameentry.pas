unit HUDirNameEntry;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HUDirNameEntry.pas
//
// Description :
//
// Called By :
//
// Calls :
//
// Ver. : 1.0.0
//
// Date : 28 Nov 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons,
  // HULibrary units
  HUMessageBoxes, HUValidations;

type

  { TdlgHUDirNameEntry }

  TdlgHUDirNameEntry = class(TForm)
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    edtDirName: TEdit;
    procedure bbtCancelClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure edtDirNameKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    vstrOriginalDirName : string;
    fDirName : string;
    function GetDirName : string;
    procedure SetDirName(Dir : string);
  public
    property pDirName : string read GetDirName write SetDirName;
  end;// TdlgHUDirNameEntry

var
  dlgHUDirNameEntry: TdlgHUDirNameEntry;

implementation

{$R *.lfm}

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================
const

  cintMaxDirNameCharacters = 20;

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
function TdlgHUDirNameEntry.GetDirName: string;
begin
   Result := fDirName;
end;// function TdlgHUDirNameEntry.GetDirNamey

//----------------------------------------------------------------------------------------
procedure TdlgHUDirNameEntry.SetDirName(Dir: string);
begin
    fDirName := Dir;
end;// procedure TdlgHUDirNameEntry.SetDirName

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================
procedure TdlgHUDirNameEntry.bbtCancelClick(Sender: TObject);
begin
  if HUConfirmMsgYN('Confirm', 'Do you really want to Cancel ?') = mrNo then
  begin
    edtDirName.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;
  pDirName := vstrOriginalDirName;
  ModalResult := mrCancel;
end;// procedure TdlgHUDirNameEntry.bbtCancelClick

//----------------------------------------------------------------------------------------
procedure TdlgHUDirNameEntry.bbtOKClick(Sender: TObject);
begin
  if edtDirName.Text = '' then
  begin
    showmessage('Invalid Directory Name');
    edtDirName.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;
  pDirName := edtDirName.Text;
end;// procedure TdlgHUDirNameEntry.bbtOKClick

//========================================================================================
procedure TdlgHUDirNameEntry.edtDirNameKeyPress(Sender: TObject; var Key: char);
begin
  Key := HUValidations.ValidDirectoryCharacter(Key);
end;// procedure TdlgHUDirNameEntry.edtDirNameKeyPress

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHUDirNameEntry.FormCreate(Sender: TObject);
begin
  edtDirName.MaxLength := cintMaxDirNameCharacters;
end;// procedure TdlgHUDirNameEntry.FormCreate

//========================================================================================
procedure TdlgHUDirNameEntry.FormShow(Sender: TObject);
begin
  vstrOriginalDirName := pDirName;
  edtDirName.Text := pDirName;
  edtDirName.SetFocus;
end;// procedure TdlgHUDirNameEntry.FormShow

//========================================================================================
end.// unit HUDirNameEntry

