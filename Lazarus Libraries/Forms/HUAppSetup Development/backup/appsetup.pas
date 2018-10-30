unit AppSetup;

{$mode objfpc}{$H+}

//========================================================================================
//
// Unit : AppSetup.pas
//
// Description :
//
// Called By : Main : TfrmMain.mnuSetupClick
//
// Calls :
//
// Ver. : 1.00
//
// Date : 24 Aug 2018
//
//========================================================================================

interface

uses
  Buttons, Classes, ComCtrls, Controls, Dialogs, FileUtil, Forms, Graphics, INIFiles,
  StdCtrls, SysUtils,
  HUConstants;

type

  { TfrmAppSetup }

  TfrmAppSetup = class(TForm)
    bbtCancel: TBitBtn;
    BitBtn1: TBitBtn;
    bbtSettingsBrowse: TBitBtn;
    bbtBackupBrowse: TBitBtn;
    edtBackupDirectory: TEdit;
    edtRadiosDirectory: TEdit;
    edtUserDirectory: TEdit;
    edtApplicationDirectory: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pcSettings: TPageControl;
    tsAppSettings: TTabSheet;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fApplicationDirectory : string;
    fUserDirectory : string;
    fRadiosDirectory : string;
    fBackupDirectory : string;
    function GetApplicationDirectory : string;
    procedure SetApplicationDirectory(Dir : string);
    function GetUserDirectory : string;
    procedure SetUserDirectory(Dir : string);
    function GetRadiosDirectory : string;
    procedure SetRadiosDirectory(Dir : string);
    function GetBackupDirectory : string;
    procedure SetBackupDirectory(Dir : string);

  public
    property pApplicationDirectory : string read GetApplicationDirectory
                                     write SetApplicationDirectory;
    property pUserDirectory : string read GetUserDirectory
                                     write SetUserDirectory;
    property pRadiosDirectory : string read GetRadiosDirectory
                                     write SetRadiosDirectory;
    property pBackupDirectory : string read GetBackupDirectory
                                     write SetBackupDirectory;

    procedure ReadSettingsINIFile;
    procedure WriteSettingsINIFile;
    function INIFileExists : Boolean;

  end;// TfrmAppSetup

var
  frmAppSetup: TfrmAppSetup;

implementation

{$R *.lfm}

const
  cstrUserDirectoryName = 'KenMem' + emNoFile + CR;
  cstrRadiosDirectoryName = 'Radios';
  cstrBackupDirectoryName = 'Backup';

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
function TfrmAppSetup.GetApplicationDirectory: string;
begin
   Result := fApplicationDirectory;
end;// function TfrmAppSetup.GetApplicationDirectory

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.SetApplicationDirectory(Dir: string);
begin
    fApplicationDirectory := Dir;
end;// procedure TfrmAppSetup.SetApplicationDirectory

//----------------------------------------------------------------------------------------
function TfrmAppSetup.GetUserDirectory: string;
begin
   Result := fUserDirectory;
end;// procedure TfrmAppSetup.GetUser5Directory

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.SetUserDirectory(Dir: string);
begin
    fUserDirectory := Dir;
end;// procedure TfrmAppSetup.SetUserDirectory

//========================================================================================
function TfrmAppSetup.GetRadiosDirectory: string;
begin
   Result := fRadiosDirectory;
end;// procedure TfrmAppSetup.GetRadiosDirectory

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.SetRadiosDirectory(Dir: string);
begin
    fRadiosDirectory := Dir;
end;// procedure TfrmAppSetup.SetRadiosDirectory

//========================================================================================
function TfrmAppSetup.GetBackupDirectory: string;
begin
   Result := fBackupDirectory;
end;// procedure TfrmAppSetup.GetBackupDirectory

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.SetBackupDirectory(Dir: string);
begin
    fBackupDirectory := Dir;
end;// procedure TfrmAppSetup.SetBackupDirectory

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================

//========================================================================================
//          FILE ROUTINES
//========================================================================================

          //==============================
          //        SettingsINIFile
          //==============================

