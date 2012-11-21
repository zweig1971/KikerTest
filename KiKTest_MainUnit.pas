unit KiKTest_MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, KiKTest_GlobalVariable;

type
  TKickerTesT = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Counter1DelayMain_Edit: TEdit;
    Counter1DelayDump_Edit: TEdit;
    Counter1LatchMain_Panel: TPanel;
    Counter1CountMain_Panel: TPanel;
    Counter1CountDump_Panel: TPanel;
    Counter1LatchDump_Panel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Exit_Button: TButton;
    Loop_SpeedButton: TSpeedButton;
    Panel11: TPanel;
    Label9: TLabel;
    CounterRead_Panel: TPanel;
    Label10: TLabel;
    ErrorCounter_Panel: TPanel;
    Label11: TLabel;
    MBXID_Panel: TPanel;
    Label12: TLabel;
    CardClockPanel: TPanel;
    Label13: TLabel;
    Bevel1: TBevel;
    Panel16: TPanel;
    SystemMessages_ListBox: TListBox;
    Label14: TLabel;
    Clear_Button: TButton;
    KickerIFKMBK: TMainMenu;
    About1: TMenuItem;
    Panel5: TPanel;
    Panel10: TPanel;
    Counter2DelayMain_Edit: TEdit;
    Counter2DelayDump_Edit: TEdit;
    Counter2LatchMain_Panel: TPanel;
    Counter2CountMain_Panel: TPanel;
    Counter2CountDump_Panel: TPanel;
    Counter2LatchDump_Panel: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Counter3DelayMain_Edit: TEdit;
    Counter3DelayDump_Edit: TEdit;
    Counter3LatchMain_Panel: TPanel;
    Counter3CountMain_Panel: TPanel;
    Counter3CountDump_Panel: TPanel;
    Counter3LatchDump_Panel: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Counter4DelayMain_Edit: TEdit;
    Counter4DelayDump_Edit: TEdit;
    Counter4LatchMain_Panel: TPanel;
    Counter4CountMain_Panel: TPanel;
    Counter4CountDump_Panel: TPanel;
    Counter4LatchDump_Panel: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Counter5DelayMain_Edit: TEdit;
    Counter5DelayDump_Edit: TEdit;
    Counter5LatchMain_Panel: TPanel;
    Counter5CountMain_Panel: TPanel;
    Counter5CountDump_Panel: TPanel;
    Counter5LatchDump_Panel: TPanel;
    Counter2Activ: TCheckBox;
    Counter3Activ: TCheckBox;
    Counter4Activ: TCheckBox;
    Counter5Activ: TCheckBox;
    Label15: TLabel;
    IFKUse_Panel: TPanel;
    Edit_Button: TButton;
    SaveDialog1: TSaveDialog;
    Counter1Activ: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    Version_Panel: TPanel;
    Revision_Panel: TPanel;
    Panel6: TPanel;
    Label18: TLabel;
    LogFile_SpeedButton: TSpeedButton;
    LogFileClear_Button: TButton;
    LogFileSave_Button: TButton;
    LogFileShow_Button: TButton;
    Counter1DumpStrbNeg_CheckBox: TCheckBox;
    Label19: TLabel;
    Counter1MainStrbNeg_CheckBox: TCheckBox;
    Counter2MainStrbNeg_CheckBox: TCheckBox;
    Counter3MainStrbNeg_CheckBox: TCheckBox;
    Counter4MainStrbNeg_CheckBox: TCheckBox;
    Counter5MainStrbNeg_CheckBox: TCheckBox;
    Label20: TLabel;
    Counter2DumpStrbNeg_CheckBox: TCheckBox;
    Counter3DumpStrbNeg_CheckBox: TCheckBox;
    Counter4DumpStrbNeg_CheckBox: TCheckBox;
    Counter5DumpStrbNeg_CheckBox: TCheckBox;
    Label21: TLabel;
    Counter1HWNeg_CheckBox: TCheckBox;
    Counter2HWNeg_CheckBox: TCheckBox;
    Counter3HWNeg_CheckBox: TCheckBox;
    Counter4HWNeg_CheckBox: TCheckBox;
    Counter5HWNeg_CheckBox: TCheckBox;
    Step_SpeedButton: TSpeedButton;
    sonstiges1: TMenuItem;
    PCICardSelect2: TMenuItem;
    EchoTesT2: TMenuItem;
    TriggerKarte1: TMenuItem;
    procedure LogFileShow_ButtonClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Counter5DelayDump_EditChange(Sender: TObject);
    procedure Counter4DelayDump_EditChange(Sender: TObject);
    procedure Counter3DelayDump_EditChange(Sender: TObject);
    procedure Counter2DelayDump_EditChange(Sender: TObject);
    procedure Counter1DelayDump_EditChange(Sender: TObject);
    procedure Counter5DelayMain_EditChange(Sender: TObject);
    procedure Counter4DelayMain_EditChange(Sender: TObject);
    procedure Counter3DelayMain_EditChange(Sender: TObject);
    procedure Counter2DelayMain_EditChange(Sender: TObject);
    procedure Counter1DelayMain_EditChange(Sender: TObject);
    procedure Clear_ButtonClick(Sender: TObject);
    procedure Step_ButtonClick(Sender: TObject);
    procedure Loop_SpeedButtonClick(Sender: TObject);
    procedure LogFileClear_ButtonClick(Sender: TObject);
    procedure LogFileSave_ButtonClick(Sender: TObject);
    procedure LogFile_SpeedButtonClick(Sender: TObject);
    procedure Counter5ActivClick(Sender: TObject);
    procedure Counter4ActivClick(Sender: TObject);
    procedure Counter3ActivClick(Sender: TObject);
    procedure Counter2ActivClick(Sender: TObject);
    procedure Counter1ActivClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit_ButtonClick(Sender: TObject);
    procedure Exit_ButtonClick(Sender: TObject);
    procedure ChooseIFKMBK1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Step_SpeedButtonClick(Sender: TObject);
    procedure Counter1MainStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter2MainStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter3MainStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter4MainStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter5MainStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter1DumpStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter2DumpStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter3DumpStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter4DumpStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter5DumpStrbNeg_CheckBoxClick(Sender: TObject);
    procedure Counter1HWNeg_CheckBoxClick(Sender: TObject);
    procedure Counter2HWNeg_CheckBoxClick(Sender: TObject);
    procedure Counter3HWNeg_CheckBoxClick(Sender: TObject);
    procedure Counter4HWNeg_CheckBoxClick(Sender: TObject);
    procedure Counter5HWNeg_CheckBoxClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PCICardSelect2Click(Sender: TObject);
    procedure EchoTesT2Click(Sender: TObject);
    procedure TriggerKarte1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
      shit:TStringList;
  end;

