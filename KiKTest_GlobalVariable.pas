unit KiKTest_GlobalVariable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UnitMil, StdCtrls, ExtCtrls, Buttons, ComCtrls;

const
   // ----------- Trigger -------------
  TriggerVoltMax = 5;
  TriggerVoltMin = -5;


var
  CardauswahlIndex: integer;
  IFKOnlineIndex:integer;
  ErrorCount:integer;

  MBKOnline: TStrings;
  MBKOnlineNr:TStrings;

  _FileSaveData:TStringList;

  MBKCount:integer;
  MBKOnlineIndex:integer;

  MDK_IDCODE:TStrings;

  LogFile_Head:string;
  Dateiname :string;
  buffer    :string;
  //FileByte  :file of KickerDaten;
  FileByte : TFileStream;
  ConfigFileSize    :DWORD;

  TriggerVoltDacA   :string;
  TriggerVoltDacB   :string;
  TriggerVoltDacC   :string;
  TriggerVoltDacD   :string;

implementation

end.