const
  cstrApplicationINIFileName = 'HUKenMem.ini';

  cstrSectionDirectories = 'DIRECTORIES';
  cstrKeyUserDirectory = 'User Directory';
  cstrKeyRadiosDirectory = 'Radios Directory';
  cstrKeyBackupDirectory = 'Backup Directory';

var
  ApplicationINIFile : TINIFile;
  ApplicationINIFileName : string;

//----------------------------------------------------------------------------------------
function TfrmAppSetup.INIFileExists : Boolean;
begin
  ApplicationINIFileName := pApplicationDirectory + '\' + cstrApplicationINIFileName;
  Result := FileExists(ApplicationINIFileName);
end;// function TfrmAppSetupApplicationDirectoryp.INIFileExists

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.ReadSettingsINIFile;

var
  vstrTStr : string;

begin

  ApplicationINIFileName := pApplicationDirectory + '\' + cstrApplicationINIFileName;
  ApplicationINIFile := TINIFile.Create(ApplicationINIFileName);

  // APPLICATION DIRECTORY SECTION

  // User Directory
  vstrTStr := ApplicationINIFile.ReadString(cstrSectionDirectories,
                                                        cstrKeyUserDirectory,
                                                        '');
  if vstrTStr = '' then
    // Default the User Directory to the Application Directory
    vstrTStr := pApplicationDirectory + '\' + cstrUserDirectoryName;
    pUserDirectory := vstrTStr;

  // Radios Directory
  vstrTStr := ApplicationINIFile.ReadString(cstrSectionDirectories,
                                                        cstrKeyRadiosDirectory,
                                                        '');
  if vstrTStr = '' then
    vstrTStr := pUserDirectory + '\' + cstrRadiosDirectoryName;
  pRadiosDirectory := vstrTStr;

  // Backup Directory
  vstrTStr := ApplicationINIFile.ReadString(cstrSectionDirectories,
                                                        cstrKeyBackupDirectory,
                                                        '');
  if vstrTStr = '' then
    vstrTStr := pUserDirectory + '\' + cstrBackupDirectoryName;
  pBackupDirectory := vstrTStr;

  ApplicationINIFile.Free;

end;// procedure TfrmAppSetup.ReadSettingsINIFile

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.WriteSettingsINIFile;
begin

    showmessage('WriteSettingsINIFile');

    ApplicationINIFileName := pApplicationDirectory + '\' + cstrApplicationINIFileName;
    showmessage(ApplicationINIFileName);

    ApplicationINIFile := TINIFile.Create(ApplicationINIFileName);

    // APPLICATION DIRECTORY SECTION

    // User Directory
    ApplicationINIFile.WriteString(cstrSectionDirectories,
                                    cstrKeyUserDirectory,
                                    pUserDirectory);

    // Radios Directory
    ApplicationINIFile.WriteString(cstrSectionDirectories,
                                    cstrKeyRadiosDirectory,
                                    pRadiosDirectory);

    // Backup Directory
    ApplicationINIFile.WriteString(cstrSectionDirectories,
                                    cstrKeyBackupDirectory,
                                    pBackupDirectory);

    ApplicationINIFile.Free;

end;// procedure TfrmAppSetup.WriteSettingsINIFile

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TfrmAppSetup.FormCreate(Sender: TObject);
begin

end;// procedure TfrmAppSetup.FormCreate

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.FormShow(Sender: TObject);
begin

  // Hide future controls
  bbtSettingsBrowse.Visible:=False;
  bbtBackupBrowse.Visible:=False;

  // Load current properties
  edtApplicationDirectory.Text:=pApplicationDirectory;
  edtUserDirectory.Text:=pUserDirectory;
  edtRadiosDirectory.Text:=pRadiosDirectory;
  edtBackupDirectory.Text:=pBackupDirectory;

end; // procedure TfrmAppSetup.FormShow

//----------------------------------------------------------------------------------------
procedure TfrmAppSetup.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

//========================================================================================
end. // unit AppSetup