var
  KickerTesT: TKickerTesT;



implementation

uses UnitMil, KIKTest_ChosseIFKMB, modulbus, KikTest_GlobalFunc, KiKTest_Info,
  KiKTest_ShowLogFile, KiKTest_EchoTest, KiKTest_PCICardFound,
  KIKTest_TriggerMain;

{$R *.dfm}

procedure TKickerTesT.FormCreate(Sender: TObject);

var
  i,x: integer;
  index:integer;
  CardCounter: integer;
  status:_DWORD;
  Error_Char:t_Error_Char;
  Error_string:string;

begin
   IFKOnline   := TStringList.Create;
   MBKOnline   := TStringList.Create;
   MBKOnlineNr := TStringList.Create;
   MDK_IDCODE  := TStringList.Create;
   _FileSaveData:= TStringList.Create;

   KickerTesT.shit:=TStringList.Create;

   LogFile_Head:='CntNr' +';' +'CntDelayMain' +';'
                 +'CntLatchMain' +';' +'CntDelayDump'
                 +';' +'CntLatchDump' +';' +'Event A'
                 +';' + 'Event B' +';' +'KntReg' +';'
                 +'DACA' +';' +'DACB' +';' +'DACC' +';'
                 +'DACD' +';' +'Date';

   TriggerVoltDacA := 'NS';
   TriggerVoltDacB := 'NS';
   TriggerVoltDacC := 'NS';
   TriggerVoltDacD := 'NS';

   _FileSaveData.Add(LogFile_Head);

  ErrorCount:=0;
  Cardauswahl:=0;
  TriggerAdress := 0;
//--------------------------------
//        PCIMil Karte suchen
//--------------------------------


  // PCI Mil Karten zählen
  CardCounter := PCI_PCIcardCount();

  // keine PCIMil Karten vorhanden -> tschüss
  if (CardCounter = 0) then begin
    Application.MessageBox('NO PCI- CARDS FOUND', 'ABBRUCH !', 16);
    KickerTesT.Close;
  end;

  if(CardCounter = 1) then begin
    Cardauswahl := 1;
    status := PCI_DriverOpen(Cardauswahl);
    if(status <> StatusOK) then begin
      PCI_ErrorString(status, Error_Char); // ausgabe bei fehlerfall
      for i := 1 to Length(Error_Char) do begin
          Error_string := Error_string + Error_Char[i];
      end;
      Application.MessageBox(PChar(Error_string), 'ABBRUCH !', 16);
      Application.Terminate;
    end;
  end else begin // Es sind mehrere pci-karten da !
    for index:= 1 to CardCounter do begin // Mache alle ducrh
      status := PCI_DriverOpen(index);    // oeffne
       if(status = StatusOK) then begin
         Cardauswahl := index;
         break;
       end;//if(status <> StatusOK)
    end;// for index:= 1 to CardCounter do begin
    if(Cardauswahl = 0) then begin
       Application.MessageBox('NO MASTER CARD FOUND', 'ABBRUCH !', 16);
       Application.Terminate;
    end;
  end; // if(CardCounter = 1) then begin

{  // Nur eine Karte gefunden
  if (CardCounter = 1) then begin
    Cardauswahl := 1;

    // öffnen der PCI Mil Karte
    status := PCI_DriverOpen(Cardauswahl);
    if(status <> StatusOK) then begin
      PCI_ErrorString(status, Error_Char); // ausgabe bei fehlerfall
        for i := 1 to Length(Error_Char) do begin
          Error_string := Error_string + Error_Char[i];
        end;
        Application.MessageBox(PChar(Error_string), 'ABBRUCH !', 16);
        KickerTesT.Close;
    end;  }




    //if(status <> StatusOK) then begin

