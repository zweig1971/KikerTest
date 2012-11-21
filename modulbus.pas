//-----------------------------
// GSI Gesellschaft f�r
// Schwerionenforschung mbH, 
// Darmstadt, Germany
//
// modulbus.pas
//
// Autor           : Zweig,Marcus
// Version         : 0.01
// letzte �nderung : 20.07.05
//------------------------------

unit modulbus;

interface

uses
  Forms,Classes,UnitMil,SysUtils,StdCtrls,Graphics,Windows;


const

 c_fc_mod_wr      = $10;
 c_fc_mod_adr_set = $11;
 c_fc_mod_rd      = $90;

 mod_comm_status  = $F0;

 mod_data_reg     = $F2;

 mod_cstat_reload_failsave = $1;
 mod_cstat_reload_user     = $2;
 mod_cstat_wr_lw_adress    = $4;
 mod_cstat_wr_hw_adress    = $8;
 mod_cstat_erase_fifo      = $40;
 mod_cstat_wr_fifo         = $80;
 mod_cstat_fifo_to_user    = $100;
 mod_cstat_Rdfifo_empty    = $800;
 mod_cstat_Rdfifo_not_full = $1000;
 mod_cstat_rd_user_flash   = $2000;
 mod_cstat_erase_user_flash= $4000;
 mod_cstat_reload_user_l    =$8000;


 // BasisSubadressen
 mod_kicker_counter_1 = $60;
 mod_kicker_counter_2 = $70;
 mod_kicker_counter_3 = $80;
 mod_kicker_counter_4 = $90;
 mod_kicker_counter_5 = $A0;
 mod_kicker_FreqReg   = $EE;
 mod_kicker_EchoReg   = $F6;

 // Offsetadressen
 mod_kicker_status   = $00;
 mod_kicker_HWDelayA = $02;
 mod_kicker_LWDelayA = $04;
 mod_kicker_HWDelayB = $06;
 mod_kicker_LWDelayB = $08;

 // Kicker Version
 mod_kickerRD_KontrollStatReg = $FA;

 // Kicker Frequenz
 mod_kickerRD_Frequenz  =$EE;

 // Kicker_Status_read
 mod_kickerRD_Version     = $F000;
 mod_kickerRD_Revision    = $F00;
 mod_kickerRD_freiA       = $80;
 mod_kickerRD_freiB       = $40;
 mod_kickerRD_CounterOvf  = $20;
 mod_kickerRD_LBStrobNg   = $10;
 mod_kickerRD_LAStrobNg   = $8;
 mod_KickerRD_HWStartFLNg = $4;
 mod_kickerRD_CountRun    = $2;
 mod_kickerRD_SoftEnable  = $1;

 //Kontroll Status Register
 mod_kickerKSR_SoftReset     = $4;
 mod_kickerKSR_ModSeqTimeout = $2;
 mod_kickerKSR_ResetDone     = $1;


// Kicker_Status_write
 mod_kickerWR_freiA       = $80;
 mod_kickerWR_freiB       = $40;
 mod_kickerWR_LBStrobNg   = $10;
 mod_kickerWR_LAStrobNg   = $8;
 mod_KickerWR_HWStartFLNg = $4;
 mod_kickerWR_SoftReset   = $2;
 mod_kickerWR_SoftEnable  = $1;

// Trigger DAC Nummern
 mod_trigger_dacA         = $0;
 mod_trigger_dacB         = $1;
 mod_trigger_dacC         = $2;
 mod_trigger_dacD         = $3;

// Subadressen der einzelnen DACs
 mod_trigger_subA         = $12;
 mod_trigger_subB         = $14;
 mod_trigger_subC         = $16;
 mod_trigger_subD         = $18;

var
   MBKAdress:Byte;
   TriggerAdress:Byte;
   MDK_IDCODE:TStrings;

//==========================================================

procedure modulbus_adr_set( sub_adr, mod_adr: _BYTE; modulbus_cntrl_adr: _BYTE;
                            VAR ErrStatus: _DWORD);

procedure modulbus_wr( data:_WORD; modulbus_cntrl_adr:_BYTE; VAR ErrStatus: _DWORD);

PROCEDURE modulbus_rd( VAR data: _WORD; modulbus_cntrl_adr: _BYTE;
                       VAR ErrStatus: _DWORD);

