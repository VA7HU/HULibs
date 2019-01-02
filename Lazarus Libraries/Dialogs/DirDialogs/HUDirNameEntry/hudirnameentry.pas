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
// Calls :  HUConstants
//          HUMessageBoxes : HUConfirmMsgYN
//          HUValidations : ValidDirectoryCharacter
//
// Ver. : 1.0.0
//
// Date : 30 Dec 2018
//
//========================================================================================

interface

uses
  Buttons, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,

  // HULibrary units
  HUConstants, HUMessageBoxes, HUValidations;

type

  { TdlgHUDirNameEntry }

  TdlgHUDirNameEntry = class(TForm)
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    Edit1: TEdit;
    edtDirName: TEdit;
    procedure bbtCancelClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure edtDirNameKeyPress(Sender: TObject; var Key: char);
    procedure edtDirNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    vstrOriginalDirName : string;
    fBaseDirName : string;
    fDirName : string;
    function GetBaseDirName : string;
    procedure SetBaseDirName(Dir : string);
    function GetDirName : string;
    procedure SetDirName(Dir : string);
  public
    property pBaseDirName : string read GetBaseDirName write SetBaseDirName;
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
  cintMinDirNameCharacters = 1;
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
function TdlgHUDirNameEntry.GetBaseDirName: string;
begin
   Result := fBaseDirName;
end;// function TdlgHUDirNameEntry.GetBaseDirNamey

//----------------------------------------------------------------------------------------
procedure TdlgHUDirNameEntry.SetBaseDirName(Dir: string);
begin
    fBaseDirName := Dir;
end;// procedure TdlgHUDirNameEntry.SetBaseDirName

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
var
  vstrDirFullPath : string;
begin

  if edtDirName.Text = '' then
  begin
    showmessage('You Must Enter a Valid Directory Name');
    edtDirName.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  // Confirm Dir DOES NOT already exist
  pDirName := edtDirName.Text;
  vstrDirFullPath := pBaseDirName + '\' + K_CR +
                     pDirName;

  edit1.Text :=  vstrDirFullPath;

  showmessage(vstrDirFullPath);

  If Not DirectoryExists(vstrDirFullPath) then
    If Not CreateDir (vstrDirFullPath) Then
      HUErrorMsgOK ('Failed to Create : ', vstrDirFullPath)
    else
      HUInformationMsgOK ('Created : ', vstrDirFullPath);




end;// procedure TdlgHUDirNameEntry.bbtOKClick

//========================================================================================
procedure TdlgHUDirNameEntry.edtDirNameKeyPress(Sender: TObject; var Key: char);
begin
  Key := HUValidations.ValidDirectoryCharacter(Key);
end;// procedure TdlgHUDirNameEntry.edtDirNameKeyPress

//----------------------------------------------------------------------------------------
procedure TdlgHUDirNameEntry.edtDirNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Length(edtDirName.Text) < cintMinDirNameCharacters then
    edtDirName.Color := bclrError
  else
    edtDirName.Color := bclrOk;
end;// procedure TdlgHUDirNameEntry.edtDirNameKeyUp

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
  pBaseDirName := pBaseDirName;
  edtDirName.Text := pDirName;
  if Length(edtDirName.Text) < cintMinDirNameCharacters then
    edtDirName.Color := bclrError
  else
    edtDirName.Color := bclrOk;
  edtDirName.SetFocus;

end;// procedure TdlgHUDirNameEntry.FormShow

//========================================================================================
end.// unit HUDirNameEntry