//--------------------------------
//--------------------------------


//------------------------------------
//        Modulbus Karten suchen
//------------------------------------

     x:=0;
     repeat
           MDK_IDCODE.Add('UNDEFINED');
           x:=x+1;
     until(x=256);

     MDK_IDCODE.Insert(1,'FG 352.150 FIB');
     MDK_IDCODE.Insert(31,'FG 450.311 Schaltkarte');
     MDK_IDCODE.Insert(32,'FG 450.320 Digital I/O');
     MDK_IDCODE.Insert(33,'FG 450.330 Statuskarte');
     MDK_IDCODE.Insert(34,'FG 450.342 Analog I/O');
     MDK_IDCODE.Insert(35,'FG 450.350 EXEV');
     MDK_IDCODE.Insert(36,'FG 450.362 MB32B');
     MDK_IDCODE.Insert(37,'FG 450.370 EvSEQ');
     MDK_IDCODE.Insert(38,'FG 450.380 GPGEN');
     MDK_IDCODE.Insert(39,'FG 450.390 MB64B');
     MDK_IDCODE.Insert(40,'FG 450.400 MBDAAD');
     MDK_IDCODE.Insert(41,'FG 450.410 Kicker-Counter');
     MDK_IDCODE.Insert(42,'FG 450.420 Trigger');

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

   // Erste IFK nehmen
    try
       IFKAdress := StrToInt('$' + IFKOnline[0]);
       IFKOnlineIndex := 0;
    except
       messagebox(0,'Keine IFK gefunden !','Warnung',16);
       IFKAdress := 0;
    end;

    //MBK suchen
    MBKFound(MBKOnline, MBKOnlineNr, MBKCount);

{    if(MBKCount = 0) then messagebox(0,'Keine MBK gefunden !','Warnung',16)
    else begin
         x:=0;
         repeat
               y:= StrToInt(MBKOnlineNr[x]);
               x:=x+1;
         until (y=4) or (x=MBKCount);

         if(y=4) then begin
            MBKOnlineIndex:= x-1;
            MBKAdress:= StrToInt('$' + MBKOnlineNr[MBKOnlineIndex]);
            end
         else messagebox(0,'Keinen 64Bit Kicker gefunden !','Warnung',16);
         end;
      end;        }

    //Ergebnisse eintragen
    KickerTesT.IFKUse_Panel.Caption:= IntToHex(IFKAdress,0);
{    MBX_string := MBKOnline[MBKOnlineIndex];
    i:= 0;
    while (i+9)<= Length(MBX_string) do
    begin
       temp_string:=temp_string+MBX_string[i+9];
       i:= i+1;
    end;

    KickerTesT.MBXID_Panel.Caption:= temp_string;


    ErrStatus := 0;

    Kiker_ReadVersion(KikVersion, KikRevision,ErrStatus);
    Kiker_ReadFrequenz(Freq_MHz,ErrStatus);

    if (ErrStatus = 0) then begin
       KickerTesT.Version_Panel.Caption  := IntToStr(KikVersion);
       KickerTesT.Revision_Panel.Caption := IntToStr(KikRevision);
       KickerTest.CardClockPanel.Caption := IntToSTR(Freq_MHz);
    end else begin
       KickerTesT.Version_Panel.Caption :=  '---';
       KickerTesT.Revision_Panel.Caption := '---';
       KickerTesT.CardClockPanel.Caption := '---'
    end;                                          }




//      modulbus_adr_rd(data, $EE, $5, IFKAdress,ErrStatus);
//      KickerTesT.LoopCounter_Panel.Caption := IntToHex(data,4);

end;

procedure TKickerTesT.ChooseIFKMBK1Click(Sender: TObject);
begin
  KickerChooseIFKMBK.ShowModal;
end;

procedure TKickerTesT.Exit_ButtonClick(Sender: TObject);
begin
  KickerTesT.Close;
end;

procedure TKickerTesT.Edit_ButtonClick(Sender: TObject);
begin
  if (KickerTesT.Loop_SpeedButton.Down = true) then begin
    KickerTesT.Loop_SpeedButton.Down := false;
    KickerTest.Loop_SpeedButton.Click;
  end;
  KickerSearch := true;
  KickerChooseIFKMBK.ShowModal;
end;

procedure TKickerTesT.Button1Click(Sender: TObject);

begin
  _FileSaveData.Add('FUCK');
  KickerTesT.shit.Add('shit fuck');
  KickerTesT.shit.Append('shit fuck 2');
  KickerTesT.SystemMessages_ListBox.Items := KickerTesT.shit;
  KiKShowLogFile.LogFile_ListBox.Items:=KickerTesT.shit;
  //KickerTesT.shit.Insert(1, 'bitch !');
  //KickerTesT.shit.AddStrings(MDK_IDCODE);
  KickerTesT.SystemMessages_ListBox.Items.Add(IntToStr(KickerTest.shit.Count));

