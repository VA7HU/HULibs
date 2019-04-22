unit HURegistration;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HURegistration.pas
//
// Description :
//
//             1. Request Registration
//                a. Receive Registration Key and USerID
//
//             2. Enter Registration Key - Only ONE Registration allowed
//                b. UserID automatically entered
//
//             3. If Multiple Users allowed then addional UserIDs allowed
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
// Date : 21 Apr 2019
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, ComCtrls, Menus,
  // Application units
  AppSettings,
  // HULib units
  HUConstants, HUMessageBoxes, HUValidations;

type

  { TdlgHURegistration }

  TdlgHURegistration = class(TForm)
    bbtPrint: TBitBtn;
    bbtCancel: TBitBtn;
    bbtHelp: TBitBtn;
    edtEmailAddress: TEdit;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtCallsign: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    Label5: TLabel;
    lblEMail: TLabel;
    lblCallsign: TLabel;
    memInstructions: TMemo;
    PageControl1: TPageControl;
    tsRequestRegistrationKey: TTabSheet;
    tsRequestUserID: TTabSheet;
    tsEnterRegistrationKey: TTabSheet;
    tsEnterUserIID: TTabSheet;
    procedure bbtCancelClick(Sender: TObject);
    procedure bbtPrintClick(Sender: TObject);
    procedure bbtHelpClick(Sender: TObject);
    procedure edtCallsignExit(Sender: TObject);
    procedure edtEmailAddressExit(Sender: TObject);
    procedure edtEmailAddressKeyPress(Sender: TObject; var Key: char);
    procedure edtFirstNameExit(Sender: TObject);
    procedure edtFirstNameKeyPress(Sender: TObject; var Key: char);
    procedure edtLastNameExit(Sender: TObject);
    procedure edtLastNameKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RequestRegistrationKey;
    function ValidData : Boolean;
    function ValidFirstName : Boolean;
    function ValidLastName : Boolean;
    function ValidEmailAddress : Boolean;
    function ValidCallsign : Boolean;
  private
    fFirstName : String;
    fLastName : String;
    fEmailAddress : String;
    fCallsign : String;
    fRegKey : String;
    fUserID : String;
    fTitle : String;
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
    function GetTitle : string;
    procedure SetTitle(Title : string);
    property pFirstName: string read GetFirstName write SetFirstName;
    property pLastName: string read GetLastName write SetLastName;
    property pEmailAddress: string read GetEmailAddress write SetEmailAddress;
    property pCallsign: string read GetCallsign write SetCallsign;
    property pRegKey: string read GetRegKey write SetRegKey;
    property pUserID: string read GetUserID write SetUserID;
    property pTitle: string read GetTitle write SetTitle;

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

  cintFirstNameMinLength = 2;
  cintFirstNameMaxLength = 20;

  cintLastNameMinLength = 2;
  cintLastNameMaxLength = 20;

  cintEMailAddressMinLength = 5;
  cintEMailAddressMaxLength = 30;

  cintCallsignMinLength = 3;
  cintCallsignMaxLength = 20;

  //==========
  //  MESSAGES
  //
  //==========
  msgFirstNameCaption = 'FIRST NAME';
  emInvalidFirstName = 'Invalid First Name.';

  msgLastNameCaption = 'LAST NAME';
  emInvalidLastName = 'Invalid Last Name.';

  msgEMailAddressCaption = 'EMAIL ADDRESS';
  emInvalidEMailAddress= 'Invalid EMailAddress Name.';

  msgCallsignCaption = 'CALLSIGN';
  emInvalidCallsign = 'Invalid Callsign Name.';

  //==========
  // MEMO TEXT
  //==========

  cstrmemRequestRegistrationKey = K_CR +
                                  'Request Your Registration Key.' +
                                  K_CR +
                                  K_CR +
                                  'Step 1 : Enter Your First Name.' +
                                  K_CR +
                                  'Step 2 : Enter Your Last Name.' +
                                  K_CR +
                                  'Step 3 : Enter Your EMail Address.' +
                                  K_CR +
                                  'Step 4 : Enter Your Callsign.' +
                                  K_Cr +
                                  'Select the <Print ID> button.';

  cstrmemEnterRegistrationKey = K_CR +
                                'Request Your Registration Key.' +
                                K_CR +
                                K_CR +
                                'Step 1 : Enter Your First Name.' +
                                K_CR +
                                'Step 2 : Enter Your Last Name.' +
                                K_CR +
                                'Step 3 : Enter Your EMail Address.' +
                                K_CR +
                                'Step 4 : Enter Your Callsign.';

  cstrmemRequestUserID = K_CR +
                         'Request Your User ID.' +
                         K_CR +
                         K_CR +
                         'Step 1 : Enter Your First Name.' +
                         K_CR +
                         'Step 2 : Enter Your Last Name.' +
                         K_CR +
                         'Step 3 : Enter Your EMail Address.';

  cstrmemEnterUserID = K_CR +
                       'Request Your Registration Key.' +
                       K_CR +
                       K_CR +
                       'Step 1 : Enter Your First Name.' +
                       K_CR +
                       'Step 2 : Enter Your Last Name.' +
                       K_CR +
                       'Step 3 : Enter Your EMail Address.' +
                       K_CR +
                       'Step 4 : Enter Your Callsign.';

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
function TdlgHURegistration.ValidData : Boolean;
begin;

  Result := True;

  if not ValidFirstName then
  begin
    Result := False;
  end;// if not ValidFirstName

  if not ValidLastName then
  begin
    Result := False;
  end;// if not ValidLastName

  if not ValidEMailAddress then
  begin
    Result := False;
  end;// if not ValidEMailAddress

  if not ValidCallsign then
  begin
    Result := False;
  end;// if not ValidCallsign

  if Result = True then
    bbtPrint.Enabled := True
  else
    bbtPrint.Enabled := False;

