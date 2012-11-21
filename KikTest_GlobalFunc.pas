unit KikTest_GlobalFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, UnitMil;

  procedure Kiker_ReadVersion(var KikVersion: _WORD;
                              var KikRevision: _Word;
                              var ErrStatus: _DWORD);

  function ArithRound(x: Double): Integer;
  procedure CalculateDAC(Vout:real; var DAC_Word:_WORD);

  procedure Kiker_ReadFrequenz(var Freq_MHz:_WORD;ErrStatus: _DWORD);
  procedure KiKer_Test();
  procedure Kicker_CounterRun(CounterNr:_WORD);
  procedure Kicker_CounterReset(CounterNr:_Word);
  procedure Kicker_CounterSet(CounterNr:_WORD);
  function  Kicker_CounterRead(CounterNr:_WORD):boolean;
  procedure Kicker_ReadCounterStrobes(CounterNr:_WORD);
  procedure Kicker_EnabelButtons();
  procedure Kicker_DisableButtons();
  procedure Kicker_CounterSetAll();
  procedure Kicker_PowerUpReset(var done:boolean);
  function  Kicker_SetCounterStrobes(CounterNr:_WORD; Strobe:_WORD; negativ:boolean):boolean;
  procedure Trigger_DataWrite(DAC_Word:_WORD;DAC_Number:_Byte);
  procedure Kiker_ErrorHandle(ErrorStatus:_DWORD; ErrorString:string; SenderListBox:TListBox);
  procedure CheckInput(InputEdit:TEdit ;OutputPanel:TPanel);

implementation

uses KiKTest_GlobalVariable, modulbus, KiKTest_MainUnit, KIKTest_TriggerMain;


// ---------------------- Arithmetisch Runden ---------------------------------------
// ------------------------------------------------------------------------------------
function ArithRound(x: Double): Integer;
begin
  Result:=trunc(x+0.5);
end;

// ---------------------- DAC Word berechnen ---------------------------------------
// ------------------------------------------------------------------------------------
procedure CalculateDAC(Vout:real; var DAC_Word:_WORD);
begin
     DAC_Word := ArithRound((Vout+10)*(4096 / 20));
end;

// -------------------- Version der KickerKarte auslesen ------------------------------
// ------------------------------------------------------------------------------------
procedure Kiker_ReadVersion(var KikVersion: _WORD;
                            var KikRevision: _Word;
                            var ErrStatus: _DWORD);

var
  version : _WORD;

begin
  version :=0;
  modulbus_adr_rd(version, mod_kickerRD_KontrollStatReg, MBKAdress, IFKAdress,ErrStatus);
  if(ErrStatus = 0) then begin
    KikVersion := (version and mod_kickerRD_Version)  shr 12;
    KikRevision:= (version and mod_kickerRD_Revision) shr 8;
  end else begin
    KikVersion := 0;
    KikRevision := 0;
  end;
end;

// ------------------------ Frequenz der KickerKarte auslesen -------------------------
// ------------------------------------------------------------------------------------
procedure Kiker_ReadFrequenz(var Freq_MHz:_WORD;ErrStatus: _DWORD);

var
  Frequenz:_WORD;

begin
  modulbus_adr_rd(Frequenz, mod_kickerRD_Frequenz, MBKAdress, IFKAdress,ErrStatus);
  Freq_MHz := (Frequenz div 100);
end;

// -------------------------- die counter resetten ---------------------------------
// ------------------------------------------------------------------------------------
procedure Kicker_CounterReset(CounterNr:_WORD);

var
  Kontrollregister:_WORD;
  ErrorStatus:_DWORD;

begin
  ErrorStatus := 0;

  // Kontrollregister auslesen
  modulbus_adr_rd( Kontrollregister,CounterNr,MBKAdress,IFKAdress,ErrorStatus);

  Kontrollregister:= Kontrollregister or mod_kickerWR_SoftReset;

  // Reset setzen
  modulbus_adr_wr( Kontrollregister, CounterNr, MBKAdress,IFKAdress,ErrorStatus);

  // Abpruefen auf write milbus timeout fehler
  if((ErrorStatus and WriteMilBusTimeOut)<> 0) then begin
      KickerTesT.SystemMessages_ListBox.Items.Add('Counter Reset: Write TimeOut'+ DateTimeToStr(Now));
      ErrorCount := ErrorCount + 1;
      KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
      KickerTest.Update;
      ErrorStatus:=0;
  end;
end;


// -------------------------- KickerCounter setzten -----------------------------------
// ------------------------------------------------------------------------------------
procedure Kicker_CounterSet(CounterNr:_WORD);

var
  ErrorStatus:_DWORD;

  counter: RECORD CASE _DWORD OF
              1: ( dw: _DWORD );
              2: ( r: PACKED RECORD
                   lw: _WORD;
                   hw: _WORD;
                   END; );
              END;