{
  Kicker_CounterReset(mod_kicker_counter_1);
  Kicker_CounterReset(mod_kicker_counter_2);
  Kicker_CounterReset(mod_kicker_counter_3);
  Kicker_CounterReset(mod_kicker_counter_4);
  Kicker_CounterReset(mod_kicker_counter_5);

  Kicker_CounterSet(mod_kicker_counter_1);
  Kicker_CounterSet(mod_kicker_counter_2);
  Kicker_CounterSet(mod_kicker_counter_3);
  Kicker_CounterSet(mod_kicker_counter_4);
  Kicker_CounterSet(mod_kicker_counter_5);

  Kicker_CounterRun(mod_kicker_counter_1);
  Kicker_CounterRun(mod_kicker_counter_2);
  Kicker_CounterRun(mod_kicker_counter_3);
  Kicker_CounterRun(mod_kicker_counter_4);
  Kicker_CounterRun(mod_kicker_counter_5);

  Kicker_CounterRead(mod_kicker_counter_1);
  Kicker_CounterRead(mod_kicker_counter_2);
  Kicker_CounterRead(mod_kicker_counter_3);
  Kicker_CounterRead(mod_kicker_counter_4);
  Kicker_CounterRead(mod_kicker_counter_5);
  //KiKer_Test();       }
end;

procedure TKickerTesT.Counter1ActivClick(Sender: TObject);
begin
  if (KickerTesT.Counter1Activ.Checked <> true) then begin
      KickerTesT.Counter1LatchDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter1CountDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter1DelayDump_Edit.Enabled := false;
      KickerTesT.Counter1DumpStrbNeg_CheckBox.Enabled := false;
      KickerTesT.Counter1DumpStrbNeg_CheckBox.Enabled := false;
      KickerTesT.Counter1LatchMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter1CountMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter1DelayMain_Edit.Enabled := false;
      KickerTesT.Counter1MainStrbNeg_CheckBox.Enabled := false;
      KickerTest.Counter1HWNeg_CheckBox.Enabled := false;
  end else begin
      KickerTesT.Counter1LatchDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter1CountDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter1DelayDump_Edit.Enabled := true;
      KickerTesT.Counter1DumpStrbNeg_CheckBox.Enabled := true;
      KickerTesT.Counter1LatchMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter1CountMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter1DelayMain_Edit.Enabled := true;
      KickerTesT.Counter1MainStrbNeg_CheckBox.Enabled := true;
      KickerTest.Counter1HWNeg_CheckBox.Enabled := true;
  end;
end;

procedure TKickerTesT.Counter2ActivClick(Sender: TObject);
begin
  if (KickerTesT.Counter2Activ.Checked <> true) then begin
      KickerTesT.Counter2LatchDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter2CountDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter2DelayDump_Edit.Enabled := false;
      KickerTesT.Counter2DumpStrbNeg_CheckBox.Enabled := false;
      KickerTesT.Counter2LatchMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter2CountMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter2DelayMain_Edit.Enabled := false;
      KickerTesT.Counter2MainStrbNeg_CheckBox.Enabled := false;
      KickerTest.Counter2HWNeg_CheckBox.Enabled := false;
  end else begin
      KickerTesT.Counter2LatchDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter2CountDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter2DelayDump_Edit.Enabled := true;
      KickerTesT.Counter2DumpStrbNeg_CheckBox.Enabled := true;
      KickerTesT.Counter2LatchMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter2CountMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter2DelayMain_Edit.Enabled := true;
      KickerTesT.Counter2MainStrbNeg_CheckBox.Enabled := true;
      KickerTest.Counter2HWNeg_CheckBox.Enabled := true;
  end;
end;

procedure TKickerTesT.Counter3ActivClick(Sender: TObject);

begin
  if (KickerTesT.Counter3Activ.Checked <> true) then begin
      KickerTesT.Counter3LatchDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter3CountDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter3DelayDump_Edit.Enabled := false;
      KickerTesT.Counter3DumpStrbNeg_CheckBox.Enabled := false;
      KickerTesT.Counter3LatchMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter3CountMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter3DelayMain_Edit.Enabled := false;
      KickerTesT.Counter3MainStrbNeg_CheckBox.Enabled := false;
      KickerTest.Counter3HWNeg_CheckBox.Enabled := false;
  end else begin
      KickerTesT.Counter3LatchDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter3CountDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter3DelayDump_Edit.Enabled := true;
      KickerTesT.Counter3DumpStrbNeg_CheckBox.Enabled := true;
      KickerTesT.Counter3LatchMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter3CountMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter3DelayMain_Edit.Enabled := true;
      KickerTesT.Counter3MainStrbNeg_CheckBox.Enabled := true;
      KickerTest.Counter3HWNeg_CheckBox.Enabled := true;
  end;
end;

procedure TKickerTesT.Counter4ActivClick(Sender: TObject);
begin
  if (KickerTesT.Counter4Activ.Checked <> true) then begin
      KickerTesT.Counter4LatchDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter4CountDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter4DelayDump_Edit.Enabled := false;
      KickerTesT.Counter4DumpStrbNeg_CheckBox.Enabled := false;
      KickerTesT.Counter4LatchMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter4CountMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter4DelayMain_Edit.Enabled := false;
      KickerTesT.Counter4MainStrbNeg_CheckBox.Enabled := false;
      KickerTest.Counter4HWNeg_CheckBox.Enabled := false;
  end else begin
      KickerTesT.Counter4LatchDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter4CountDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter4DelayDump_Edit.Enabled := true;
      KickerTesT.Counter4DumpStrbNeg_CheckBox.Enabled := true;
      KickerTesT.Counter4LatchMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter4CountMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter4DelayMain_Edit.Enabled := true;
      KickerTesT.Counter4MainStrbNeg_CheckBox.Enabled := true;
      KickerTest.Counter1HWNeg_CheckBox.Enabled := true;
  end;
end;

procedure TKickerTesT.Counter5ActivClick(Sender: TObject);

begin
  if (KickerTesT.Counter5Activ.Checked <> true) then begin
      KickerTesT.Counter5LatchDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter5CountDump_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter5DelayDump_Edit.Enabled := false;
      KickerTesT.Counter5DumpStrbNeg_CheckBox.Enabled := false;
      KickerTesT.Counter5LatchMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter5CountMain_Panel.Font.Color:= clScrollBar;
      KickerTesT.Counter5DelayMain_Edit.Enabled := false;
      KickerTesT.Counter5MainStrbNeg_CheckBox.Enabled := false;
      KickerTest.Counter5HWNeg_CheckBox.Enabled := false;
  end else begin
      KickerTesT.Counter5LatchDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter5CountDump_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter5DelayDump_Edit.Enabled := true;
      KickerTesT.Counter5DumpStrbNeg_CheckBox.Enabled := true;
      KickerTesT.Counter5LatchMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter5CountMain_Panel.Font.Color:= clWindowText;
      KickerTesT.Counter5DelayMain_Edit.Enabled := true;
      KickerTesT.Counter5MainStrbNeg_CheckBox.Enabled := false;
      KickerTest.Counter5HWNeg_CheckBox.Enabled := false;
  end;
end;

procedure TKickerTesT.LogFile_SpeedButtonClick(Sender: TObject);
begin
  if (KickerTest.LogFile_SpeedButton.Down = true) then begin
      KickerTest.LogFile_SpeedButton.Caption := 'STOP Rec';
      KickerTest.LogFile_SpeedButton.Font.Color := clRed;
      //_FileSaveData.Add(LogFile_Head);
      KickerTesT.SystemMessages_ListBox.Items.Add('Start record Log File '+ DateTimeToStr(Now));
  end else begin
      KickerTest.LogFile_SpeedButton.Caption := 'Record';
      KickerTest.LogFile_SpeedButton.Font.Color := clWindowText;
      KickerTesT.SystemMessages_ListBox.Items.Add('Stop record Log File '+ DateTimeToStr(Now));
  end;
end;

procedure TKickerTesT.LogFileSave_ButtonClick(Sender: TObject);

begin
  dateiname:='';

  if SaveDialog1.Execute then begin
        dateiname := SaveDialog1.FileName;
        if FileExists(dateiname) then begin
          messagebox(0,'Datei existiert bereits, anderen Namen wählen !','Uffbasse',16);
          dateiname :='';
  end;

  if (dateiname<> '') then
    _FileSaveData.SaveToFile(dateiname);
    KickerTesT.SystemMessages_ListBox.Items.Add('Save Log File '+ DateTimeToStr(Now));
  end;

{
  TextTstring := 'Feld 1;'+'Feld 2;'+'Feld 3;'+ 'Feld 4;';
  FileSaveData.Add(TextTstring);
  TextTstring := '4715;'+'4712;'+'4713;'+ '4714;';
  FileSaveData.Add(TextTstring);
  FileSaveData.Add(TextTstring);
  FileSaveData.Add(TextTstring);
  FileSaveData.SaveToFile(dateiname);   }
end;

procedure TKickerTesT.LogFileClear_ButtonClick(Sender: TObject);
begin
  _FileSaveData.Clear;
  KiKShowLogFile.LogFile_ListBox.Clear;
  _FileSaveData.Add(LogFile_Head);
  KickerTesT.SystemMessages_ListBox.Items.Add('Log File cleared '+ DateTimeToStr(Now));
end;

procedure TKickerTesT.Loop_SpeedButtonClick(Sender: TObject);

var
  ReadCounter : boolean;
  LoopCounter : integer;
  CounterRead :integer;
  KontrollStatusReg : _WORD;
  ErrorStatus : _DWORD;
  done : boolean;

begin
  if (KickerTesT.Loop_SpeedButton.Down = true) then begin
    Kicker_DisableButtons();
    KickerTesT.SystemMessages_ListBox.Items.Add('Loop start '+ DateTimeToStr(Now));

  end else begin
    Kicker_EnabelButtons();
    KickerTesT.SystemMessages_ListBox.Items.Add('Loop stop '+ DateTimeToStr(Now));
  end;
//---------------------------------------------------------------------
//---------------------------------------------------------------------
  // Alle Kicker Counter setzen
  Kicker_CounterSetAll();

  //Loopcounter anzeigen
  CounterRead := 0;
  LoopCounter := 1;
  KickerTest.CounterRead_Panel.Caption := inttostr(CounterRead);
  KickerTest.Update;

  while KickerTesT.Loop_SpeedButton.Down = true do
    begin

      LoopCounter:=LoopCounter+1;

      // Counter 1 lesen & neu aufziehen
      if (KickerTesT.Counter1Activ.Checked = true) then begin
        ReadCounter:= Kicker_CounterRead(mod_kicker_counter_1);
        if (ReadCounter =  true) then begin
          Kicker_CounterReset(mod_kicker_counter_1);
          Kicker_CounterSet(mod_kicker_counter_1);
          Kicker_CounterRun(mod_kicker_counter_1);
          CounterRead := CounterRead +1;
        end
      end;

      // Counter 2 lesen & neu aufziehen
      if (KickerTesT.Counter2Activ.Checked = true) then begin
        ReadCounter:= Kicker_CounterRead(mod_kicker_counter_2);
        if (ReadCounter =  true) then begin
          Kicker_CounterReset(mod_kicker_counter_2);
          Kicker_CounterSet(mod_kicker_counter_2);
          Kicker_CounterRun(mod_kicker_counter_2);
          CounterRead := CounterRead +1;
        end
      end;

      // Counter 3 lesen & neu aufziehen
      if (KickerTesT.Counter3Activ.Checked = true) then begin
        ReadCounter:= Kicker_CounterRead(mod_kicker_counter_3);
        if (ReadCounter =  true) then begin
          Kicker_CounterReset(mod_kicker_counter_3);
          Kicker_CounterSet(mod_kicker_counter_3);
          Kicker_CounterRun(mod_kicker_counter_3);
          CounterRead := CounterRead +1;
        end
      end;

       // Counter 4 lesen & neu aufziehen
      if (KickerTesT.Counter4Activ.Checked = true) then begin
        ReadCounter:= Kicker_CounterRead(mod_kicker_counter_4);
        if (ReadCounter =  true) then begin
          Kicker_CounterReset(mod_kicker_counter_4);
          Kicker_CounterSet(mod_kicker_counter_4);
          Kicker_CounterRun(mod_kicker_counter_4);
          CounterRead := CounterRead +1;
        end
      end;

       // Counter 5 lesen & neu aufziehen
      if (KickerTesT.Counter5Activ.Checked = true) then begin
        ReadCounter:= Kicker_CounterRead(mod_kicker_counter_5);
        if (ReadCounter =  true) then begin
          Kicker_CounterReset(mod_kicker_counter_5);
          Kicker_CounterSet(mod_kicker_counter_5);
          Kicker_CounterRun(mod_kicker_counter_5);
          CounterRead := CounterRead +1;
        end
      end;

     ErrorStatus:=0;
      // PowerUP bit abfragen & Counter hochzählen
     if ( LoopCounter mod 200 = 0) then begin
      // Kontroll Status Reg. lesen
      modulbus_adr_rd( KontrollStatusReg, mod_kickerRD_KontrollStatReg, MBKAdress, IFKAdress, ErrorStatus);
      //Prüfen ob das Powerup bit gesetzt wurde
      if(KontrollStatusReg and mod_kickerKSR_ResetDone) = mod_kickerKSR_ResetDone then begin
        messagebox(0,'PowerUp ist gesetzt worden !','Huch ?',16);
        KickerTesT.SystemMessages_ListBox.Items.Add('PowerUp was set '+ DateTimeToStr(Now));
        Kicker_PowerUpReset(done);
        KickerTesT.Loop_SpeedButton.Down := false;
        KickerTesT.Loop_SpeedButton.Click;
      end;
      KickerTest.CounterRead_Panel.Caption := inttostr(CounterRead);
      KickerTest.Update;
      Application.ProcessMessages;
     end;
    end;

  // while schleife beendet
  KickerTest.CounterRead_Panel.Caption := inttostr(CounterRead);
  KickerTest.Update;
  Application.ProcessMessages;
end;

procedure TKickerTesT.Step_ButtonClick(Sender: TObject);
begin
if (KickerTesT.Loop_SpeedButton.Down = true) then begin
    KickerTesT.Loop_SpeedButton.Down := false;
    KickerTest.Loop_SpeedButton.Click;
  end;
end;

procedure TKickerTesT.Clear_ButtonClick(Sender: TObject);
begin
  KickerTesT.SystemMessages_ListBox.Items.Clear;
  KickerTesT.ErrorCounter_Panel.Caption := '0';
end;

procedure TKickerTesT.Counter1DelayMain_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter1DelayMain_Edit,KickerTest.Counter1CountMain_Panel);
end;

