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
// Calls : HUMessageBoxes : HUConfirmMsgYN
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
  HUMessageBoxes, HUValidations;

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
    function DataComplete : boolean;
    function GenerateKey (SeedVal : string) : string;
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

  clMandatoryField = $00CACAFF;

  CmsgConfirmCancelType = 'Confirm Cancel';
  CmsgConfirmCancelText = 'Confirm you wish to cancel thid registration ?';

  ImsgMandatoryFieldType = 'Mandatory Field';
  ImsgMandatoryFNameText = 'Your First Name is a Mandatory field';
  ImsgMandatoryLNameText = 'Your Last Name is a Mandatory field';
  ImsgMandatoryCallSignText = 'Your CallSign is a Mandatory field';

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
function TdlgHURegister1.GenerateKey (SeedVal : string) : string;
begin

end;// function TdlgHURegister1.GenerateKey

//========================================================================================
function TdlgHURegister1.DataComplete : boolean;

const
  cblnMaxNameLen = 2;
var
  Complete : boolean;
begin

  Complete := False;

  if not Length(edtFirstName.Text) > cblnMaxNameLen then
    Complete := False;
  if not Length(edtLastName.Text) > cblnMaxNameLen then
    Complete := False;
  if not Length(edtFirstName.Text) > cblnMaxNameLen then
    Complete := False;

  DataComplete := Complete;

end;// function TdlgHURegister1.DataComplete

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
  HUConfirmMsgYN (CmsgConfirmCancelType, CmsgConfirmCancelText);
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

  if not DataComplete then
    //begin
     //if bbtCancel.Focused then
       //Exit;
     edtFirstName.Color := clMandatoryField;
     HUInformationMsgOK(ImsgMandatoryFieldType, ImsgMandatoryFNameText);
    //end;// if not DataComplete

end;// procedure TdlgHURegister1.edtFirstNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtLastNameExit(Sender: TObject);
begin

  if not DataComplete then
    begin
     if bbtCancel.Focused then
       Exit;
     edtLastName.Color := clMandatoryField;
     HUInformationMsgOK(ImsgMandatoryFieldType, ImsgMandatoryLNameText);
    end;// if not DataComplete

end;// procedure TdlgHURegister1.edtLastNameExit

//----------------------------------------------------------------------------------------
procedure TdlgHURegister1.edtCallSignExit(Sender: TObject);
begin

  if not DataComplete then
    begin
     if bbtCancel.Focused then
       Exit;
     edtCallSign.Color := clMandatoryField;
     HUInformationMsgOK(ImsgMandatoryFieldType, ImsgMandatoryCallSignText);
    end;// if not DataComplete

end;// procedure TdlgHURegister1.edtCallSignExit

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegister1.FormCreate(Sender: TObject);
begin
  position := poScreenCenter;
end;// procedure TdlgHURegister1.FormCreate

//========================================================================================
procedure TdlgHURegister1.FormShow(Sender: TObject);
begin
  fRegistrationKey := '';
  edtRegistrationKey.Text := fRegistrationKey;
  edtFirstName.SetFocus;
  bbtOK.Enabled := False;
end;// procedure TdlgHURegister1.FormShow

//========================================================================================
end.// unit HURegister1