begin
  // -----------------  Counter A runterschreiben ----------------------

  ErrorStatus:=0;

  case CounterNr of
    mod_kicker_counter_1: counter.dw := StrToInt('$' +KickerTesT.Counter1CountMain_Panel.Caption);
    mod_kicker_counter_2: counter.dw := StrToInt('$' +KickerTesT.Counter2CountMain_Panel.Caption);
    mod_kicker_counter_3: counter.dw := StrToInt('$' +KickerTesT.Counter3CountMain_Panel.Caption);
    mod_kicker_counter_4: counter.dw := StrToInt('$' +KickerTesT.Counter4CountMain_Panel.Caption);
    mod_kicker_counter_5: counter.dw := StrToInt('$' +KickerTesT.Counter5CountMain_Panel.Caption);
  end;

  modulbus_adr_wr(counter.r.hw, CounterNr+mod_kicker_HWDelayA,MBKAdress,IFKAdress,ErrorStatus);
  modulbus_adr_wr(counter.r.lw, CounterNr+mod_kicker_LWDelayA,MBKAdress,IFKAdress,ErrorStatus);

  // Abpruefen auf write milbus timeout fehler
  if((ErrorStatus and WriteMilBusTimeOut)<> 0) then begin
      KickerTesT.SystemMessages_ListBox.Items.Add('Counter A Set: Write TimeOut'+ DateTimeToStr(Now));
      ErrorCount := ErrorCount + 1;
      KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
      KickerTest.Update;
      ErrorStatus:=0;
  end;

  // -----------------  Counter B runterschreiben ----------------------

  ErrorStatus:=0;

  case CounterNr of
    mod_kicker_counter_1: counter.dw:= StrToInt('$' +KickerTesT.Counter1CountDump_Panel.Caption);
    mod_kicker_counter_2: counter.dw:= StrToInt('$' +KickerTesT.Counter2CountDump_Panel.Caption);
    mod_kicker_counter_3: counter.dw:= StrToInt('$' +KickerTesT.Counter3CountDump_Panel.Caption);
    mod_kicker_counter_4: counter.dw:= StrToInt('$' +KickerTesT.Counter4CountDump_Panel.Caption);
    mod_kicker_counter_5: counter.dw:= StrToInt('$' +KickerTesT.Counter5CountDump_Panel.Caption);
  end;

  modulbus_adr_wr(counter.r.hw, CounterNr+mod_kicker_HWDelayB,MBKAdress,IFKAdress,ErrorStatus);
  modulbus_adr_wr(counter.r.lw, CounterNr+mod_kicker_LWDelayB,MBKAdress,IFKAdress,ErrorStatus);

  // Abpruefen auf write milbus timeout fehler
  if((ErrorStatus and WriteMilBusTimeOut)<> 0) then begin
      KickerTesT.SystemMessages_ListBox.Items.Add('Counter B Set: Write TimeOut'+ DateTimeToStr(Now));
      ErrorCount := ErrorCount + 1;
      KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
      KickerTest.Update;
      ErrorStatus:=0;
  end;
end;

// -------------------------- KickerCounter starten -----------------------------------
// ------------------------------------------------------------------------------------
procedure Kicker_CounterRun(CounterNr:_WORD);

var
  Kontrollregister:_WORD;
  ErrorStatus:_DWORD;

begin
  Kontrollregister:= 0;
  ErrorStatus:=0;

  // Kontrollregister auslesen
  modulbus_adr_rd( Kontrollregister,CounterNr,MBKAdress,IFKAdress,ErrorStatus);

  Kontrollregister:= Kontrollregister or mod_kickerWR_SoftEnable;

  // Reset setzen
  modulbus_adr_wr( Kontrollregister, CounterNr, MBKAdress,IFKAdress,ErrorStatus);

{  // register lesen
  modulbus_adr_rd( Kontrollregister,CounterNr,MBKAdress,IFKAdress,ErrorStatus);

  if ((Kontrollregister and mod_kickerRD_SoftEnable) <> mod_kickerWR_SoftEnable) then begin
      KickerTesT.SystemMessages_ListBox.Items.Add('Counter activate failt'+ DateTimeToStr(Now));
      ErrorCount := ErrorCount + 1;
      KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
      KickerTest.Update;
  end;                                }

  // Abpruefen auf write milbus timeout fehler
  if((ErrorStatus and WriteMilBusTimeOut)<> 0) then begin
      KickerTesT.SystemMessages_ListBox.Items.Add('Counter activate: Write TimeOut'+ DateTimeToStr(Now));
      ErrorCount := ErrorCount + 1;
      KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
      KickerTest.Update;
      ErrorStatus:=0;
  end;
end;

// -------------------------- KickerCounter lesen -----------------------------------
// ------------------------------------------------------------------------------------
function Kicker_CounterRead(CounterNr:_WORD):boolean;

var
  Kontrollregister:_WORD;
  ErrorStatus:_DWORD;
  CounterEventA :_WORD;
  CounterEventB :_WORD;
  CountLatchMainReg:_WORD;
  CountLatchDumpReg:_WORD;
  TextTstring:string;
  CounterDelayMain:string;
  CounterDelayDump:string;
  Error_Char:t_Error_Char;
  Error_string:string;
  i:integer;

  counter: RECORD CASE _DWORD OF
              1: ( dw: _DWORD );
              2: ( r: PACKED RECORD
                   lw: _WORD;
                   hw: _WORD;
                   END; );
              END;