procedure TKickerTesT.Counter2DelayMain_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter2DelayMain_Edit,KickerTest.Counter2CountMain_Panel);
end;

procedure TKickerTesT.Counter3DelayMain_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter3DelayMain_Edit,KickerTest.Counter3CountMain_Panel);
end;

procedure TKickerTesT.Counter4DelayMain_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter4DelayMain_Edit,KickerTest.Counter4CountMain_Panel);
end;

procedure TKickerTesT.Counter5DelayMain_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter5DelayMain_Edit,KickerTest.Counter5CountMain_Panel);
end;

procedure TKickerTesT.Counter1DelayDump_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter1DelayDump_Edit,KickerTest.Counter1CountDump_Panel);
end;

procedure TKickerTesT.Counter2DelayDump_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter2DelayDump_Edit,KickerTest.Counter2CountDump_Panel);
end;

procedure TKickerTesT.Counter3DelayDump_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter3DelayDump_Edit,KickerTest.Counter3CountDump_Panel);
end;

procedure TKickerTesT.Counter4DelayDump_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter4DelayDump_Edit,KickerTest.Counter4CountDump_Panel);
end;

procedure TKickerTesT.Counter5DelayDump_EditChange(Sender: TObject);
begin
  CheckInput(KickerTest.Counter5DelayDump_Edit,KickerTest.Counter5CountDump_Panel);
