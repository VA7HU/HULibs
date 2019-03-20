unit HURegistration;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HURegistration.pas
//
// Description :
//
// Called By :
//
// Calls : HUConstants
//         HUValidations : ValidCallsignCharacter
//                         ValidEmailCharacter
//                         ValidNameCharacter
//
// Ver. : 1.0.0
//
// Date : 16 Mar 2019
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls,
  // Application units
  // HULib units
  HUConstants, HUValidations;

type

  { TdlgHURegistration }

  TdlgHURegistration = class(TForm)
    bbtRegID: TBitBtn;
    bbtCancel: TBitBtn;
    bbtHelp: TBitBtn;
    edtEmail: TEdit;
    edtStep4: TEdit;
    edtKeyID: TEdit;
    edtLastName: TEdit;
    edtFirstName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblKeyID: TLabel;
    lblStep4: TLabel;
    Label5: TLabel;
    memInstructions: TMemo;
    procedure bbtCancelClick(Sender: TObject);
    procedure bbtRegIDClick(Sender: TObject);
    procedure bbtHelpClick(Sender: TObject);
    procedure edtStep4KeyPress(Sender: TObject; var Key: char);
    procedure edtEmailKeyPress(Sender: TObject; var Key: char);
    procedure edtFirstNameKeyPress(Sender: TObject; var Key: char);
    procedure edtLastNameKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetRegistrationKey;
    procedure GetUSerID;
//    procedure HideStep4;
  private
    fFirstName : String;
    fLastName : String;
    fEmailAddress : String;
    fCallsign : String;
    fRegKey : String;
    fUserID : String;
    fHideStep4 : Boolean;
    procedure HideStep4Entry;
  public
    function GetFirstName : string;
    procedure SetFirstName(FirstName : string);
    function GetLastName : string;
    procedure SetLastName(LastName : string);
    function GetEmailAddress : string;
    procedure SetEmailAddress(EmailAddress : string);
    function GetCallsign : string;
    procedure SetCallsign(Callsign : string);
    function GetRegKey : string;
    procedure SetRegKey(RegKey : string);
    function GetUserID : string;
    procedure SetUserID(UserID : string);
    function GetHideStep4 : Boolean;
    procedure SetHideStep4(HideStep4 : Boolean);
    property pFirstName: string read GetFirstName write SetFirstName;
    property pLastName: string read GetLastName write SetLastName;
    property pEmailAddress: string read GetEmailAddress write SetEmailAddress;
    property pCallsign: string read GetCallsign write SetCallsign;
    property pRegKey: string read GetRegKey write SetRegKey;
    property pUserID: string read GetUserID write SetUserID;
    property pHideStep4: Boolean read GetHideStep4 write SetHideStep4;

  end;// TdlgHURegistration

var
  dlgHURegistration: TdlgHURegistration;

implementation

{$R *.lfm}

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================
Const
  cstrlblRegistrationKey = 'Registration Key : ';
  cstrlblUserID = '     User ID : ';

  cstrmemRegKeyInstructions1 = 'Request Your Registration Key.' +
                                    K_CR +
                                    K_CR +
                                    'Step 1 : Enter Your First Name.' +
                                    K_CR +
                                    'Step 2 : Enter Your Last Name.' +
                                    K_CR +
                                    'Step 3 : Enter Your EMail Address.' +
                                    K_CR +
                                    'Step 4 : Enter Your Callsign.';

  cstrmemRegKeyInstructions2 = 'Request Your Registration Key.' +
                                    K_CR +
                                    K_CR +
                                    'Step 1 : Enter Your First Name.' +
                                    K_CR +
                                    'Step 2 : Enter Your Last Name.' +
                                    K_CR +
                                    'Step 3 : Enter Your EMail Address.';

  cstrmemUserIDInstructions1 = 'Request Your User ID.' +
                                    K_CR +
                                    K_CR +
                                    'Step 1 : Enter Your First Name.' +
                                    K_CR +
                                    'Step 2 : Enter Your Last Name.' +
                                    K_CR +
                                    'Step 3 : Enter Your EMail Address.' +
                                    K_CR +
                                    'Step 4 : Enter Your Callsign.';

  cstrmemUserIDInstructions2 = 'Request Your User ID.' +
                                    K_CR +
                                    K_CR +
                                    'Step 1 : Enter Your First Name.' +
                                    K_CR +
                                    'Step 2 : Enter Your Last Name.' +
                                    K_CR +
                                    'Step 3 : Enter Your EMail Address.';

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
procedure TdlgHURegistration.HideStep4Entry;
begin
  if pHideStep4 then
  begin
    lblstep4.Visible := False;
    edtStep4.Visible := False;
  end
  else
  begin
    lblstep4.Visible := True;
    edtStep4.Visible := True;
  end;
end;// procedure TdlgHURegistration.HideStep4Entry

