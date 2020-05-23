unit HUSerialStuff;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : SerialStuff.pas
//
// Description :
//
// Called By : TdlgRadioData : FormShow
//
// Calls : HUErrorMessageBoxes : HUErrorMsgOK
//
// Ver. : 1.0.0
//
// Date : 28 Feb 2019
//
//========================================================================================

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  ExtCtrls, SdpoSerial, TypInfo,
  // Application units
  // HULib units
  HUConstants, HUMessageBoxes;

type

  { TdlgHUSerialStuff }

  TdlgHUSerialStuff = class(TForm)
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    bbtHelp: TBitBtn;
    bbtRestore: TBitBtn;
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
    rbtNoFlowControl: TRadioButton;
    rbtSoftwareFlowControl: TRadioButton;
    rbtHardwareFlowControl: TRadioButton;
    SdpoSerial1: TSdpoSerial;
    procedure bbtCancelClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure bbtRestoreClick(Sender: TObject);
    procedure cbxComPortChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LoadAvailableComPortNames;
//    procedure OpenSelectedComPort;
    procedure SaveSelectedParameters;
  private
    fAvailableComPort : String;
    fSelectedComPort : String;
    fBaudRate : TBaudRate;
    fDataBits : TDataBits;
    fParity : TParity;
    fStopBits : TStopBits;
    fFlowControl : TFlowControl;
    function GetAvailableCOMPort : String;
    procedure SetAvailableComPort(AvailablePort : String);
    function GetSelectedCOMPort : String;
    procedure SetSelectedComPort(SelectedPort : String);
    function GetBaudRate : TBaudRate;
    procedure SetBaudRate(BaudRate : TBaudRate);
    function GetDataBits : TDataBits;
    procedure SetDataBits(DataBits : TDataBits);
    function GetParity : TParity;
    procedure SetParity(Parity : TParity);
    function GetStopBits : TStopBits;
    procedure SetStopBits(StopBits : TStopBits);
    function GetFlowControl : TFlowControl;
    procedure SetFlowControl(FlowControl : TFlowControl);
    procedure SetFlowControlRadioButtons;
    procedure ReadFlowControlRadioButtons;
  public
    property pAvailableComPort : String read GetAvailableComPOrt write SetAvailableComPort;
    property pSelectedComPort : String read GetSelectedComPort write SetSelectedComPort;
    property pBaudRate : TBaudRate read GetBaudRate write SetBaudRate;
    property pDataBits : TDataBits read GetDataBits write SetDataBits;
    property pParity : TParity read GetParity write SetParity;
    property pStopBits : TStopBits read GetStopBits write SetStopBits;
    property pFlowControl : TFlowControl read GetFlowControl write SetFlowControl;

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

  cbrDefBaudRate : TBaudRate = br__9600;
  cpDefParity : TParity = pNone;
  cdbDefDataBits : TDataBits = db8Bits;
  csbDefStopBits : TStopBits = sbOne;
  cfcDefFlowControl : tFlowControl = fcNone;

//========================================================================================
//          PUBLIC CONSTANTS
//========================================================================================

//========================================================================================
//          PRIVATE VARIABLES
//========================================================================================
var

  vstrOrigSelectedCOMPort : string;
  vbrOrigBaudRate : TBaudRate;
  vparOrigParity : TParity;
  vdbOrigDataBits : TDataBits;
  vsbOrigStopBits : TStopBits;
  vfcOrigFlowControl : TFlowControl;

//========================================================================================
//          PUBLIC VARIABLES
//========================================================================================
var

  BaudRate: TBaudRate;
  vintMaxBaudRate : Integer = ord(high(BaudRate));

  Parity: TParity;
  vintMaxParity : Integer = ord(high(Parity));

  DataBits: TDataBits;
  vintMaxDataBits : Integer = ord(high(DataBits));

  StopBits: TStopBits;
  vintMaxStopBits : Integer = ord(high(StopBits));

  FlowControl : TFlowControl;
  vintMaxFlowControl : Integer = ord(high(FlowControl));