end;


procedure TKickerTesT.About1Click(Sender: TObject);
begin
  KickerTest_Info.Show;
end;

procedure TKickerTesT.LogFileShow_ButtonClick(Sender: TObject);
begin
  KiKShowLogFile.LogFile_ListBox.Clear;
  KiKShowLogFile.LogFile_ListBox.Items:= _FileSaveData;
  KiKShowLogFile.Show;
end;

procedure TKickerTesT.Step_SpeedButtonClick(Sender: TObject);

var ReadCounter : boolean;
    LoopCounter : integer;
    CounterRead :integer;

begin
 if (KickerTesT.Step_SpeedButton.Down = true) then begin
    Kicker_DisableButtons();
    KickerTesT.SystemMessages_ListBox.Items.Add('Step start '+ DateTimeToStr(Now));
  end else begin
    Kicker_EnabelButtons();
    KickerTesT.SystemMessages_ListBox.Items.Add('Step stop '+ DateTimeToStr(Now));
  end;
//---------------------------------------------------------------------
//---------------------------------------------------------------------
  // Alle Kicker Counter setzen
  Kicker_CounterSetAll();

  //counter anzeigen
  LoopCounter := 0;
  CounterRead := 0;
  KickerTest.CounterRead_Panel.Caption := inttostr(CounterRead);
  KickerTest.Update;

  while KickerTesT.Step_SpeedButton.Down = true do
    begin

     LoopCounter:=LoopCounter+1;

      // Counter 1 lesen
      if (KickerTesT.Counter1Activ.Checked = true) then begin
        ReadCounter:= Kicker_CounterRead(mod_kicker_counter_1);
        if (ReadCounter =  true) then begin
          CounterRead := CounterRead +1;
          KickerTesT.Step_SpeedButton.Down := false;
        end
      end;

      // Counter Ausgabe
     if ( LoopCounter mod 50 = 0) then begin
      KickerTest.Update;
      Application.ProcessMessages;
     end;
  end;


  // Counter 2 lesen
  if (KickerTesT.Counter2Activ.Checked = true) then begin
    ReadCounter:= Kicker_CounterRead(mod_kicker_counter_2);
    if (ReadCounter =  true) then begin
       CounterRead := CounterRead +1;
    end
  end;

  // Counter 3 lesen
  if (KickerTesT.Counter3Activ.Checked = true) then begin
    ReadCounter:= Kicker_CounterRead(mod_kicker_counter_3);
    if (ReadCounter =  true) then begin
       CounterRead := CounterRead +1;
    end
  end;

  // Counter 4 lesen
  if (KickerTesT.Counter4Activ.Checked = true) then begin
    ReadCounter:= Kicker_CounterRead(mod_kicker_counter_4);
    if (ReadCounter =  true) then begin
      CounterRead := CounterRead +1;
    end
  end;

   // Counter 5 lesen
   if (KickerTesT.Counter5Activ.Checked = true) then begin
    ReadCounter:= Kicker_CounterRead(mod_kicker_counter_5);
    if (ReadCounter =  true) then begin
      CounterRead := CounterRead +1;
    end
  end;

  KickerTest.CounterRead_Panel.Caption := inttostr(CounterRead);
  Kicker_EnabelButtons();

  KickerTest.Update;
  Application.ProcessMessages;
