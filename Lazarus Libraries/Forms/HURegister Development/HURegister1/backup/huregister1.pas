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
// Calls : HUConstants
//         HUMessageBoxes : HUConfirmMsgYN
//                          HUInformationMsgOK
//         HUValidations : ValidNameCharacter
//
// Ver. : 1.01
//
// Date : 16 Oct 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls,
  HUConstants, HUMessageBoxes, HUValidations;

type

  { TdlgHURegister1 }

  TdlgHURegister1 = class(TForm)
    bbtOK: TBitBtn;
    bbtHelp: TBitBtn;
    bbtCancel: TBitBtn;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtCallSign: TEdit;
    edtRegistrationKey: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure bbtHelpClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure bbtCancelClick(Sender: TObject);
    procedure edtCallSignEnter(Sender: TObject);
    procedure edtCallSignExit(Sender: TObject);
    procedure edtCallSignKeyPress(Sender: TObject; var Key: char);
    procedure edtFirstNameEnter(Sender: TObject);
    procedure edtFirstNameExit(Sender: TObject);
    procedure edtFirstNameKeyPress(Sender: TObject; var Key: char);
    procedure edtLastNameEnter(Sender: TObject);
    procedure edtLastNameExit(Sender: TObject);
    procedure edtLastNameKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function GenerateKey : string;
    function ValidateFirstName : Boolean;
    function ValidateLastName : Boolean;
    function ValidateCallSign : Boolean;
    procedure ClearKey;
  private
    fFirstName : string;
    fLastName : string;
    fCallSign : string;
    fRegistrationKey : string;
    function GetFirstName : string;
    procedure SetFirstName(FName : string);
    function GetLastName : string;
    procedure SetLastName(LName : string);
    function GetCallSign : string;
    procedure SetCallSign(Call : string);
    function GetRegistrationKey : string;
    procedure SetRegistrationKey(RegKey : string);
  public
    property pRegistrationKey : string read GetRegistrationKey
                                     write SetRegistrationKey;
    property pFirstName : string read GetFirstName
                                     write SetFirstName;
    property pLastName : string read GetLastName
                                     write SetLastName;
    property pCallSign : string read GetCallSign
                                     write SetCallSign;
  end;// TdlgHURegister1

var
  dlgHURegister1: TdlgHURegister1;

implementation

{$R *.lfm}

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================
const

  // Title
  cstrCaption = 'Registration Data';

  // Colors
  clMandatoryField = $00CACAFF;

  cintMinFirstNameLen = 2;
  cintMaxFirstNameLen = 20;
  cintMinLastNameLen = 2;
  cintMaxLastNameLen = 20;
  cintMinCallSignLen = 3;
  cintMaxCallSignLen = 15;

var
  blnValidFirstName :Boolean;
  blnValidLastName :Boolean;
  blnValidCallsign :Boolean;

const //Messages

  EmsgInvalidDataEntryType = '';
  EmsgInvalidDataEntrytext = 'Invalid Data Entry';

  ImsgMandatoryFieldType = 'Mandatory Field';
  ImsgMandatoryFirstNameType = '';
  ImsgMandatoryFirstNameText = 'Your First Name is a Mandatory Entry';
  ImsgMandatoryLastNameType = '';
  ImsgMandatoryLastNameText = 'Your Last Name is a Mandatory Entry';
  ImsgMandatoryCallSignType = '';
  ImsgMandatoryCallSignText = 'Your CallSign is a Mandatory Entry';

  ImsgSaveRegKeyType = '';
  ImsgSaveRegKeyText = 'Ensure that you save your Registration Key';

  CmsgConfirmDlgCancelType = '';
  CmsgConfirmDlgCancelText = 'If you do not register you will not receive' +
                         K_CR +
                         'Notices of Bug fixes or Progam enhancements.' +
                         K_CR + K_CR +
                         'Confirm you wish to cancel yout Registration ?';

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
function TdlgHURegister1.ValidateFirstName : Boolean;
begin

 if Length(edtFirstName.Text) < cintMinFirstNameLen then
 begin
   edtFirstName.Color := clMandatoryField;
   HUErrorMsgOK(EmsgInvalidDataEntryType, ImsgMandatoryFirstNameText);
   ValidateFirstName := False;
   blnValidFirstName := False;
 end
 else
 begin
   edtLastName.Color := clDefault;
   ValidateFirstName := True;
   blnValidFirstName := True;
 end;

end;// function ValidFirstName

//----------------------------------------------------------------------------------------
function TdlgHURegister1.ValidateLastName : Boolean;
begin

 if Length(edtLastName.Text) < cintMinLastNameLen then
 begin
   edtLastName.Color := clMandatoryField;
   HUErrorMsgOK(EmsgInvalidDataEntryType, ImsgMandatoryLastNameText);
   ValidateLastName := False;
   blnValidLastName := False;
 end
 else
 begin
   edtLastName.Color := clDefault;
   ValidateLastName := True;
   blnValidLastName := True;
 end;

end;// function ValidLastName

//----------------------------------------------------------------------------------------
function TdlgHURegister1.ValidateCallSign : Boolean;
begin

 if Length(edtCallSign.Text) < cintMinCallSignLen then
 begin
   edtCallSign.Color := clMandatoryField;
   HUErrorMsgOK(EmsgInvalidDataEntryType, ImsgMandatoryCallSignText);
   ValidateCallSign := False;
   blnValidCallsign := False;
 end
 else
 begin
   edtLastName.Color := clDefault;
   ValidateCallSign := True;
   blnValidCallSign := True;
 end;