begin
    // Prüfen ob daten vorhanden sind
    modulbus_adr_rd( Kontrollregister,CounterNr,MBKAdress,IFKAdress,ErrorStatus);

    // hat das geklappt
    Error_string := 'ERROR KickerCnt Rd: ';
    if(ErrorStatus <> StatusOK) then begin
      Kiker_ErrorHandle(ErrorStatus,Error_string,KickerTesT.SystemMessages_ListBox);
      ErrorCount := ErrorCount + 1;
      KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
      KickerTest.Update;
    end;

    if(Kontrollregister and mod_kickerRD_CounterOvf = mod_kickerRD_CounterOvf) then begin

      // ----------------- Counter A lesen ----------------------
      ErrorStatus:=0;
      modulbus_adr_rd(counter.r.hw, CounterNr+mod_kicker_HWDelayA,MBKAdress,IFKAdress,ErrorStatus);
      modulbus_adr_rd(counter.r.lw, CounterNr+mod_kicker_LWDelayA,MBKAdress,IFKAdress,ErrorStatus);

      // Was ist passiert
      CounterEventA := counter.r.hw and $F000;
      CounterEventA := CounterEventA shr 12;

      // ObereBits abschneiden
      counter.r.hw := counter.r.hw and $7F;

      // Daten ausgeben
      CountLatchMainReg := counter.dw;
      case CounterNr of
          mod_kicker_counter_1: begin
                                  KickerTesT.Counter1LatchMain_Panel.Caption := IntToHex(CountLatchMainReg,0);
                                  CounterDelayMain:= '1;'+ KickerTesT.Counter1CountMain_Panel.Caption;
                                end;

          mod_kicker_counter_2: begin
                                  KickerTesT.Counter2LatchMain_Panel.Caption := IntToHex(CountLatchMainReg,0);
                                  CounterDelayMain:= '2;'+ KickerTesT.Counter2CountMain_Panel.Caption;
                                end;

          mod_kicker_counter_3: begin
                                  KickerTesT.Counter3LatchMain_Panel.Caption := IntToHex(CountLatchMainReg,0);
                                  CounterDelayMain:= '3;'+ KickerTesT.Counter3CountMain_Panel.Caption;
                                end;

          mod_kicker_counter_4: begin
                                  KickerTesT.Counter4LatchMain_Panel.Caption := IntToHex(CountLatchMainReg,0);
                                  CounterDelayMain:= '4;'+ KickerTesT.Counter4CountMain_Panel.Caption;
                                end;

          mod_kicker_counter_5: begin
                                  KickerTesT.Counter5LatchMain_Panel.Caption := IntToHex(CountLatchMainReg,0);
                                  CounterDelayMain:= '5;'+ KickerTesT.Counter5CountMain_Panel.Caption;
                                end;
      end;

      // hat das geklappt
      Error_string := 'Error CntA: ';
      if(ErrorStatus <> StatusOK) then begin
        Kiker_ErrorHandle(ErrorStatus,Error_string,KickerTesT.SystemMessages_ListBox);
         ErrorCount := ErrorCount + 1;
        KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
        KickerTest.Update;
      end;


      // ----------------- Counter B lesen ----------------------
      ErrorStatus:=0;
      modulbus_adr_rd(counter.r.hw, CounterNr+mod_kicker_HWDelayB,MBKAdress,IFKAdress,ErrorStatus);
      modulbus_adr_rd(counter.r.lw, CounterNr+mod_kicker_LWDelayB,MBKAdress,IFKAdress,ErrorStatus);

      // Was ist passiert
      CounterEventB := counter.r.hw and $F000;
      CounterEventB := CounterEventB shr 12;

      // ObereBits abschneiden
      counter.r.hw := counter.r.hw and $7F;

      // Daten ausgeben
      CountLatchDumpReg := counter.dw;
      case CounterNr of
          mod_kicker_counter_1: begin
                                  KickerTesT.Counter1LatchDump_Panel.Caption := IntToHex(CountLatchDumpReg,0);
                                  CounterDelayDump := KickerTesT.Counter1CountDump_Panel.Caption;
                                end;

          mod_kicker_counter_2: begin
                                  KickerTesT.Counter2LatchDump_Panel.Caption := IntToHex(CountLatchDumpReg,0);
                                  CounterDelayDump := KickerTesT.Counter2CountDump_Panel.Caption;
                                end;

          mod_kicker_counter_3: begin
                                  KickerTesT.Counter3LatchDump_Panel.Caption := IntToHex(CountLatchDumpReg,0);
                                  CounterDelayDump := KickerTesT.Counter3CountDump_Panel.Caption;
                                end;

          mod_kicker_counter_4: begin
                                  KickerTesT.Counter4LatchDump_Panel.Caption := IntToHex(CountLatchDumpReg,0);
                                  CounterDelayDump := KickerTesT.Counter4CountDump_Panel.Caption;
                                end;

          mod_kicker_counter_5: begin
                                  KickerTesT.Counter5LatchDump_Panel.Caption := IntToHex(CountLatchDumpReg,0);
                                  CounterDelayDump := KickerTesT.Counter5CountDump_Panel.Caption;
                                end;
      end;

      // hat das geklappt
      Error_string := 'Error CntB: ';
      if(ErrorStatus <> StatusOK) then begin
        Kiker_ErrorHandle(ErrorStatus,Error_string,KickerTesT.SystemMessages_ListBox);
        ErrorCount := ErrorCount + 1;
        KickerTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCount);
        KickerTest.Update;
      end;

      // ------------------------ Daten Ausgeben oder sichern -----------------


      if (KickerTest.LogFile_SpeedButton.Down = true) then begin
        TextTstring:= CounterDelayMain +';'+ IntToHex(CountLatchMainReg,0)+';'
                    + CounterDelayDump +';'+ IntToHex(CountLatchDumpReg,0)+';'
                    + IntToHex(CounterEventA,0)+';'+IntToHex(CounterEventB,0)+';'
                    + IntToHex(Kontrollregister,0)+';'+TriggerVoltDacA+';'
                    + TriggerVoltDacB+';'+TriggerVoltDacC+';'+TriggerVoltDacD+';'
                    + DateTimeToStr(Now);
        _FileSaveData.Add(TextTstring);
      end;
       result := true;
    end else result := false;