end;

procedure TKickerTesT.Counter1MainStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter1MainStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_1, mod_kickerWR_LAStrobNg, true);
        if (status <> true) then KickerTesT.Counter1MainStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_1, mod_kickerWR_LAStrobNg, false);
          if (status <> true) then KickerTesT.Counter1MainStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter2MainStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter2MainStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_2, mod_kickerWR_LAStrobNg, true);
        if (status <> true) then KickerTesT.Counter1MainStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_2, mod_kickerWR_LAStrobNg, false);
          if (status <> true) then KickerTesT.Counter2MainStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter3MainStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter3MainStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_3, mod_kickerWR_LAStrobNg, true);
        if (status <> true) then KickerTesT.Counter3MainStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_3, mod_kickerWR_LAStrobNg, false);
          if (status <> true) then KickerTesT.Counter3MainStrbNeg_CheckBox.Checked := true;
     end;
end;



procedure TKickerTesT.Counter4MainStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter4MainStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_4, mod_kickerWR_LAStrobNg, true);
        if (status <> true) then KickerTesT.Counter4MainStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_4, mod_kickerWR_LAStrobNg, false);
          if (status <> true) then KickerTesT.Counter4MainStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter5MainStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter5MainStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_5, mod_kickerWR_LAStrobNg, true);
        if (status <> true) then KickerTesT.Counter5MainStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_5, mod_kickerWR_LAStrobNg, false);
          if (status <> true) then KickerTesT.Counter5MainStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter1DumpStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter1DumpStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_1, mod_kickerWR_LBStrobNg, true);
        if (status <> true) then KickerTesT.Counter1DumpStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_1, mod_kickerWR_LBStrobNg, false);
          if (status <> true) then KickerTesT.Counter1DumpStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter2DumpStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter2DumpStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_2, mod_kickerWR_LBStrobNg, true);
        if (status <> true) then KickerTesT.Counter2DumpStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_2, mod_kickerWR_LBStrobNg, false);
          if (status <> true) then KickerTesT.Counter2DumpStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter3DumpStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter3DumpStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_3, mod_kickerWR_LBStrobNg, true);
        if (status <> true) then KickerTesT.Counter3DumpStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_3, mod_kickerWR_LBStrobNg, false);
          if (status <> true) then KickerTesT.Counter3DumpStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter4DumpStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter4DumpStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_4, mod_kickerWR_LBStrobNg, true);
        if (status <> true) then KickerTesT.Counter4DumpStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_4, mod_kickerWR_LBStrobNg, false);
          if (status <> true) then KickerTesT.Counter4DumpStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter5DumpStrbNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter5DumpStrbNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_5, mod_kickerWR_LBStrobNg, true);
        if (status <> true) then KickerTesT.Counter5DumpStrbNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_5, mod_kickerWR_LBStrobNg, false);
          if (status <> true) then KickerTesT.Counter5DumpStrbNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter1HWNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter1HWNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_1, mod_KickerRD_HWStartFLNg, true);
        if (status <> true) then KickerTesT.Counter1HWNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_1, mod_KickerRD_HWStartFLNg, false);
          if (status <> true) then KickerTesT.Counter1HWNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter2HWNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter2HWNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_2, mod_KickerRD_HWStartFLNg, true);
        if (status <> true) then KickerTesT.Counter2HWNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_2, mod_KickerRD_HWStartFLNg, false);
          if (status <> true) then KickerTesT.Counter2HWNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter3HWNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter3HWNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_3, mod_KickerRD_HWStartFLNg, true);
        if (status <> true) then KickerTesT.Counter3HWNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_3, mod_KickerRD_HWStartFLNg, false);
          if (status <> true) then KickerTesT.Counter3HWNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter4HWNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter4HWNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_4, mod_KickerRD_HWStartFLNg, true);
        if (status <> true) then KickerTesT.Counter4HWNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_4, mod_KickerRD_HWStartFLNg, false);
          if (status <> true) then KickerTesT.Counter4HWNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Counter5HWNeg_CheckBoxClick(Sender: TObject);

