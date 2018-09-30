unit HUNagScreen;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HUNagScreen.pas
//
// Description :
//
// Calls : HUConstants
//         HURegister
//
// Ver. : 1.00
//
// Date : 16 Sep 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls,
  // Application units
  AppSetup, HUConstants, HURegister;

type

  { TfrmHUNagScreen }

  TfrmHUNagScreen = class(TForm)
    bbtYes: TBitBtn;
    bbtNo: TBitBtn;
    Memo1: TMemo;
    procedure bbtNoClick(Sender: TObject);
    procedure bbtYesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fNagMsgTitle : String;
    function GetNagMsgTitle : string;
    procedure SetNagMsgTitle(Title : string);

  public
    property pNagMsgTitle : string read GetNagMsgTitle
                                  write SetNagMsgTitle;

  end;// TfrmHUNagScreen

var
  frmHUNagScreen: TfrmHUNagScreen;

implementation

{$R *.lfm}

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================
const

  MsgText = 'You are using an un-registered copy of this application.' +
            K_CR +
            'Registering will remove this nagging message and provide you' +
            K_CR +
            'with information on Bug fixes and Enhancements to the program' +
            K_CR + K_CR +
            'Do you wish to Register ?';

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
function TfrmHUNagScreen.GetNagMsgTitle: string;
begin
   Result := K_CR + fNagMsgTitle + K_CR + K_CR;
end;// function TfrmHUNagScreen.GetNagMsgTitle

//----------------------------------------------------------------------------------------
procedure TfrmHUNagScreen.SetNagMsgTitle(Title: string);
begin
    fNagMsgTitle := Title;
end;// procedure TfrmHUNagScreen.SetNagMsgTitle

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TfrmHUNagScreen.bbtNoClick(Sender: TObject);
begin
  // Do not show the Registration form
end;// procedure TfrmHUNagScreen.bbtNoClick

//========================================================================================
procedure TfrmHUNagScreen.bbtYesClick(Sender: TObject);
begin
  frmHURegister.ShowModal;
end;// procedure TfrmHUNagScreen.bbtYesClick

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TfrmHUNagScreen.FormShow(Sender: TObject);
begin

end;// procedure TfrmHUNagScreen.FormShow

//========================================================================================
procedure TfrmHUNagScreen.FormCreate(Sender: TObject);
begin

  //ShowMessage('HUNagScreen Create');

  pNagMsgTitle := frmAppSetup.pApplicationName;
  Memo1.Text := pNagMsgTitle + MsgText;

end;// procedure TfrmHUNagScreen.FormCreate

//========================================================================================
end.// unit HUNagScreen