end;



{
var
  Kontrollregister:_WORD;
  CountLatchMainReg:_WORD;
  CountLatchDumpReg:_WORD;
  CounterEventA :_WORD;
  CounterEventB :_WORD;
  ErrStatus:_DWORD;
  Error_Char:t_Error_Char;
  Error_string:string;
  TextTstring:string;

  counter: RECORD CASE _DWORD OF
              1: ( dw: _DWORD );
              2: ( r: PACKED RECORD
                   lw: _WORD;
                   hw: _WORD;
                   END; );
              END;

begin

 // ---------------------------------------------------------------
 //                         Counter 1 lesen
 // ---------------------------------------------------------------

  if(KickerTest.Counter1Activ.Checked = true) then begin
    modulbus_adr_rd( Kontrollregister,mod_kicker_counter_1,MBKAdress,IFKAdress,ErrStatus);
    if(Kontrollregister and mod_kickerRD_CounterOvf = 1) then begin

      // ----------------- Counter 1 A lesen ----------------------
      modulbus_adr_rd(counter.r.hw, mod_kicker_counter_1+mod_kicker_HWDelayA,MBKAdress,IFKAdress,ErrStatus);
      modulbus_adr_rd(counter.r.lw, mod_kicker_counter_1+mod_kicker_LWDelayA,MBKAdress,IFKAdress,ErrStatus);

      // Was ist passiert
      CounterEventA := counter.r.hw and $F000;

      // ObereBits abschneiden
      counter.r.hw := counter.r.hw and $7F;

      // Daten ausgeben
      CountLatchMainReg := counter.dw;
      KickerTesT.Counter1LatchMain_Panel.Caption := IntToHex(CountLatchMainReg,0);

     // ----------------- Counter 1 B lesen ----------------------
      modulbus_adr_rd(counter.r.hw, mod_kicker_counter_1+mod_kicker_HWDelayB,MBKAdress,IFKAdress,ErrStatus);
      modulbus_adr_rd(counter.r.lw, mod_kicker_counter_1+mod_kicker_LWDelayB,MBKAdress,IFKAdress,ErrStatus);

      // Was ist passiert
      CounterEventB := counter.r.hw and $F000;

      // ObereBits abschneiden
      counter.r.hw := counter.r.hw and $7F;

      // Daten ausgeben
      CountLatchDumpReg := counter.dw;
      KickerTesT.Counter1LatchDump_Panel.Caption := IntToHex(CountLatchMainReg,0);

      // ------------------------ Daten Ausgeben oder sichern -----------------
      TextTstring:= KickerTesT.Counter1DelayMain_Edit.Text +';'+ IntToHex(CountLatchMainReg,0)+';'
                    + KickerTest.Counter1DelayDump_Edit.Text +';'+ IntToHex(CountLatchDumpReg,0)+';'
                    + 'Event A:'+IntToHex(CounterEventA,0)+';'+ 'Event B:'+IntToHex(CounterEventB,0)+';';


    end;
  end;
end;
}

procedure KiKer_Test();

var
  i:integer;
  Kontrollregister:_WORD;
  ErrStatus:_DWORD;
  Error_Char:t_Error_Char;
  Error_string:string;

  counter: RECORD CASE _DWORD OF
              1: ( dw: _DWORD );
              2: ( r: PACKED RECORD
                   lw: _WORD;
                   hw: _WORD;
                   END; );
              END;

begin

  ErrStatus:=0;
  Kontrollregister:=0;

  // Kontrollregister lesen
  modulbus_adr_rd(Kontrollregister, mod_kicker_counter_1, MBKAdress, IFKAdress,ErrStatus);

  // Reset setzen
  Kontrollregister:=2;

  // Runterschreiben
  modulbus_adr_wr( Kontrollregister,mod_kicker_counter_1,MBKAdress,IFKAdress,ErrStatus);

  // hat es geklappt
  if(ErrStatus <> StatusOK) then begin
    Kiker_ErrorHandle(ErrStatus,'',  KickerTesT.SystemMessages_ListBox);