var status:boolean;

begin
     if (KickerTesT.Counter5HWNeg_CheckBox.Checked = true) then begin
        status :=Kicker_SetCounterStrobes(mod_kicker_counter_5, mod_KickerRD_HWStartFLNg, true);
        if (status <> true) then KickerTesT.Counter5HWNeg_CheckBox.Checked := false;
     end else begin
         status:=Kicker_SetCounterStrobes(mod_kicker_counter_5, mod_KickerRD_HWStartFLNg, false);
          if (status <> true) then KickerTesT.Counter5HWNeg_CheckBox.Checked := true;
     end;
end;

procedure TKickerTesT.Button2Click(Sender: TObject);

var ErrorStatus:_DWORD;


begin
 modulbus_adr_wr(4711, mod_kicker_EchoReg, MBKAdress,IFKAdress,ErrorStatus);
end;

procedure TKickerTesT.PCICardSelect2Click(Sender: TObject);
begin
     PCICardSelect.ShowModal;
end;

procedure TKickerTesT.EchoTesT2Click(Sender: TObject);
begin
     KickerEchoTest.ShowModal;
end;

procedure TKickerTesT.TriggerKarte1Click(Sender: TObject);
begin
     TriGGerMain.Show;
end;

procedure TKickerTesT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (KickerTesT.Loop_SpeedButton.Down = true) then begin
    KickerTesT.Loop_SpeedButton.Down := false;
    KickerTest.Loop_SpeedButton.Click;
  end;

  if(KickerTesT.Step_SpeedButton.Down = true) then begin
    KickerTesT.Step_SpeedButton.Down := false;
    KickerTesT.Step_SpeedButton.Click;
  end;

  if(KickerTesT.LogFile_SpeedButton.Down = true) then begin
    KickerTesT.LogFile_SpeedButton.Down := false;
    KickerTesT.LogFileSave_Button.Click;
  end;

  PCI_DriverClose(Cardauswahl);
end;

end.