PROCEDURE modulbus_adr_rd( VAR data: _WORD;
                           sub_adr, mod_adr: _BYTE;
                           modulbus_cntrl_adr: _BYTE;
                           VAR ErrStatus: _DWORD);

PROCEDURE modulbus_adr_wr( data: WORD;
                           sub_adr, mod_adr: BYTE;
                           modulbus_cntrl_adr: BYTE;
                           VAR ErrStatus: _DWORD);

//==========================================================

// Testet das kommando statusregister ab
function MOD_CommStatusTest(StatusBit:_DWORD):boolean;

//Auslesen des kommando statusregister
procedure mod_rd_commstatus(var statusbits:_WORD);

//Schreibt HW-Adresse und LW-Adresse
function modulbus_adr_hw_lw_set(Adresse:_DWORD; VAR ErrStatus: _DWORD):boolean;

// L�sche User-Flash
function MOD_Erase_User_Flash(ErrorStatus:_DWORD):boolean;

// FiFo loeschen
function MOD_Erase_FiFo(ErrorStatus:_DWORD):boolean;

// Datei Convertieren
function ConvertFile(FileTXT:TStringlist; ConvFile:TStringlist):boolean;

// UserFlash programmieren
function UserFlashprog(ErrorOut:TListBox):boolean;

// UserFlash verification
function UserFlashVerify(ErrorOut:TListBox):boolean;

// ModulbusKarten suchen
procedure MBKFound(var MBKOnline: TStrings; MBKOnlineNr: TStrings ;var MBKCount: Integer);

//==========================================================




implementation

// Grundlegende Modulbus-zugriffe
//==========================================================

procedure modulbus_adr_set( sub_adr, mod_adr: _BYTE; modulbus_cntrl_adr: _BYTE;
                            VAR ErrStatus: _DWORD);

VAR
    address: RECORD CASE BYTE OF
               1: ( r: PACKED RECORD
                         lb: _BYTE;
                         hb: _BYTE;
                       END; );
               2: ( w: _WORD );
             END;

BEGIN
     address.r.lb := sub_adr;
     address.r.hb := mod_adr;

     PCI_IfkWrite(Cardauswahl, modulbus_cntrl_adr, c_fc_mod_adr_set, address.w, ErrStatus);
END;


procedure modulbus_wr( data:_WORD; modulbus_cntrl_adr:_BYTE; VAR ErrStatus: _DWORD);

BEGIN
     PCI_IfkWrite(Cardauswahl, modulbus_cntrl_adr, c_fc_mod_wr, data, ErrStatus );
END;


PROCEDURE modulbus_rd( VAR data: _WORD; modulbus_cntrl_adr: _BYTE;
                                  VAR ErrStatus: _DWORD);

BEGIN
     PCI_IfkRead(Cardauswahl, modulbus_cntrl_adr, c_fc_mod_rd, data, ErrStatus);
END;


PROCEDURE modulbus_adr_rd( VAR data: _WORD;
                           sub_adr, mod_adr: _BYTE;
                           modulbus_cntrl_adr: _BYTE;
                           VAR ErrStatus: _DWORD);
BEGIN
     modulbus_adr_set( sub_adr, mod_adr, modulbus_cntrl_adr, ErrStatus );
     IF ErrStatus = 0 THEN
        modulbus_rd( data, modulbus_cntrl_adr, ErrStatus );
END;

PROCEDURE modulbus_adr_wr( data: WORD;
                           sub_adr, mod_adr: BYTE;
                           modulbus_cntrl_adr: BYTE;
                           VAR ErrStatus: _DWORD);
BEGIN
  modulbus_adr_set( sub_adr, mod_adr, modulbus_cntrl_adr, ErrStatus );
  IF ErrStatus = 0 THEN
    modulbus_wr( data, modulbus_cntrl_adr, ErrStatus );
END;

// Weitere Modulbus-zugriffe
//==========================================================

// Testet das kommando statusregister ab
function MOD_CommStatusTest(StatusBit:_DWORD):boolean;

var
    data      :_WORD;
    ErrStatus :_DWORD;