//    PCI_ErrorString(ErrStatus, Error_Char); // ausgabe bei fehlerfall
//    for i := 1 to Length(Error_Char) do begin
//       Error_string := Error_string + Error_Char[i];
//    end;
//    KickerTesT.SystemMessages_ListBox.Items.Add(Error_string);
  end;


  //counter A setzten &  HW runterschreiben
  counter.dw:= $124F8;
  modulbus_adr_wr(counter.r.hw, mod_kicker_counter_1+mod_kicker_HWDelayA,MBKAdress,IFKAdress,ErrStatus);
  // LW runterschreiben
  modulbus_adr_wr(counter.r.lw, mod_kicker_counter_1+mod_kicker_LWDelayA,MBKAdress,IFKAdress,ErrStatus);
  // hat das geklappt
  if(ErrStatus <> StatusOK) then begin
    PCI_ErrorString(ErrStatus, Error_Char); // ausgabe bei fehlerfall
    for i := 1 to Length(Error_Char) do begin
       Error_string := Error_string + Error_Char[i];
    end;
    KickerTesT.SystemMessages_ListBox.Items.Add(Error_string);
  end;

  //counter B setzten &  HW runterschreiben
  counter.dw:= $128E0;
  modulbus_adr_wr(counter.r.hw, mod_kicker_counter_1+mod_kicker_HWDelayB,MBKAdress,IFKAdress,ErrStatus);
  // LW runterschreiben
  modulbus_adr_wr(counter.r.lw, mod_kicker_counter_1+mod_kicker_LWDelayB,MBKAdress,IFKAdress,ErrStatus);
  // hat das geklappt
  if(ErrStatus <> StatusOK) then begin
    PCI_ErrorString(ErrStatus, Error_Char); // ausgabe bei fehlerfall
    for i := 1 to Length(Error_Char) do begin
       Error_string := Error_string + Error_Char[i];
    end;
    KickerTesT.SystemMessages_ListBox.Items.Add(Error_string);
  end;


  // Software enable setzen
  Kontrollregister:= $1;
  // Runterschreiben
  modulbus_adr_wr( Kontrollregister,mod_kicker_counter_1,MBKAdress,IFKAdress,ErrStatus);

  Kontrollregister:=0;

  modulbus_adr_rd( Kontrollregister,mod_kicker_counter_1,MBKAdress,IFKAdress,ErrStatus);
  KickerTesT.SystemMessages_ListBox.Items.Add('Kontrollreg: '+IntToHex(Kontrollregister,0));

  counter.dw:=0;
  modulbus_adr_rd(counter.r.hw, mod_kicker_counter_1+mod_kicker_HWDelayA,MBKAdress,IFKAdress,ErrStatus);
  modulbus_adr_rd(counter.r.lw, mod_kicker_counter_1+mod_kicker_LWDelayA,MBKAdress,IFKAdress,ErrStatus);
  KickerTesT.SystemMessages_ListBox.Items.Add(IntToHex(counter.dw,0));

  counter.dw:=0;
  modulbus_adr_rd(counter.r.hw, mod_kicker_counter_1+mod_kicker_HWDelayB,MBKAdress,IFKAdress,ErrStatus);
  modulbus_adr_rd(counter.r.lw, mod_kicker_counter_1+mod_kicker_LWDelayB,MBKAdress,IFKAdress,ErrStatus);
  KickerTesT.SystemMessages_ListBox.Items.Add(IntToHex(counter.dw,0));

  modulbus_adr_rd( Kontrollregister,mod_kicker_counter_1,MBKAdress,IFKAdress,ErrStatus);
  KickerTesT.SystemMessages_ListBox.Items.Add('Kontrollreg: '+IntToHex(Kontrollregister,0));
end;


procedure Kicker_CounterResetAll();

begin
  if (KickerTesT.Counter1Activ.Checked = true) then  Kicker_CounterRun(mod_kicker_counter_1);
  if (KickerTesT.Counter2Activ.Checked = true) then  Kicker_CounterRun(mod_kicker_counter_2);
  if (KickerTesT.Counter3Activ.Checked = true) then  Kicker_CounterRun(mod_kicker_counter_3);
  if (KickerTesT.Counter4Activ.Checked = true) then  Kicker_CounterRun(mod_kicker_counter_4);
  if (KickerTesT.Counter5Activ.Checked = true) then  Kicker_CounterRun(mod_kicker_counter_5);
end;

procedure Kicker_ReadCounterStrobes(CounterNr:_WORD);

var
  i:integer;
  Kontrollregister:_WORD;
  ErrorStatus     : _DWORD;
  Error_Char:t_Error_Char;
  Error_string:string;


  LatchAStrobeNeg :boolean;
  LatchBStrobeNeg :boolean;
  HWStartFLNeg    :boolean;

begin
  LatchAStrobeNeg := false;
  LatchBStrobeNeg := false;
  HWStartFLNeg    := false;
  ErrorStatus     := 0;

  modulbus_adr_rd( Kontrollregister, CounterNr, MBKAdress, IFKAdress, ErrorStatus);

    // hat es geklappt
  if(ErrorStatus <> StatusOK) then begin
    PCI_ErrorString(ErrorStatus, Error_Char); // ausgabe bei fehlerfall
    for i := 1 to Length(Error_Char) do begin
       Error_string := Error_string + Error_Char[i];
    end;
    KickerTesT.SystemMessages_ListBox.Items.Add(Error_string);
  end;

  if(Kontrollregister and mod_kickerRD_LAStrobNg)   = mod_kickerRD_LAStrobNg   then LatchAStrobeNeg:= true;
  if(Kontrollregister and mod_kickerRD_LBStrobNg)   = mod_kickerRD_LBStrobNg   then LatchBStrobeNeg:= true;
  if(Kontrollregister and mod_KickerRD_HWStartFLNg) = mod_KickerRD_HWStartFLNg then HWStartFLNeg   := true;

  case CounterNr of
    mod_kicker_counter_1:begin
                          KickerTesT.Counter1MainStrbNeg_CheckBox.Checked := LatchAStrobeNeg;
                          KickerTesT.Counter1DumpStrbNeg_CheckBox.Checked := LatchBStrobeNeg;
                          KickerTesT.Counter1HWNeg_CheckBox.Checked       := HWStartFLNeg;
                         end;

    mod_kicker_counter_2:begin
                          KickerTesT.Counter2MainStrbNeg_CheckBox.Checked := LatchAStrobeNeg;
                          KickerTesT.Counter2DumpStrbNeg_CheckBox.Checked := LatchBStrobeNeg;
                          KickerTesT.Counter2HWNeg_CheckBox.Checked       := HWStartFLNeg;
                         end;

    mod_kicker_counter_3:begin
                          KickerTesT.Counter3MainStrbNeg_CheckBox.Checked := LatchAStrobeNeg;
                          KickerTesT.Counter3DumpStrbNeg_CheckBox.Checked := LatchBStrobeNeg;
                          KickerTesT.Counter3HWNeg_CheckBox.Checked       := HWStartFLNeg;
                         end;

    mod_kicker_counter_4:begin
                          KickerTesT.Counter4MainStrbNeg_CheckBox.Checked := LatchAStrobeNeg;
                          KickerTesT.Counter4DumpStrbNeg_CheckBox.Checked := LatchBStrobeNeg;
                          KickerTesT.Counter4HWNeg_CheckBox.Checked       := HWStartFLNeg;
                         end;

    mod_kicker_counter_5:begin
                          KickerTesT.Counter5MainStrbNeg_CheckBox.Checked := LatchAStrobeNeg;
                          KickerTesT.Counter5DumpStrbNeg_CheckBox.Checked := LatchBStrobeNeg;
                          KickerTesT.Counter5HWNeg_CheckBox.Checked       := HWStartFLNeg;
                         end;
   end;