//----------------------------------------------------------------------------------------
{procedure TdlgHURegistration.ShowStep4;
begin
  lblstep4.Visible := True;
  edtStep4.Visible := True;
end;// procedure TdlgHURegistration.ShowStep4}

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================
//========================================================================================
procedure TdlgHURegistration.GetRegistrationKey;
begin
  lblKeyID.Caption := cstrlblRegistrationKey;
  bbtRegID.Caption := 'Registration';;
  memInstructions.lines[0] := cstrmemRegKeyInstructions1;
  pHideStep4 := False;
  dlgHURegistration.HideStep4Entry;
  dlgHURegistration.ShowModal;
end;// procedure TdlgHURegistration.GetRegistrationKey

//========================================================================================
procedure TdlgHURegistration.GetUSerID;
begin
  lblKeyID.Caption := cstrlblUserID;
  bbtRegID.Caption := 'User ID';
  memInstructions.lines[0] := cstrmemUserIDInstructions1;
  dlgHURegistration.ShowModal;
end;// procedure TdlgHURegistration.GetUSerID

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================
function TdlgHURegistration.GetFirstName: String;
begin
  Result := fFirstName;
end;// function TdlgHURegistration.GetFirstName

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetFirstName(FirstName: String);
begin
   fFirstName := FirstName;
end;// procedure TdlgHURegistration.SetFirstName

//========================================================================================
function TdlgHURegistration.GetLastName: String;
begin
  Result := fLastName;
end;// function TdlgHURegistration.GetLastName

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetLastName(LastName: String);
begin
   fLastName := LastName;
end;// procedure TdlgHURegistration.SetLastName

//========================================================================================
function TdlgHURegistration.GetEmailAddress: String;
begin
  Result := fEmailAddress;
end;// function TdlgHURegistration.EmailAddress

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetEmailAddress(EmailAddress: String);
begin
   fEmailAddress := EmailAddress;
end;// procedure TdlgHURegistration.SetEmailAddress

//========================================================================================
function TdlgHURegistration.GetCallsign: String;
begin
  Result := fCallsign;
end;// function TdlgHURegistration.GetCallsign

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetCallsign(Callsign: String);
begin
   fCallsign := Callsign;
end;// procedure TdlgHURegistration.SetCallsign

//========================================================================================
function TdlgHURegistration.GetRegKey: String;
begin
  Result := fRegKey;
end;// function TdlgHURegistration.RegKey

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetRegKey(RegKey: String);
begin
   fRegKey := RegKey;
end;// procedure TdlgHURegistration.SetRegKeyID

//========================================================================================
function TdlgHURegistration.GetUserID: String;
begin
  Result := fUserID;
end;// function TdlgHURegistration.UserID

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetUserID(UserID: String);
begin
   fUserID := UserID;
end;// procedure TdlgHURegistration.SetUserID

//========================================================================================
function TdlgHURegistration.GetHideStep4: Boolean;
begin
  Result := fHideStep4;
end;// function TdlgHURegistration.HideStep4D

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetHideStep4(HideStep4: Boolean);
begin
   fHideStep4 := HideStep4;
end;// procedure TdlgHURegistration.SetHidestep4

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHURegistration.bbtCancelClick(Sender: TObject);
begin

end;// procedure TdlgHURegistration.bbtCancelClick

//========================================================================================
procedure TdlgHURegistration.bbtRegIDClick(Sender: TObject);
begin

end;// procedure TdlgHURegistration.bbtOKClick

//========================================================================================
procedure TdlgHURegistration.bbtHelpClick(Sender: TObject);
begin

end;// procedure TdlgHURegistration.BitBtn1Click

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

// KeyPress
procedure TdlgHURegistration.edtStep4KeyPress(Sender: TObject; var Key: char);
begin
   Key := ValidCallsignCharacter(Key);
end;// procedure TdlgHURegistration.edtCallsignKeyPress

//========================================================================================
procedure TdlgHURegistration.edtEmailKeyPress(Sender: TObject; var Key: char);
begin
  Key := ValidEmailCharacter(Key);
end;// procedure TdlgHURegistration.edtEmailKeyPress

//========================================================================================
procedure TdlgHURegistration.edtFirstNameKeyPress(Sender: TObject; var Key: char);
begin
  Key := ValidNameCharacter(Key);
end;// procedure TdlgHURegistration.edtFirstNameKeyPress

//========================================================================================
procedure TdlgHURegistration.edtLastNameKeyPress(Sender: TObject; var Key: char);
begin
  Key := ValidNameCharacter(Key);
 end;// procedure TdlgHURegistration.edtLastNameKeyPress

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegistration.FormCreate(Sender: TObject);
begin

end;// procedure TdlgHURegistration.FormCreate

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.FormShow(Sender: TObject);
begin

end;// procedure TdlgHURegistration.FormShow

//========================================================================================
end.// unit HURegistration

