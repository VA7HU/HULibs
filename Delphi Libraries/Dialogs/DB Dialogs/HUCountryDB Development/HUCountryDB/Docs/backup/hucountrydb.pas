unit HUCountryDB;

{$mode objfpc}{$H+}
 
//========================================================================================
//
// Unit :  HUCountryDB.pas
//
// Description :
//
// Called By :
//
// Calls :
//
// Ver. : 1.00
//
// Date : 15 Dec 2018
//
//========================================================================================

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, Buttons, DbCtrls, DBGrids, StdCtrls, ComCtrls;

type

  { TdlgHUCountryDB }

  TdlgHUCountryDB = class(TForm)
    bbtClose: TBitBtn;
    bbtCancel: TBitBtn;
    bbtSave: TBitBtn;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    StatusBar1: TStatusBar;
    procedure DataSource1StateChange(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType
      );
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fDebug : boolean;
    function GetDebug : boolean;
    procedure SetDebug(Dbg : boolean);
  public
    property pDebug : boolean read GetDebug write SetDebug;
  end;

var
dlgHUCountryDB: TdlgHUCountryDB;

implementation

{$R *.lfm}


//========================================================================================
//          PRIVATE CONSTANTS
//========================================================================================

//========================================================================================
//          PUBLIC CONSTANTS
//========================================================================================
const
  cstrCountryDBName = 'HUCountryDB.sl3';

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
function TdlgHUCountryDB.GetDebug: boolean;
begin
   Result := fDebug;
end;// function TfrmSettings.GetApplicationDirectory

//----------------------------------------------------------------------------------------
procedure TdlgHUCountryDB.SetDebug(Dbg: boolean);
begin

    pDebug := Dbg;

    if pDebug then
    begin
      StatusBar1.Visible := True;
    end
    else
    begin
      StatusBar1.Visible := False;
    end;// if pDebug

end;// procedure TfrmSettings.SetApplicationDirectory

//========================================================================================
//          MENU ROUTINES
//========================================================================================

//========================================================================================
//          COMMAND BUTTON ROUTINES
//========================================================================================

//========================================================================================
//          CONTROL ROUTINES
//========================================================================================
procedure TdlgHUCountryDB.DataSource1StateChange(Sender: TObject);
var
  vstrState: string;
begin

  case DataSource1.State of

   dsBrowse: vstrState := 'dsBrowse';
   dsEdit: vstrState := 'dsEdit';
   dsInsert: vstrState := 'dsInsert';
   dsInactive: vstrState := 'dsInactive';
   dsCalcFields:  vstrState := 'dsCalcFields';
   dsNewValue: vstrState := 'dsNewValue';
   dsOldValue:  vstrState :='dsOldValue';
   dsFilter: vstrState := 'dsFilter';
  else
    vstrState :='OTHER';
  end;

  StatusBar1.Panels[1].Text := vstrState;

end;// procedure TdlgHUCountryDB.DataSource1StateChange

//========================================================================================
procedure TdlgHUCountryDB.DBNavigator1BeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin

  Case (Button) of
    nbFirst : begin
                ShowMessage('Before First');
              end;
    nbPrior : begin
                ShowMessage('Before Prior');
              end;
    nbNext  : begin
                ShowMessage('Before Next');
              end;
    nbLast  : begin
                ShowMessage('Before Last');
              end;
    nbInsert : begin
                 ShowMessage('Before Insert');
               end;
    nbDelete : begin
                 ShowMessage('Before Delete');
               end;
    nbEdit : begin
               ShowMessage('Before Edit');
             end;
    nbPost : begin
               ShowMessage('Before Post');
             end;
    nbCancel : begin
                 ShowMessage('Before Cancel');
               end;
    nbRefresh : begin
                  ShowMessage('Before Refresh');
                end;
  end;// Case (Button)

end;// procedure TdlgHUCountryDB.DBNavigator1BeforeAction

//----------------------------------------------------------------------------------------
procedure TdlgHUCountryDB.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
begin

  Case (Button) of
    nbFirst : begin
                ShowMessage('First');
              end;
    nbPrior : begin
                ShowMessage('Prior');
              end;
    nbNext  : begin
                ShowMessage('Next');
              end;
    nbLast  : begin
                ShowMessage('Last');
              end;
    nbInsert : begin
                ShowMessage('Insert');
              end;
    nbDelete : begin
                ShowMessage('Delete');
              end;
    nbEdit : begin
                ShowMessage('Edit');
              end;
    nbPost : begin
                ShowMessage('Post');
              end;
    nbCancel : begin
                ShowMessage('Cancel');
              end;
    nbRefresh : begin
                ShowMessage('Refresh');
              end;
  end;// Case (Button)

end;// procedure TdlgHUCountryDB.DBNavigator1Click


//========================================================================================
//          FILE ROUTINES
//========================================================================================

//========================================================================================
//          FORM ROUTINES
//========================================================================================
procedure TdlgHUCountryDB.FormCreate(Sender: TObject);
begin

  pDebug := False;

end;// procedure TdlgHUCountryDB.FormCreate

//========================================================================================
procedure TdlgHUCountryDB.FormShow(Sender: TObject);
var
  Col1 : TColumn;
  Col2 : TColumn;

begin

  SQLite3Connection1.Connected := False;
  SQLTransaction1.Active := False;
  SQLQuery1.Active := False;

  SQLite3Connection1.DatabaseName := 'HUCountryDB.sl3';
  SQLite3Connection1.Transaction := SQLTransaction1;

  SQLTransaction1.DataBase := SQLite3Connection1;

  SQLQuery1.Options := [sqoKeepOpenOnCommit, sqoAutoApplyUpdates, sqoAutoCommit];
  SQLQuery1.DataBase := SQLite3Connection1;
  SQLQuery1.Transaction := SQLTransaction1;
  SQLQuery1.SQL.Text := 'SELECT * from CountryTbl';

  DataSource1.DataSet := SQLQuery1;

  DBNavigator1.DataSource := DataSource1;

  DBGrid1.DataSource := DataSource1;
  Col1 := DBGrid1.Columns.Add;
  Col1.Width := 300;
  Col1.Alignment := taCenter;
  Col1.Title.Caption := 'Country';
  Col1.FieldName := 'Country';
  Col2 := DBGrid1.Columns.Add;
  Col2.Width := 50;
  Col2.Title.Caption := 'Code';
  Col2.FieldName := 'CountryCode';

  DBEdit1.Alignment := taCenter;
  DBEdit1.DataSource := DataSource1;
  DBEdit1.DataField := 'Country';
  DBEdit2.Alignment := taCenter;
  DBEdit2.DataSource := DataSource1;
  DBEdit2.DataField := 'CountryCode';

  SQLite3Connection1.Open;
  SQLTransaction1.Active := True;
  SQLQuery1.Open;

end;// procedure TdlgHUCountryDB.FormShow

//----------------------------------------------------------------------------------------
procedure TdlgHUCountryDB.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   SQLQuery1.Active := False;
   SQLTransaction1.Active := False;
   SQLite3Connection1.Close;
end;// procedure TdlgHUCountryDB.FormClose

//========================================================================================
end.// unit HUCountryDB