end;// function ValidCallSign

//========================================================================================
function TdlgHURegister1.GenerateKey : string;

const
  cintKeyLength = 10;
  cintTypes = 3;
 cintDigit = 1;
  cintucAlpha = 2;
  cintlcAlpha = 3;
  cintDigits = 10;
  cintAlphas = 25;

var
  vintTemp : Integer;
  vintType : Integer;
  vintChar : integer;
  vstrKeyString : String;

begin

  Randomize;
  vstrKeyString := '';

  // Create the 10 character string
  for vintTemp := 1 to cintKeyLength do
  begin

    // First we get the type of char (digit, a-z, A-Z)
    vintType := (Random(cintTypes) + 1);

    // Now we get the character itself
    case vintType of
      1  : begin
             vstrKeyString := vstrKeyString + CHR(Random(10) + ORD(K_0));
           end;
      2  : begin
             vstrKeyString := vstrKeyString + CHR(Random(25) + ORD(lK_a));
           end;
      3  : begin
             vstrKeyString := vstrKeyString + CHR(Random(25) + ORD(uK_A));
           end;
    end;// case vintType

  end;// for vintTemp := 1 to cintKeyLength

  edtRegistrationKey.Text := vstrKeyString;

  HUInformationMsgOK(ImsgSaveRegKeyText, ImsgSaveRegKeyText);

end;// function TdlgHURegister1.GenerateKey

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.ClearKey;
begin

  if blnValidFirstName and blnValidLastName and blnValidCallsign then
  begin
    edtRegistrationKey.Color := clYellow;
    GenerateKey;
    bbtOK.Enabled := True;
  end
  else
  begin
    edtRegistrationKey.Color := clDefault;
    edtRegistrationKey.Text := '';
    bbtOK.Enabled := False;
  end;// if blnValidFirstName and blnValidLastName and blnValidCallsign

end;// procedure TdlgHURegister1.ClearKey

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================
function TdlgHURegister1.GetFirstName: string;
begin
  Result := fFirstName;
end;// function TfrmAppSetup.GetFirstName

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.SetFirstName(FName: string);
begin
   fFirstName := FName;
end;// procedure TfrmAppSetup.SetFirstName

//========================================================================================
function TdlgHURegister1.GetLastName: string;
begin
  Result := fLastName;
end;// function TfrmAppSetup.GetLastName

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.SetLastName(LName: string);
begin
   fLastName := LName;
end;// procedure TfrmAppSetup.SetLastName

//========================================================================================
function TdlgHURegister1.GetCallSign: string;
begin
  Result := fCallSign;
end;// function TfrmAppSetup.GetCallSign

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.SetCallSign(Call: string);
begin
   fCallSign := Call;
end;// procedure TfrmAppSetup.SetCallSign

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
  pFirstName := edtFirstName.Text;
  pLastName := edtLastName.Text;
  pCallSign := edtCallSign.Text;
  pRegistrationKey := edtRegistrationKey.Text;
end;// procedure TdlgHURegister1.bbtOKClick

//========================================================================================
procedure TdlgHURegister1.bbtHelpClick(Sender: TObject);
begin

end;// procedure TdlgHURegister1.bbtHelpClick

//========================================================================================
procedure TdlgHURegister1.bbtCancelClick(Sender: TObject);
begin
  HUConfirmMsgYN (CmsgConfirmDlgCancelType, CmsgConfirmDlgCancelText);
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
procedure TdlgHURegister1.edtFirstNameEnter(Sender: TObject);
begin
  edtFirstName.Color := clDefault;
end;// procedure TdlgHURegister1.edtFirstNameEnter

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtLastNameEnter(Sender: TObject);
begin
  edtLastName.Color := clDefault;
end;// procedure TdlgHURegister1.edtLastNameEnter

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtCallSignEnter(Sender: TObject);
begin
  edtCallSign.Color := clDefault;
end;// procedure TdlgHURegister1.edtCallSignEnter

//========================================================================================
procedure TdlgHURegister1.edtFirstNameExit(Sender: TObject);
begin
  ValidateFirstName;
  ClearKey;
end;// procedure TdlgHURegister1.edtFirstNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtLastNameExit(Sender: TObject);
begin
  ValidateLastName;
  ClearKey;
end;// procedure TdlgHURegister1.edtLastNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtCallSignExit(Sender: TObject);
begin
  ValidateCallsign;
  ClearKey;
end;// procedure TdlgHURegister1.edtCallSignExit

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegister1.FormCreate(Sender: TObject);
begin

  Caption := cstrCaption;
  Position := poScreenCenter;

  edtFirstName.MaxLength := cintMaxFirstNameLen;
  edtLastName.MaxLength := cintMaxLastNameLen;
  edtCallSign.MaxLength := cintMaxCallSignLen;

end;// procedure TdlgHURegister1.FormCreate

//========================================================================================
procedure TdlgHURegister1.FormShow(Sender: TObject);
begin

  edtFirstName.Text := pFirstName;
  edtLastName.Text := pLastName;
  edtCallSign.Text := pCallSign;
  edtRegistrationKey.Text := pRegistrationKey;

  edtFirstName.SetFocus;
  bbtOK.Enabled := False;
  //  ClearKey;
  edtRegistrationKey.ReadOnly := True;

end;// procedure TdlgHURegister1.FormShow

//========================================================================================
end.// unit HURegister1

