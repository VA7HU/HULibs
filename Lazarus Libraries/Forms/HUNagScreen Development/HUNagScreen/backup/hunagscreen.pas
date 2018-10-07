unit HUNagScreen;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : HUNagScreen.pas
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
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls,
  HUConstants, HUMessageBoxes, HURegister1;

type

  { TdlgHUNagScreen }

  TdlgHUNagScreen = class(TForm)
    bbtNo: TBitBtn;
    bbtYes: TBitBtn;
    bbtHelp: TBitBtn;
    Memo1: TMemo;
    procedure bbtHelpClick(Sender: TObject);
    procedure bbtNoClick(Sender: TObject);
    procedure bbtYesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fDlgTitle : string;
  public
    function GetDlgTitle : string;
    procedure SetDlgTitle(Title : string);
    property pDlgTitle: string read GetDlgTitle write SetDlgTitle;
  end;

var
  dlgHUNagScreen: TdlgHUNagScreen;

implementation

{$R *.lfm}


//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================

const

  cstrMemoText = K_CR +
                 'You are using an un-registered copy of this software.' +
                 K_CR + K_CR +
                 'Registering your copy will ensure you get notified of any ' +
                 'Bug Fixes, Changes or Enhancements to keep it current.' +
                 K_CR + K_CR +
                 'Your registration data will never be sold or shared.' +
                 K_CR + K_CR +
                 'Would you like to register now? If not, you can register later' +
                 K_CR +
                 'by using your application <Help - Register> menu item.' +
                 K_CR;

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
function TdlgHUNagScreen.GetDlgTitle: string;
begin
   Result := K_CR + fDlgTitle + K_CR + K_CR;
end;// function TdlgHUNagScreen.GetDlgTitle

//----------------------------------------------------------------------------------------
procedure TdlgHUNagScreen.SetDlgTitle(Title: string);
begin
    fDlgTitle := Title;
end;// procedure TdlgHUNagScreen.SetNagMsgTitle

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHUNagScreen.bbtHelpClick(Sender: TObject);
begin
  HUNotImplementedMsgOK('Help');
end;// procedure TdlgHUNagScreen.bbtHelpClick

//========================================================================================
procedure TdlgHUNagScreen.bbtNoClick(Sender: TObject);
begin

end;// procedure TdlgHUNagScreen.bbtNoClick

//========================================================================================
procedure TdlgHUNagScreen.bbtYesClick(Sender: TObject);
begin
  dlgHURegister1.ShowModal;
end;// procedure TdlgHUNagScreen.bbtYesClick

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHUNagScreen.FormShow(Sender: TObject);
begin

  dlgHUNagScreen.Caption := pDlgTitle;
end;// procedure TdlgHUNagScreen.FormShow

procedure TdlgHUNagScreen.FormCreate(Sender: TObject);
begin
    pDlgTitle := 'Default Title';
    Memo1.Caption := cstrMemoText;
end;// procedure TdlgHUNagScreen.FormCreate

//========================================================================================
end.// unit HUNagScreen

