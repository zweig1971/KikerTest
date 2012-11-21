unit KiKTest_ShowLogFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TKiKShowLogFile = class(TForm)
    LogFile_ListBox: TListBox;
    LogFileClear_Button: TButton;
    LogFileSave_Button: TButton;
    LogFileOK_Button: TButton;
    procedure FormCreate(Sender: TObject);
    procedure LogFileClear_ButtonClick(Sender: TObject);
    procedure LogFileSave_ButtonClick(Sender: TObject);
    procedure LogFileOK_ButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KiKShowLogFile: TKiKShowLogFile;

implementation

uses KiKTest_MainUnit, KiKTest_GlobalVariable, UnitMil;

{$R *.dfm}

procedure TKiKShowLogFile.LogFileOK_ButtonClick(Sender: TObject);
begin
  KiKShowLogFile.Close;
end;

procedure TKiKShowLogFile.LogFileSave_ButtonClick(Sender: TObject);
begin
  KickerTest.LogFileSave_Button.Click;
end;

procedure TKiKShowLogFile.LogFileClear_ButtonClick(Sender: TObject);
begin
  KickerTest.LogFileClear_Button.Click;
end;

procedure TKiKShowLogFile.FormCreate(Sender: TObject);
begin
  KiKShowLogFile.LogFile_ListBox.Clear;
  //KiKShowLogFile.LogFile_ListBox.Items:= _FileSaveData;
  //KiKShowLogFile.LogFile_ListBox.Items:=KickerTesT.shit;
end;

end.