end;

procedure Kicker_EnabelButtons();
begin
 if(KickerTesT.Counter1Activ.Checked = true) then begin
   KickerTest.Counter1DelayMain_Edit.Enabled := true;
   KickerTest.Counter1DelayDump_Edit.Enabled := true;
   KickerTesT.Counter1MainStrbNeg_CheckBox.Enabled := true;
   KickerTesT.Counter1DumpStrbNeg_CheckBox.Enabled := true;
   KickerTest.Counter1HWNeg_CheckBox.Enabled := true;
 end;

 if(KickerTesT.Counter2Activ.Checked = true) then begin
   KickerTest.Counter2DelayMain_Edit.Enabled := true;
   KickerTest.Counter2DelayDump_Edit.Enabled := true;
   KickerTesT.Counter2MainStrbNeg_CheckBox.Enabled := true;
   KickerTesT.Counter2DumpStrbNeg_CheckBox.Enabled := true;
   KickerTest.Counter2HWNeg_CheckBox.Enabled := true;
 end;

 if(KickerTesT.Counter3Activ.Checked = true) then begin
   KickerTest.Counter3DelayMain_Edit.Enabled := true;
   KickerTest.Counter3DelayDump_Edit.Enabled := true;
   KickerTesT.Counter3MainStrbNeg_CheckBox.Enabled := true;
   KickerTesT.Counter3DumpStrbNeg_CheckBox.Enabled := true;
   KickerTest.Counter3HWNeg_CheckBox.Enabled := true;
 end;

 if(KickerTesT.Counter4Activ.Checked = true) then begin
   KickerTest.Counter4DelayMain_Edit.Enabled := true;
   KickerTest.Counter4DelayDump_Edit.Enabled := true;
   KickerTesT.Counter4MainStrbNeg_CheckBox.Enabled := true;
   KickerTesT.Counter4DumpStrbNeg_CheckBox.Enabled := true;
   KickerTest.Counter4HWNeg_CheckBox.Enabled := true;
 end;

 if(KickerTesT.Counter5Activ.Checked = true) then begin
   KickerTest.Counter5DelayMain_Edit.Enabled := true;
   KickerTest.Counter5DelayDump_Edit.Enabled := true;
   KickerTesT.Counter5MainStrbNeg_CheckBox.Enabled := true;
   KickerTesT.Counter5DumpStrbNeg_CheckBox.Enabled := true;
   KickerTest.Counter5HWNeg_CheckBox.Enabled := true;
 end;

 KickerTesT.Counter1Activ.Enabled := true;
 KickerTesT.Counter2Activ.Enabled := true;
 KickerTesT.Counter3Activ.Enabled := true;
 KickerTesT.Counter4Activ.Enabled := true;
 KickerTesT.Counter5Activ.Enabled := true;

 KickerTesT.sonstiges1.Enabled := true;

 KickerTest.LogFile_SpeedButton.Enabled := true;
 KickerTest.LogFileClear_Button.Enabled := true;
 KickerTest.LogFileSave_Button.Enabled  := true;
end;

