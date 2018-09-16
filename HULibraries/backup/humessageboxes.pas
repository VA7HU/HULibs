unit HUMessageBoxes;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : AppInit.pas
//
// Description :
//
// Called By : Main : TfrmMain.FormShow
//
// Calls :  NagScreen : TfrmNagScreen.FormShow
//          Register : frmRegister.ShowModal
//
// Ver. : 1.00
//
// Date : 25 Aug 2018
//
//========================================================================================

interface

uses
  Classes, Controls, Dialogs, Forms, LCLType, SysUtils,
  {HUConstants};

function HUErrorMsgOK (ErrorType, ErrorMsg : String) : Integer;
function HUErrorMsgYN (ErrorType, ErrorMsg : String) : Integer;

function HUInformationMsgOK (ErrorType, ErrorMsg : String) : Integer;

implementation

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

                    {ERROR MESSAGES}

function HUErrorMsgOK (ErrorType, ErrorMsg : String) : Integer;
begin
  Result := MessageDlg('ERROR' + ErrorType, ErrorMsg, mtError,
  [mbOK],0);
end;// function HUErrorMsgOK

//----------------------------------------------------------------------------------------
function HUErrorMsgYN (ErrorType, ErrorMsg : String) : Integer;
begin
  Result := MessageDlg('ERROR' + ErrorType, ErrorMsg, mtError,
  [mbYes, mbNo],0);
end;// function HUErrorMsgYN

                    {CONFIRMATION MESSAGES}

                    {INFORMATION MESSAGES}

function HUInformationMsgOK (ErrorType, ErrorMsg : String) : Integer;
begin
  Result := MessageDlg('INFORMATION' + ErrorType, ErrorMsg, mtError,
  [mbOK],0);
end;// function HUInformationMsgOK



//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================

end.// unit HUMessageBoxes

