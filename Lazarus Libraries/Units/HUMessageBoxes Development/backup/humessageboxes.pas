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
// Date : 30 Sep 2018
//
//========================================================================================

interface

uses
  Classes, Controls, Dialogs, Forms, LCLType, SysUtils,
  HUConstants;

function HUErrorMsgOK (ErrorType, ErrorMsg : String) : Integer;
function HUErrorMsgYN (ErrorType, ErrorMsg : String) : Integer;

function HUInformationMsgOK (InformationType , InformationMsg: String) : Integer;
function HUNotImplementedMsgOK (InformationType : String) : Integer;

implementation

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================

const
     // Error Message Texts


     // Confirmation Message Texts


     // Information Message Texts

  imNotImplementedMsg = 'Not Yet Implemented';


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

function HUInformationMsgOK (InformationType, InformationMsg : String) : Integer;
begin
  Result := MessageDlg('INFORMATION' + InformationType, InformationType, mtError,
  [mbOK],0);
end;// function HUInformationMsgOK

function HUNotImplementedMsgOK (InformationType: String) : Integer;
begin
   Result := MessageDlg('INFORMATION' + InformationType, imNotImplementedMsg, mtError,
  [mbOK],0);
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