end;// function TdlgHURegistration.ValidData

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================
procedure TdlgHURegistration.RequestRegistrationKey;
begin

  PageControl1.ActivePage:= tsRequestRegistrationKey;
  bbtPrint.Caption := 'Reguest Registration Key';
  memInstructions.Caption := cstrmemRequestRegistrationKey;
  dlgHURegistration.ShowModal;

end;// procedure TdlgHURegistration.RequestRegistrationKey

//========================================================================================

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
function TdlgHURegistration.GetTitle: String;
begin
  Result := fTitle;
end;// function TdlgHURegistration.Title

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.SetTitle(Title: String);
begin
   fUserID := Title;
end;// procedure TdlgHURegistration.SetTitle

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHURegistration.bbtCancelClick(Sender: TObject);
begin
  showmessage('Register Later');
end;// procedure TdlgHURegistration.bbtCancelClick

//========================================================================================
procedure TdlgHURegistration.bbtPrintClick(Sender: TObject);
begin
  showmessage('Thanks for Registering');
end;// procedure TdlgHURegistration.bbtPrintClick

//========================================================================================
procedure TdlgHURegistration.bbtHelpClick(Sender: TObject);
begin
  showmessage('Help');
end;// procedure TdlgHURegistration.BitBtn1Click

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

//==========
// KeyPress
//==========

procedure TdlgHURegistration.edtEmailAddressKeyPress(Sender: TObject; var Key: char);
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

//==========
//  ON EXIT
//==========
procedure TdlgHURegistration.edtFirstNameExit(Sender: TObject);
begin
  ValidFirstName;
end;// procedure TdlgHURegistration.edtFirstNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.edtLastNameExit(Sender: TObject);
begin
  ValidLastName;
end;// procedure TdlgHURegistration.edtLastNameExit

//----------------------------------------------------------------------------------------

procedure TdlgHURegistration.edtEmailAddressExit(Sender: TObject);
begin
  ValidLastName;
end;

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.edtCallsignExit(Sender: TObject);
begin

end;

//----------------------------------------------------------------------------------------

//===========
// VALIDATION
//===========
function TdlgHURegistration.ValidFirstName : Boolean;
begin;

  Result := True;

  if Length(edtFirstName.Text) < cintFirstNameMinLength then
  begin
    HUErrorMsgOk(msgFirstNameCaption, emInvalidFirstName);
    Result := False;
  end;// if Length(edtFirstName.Text) < cintFirstNameMinLength

end;// function TdlgHURegistration.ValidFirstName

//----------------------------------------------------------------------------------------
function TdlgHURegistration.ValidLastName : Boolean;
begin;

    Result := True;

    if Length(edtLastName.Text) < cintLastNameMinLength then
    begin
      HUErrorMsgOk(msgLastNameCaption, emInvalidLastName);
      Result := False;
    end;// if Length(edtLastName.Text) < cintLastNameMinLength

end;// function TdlgHURegistration.ValidLastName

//----------------------------------------------------------------------------------------
function TdlgHURegistration.ValidEMailAddress : Boolean;
begin;

  Result := True;

  if Length(edtEMailAddress.Text) < cintEMailAddressMinLength then
  begin
    HUErrorMsgOk(msgEMailAddressCaption, emInvalidEMailAddress);
    Result := False;
  end;// if Length(edtEMailAddress.Text) < cintEMailAddressMinLength

end;// function ValidEMailAddress

//----------------------------------------------------------------------------------------
function TdlgHURegistration.ValidCallsign : Boolean;
begin;

    Result := True;

    if Length(edtCallsign.Text) < cintCallsignMinLength then
    begin
      HUErrorMsgOk(msgCallsignCaption, emInvalidCallsign);
      Result := False;
    end;// if Length(edtCallsign.Text) < cintCallsignMinLength

end;// function TdlgHURegistration.ValidCallsign

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegistration.FormCreate(Sender: TObject);
begin

  edtFirstName.MaxLength := cintFirstNameMaxLength;
  edtLastName.MaxLength := cintLastNameMaxLength;
  edtEMailAddress.MaxLength := cintEMailAddressMaxLength;
  edtCallsign.MaxLength := cintCallsignMaxLength;

end;// procedure TdlgHURegistration.FormCreate

//----------------------------------------------------------------------------------------
procedure TdlgHURegistration.FormShow(Sender: TObject);
begin

end;// procedure TdlgHURegistration.FormShow

//========================================================================================
end.// unit HURegistration

