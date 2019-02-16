unit HUSerialStuff;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : SerialStuff.pas
//
// Description :
//
// Called By :
//
// Calls :
//
// Ver. : 1.0.0
//
// Date : 13 Feb 2019
//
//========================================================================================

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  ExtCtrls, LazSerial, SdpoSerial
  // Application units
  // HULib units
  ;

type

  { TdlgHUSerialStuff }

  TdlgHUSerialStuff = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbxComPort: TComboBox;
    cbxBaudRate : TComboBox;
    cbxParity: TComboBox;
    cbxDataBits: TComboBox;
    cbxStopBits: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    rbtNoHandshaking: TRadioButton;
    rbtSoftwareHandshaking: TRadioButton;
    rbtHardwareHandshaking: TRadioButton;
    SdpoSerial1: TSdpoSerial;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LoadComPorts;
  private
    fComPort : String;
    fBaudRate : String;
    fDataBits : String;
    fParity : String;
    fStopBits : String;
    fHandshaking : String;
    function GetCOMPort : String;
    procedure SetComPort(Port : String);
    function GetBaudRate : String;
    procedure SetBaudRate(BaudRate : String);
    function GetDataBits : String;
    procedure SetDataBits(DataBits : String);
    function GetParity : String;
    procedure SetParity(Parity : String);
    function GetStopBits : String;
    procedure SetStopBits(StopBits : String);
    function GetHandshaking : String;
    procedure SetHandshaking(Handshaking : String);
  public
    property pComPort : String read GetComPOrt write SetComPort;
    property pBaudRate : String read GetBaudRate write SetBaudRate;
    property pDataBits : String read GetDataBits write SetDataBits;
    property pParity : String read GetParity write SetParity;
    property pStopBits : String read GetStopBits write SetStopBits;
    property pHandshaking : String read GetHandshaking write SetHandshaking;

end;// TdlgHUSerialStuff = class(TForm)

var
  dlgHUSerialStuff: TdlgHUSerialStuff;

implementation

{$R *.lfm}

//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================
const
  cintMaxComPorts = 32;
  cintMinComPorts = 1;


  BaudRateArrayMaxItems =  9;
  BaudRateArray : Array [0..BaudRateArrayMaxItems] of String  = ('br__300', 'br__600',
                                                                'br__1200', 'br__2400',
                                                                'br__4800', 'br__9600',
                                                                'br__19200', 'br__38400',
                                                                'br__57600', 'br__115200');

  ParityArrayMaxItems = 4;
  ParityArray : Array [0..ParityArrayMaxItems] of String = ('pNone', 'pOdd', 'Even',
                                                           'pMark', 'pSpace');

  DataBitsArrayMaxItems = 3;
  DataBitsArray : Array [0..DataBitsArrayMaxItems] of String = ('db5bits', 'db6bits',
                                                               'db7bits', 'db8bits');

  StopBitsArrayMaxItems = 1;
  StopBitsArray : Array [0..StopBitsArrayMaxItems] of String = ('sbOne', 'sbTwo');

//========================================================================================
//          PUBLIC CONSTANTS
//========================================================================================

//========================================================================================
//          PRIVATE VARIABLES
//========================================================================================
var

  vstrAvaiableComPorts : Array [cintMinComPorts..cintMaxComPorts] of String;

//========================================================================================
//          PUBLIC VARIABLES
//========================================================================================

//========================================================================================
//          PRIVATE ROUTINES
//========================================================================================
procedure TdlgHUSerialStuff.LoadComPorts;
// Load all available ComPorts from 1 to 32 into the AvialableComPorts Array.
// An Available ComPOrt is one that can be opened.
var
  vintPort : integer;

begin

  //  First Clear the array
  cbxComPort.Items.Clear;

  //  Now Load the array
 for vintPort := cintMinComPorts to cintMaxComPorts do
 begin

   // First try to Open the port
   SdpoSerial1.Device := 'COM' + IntToStr(vintPort);

   try
     SdpoSerial1.Active := True;
   except
   end;// try

   if SdpoSerial1.Active then
   begin
     cbxComPort.items.Add(SdpoSerial1.Device);
     SdpoSerial1.Active := False;
   end;// if SdpoSerial1.Active

 end;// for vintPort := cintMinComPorts to cintMaxComPorts

