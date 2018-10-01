unit HURegister;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HURegister.pas
//
// Description :
//
// Called By :
//
// Calls :
//
// Ver. : 1.00
//
// Date : 30 Sep 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons;

type

  { TdlgHURegister }

  TdlgHURegister = class(TForm)
    bbtCancel: TBitBtn;
    bbtSave: TBitBtn;
    bbtHelp: TBitBtn;
    procedure bbtCancelClick(Sender: TObject);
    procedure bbtHelpClick(Sender: TObject);
    procedure bbtSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fRegistered: Boolean;
    fFirstName: string;
    fLastName: string;
    fCall: string;
    fAdderess1: string;
    fAddress2: string;
    fCity: string;
    fProvState: string;
    fCountry: string;
    fPostalCode: string;
    fPhone1: string;
    fPhone2: string;
    feMail: string;
  public
    function GetRegistered : Boolean;
    procedure SetRegistered(Value : Boolean);
    property pRegistered: Boolean read GetRegistered write SetRegistered;

    function GetFirstName : string;
    procedure SetFirstName(FN : string);
    property pFirstName: string read GetFirstName write SetFirstName;

    function GetLastName : string;
    procedure SetLastName(LN : string);
    property pLastName: string read GetLastName write SetLastName;

    function GetCall : string;
    procedure SetCall( Call : string);
    property pCall: string read GetCall write SetCall;

    function GetAddress1 : string;
    procedure SetAddress1( Address1 : string);
    property pAddress1: string read GetAddress1 write SetAddress1;

    function GetAddress2 : string;
    procedure SetAddress2( Address2 : string);
    property pAddress2: string read GetAddress2 write SetAddress2;

    function GetCity : string;
    procedure SetCity( City : string);
    property pCity: string read GetCity write SetCity;

    function GetProvState : string;
    procedure SetProvState( ProvState : string);
    property pProvState: string read GetProvState write SetProvState;

    function GetCountry : string;
    procedure SetCountry( Country : string);
    property pCountry: string read GetCountry write SetCountry;

    function GetPostalCode : string;
    procedure SetPostalCode( PostalCode : string);
    property pPostalCode: string read GetPostalCode write SetPostalCode;

    function GetPhone1 : string;
    procedure SetPhone1( Phone1 : string);
    property pPhone1: string read GetPhone1 write SetPhone1;

    function GetPhone2 : string;
    procedure SetPhone2( Phone2 : string);
    property pPhone2: string read GetPhone2 write SetPhone2;

    function GeteMail : string;
    procedure SeteMail( eMail : string);
    property peMail: string read GeteMail write SeteMail;

  end;// TdlgHURegister

var
  dlgHURegister: TdlgHURegister;

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

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================
function TdlgHURegister.GetRegistered: Boolean;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function dlgHURegister.GetDlgTitle

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetRegistered(Value: Boolean);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetNagMsgTitle

//========================================================================================
function TdlgHURegister.GetFirstName: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetFirstName

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetFirstName(FN: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetNaSetFirstNamegMsgTitle

//========================================================================================
function TdlgHURegister.GetLastName: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetLastName

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetLastName(LN: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetLastName

//========================================================================================
function TdlgHURegister.GetCall: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetCall

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetCall(Call: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetCall

//========================================================================================
function TdlgHURegister.GetAddress1: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetAddress1

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetAddress1(Address1: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetAddress1

//========================================================================================
function TdlgHURegister.GetAddress2: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetAddress2

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetAddress2(Address2: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetAddress2

//========================================================================================
function TdlgHURegister.GetCity: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetCity

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetCity(City: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetCity

//========================================================================================
function TdlgHURegister.GetProvState: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetProvState

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetProvState(ProvState: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetProvState

//========================================================================================
function TdlgHURegister.GetCountry: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetCountry

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetCountry(Country: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetCountry

//========================================================================================
function TdlgHURegister.GetPostalCode: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetPostalCode

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetPostalCode(PostalCode: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetPostalCode

//========================================================================================
function TdlgHURegister.GetPhone1: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetPhone1

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetPhone1(Phone1: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetPhone1

//========================================================================================
function TdlgHURegister.GetPhone2: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GetPhone2

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SetPhone2(Phone2: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetPhone2


    //========================================================================================
function TdlgHURegister.GeteMail: string;
begin
   //Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHURegister.GeteMail

//----------------------------------------------------------------------------------------
procedure TdlgHURegister.SeteMail(eMail: string);
begin
    //fDlgTitle := Title;
end;// procedure dlgHURegister.SetPeMail

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHURegister.bbtCancelClick(Sender: TObject);
begin

end;// procedure TdlgHURegister.bbtCancelClick

//========================================================================================
procedure TdlgHURegister.bbtHelpClick(Sender: TObject);
begin

end;// procedure TdlgHURegister.bbtHelpClick

//========================================================================================
procedure TdlgHURegister.bbtSaveClick(Sender: TObject);
begin

end;// procedure TdlgHURegister.bbtSaveClick

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHURegister.FormCreate(Sender: TObject);
begin

end;// procedure TdlgHURegister.FormCreat

//========================================================================================
procedure TdlgHURegister.FormShow(Sender: TObject);
begin

end;// procedure TdlgHURegister.FormShow

//========================================================================================
end.// unit HURegister

