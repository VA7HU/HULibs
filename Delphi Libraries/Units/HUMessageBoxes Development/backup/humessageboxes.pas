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
// Date : 20 Apr 2019
//
//========================================================================================

interface

uses
  Classes, Controls, Dialogs, Forms, LCLType, SysUtils,
  HUConstants;

function HUErrorMsgOK (Caption, Text: String) : Integer;
function HUErrorMsgYN (Caption, Text: String) : Integer;

function HUInformationMsgOK (Caption, Text: String) : Integer;
function HUInformationMsgYN (Caption, Text: String) : Integer;
Function HUNotImplementedMsgOK (Caption, Text: String) : Integer;

function HUConfirmMsgYN (Caption, Text: String) : Integer;

const

  // Common Error Message Texts
  erCreateUserDirsFailed = 'Failure Creating User Directories';
  erNoDataDirectoriesFound = '       MAJOR ERROR' +
                             K_CR +
                             K_CR +
                             'No Data Directories found.';

  // Common Confirmation Message Texts

  // Common Information Message Texts
  imApplicationClosing = 'Application closing.';
  imCreateUserDirs = 'Creating User Directories';
  imNotImplementedMsg = 'Not Yet Implemented';
  imNoINIFile = '   The .INI file Does Not Exist.'
              + K_CR
              + ' Is this an Initial installation ?';

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

function HUErrorMsgOK (Caption, Text: String) : Integer;
begin
  Result := MessageDlg('ERROR - ' + Caption, Text, mtError,
  [mbOK],0);
end;// function HUErrorMsgOK

//----------------------------------------------------------------------------------------
function HUErrorMsgYN (Caption , Text : String) : Integer;
begin
  Result := MessageDlg('ERROR - ' + Caption, Text, mtError,
  [mbYes, mbNo],0);
end;// function HUErrorMsgYN

                    {CONFIRMATION MESSAGES}

function HUConfirmMsgYN (Caption, Text : String) : Integer;
begin
  Result := MessageDlg('CONFIRMATION - ' + Caption, Text, mtConfirmation,
  [mbYes, mbNo],0);
end;// function HUConfirmMsgYN



                    {INFORMATION MESSAGES}

function HUInformationMsgOK (Caption, Text : String) : Integer;
begin
  Result := MessageDlg('INFORMATION - ' + Caption, Text, mtInformation,
  [mbOK],0);
end;// function HUInformationMsgOK

//----------------------------------------------------------------------------------------
function HUInformationMsgYN (Caption, Text   : String) : Integer;
begin
  Result := MessageDlg('INFORMATION - ' + Caption, Text, mtInformation,
  [mbYes, mbNo],0);
end;// function HUInformationMsgYN

//----------------------------------------------------------------------------------------
function HUNotImplementedMsgOK (Caption, Text : String) : Integer;
begin
   Result := MessageDlg('INFORMATION - ' + Caption, Text, mtInformation, [mbOK],0);
end;// function HUNotImplementedMsgOK

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