end;// procedure TdlgHUSerialStuff.LoadComPorts

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================
function TdlgHUSerialStuff.GetComPort: String;
begin
   Result := fComPort;
end;// function TdlgHUSerialStuff.GetComPort

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetComPort(Port: String);
begin
    fComPort := Port;
end;// procedure TdlgHUSerialStuff.SetComPort

//========================================================================================
function TdlgHUSerialStuff.GetBaudRate: String;
begin
   Result := fBaudRate;
end;// function TdlgHUSerialStuff.GetBaudRate

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetBaudRate(BaudRate: String);
begin
    fBaudRate := BaudRate;
end;// procedure TdlgHUSerialStuff.SetBaudRate

//========================================================================================
function TdlgHUSerialStuff.GetDataBits: String;
begin
   Result := fDataBits;
end;// function TdlgHUSerialStuff.GetBaudRate

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetDataBits(DataBits: String);
begin
    fDataBits := DataBits;
end;// procedure TdlgHUSerialStuff.SetDataBits

//========================================================================================
function TdlgHUSerialStuff.GetParity: String;
begin
   Result := fParity;
end;// function TdlgHUSerialStuff.GetParity

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetParity(Parity: String);
begin
    fParity := Parity;
end;// procedure TdlgHUSerialStuff.SetParity

//========================================================================================
function TdlgHUSerialStuff.GetStopBits: String;
begin
   Result := fStopBits;
end;// function TdlgHUSerialStuff.GetStopBits

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetStopBits(StopBits: String);
begin
    fStopBits := StopBits;
end;// procedure TdlgHUSerialStuff.SetStopBits

//========================================================================================
function TdlgHUSerialStuff.GetHandshaking: String;
begin
   Result := fHandshaking;
end;// function TdlgHUSerialStuff.GetHandshaking

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetHandshaking(Handshaking: String);
begin
    fHandshaking := Handshaking;
end;// procedure TdlgHUSerialStuff.SetHandshaking

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHUSerialStuff.BitBtn1Click(Sender: TObject);
begin

end;// procedure TdlgHUSerialStuff.BitBtn1Click

//========================================================================================
procedure TdlgHUSerialStuff.BitBtn2Click(Sender: TObject);
begin

end;// procedure TdlgHUSerialStuff.BitBtn2Click

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHUSerialStuff.FormClose(Sender: TObject;
			var CloseAction: TCloseAction);
begin

end;// procedure TdlgHUSerialStuff.FormClose

//========================================================================================
procedure TdlgHUSerialStuff.FormCreate(Sender: TObject);
var
  intTInt : Integer;
  intTemp : Integer;
begin

  intTInt := BaudRateArrayMaxItems;
  for intTemp := 0 to BaudRateArrayMaxItems do
  begin
    cbxBaudRate.Items.Add (BaudRateArray[intTemp]);
  end;// for intTemp := 0 to BaudRateArrayMaxItems do

  for intTemp := 0 to ParityArrayMaxItems do
  begin
    cbxParity.Items.Add (ParityArray[intTemp]);
  end;// for intTemp := 0 to ParityArrayMaxItems do

  for intTemp := 0 to DataBitsArrayMaxItems do
  begin
    cbxDataBits.Items.Add (DataBitsArray[intTemp]);
  end;// for intTemp := 0 to DataBitsArrayMaxItems do

  for intTemp := 0 to StopBitsArrayMaxItems do
  begin
    cbxStopBits.Items.Add (StopBitsArray[intTemp]);
  end;// for intTemp := 0 to StopBitsArrayMaxItems do

end;// procedure TdlgHUSerialStuff.FormCreate

//========================================================================================
procedure TdlgHUSerialStuff.FormShow(Sender: TObject);
begin

  // Load Combo Boxes

  LoadComPorts;
  if cbxcomport.Items.Count = 0 then
    showmessage('No COM Ports')
  else
    cbxcomport.Text:=cbxComPort.Items[0];

  cbxBaudRate.Text := cbxBaudRate.Items[0];
  cbxParity.Text := cbxParity.Items[0];
  cbxDataBits.Text := cbxDataBits.Items[0];
  cbxStopBits.Text := cbxStopBits.Items[0];

end;// procedure TdlgHUSerialStuff.FormShow

//========================================================================================
end.// unit SerialStuff