begin
     data      := 0;
     ErrStatus := 0;
     modulbus_adr_rd(data, mod_comm_status, MBKAdress, IFKAdress, ErrStatus);
     if data and StatusBit = StatusBit then MOD_CommStatusTest := true
     else MOD_CommStatusTest := false;
end;

//Auslesen des kommando statusregister
procedure mod_rd_commstatus(var statusbits:_WORD);

var
    ErrStatus :_DWORD;

begin
     ErrStatus := 0;
     modulbus_adr_rd(statusbits, mod_comm_status, MBKAdress, IFKAdress, ErrStatus);
end;

//Schreibt HW-Adresse und LW-Adresse
function modulbus_adr_hw_lw_set(Adresse:_DWORD; VAR ErrStatus: _DWORD):boolean;

VAR
    address: RECORD CASE _DWORD OF
                1: ( dw: _DWORD );
                2: ( r: PACKED RECORD
                     lw: _WORD;
                     hw: _WORD;
                     END; );
                END;

begin
    address.dw := adresse;

    //PCI_TimerWait(Cardauswahl, 52, 1, ErrStatus);

    //lw-adresse festsetzen und pruefen bit muss von 0->1
    modulbus_adr_wr(mod_cstat_wr_lw_adress, mod_comm_status, MBKAdress, IFKAdress, ErrStatus);
     if MOD_CommStatusTest(mod_cstat_wr_lw_adress) <> true then begin
        Application.MessageBox('Fehler beim schreiben auf die LW-Adresse', '0->1', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;
     //in lw-adresse schreiben & pruefen, bit mus von 1->0
     modulbus_adr_wr(address.r.lw, mod_data_reg, MBKAdress, IFKAdress, ErrStatus);
     if MOD_CommStatusTest(mod_cstat_wr_lw_adress) = true then begin
        Application.MessageBox('Fehler beim schreiben auf die LW-Adresse', '1->0', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;

    //PCI_TimerWait(Cardauswahl, 52, 1, ErrStatus);

    //hw-adresse festsetzen und pruefen bit muss von 0->1
    modulbus_adr_wr(mod_cstat_wr_hw_adress, mod_comm_status, MBKAdress, IFKAdress, ErrStatus);
     if MOD_CommStatusTest(mod_cstat_wr_hw_adress) <> true then begin
        Application.MessageBox('Fehler beim schreiben auf die HW-Adresse', '0->1', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;
     //in hw-adresse schreiben & pruefen, bit mus von 1->0
      modulbus_adr_wr(address.r.hw, mod_data_reg, MBKAdress, IFKAdress, ErrStatus);
     if MOD_CommStatusTest(mod_cstat_wr_hw_adress) = true then begin
        Application.MessageBox('Fehler beim schreiben auf die HW-Adresse', '1->0', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;

     modulbus_adr_hw_lw_set := true;
end;


// L�sche User-Flash
function MOD_Erase_User_Flash(ErrorStatus:_DWORD):boolean;

var
   ErrStatus:_DWORD;
   i        :_DWORD;

begin
    ErrStatus := 0;
    i         := 0;

    //Vorbereitung zum loeschen des User-Flash
    modulbus_adr_hw_lw_set($654321,ErrStatus);

   //User Flash loeschen
    modulbus_adr_wr(mod_cstat_erase_user_flash, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);

//    PCI_TimerWait(Cardauswahl, 50, 1, ErrStatus);

    repeat
      i:=i+1;
    until (MOD_CommStatusTest(mod_cstat_erase_user_flash) = false) or (i<256);

    if (i = 0) or (i >= 256) then begin
       Application.MessageBox('Fehler beim l�schen des User-Flash', 'ABBRUCH', 16);
       MOD_Erase_User_Flash := false;
       end
    else MOD_Erase_User_Flash := true;
end;

// FiFo loeschen
function MOD_Erase_FiFo(ErrorStatus:_DWORD):boolean;
var
   ErrStatus:_DWORD;
   i        :_DWORD;

begin
   ErrStatus := 0;
   i         := 0;

   modulbus_adr_wr(mod_cstat_erase_fifo, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);

    repeat
      i:=i+1;
    until (MOD_CommStatusTest(mod_cstat_erase_fifo) = true) or (i<256);

    if (i = 0) or (i >= 256) then begin
       Application.MessageBox('Fehler beim l�schen des FIFO', 'ABBRUCH', 16);
       MOD_Erase_FiFo := false;
       end
    else MOD_Erase_FiFo := true;
end;

//=================================================================================

// Datei Convertieren
function ConvertFile(FileTXT:TStringlist; ConvFile:TStringlist):boolean;

var   i       :word;
      index   :word;
      buffer  :string;

begin

     i     := 1;
     ConvFile.Clear;

     while i < FileTXT.Count-1 do begin
         buffer := '';
         index := i;
         index := index + 3;
         while index >   i do begin
           if FileTXT.Text[i] = ' ' then begin
              i:=i+1
              end
           else begin
               buffer := buffer + FileTXT.Text[i];
               i := i + 1;
               end;
         end;

         if FileTXT.Text[i] <> ',' then begin
             Application.MessageBox('ACHTUNG ! Dateiformat ung�ltig','ERROR',16);
             ConvertFile := false;
             exit;
         end;
         i := i + 1;

         if FileTXT.Text[i] = char($0d) then begin
            i := i + 2;
         end;
         ConvFile.Add(buffer);
     end;
     ConvFile.Count;
     ConvertFile:= true;
end;

// UserFlash programmieren
function UserFlashprog(ErrorOut:TListBox):boolean;
{
var
   i        : _WORD;
   x        : _WORD;
   index    : _DWORD;
   data     : _BYTE;
   StatReg  : _WORD;
   ErrStatus: _DWORD;
   LoopCount: _DWORD;
   ByteCount: _DWORD;

   daten: RECORD CASE BYTE OF
               1: ( r: PACKED RECORD
                         lb: _BYTE;
                         hb: _BYTE;
                       END; );
               2: ( w: _WORD );
             END;  }

begin
{     i     := 0;
     x     := 0;
     index := 0;
     LoopCount := 0;
     ErrStatus := 0;
     ByteCount := 0;
     //Fenster fuer Fortschrittsanzeige init. & anzeigen
     Application.CreateForm(TForm5, Form5);
     Form5.Caption := 'burn baby burn...';
     Form5.Label1.Caption := 'Programming in progress.......please wait....';
     Form5.ProgressBar1.Min := 0;
     Form5.ProgressBar1.Max := ConfigFileSize;
     Form5.Show;
     Form5.ProgressBar1.Perform($0409, 0, clGreen);
     Form5.Update;

     //Config-File von anfang an lesen
     //$i-
         Reset(FileByte);
     //$i+

   //User Flash loeschen
    if not(MOD_Erase_User_Flash(ErrStatus)) then begin
       mod_rd_commstatus(StatReg);
       ErrorOut.Items. Add('ERROR User Flash wurde nicht gel�scht $'+IntToHex(StatReg,4));
       UserFlashprog := false;
       Form5.Close;
       exit;
       end;


     while not eof(FileByte) do begin

           //FiFo loeschen
           MOD_Erase_FiFo(ErrStatus);

           // Daten sollen ab der adresse null geschrieben werden
           if modulbus_adr_hw_lw_set(index, ErrStatus) = false then begin
              mod_rd_commstatus(StatReg);
              ErrorOut.Items. Add('ERROR Start-Adresse vom FiFo kann nicht gesetzt werden $'
                                   +IntToHex(StatReg,4));
              UserFlashprog := false;
              Form5.Close;
              exit;
              end;

            // Daten sollen ins FiFo geschrieben werden
           modulbus_adr_wr(mod_cstat_wr_fifo, mod_comm_status, MBKAdress, IFKAdress, ErrStatus);

           i:=0;

           repeat
             // HB Lesen
             Read(FileByte, data);
             daten.r.hb := data;

             // LW Lesen
             Read(FileByte, data);
             daten.r.lb := data;

             // Daten schreiben
             modulbus_adr_wr(daten.w, mod_data_reg, MBKAdress, IFKAdress,ErrStatus);

             i:=i+1;

             ByteCount:=ByteCount + 2;

           until(i=128) or eof(FileByte);

           //FiFo muss jetzt voll sein
           if   (MOD_CommStatusTest(mod_cstat_wr_fifo) = true) and not(eof(FileByte)) then begin
                mod_rd_commstatus(StatReg);
                ErrorOut.Items. Add('ERROR ! '+IntToStr(i)+'x geschrieben FiFo ist nicht voll $'
                +IntToHex(StatReg,4));
                UserFlashprog := false;
                Form5.Close;
                exit;
                end;

           //User Flash programmieren
           modulbus_adr_wr(mod_cstat_fifo_to_user, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);

           x:=0;
           repeat
                 x:=x+1;
                 PCI_TimerWait(Cardauswahl, 10, 1, ErrStatus);
           until (MOD_CommStatusTest(mod_cstat_fifo_to_user) = false) or (x > 500);

           //ErrorOut.Items. Add('Programmierung :'+IntToStr(x));

           if x > 500 then begin
              ErrorOut.Items. Add('ERROR ! Programierung fehlgeschlagen ! (x>500)');
              UserFlashprog := false;
              Form5.Close;
              exit;
              end;

//           if x = 1 then
//              ErrorOut.Items. Add('WARNING ! Programierung vermutlich fehlerhaft ! (x=1)');

           index := index + 256;
           LoopCounter := LoopCounter + 1;

           // Statusbalken updaten & abbruch button pruefen
           if (LoopCounter mod 10 = 0) or (eof(FileByte)) then begin
              if Form5.SpeedButton1.Down = true then begin
                 Form5.ProgressBar1.Perform($0409, 0, clRed);
                 Form5.ProgressBar1.Position := ConfigFileSize;
                 Form5.Update;
                 //warte
                 PCI_TimerWait(Cardauswahl, 800, 1, ErrStatus);
                 //User Flash loeschen
                 MOD_Erase_User_Flash(ErrStatus);
                 //FiFo loeschen
                 MOD_Erase_FiFo(ErrStatus);
                 UserFlashprog := false;
                 Form5.Close;
                 exit;
                 end
              else begin
                   Form5.ProgressBar1.Position := ByteCount;
                   Form5.Update;
                   Application.ProcessMessages
                   end;
              end;
    end;
    Form5.Close;
    UserFlashprog := true;
    modulbus_adr_wr(mod_cstat_reload_failsave, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);
    MOD_CommStatusTest(mod_cstat_fifo_to_user);}
end;

// UserFlash verification
function UserFlashVerify(ErrorOut:TListBox):boolean;
{
var
   x        : _WORD;
   i        : _WORD;
   DataByte : _BYTE;
   FiFoData : _WORD;
   StatReg  : _WORD;
   ErrStatus: _DWORD;
   index    : _DWORD;
   ErrCount : _DWORD;
   ByteCount: _DWORD;

   FileData: RECORD CASE BYTE OF
               1: ( r: PACKED RECORD
                         lb: _BYTE;
                         hb: _BYTE;
                       END; );
               2: ( w: _WORD );
             END;    }


begin
{     StatReg   := 0;
     ErrStatus := 0;
     ErrCount  := 0;
     index     := 0;
     ByteCount := 0;

     //Fenster fuer Fortschrittsanzeige init. & anzeigen
     Application.CreateForm(TForm5, Form5);
     Form5.Caption := 'Verification';
     Form5.Label1.Caption := 'Verification in progress...please wait...';
     Form5.ProgressBar1.Min := 0;
     Form5.ProgressBar1.Max := ConfigFileSize;
     Form5.Show;
     Form5.ProgressBar1.Perform($0409, 0, clGreen);
     Form5.Update;

     //Config-File von anfang an lesen
     //$i-
         Reset(FileByte);
     //$i+

      while not eof(FileByte) do begin
           x:= 0;
           i:= 0;

           // Daten sollen ab der adresse null gelesen werden
           if modulbus_adr_hw_lw_set(index, ErrStatus) = false then begin
              mod_rd_commstatus(StatReg);
              ErrorOut.Items. Add('ERROR Start-Adresse vom FiFo kann nicht gesetzt werden $'
                                   +IntToHex(StatReg,4));
              UserFlashVerify := false;
              Form5.Close;
              exit
              end;

           //FiFo loeschen
           MOD_Erase_FiFo(ErrStatus);

           // Daten sollen aus dem FiFo gelesen werden
           modulbus_adr_wr(mod_cstat_rd_user_flash, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);

           //Pr�fen ob Bit 13, lese User-Flash daten g�ltig, gesetzt ist
           repeat
                 x:=x+1;
                 PCI_TimerWait(Cardauswahl, 10, 1, ErrStatus);
           until (MOD_CommStatusTest(mod_cstat_rd_user_flash) <> true) or (x>500);

           if (x>500) then begin
           ErrorOut.Items. Add('ERROR ! Transfer Data User-Flash -> RDFiFo Time-Out !');
           UserFlashVerify := false;
           Form5.Close;
           exit
           end;

           // Daten vom FiFo lesen wenn g�ltig
           repeat
                 //Daten aus dem FiFo nur lesen wenn daten gueltig
                 if(MOD_CommStatusTest(mod_cstat_rd_user_flash) <> true) then
                    modulbus_adr_rd(FiFoData, mod_data_reg, MBKAdress, IFKAdress,ErrStatus)
                 else begin
                     ErrorOut.Items. Add('ERROR ! READ User-Flash Time-Out !');
                     UserFlashVerify := false;
                     Form5.Close;
                     exit
                     end;

                 //Daten vom config-file lesen
                 // HB Lesen
                 Read(FileByte, DataByte);
                 FileData.r.hb := DataByte;

                 // LW Lesen
                 Read(FileByte, DataByte);
                 FileData.r.lb := DataByte;

                 if(FileData.w <> FiFoData) then ErrCount:=ErrCount+1;

                 i:=i+1;

                 ByteCount:=ByteCount + 2;

           until (MOD_CommStatusTest(mod_cstat_Rdfifo_empty)) or (i > 128) or eof(FileByte);

           index:=index+256;

           //FiFo muss leer sein -> sonst fehler !
           if not (MOD_CommStatusTest(mod_cstat_Rdfifo_empty)) and not (eof(FileByte)) then begin
              ErrorOut.Items. Add('ERROR ! Fehler beim lesen des FiFo $'+IntToHex(StatReg,4));
              UserFlashVerify := false;
              Form5.Close;
              exit
              end;

           LoopCounter := LoopCounter + 1;

           // Statusbalken updaten & abbruch button pruefen
           if (LoopCounter mod 10 = 0) or (eof(FileByte)) then begin
              if Form5.SpeedButton1.Down = true then begin
                 Form5.ProgressBar1.Perform($0409, 0, clRed);
                 Form5.ProgressBar1.Position := ConfigFileSize;
                 Form5.Update;
                 //warte
                 PCI_TimerWait(Cardauswahl, 800, 1, ErrStatus);
                 //User Flash loeschen
                 MOD_Erase_User_Flash(ErrStatus);
                 //FiFo loeschen
                 MOD_Erase_FiFo(ErrStatus);
                 UserFlashVerify := false;
                 Form5.Close;
                 exit;
                 end
              else begin
                   Form5.ProgressBar1.Position := ByteCount;
                   Form5.Update;
                   Application.ProcessMessages
                   end;
              end;
     end; //while not eof(FileByte) do begin

     if(ErrCount = 0) then begin
        UserFlashVerify := true;
        Form5.Close;
        end
     else begin
          ErrorOut.Items. Add('ERROR ! Fehler beim verification. ErrorCounter :'+IntToStr(ErrCount));
          UserFlashVerify := false;
          Form5.Close;
          end;     }
end;

procedure MBKFound(var MBKOnline: TStrings; MBKOnlineNr: TStrings ;var MBKCount: Integer);

var
   i         : _WORD;
   data      : _WORD;
   index     : _WORD;
   ErrStatus : _DWORD;

begin
     i         := 0;
     data      := 0;
     index     := 0;
     ErrStatus := 0;
     MBKCount  := 0;

     repeat
          modulbus_adr_rd(data, $FE, i, IFKAdress,ErrStatus);
           if(ErrStatus = 0) then begin
             index := (data and $FF);
             if(index > 256) then messagebox(0,'Modul ID zu hoch !','Warnung',16)
             else begin
                  MBKOnline.Add(IntToHex(i,2)+'('+IntToHex(data,4)+')'+' '+MDK_IDCODE.Strings[index]);
                  MBKOnlineNr.Add(IntToHex(i,2));
                  MBKCount:=MBKCount+1;
                  end;
           end;
          ErrStatus :=0;
          i:=i+1;
     until (i=$1F);
end;


end.