//========================================================================================
//          PRIVATE ROUTINES
//========================================================================================
{procedure TdlgHUSerialStuff.OpenSelectedComPort;
var
  vintPort : integer;
begin
{
  //  First Clear the ComboBox items
  cbxComPort.Items.Clear;

  //  Now Load the array
 for vintPort := cintMinComPorts to cintMaxComPorts do
 begin

   // First try to Open the port
   SdpoSerial1.Device := 'COM' + IntToStr(vintPort);

   try
     SdpoSerial1.Active := True;
   Except
   end;// try

   if SdpoSerial1.Active then
   begin
     cbxComPort.items.Add(SdpoSerial1.Device);
     SdpoSerial1.Active := False;
   end;// if SdpoSerial1.Active

 end;// for vintPort := cintMinComPorts to cintMaxComPorts
 }
end;// procedure TdlgHUSerialStuff.OpenSelectedComPort}

//========================================================================================
procedure TdlgHUSerialStuff.LoadAvailableComPortNames;
// Load all available ComPorts from 1 to 32 into the AvialableComPorts Array.
// An Available ComPOrt is one that can be opened.
var
  vintPort : integer;

begin

  //  Load Available COM Ports
  cbxComPort.Items.Clear;
  for vintPort := cintMinComPorts to cintMaxComPorts do
  begin

    // First try to Open the port
    SdpoSerial1.Device := 'COM' + IntToStr(vintPort);

    try
      SdpoSerial1.Active := True;
    Except
    end;// try

    if SdpoSerial1.Active then
    begin
      cbxComPort.items.Add(SdpoSerial1.Device);
      SdpoSerial1.Active := False;
    end;// if SdpoSerial1.Active

  end;// for vintPort := cintMinComPorts to cintMaxComPorts

  if cbxComPort.items.Count < cintMinComPorts then
  begin
    HUErrorMsgOK ('COM Port', 'No COM Ports Available');
    pSelectedCOMPort := '';
    cbxCOMPort.Text := pSelectedCOMPort;
  end
  else
  begin
    pSelectedCOMPort := cbxCOMPort.Items[0];
    cbxCOMPort.Text := pSelectedCOMPort;
  end;// if cbxComPort.items.Count < cintMinComPorts

end;// procedure TdlgHUSerialStuff.LoadAvailableComPortNames

//========================================================================================
procedure TdlgHUSerialStuff.SaveSelectedParameters;
begin

    // Save New Parameters
  PSelectedComPort := cbxCOMPort.Text;
  pBaudRate := (TBaudRate(cbxBaudRate.ItemIndex));
  pParity := (TParity(cbxParity.ItemIndex));
  pDataBits := (TDataBits(cbxParity.ItemIndex));
  pStopBits := (TStopBits(cbxStopBits.ItemIndex));
  ReadFlowControlRadioButtons;

end;// procedure TdlgHUSerialStuff.SaveSelectedParameters

//========================================================================================
procedure TdlgHUSerialStuff.SetFlowControlRadioButtons;
begin

  case pFlowControl of
    fcNone : rbtNoFlowControl.Checked := True;
    fcHardware : rbtHardwareFlowControl.Checked := True;
    fcXonXoff : rbtSoftwareFlowControl.Checked := True;
  end;// case pFlowControl of

end;// procedure TdlgHUSerialStuff.SetFlowControlRadioButtons;

//========================================================================================
procedure TdlgHUSerialStuff.ReadFlowControlRadioButtons;
begin

  if rbtNoFlowControl.Checked then
    pFlowControl := fcNone
  else if rbtHardwareFlowControl.Checked then
    pFlowControl := fcHardware
  else
    pFlowControl := fcXOnXOff;

end;// procedure TdlgHUSerialStuff.ReadFlowControlRadioButtons;

//========================================================================================
//          PUBLIC ROUTINES
//========================================================================================

//========================================================================================
//          PROPERTY ROUTINES
//========================================================================================
function TdlgHUSerialStuff.GetAvailableComPort: String;
begin
  Result := fAvailableComPort;
end;// function TdlgHUSerialStuff.GetAvailableComPort

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetAvailableComPort(AvailablePort: String);
begin
   fAvailableComPort := AvailablePort;
end;// procedure TdlgHUSerialStuff.SetAvailableComPort

//========================================================================================
function TdlgHUSerialStuff.GetSelectedComPort: String;
begin
  Result := fSelectedComPort;
end;// function TdlgHUSerialStuff.GetSelectedComPort

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetSelectedComPort(SelectedPort: String);
begin
   fSelectedComPort := SelectedPort;
end;// procedure TdlgHUSerialStuff.SetSelectedComPort

//========================================================================================
function TdlgHUSerialStuff.GetBaudRate: TBaudRate;
begin
  Result := fBaudRate;
end;// function TdlgHUSerialStuff.GetBaudRate

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetBaudRate(BaudRate: TBaudRate);
begin
  fBaudRate := BaudRate;
end;// procedure TdlgHUSerialStuff.SetBaudRate

//========================================================================================
function TdlgHUSerialStuff.GetDataBits: TDataBits;
begin
  Result := fDataBits;
end;// function TdlgHUSerialStuff.GetBaudRate

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetDataBits(DataBits: TDataBits);
begin
  fDataBits := DataBits;
end;// procedure TdlgHUSerialStuff.SetDataBits

//========================================================================================
function TdlgHUSerialStuff.GetParity: TParity;
begin
  Result := fParity;
end;// function TdlgHUSerialStuff.GetParity

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetParity(Parity: TParity);
begin
  fParity := Parity;
end;// procedure TdlgHUSerialStuff.SetParity

//========================================================================================
function TdlgHUSerialStuff.GetStopBits: TStopBits;
begin
  Result := fStopBits;
end;// function TdlgHUSerialStuff.GetStopBits

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetStopBits(StopBits: TStopBits);
begin
  fStopBits := StopBits;
end;// procedure TdlgHUSerialStuff.SetStopBits

//========================================================================================
function TdlgHUSerialStuff.GetFlowControl: TFlowControl;
begin
  Result := fFlowControl;
end;// function TdlgHUSerialStuff.GetFlowControl

//----------------------------------------------------------------------------------------
procedure TdlgHUSerialStuff.SetFlowControl(FlowControl: TFlowControl);
begin
  fFlowControl := FlowControl;
end;// procedure TdlgHUSerialStuff.SetFlowControl

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================
procedure TdlgHUSerialStuff.bbtCancelClick(Sender: TObject);
begin
  showmessage('Serial Stuff Cancel');
  // Show amessage and close or remain with no changes

end;// procedure TdlgHUSerialStuff.bbtCancelClick

//========================================================================================
procedure TdlgHUSerialStuff.bbtOKClick(Sender: TObject);
begin

  //IF no COMPort selected display message with cancel option
  if cbxCOMPort.Items.Count < 1 then
  begin

    if HUConfirmMsgYN('', 'Confirm') = mrNo then
    begin
      showmessage('No');
      ModalResult := mrNone;
      cbxCOMPort.SetFocus;
      Exit
    end;// if HUConfirmMsgYN('', 'Confirm') = mrNo then

  end;// if cbxCOMPort.Items.Count < cintMinComPorts

{  pSelectedCOMPort :=  cbxCOMPort.Items[0];
  cbxCOMPort.Text := pSelectedCOMPort;
  SaveSelectedParameters;  }

end;// procedure TdlgHUSerialStuff.bbtOKClick

//========================================================================================
procedure TdlgHUSerialStuff.bbtRestoreClick(Sender: TObject);
begin

  // Restore Original Parameters to form and remain
  cbxCOMPort.Text := vstrOrigSelectedCOMPort;
  pBaudRate := vbrOrigBaudRate;
  cbxBaudRate.ItemIndex := (ORD(pBaudRate));
  pParity := vparOrigParity;
  cbxParity.ItemIndex := (ORD(pParity));
  pDataBits := vdbOrigDataBits;
  cbxDataBits.ItemIndex := (ORD(pDataBits));
  pStopBits := vsbOrigStopBits;
  cbxStopBits.ItemIndex := (ORD(pStopBits));
  pFlowControl := vfcOrigFlowControl;
  SetFlowControlRadioButtons;

  ModalResult := mrNone;
  cbxCOMPort.SetFocus;

end;// procedure TdlgHUSerialStuff.bbtRestoreClick

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================
procedure TdlgHUSerialStuff.cbxComPortChange(Sender: TObject);
begin
  showmessage('pSelectedCOMPort');
end;// procedure TdlgHUSerialStuff.cbxComPortChange

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
  vintTemp : Integer;
  vstrTStr : String;
begin

  // Load Combo Boxes
  for vintTemp := 0 to vintMaxBaudRate do
  begin
    vstrTStr := GetEnumName(TypeInfo(TBaudRate), vintTemp);
    cbxBaudRate.Items.Add (vstrTStr);
  end;// for vintTemp := 0 to vintMaxeBaudRate do

  for vintTemp := 0 to vintMaxParity do
  begin
    vstrTStr := GetEnumName(TypeInfo(TParity), vintTemp);
    cbxParity.Items.Add (vstrTStr);
  end;// for vintTemp := 0 to vintMaxParity do

  for vintTemp := 0 to vintMaxDataBits do
  begin
    vstrTStr := GetEnumName(TypeInfo(TDataBits), vintTemp);
    cbxDataBits.Items.Add (vstrTStr);
  end;// for vintTemp := 0 to vintMaxDataBits do

  for vintTemp := 0 to vintMaxStopBits do
  begin
    vstrTStr := GetEnumName(TypeInfo(TStopBits), vintTemp);
    cbxStopBits.Items.Add (vstrTStr);
  end;// for vintTemp := 0 to vintMaxStopBits do

end;// procedure TdlgHUSerialStuff.FormCreate

//========================================================================================
procedure TdlgHUSerialStuff.FormShow(Sender: TObject);
var
  vintTInt : Integer;
begin

  // Load Default Parameters
  pBaudRate := cbrDefBaudRate;
  cbxBaudRate.ItemIndex := (ORD(pBaudRate));
  pParity := cpDefParity;
  cbxParity.ItemIndex := (ORD(pParity));
  pDataBits := cdbDefDataBits;
  cbxDataBits.ItemIndex := (ORD(pDataBits));
  pStopBits := csbDefstopBits;
  cbxStopBits.ItemIndex := (ORD(pStopBits));
  pFlowControl := cfcDefFlowControl;
  SetFlowControlRadioButtons;

  // Save Original Parameters
  vstrOrigSelectedCOMPort := cbxCOMPort.Text;
  vbrOrigBaudRate := pBaudRate;
  vparOrigParity := pParity;
  vdbOrigDataBits := pDataBits;
  vsbOrigStopBits := pStopBits;
  vfcOrigFlowControl := pFlowControl;

  cbxCOMPort.SetFocus;

end;// procedure TdlgHUSerialStuff.FormShow

//========================================================================================
end.// unit SerialStuff