procedure Kicker_DisableButtons();
begin
 KickerTesT.Counter1Activ.Enabled := false;
 KickerTesT.Counter2Activ.Enabled := false;
 KickerTesT.Counter3Activ.Enabled := false;
 KickerTesT.Counter4Activ.Enabled := false;
 KickerTesT.Counter5Activ.Enabled := false;

 KickerTest.LogFile_SpeedButton.Enabled := false;
 KickerTest.LogFileClear_Button.Enabled := false;
 KickerTest.LogFileSave_Button.Enabled  := false;

 KickerTest.Counter1DelayMain_Edit.Enabled := false;
 KickerTest.Counter2DelayMain_Edit.Enabled := false;
 KickerTest.Counter3DelayMain_Edit.Enabled := false;
 KickerTest.Counter4DelayMain_Edit.Enabled := false;
 KickerTest.Counter5DelayMain_Edit.Enabled := false;

 KickerTest.Counter1DelayDump_Edit.Enabled := false;
 KickerTest.Counter2DelayDump_Edit.Enabled := false;
 KickerTest.Counter3DelayDump_Edit.Enabled := false;
 KickerTest.Counter4DelayDump_Edit.Enabled := false;
 KickerTest.Counter5DelayDump_Edit.Enabled := false;

 KickerTesT.Counter1MainStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter2MainStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter3MainStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter4MainStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter5MainStrbNeg_CheckBox.Enabled := false;

 KickerTesT.Counter1DumpStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter2DumpStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter3DumpStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter4DumpStrbNeg_CheckBox.Enabled := false;
 KickerTesT.Counter5DumpStrbNeg_CheckBox.Enabled := false;

 KickerTesT.sonstiges1.Enabled := false;
 
 KickerTest.Counter1HWNeg_CheckBox.Enabled := false;
 KickerTest.Counter2HWNeg_CheckBox.Enabled := false;
 KickerTest.Counter3HWNeg_CheckBox.Enabled := false;
 KickerTest.Counter4HWNeg_CheckBox.Enabled := false;
 KickerTest.Counter5HWNeg_CheckBox.Enabled := false;
end;

procedure Kicker_CounterSetAll();
begin
 // Counter resetten & setzten & starten
  if (KickerTesT.Counter1Activ.Checked = true) then
    begin
      Kicker_CounterReset(mod_kicker_counter_1);
      Kicker_CounterSet(mod_kicker_counter_1);
      Kicker_CounterRun(mod_kicker_counter_1);
    end;

  if (KickerTesT.Counter2Activ.Checked = true) then
    begin
      Kicker_CounterReset(mod_kicker_counter_2);
      Kicker_CounterSet(mod_kicker_counter_2);
      Kicker_CounterRun(mod_kicker_counter_2);
    end;

  if (KickerTesT.Counter3Activ.Checked = true) then
    begin
      Kicker_CounterReset(mod_kicker_counter_3);
      Kicker_CounterSet(mod_kicker_counter_3);
      Kicker_CounterRun(mod_kicker_counter_3);
    end;

  if (KickerTesT.Counter4Activ.Checked = true) then
    begin
      Kicker_CounterReset(mod_kicker_counter_4);
      Kicker_CounterSet(mod_kicker_counter_4);
      Kicker_CounterRun(mod_kicker_counter_4);
    end;

  if (KickerTesT.Counter5Activ.Checked = true) then
    begin
     Kicker_CounterReset(mod_kicker_counter_5);
     Kicker_CounterSet(mod_kicker_counter_5);
     Kicker_CounterRun(mod_kicker_counter_5);
    end;
end;

procedure Kicker_PowerUpReset(var done:boolean);

var KontrollStatusReg:_WORD;
    ErrorStatus:_DWORD;

begin
    ErrorStatus:= 0;
    done := true;
    // PowerUp-Reset durchfuehren
    modulbus_adr_wr( mod_kickerKSR_SoftReset, mod_kickerRD_KontrollStatReg, MBKAdress,IFKAdress,ErrorStatus);

    // Kontroll Status Reg. lesen
    modulbus_adr_rd( KontrollStatusReg, mod_kickerRD_KontrollStatReg, MBKAdress, IFKAdress, ErrorStatus);

    //Prüfen ob das Powerup bit gesetzt ist & quitieren
    if(KontrollStatusReg and mod_kickerKSR_ResetDone) = mod_kickerKSR_ResetDone then begin
      modulbus_adr_wr(mod_kickerKSR_ResetDone, mod_kickerRD_KontrollStatReg, MBKAdress,IFKAdress,ErrorStatus);

      // Kontroll Status Reg. lesen
       modulbus_adr_rd( KontrollStatusReg, mod_kickerRD_KontrollStatReg, MBKAdress, IFKAdress, ErrorStatus);

      //das Powerup bit darf nicht gesetzt sein
      if(KontrollStatusReg and mod_kickerKSR_ResetDone) = mod_kickerKSR_ResetDone then begin
        KickerTesT.SystemMessages_ListBox.Items.Add('Set PowerUp failt !');
        done := false;
      end;
     end else begin
      KickerTesT.SystemMessages_ListBox.Items.Add('Set PowerUp failt !');
      done := false;
    end;
end;


function Kicker_SetCounterStrobes(CounterNr:_WORD; Strobe:_WORD; negativ:boolean):boolean;

var  Kontrollregister:_WORD;
     ErrorStatus     : _DWORD;


begin
     // Kontrollregister lesen
     modulbus_adr_rd( Kontrollregister, CounterNr, MBKAdress, IFKAdress, ErrorStatus);

     // Reset setzten
     Kontrollregister := Kontrollregister or mod_kickerWR_SoftReset;

     // Kontrollregister setzten
     if (negativ = true) then Kontrollregister:= Kontrollregister or Strobe
         else Kontrollregister:= Kontrollregister and not Strobe;

     //Kontrollregister schreiben
     modulbus_adr_wr( Kontrollregister, CounterNr, MBKAdress,IFKAdress,ErrorStatus);

     // Kontrollregister lesen
     modulbus_adr_rd( Kontrollregister, CounterNr, MBKAdress, IFKAdress, ErrorStatus);

     if (negativ = true) then
     begin
          if(Kontrollregister and Strobe) <> Strobe then
          begin
               KickerTesT.SystemMessages_ListBox.Items.Add('Set Strope failt !'+DateTimeToStr(Now));
               result := false;
          end else  result := true;
     end else begin
          if(Kontrollregister and Strobe) <> 0 then
          begin
               KickerTesT.SystemMessages_ListBox.Items.Add('Set Strope failt !'+DateTimeToStr(Now));
                result := false;
          end else  result := true;
     end;
end;


// -------------------------- Trigger Daten schreiben--------------------------------
// ------------------------------------------------------------------------------------
procedure Trigger_DataWrite(DAC_Word:_WORD; DAC_Number:_Byte);

VAR
    i:integer;
    ErrStatus: _DWORD;
    Error_Char:t_Error_Char;
    Error_string:string;
    dac_send:_WORD;

    dac_sdi: RECORD CASE BYTE OF
               1: ( r: PACKED RECORD
                         lb: _BYTE;
                         hb: _BYTE;
                       END; );
               2: ( w: _WORD );
             END;

begin
     ErrStatus:= 0;

//    dac_sdi.r.lb := DAC_Word;
//    dac_sdi.r.hb := DAC_Number;

     dac_send:= DAC_Number;
     dac_send := dac_send shl 14;
     dac_send := dac_send or DAC_Word;

//     modulbus_wr(dac_send, TriggerAdress, ErrStatus);

     case DAC_Number of
          mod_trigger_dacA:begin
                            modulbus_adr_wr(dac_send, mod_trigger_subA, TriggerAdress, IFKAdress,ErrStatus);
                           end;

          mod_trigger_dacB:begin
                            modulbus_adr_wr(dac_send, mod_trigger_subB, TriggerAdress, IFKAdress,ErrStatus);
                           end;

          mod_trigger_dacC:begin
                            modulbus_adr_wr(dac_send, mod_trigger_subC, TriggerAdress, IFKAdress,ErrStatus);
                           end;

          mod_trigger_dacD:begin
                            modulbus_adr_wr(dac_send, mod_trigger_subD, TriggerAdress, IFKAdress,ErrStatus);
                           end;
          end;

//     modulbus_adr_wr(dac_send, mod_trigger_reg, TriggerAdress, IFKAdress,ErrStatus);


     // hat es geklappt
     if(ErrStatus <> StatusOK) then begin
       PCI_ErrorString(ErrStatus, Error_Char); // ausgabe bei fehlerfall
       for i := 1 to Length(Error_Char) do begin
           Error_string := Error_string + Error_Char[i];
       end;
       TriGGerMain.TriggerSysMessages_ListBox.Items.Add(Error_string + DateTimeToStr(Now));
     end;
end;

// Fehlerausgabe in ListBox und Datei
procedure Kiker_ErrorHandle(ErrorStatus:_DWORD; ErrorString:string; SenderListBox: TListBox);

var
    i:integer;
    SpaceInErrStrgFileOut:integer;
    Error_Char:t_Error_Char;
    ErrorSringOut:string;
    ErrorStringFileOut:string;

begin
    SpaceInErrStrgFileOut := 1;

    if(ErrorString <> 'NIL') and (ErrorStatus = 0)then begin
       ErrorSringOut := ErrorString;
    end else begin
       PCI_ErrorString(ErrorStatus, Error_Char); // ausgabe bei fehlerfall
       ErrorSringOut := ErrorString;

       i:=1;

       while(Error_Char[i] <> #0) and (i < Length(Error_Char)) do begin
           ErrorSringOut := ErrorSringOut + Error_Char[i];
           i:=i+1;
       end;
    end;

    // Uhrzeit drann hängen
    ErrorSringOut := ErrorSringOut + ' ' + DateTimeToStr(Now);

    // Ausgabe in ListBox
    SenderListBox.Items.Add(ErrorSringOut);

    // Ausgabe in datei wenn gewünscht
    if (KickerTest.LogFile_SpeedButton.Down = true) then begin
       for i:=1 to SpaceInErrStrgFileOut do begin
         ErrorStringFileOut := ErrorStringFileOut + '  ';
       end;
       ErrorStringFileOut := ErrorStringFileOut + ErrorSringOut;
       _FileSaveData.Add(ErrorStringFileOut);
    end;
end;

// überprüfen der eingabewerte für KiKTest_MainUnit
procedure CheckInput(InputEdit:TEdit ;OutputPanel:TPanel);

var counterReal:Double;

begin
     if(InputEdit.Text <> '') then begin
       if(length(InputEdit.Text) <= 6) then begin
         if (KickerTesT.CardClockPanel.Caption <> '---') then begin
           try
              counterReal:= (StrToInt(InputEdit.Text)/1000);
           except
              InputEdit.Color := clRed;
              messagebox(0,'Nur Zahlen sind erlaubt...','Ach so...',16);
              InputEdit.Color := clWhite;
              counterReal:= 0;
              InputEdit.Text:= '0';
              OutputPanel.Caption := '0';
           end;
           OutputPanel.Caption := IntToHex(ArithRound(counterReal * StrToInt(KickerTesT.CardClockPanel.Caption)),0);
         end else begin
           InputEdit.Text:= '0';
           OutputPanel.Caption := '0';
         end;
       end else begin
          InputEdit.Color := clRed;
          messagebox(0,'maximal nur 6 stellen...','Was ist denn jetzt...',16);
          InputEdit.Color := clWhite;
          InputEdit.Text:= '0';
          OutputPanel.Caption := '0';
       end;//length(InputEdit.Text) < 6
     end;//InputEdit.Text <> ''
end;

end.
