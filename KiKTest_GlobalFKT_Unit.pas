unit KiKTest_GlobalFKT_Unit;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitMil,StdCtrls, ExtCtrls, Menus;

  procedure IFKSearch(var IFKCount: integer; var IFKIndex: integer);



implementation

uses KiKTest_GlobalVariable;


procedure IFKSearch(var IFKCount: integer; var IFKIndex: integer);

begin
  // Liste loeschen
  IFKOnline.Clear;

  // IFKs suchen
  IFKFound(IFKOnline, IFKCount);

  // Die alte IFK in der Liste suchen
  IFKIndex:= IFKOnline.IndexOf(IntToStr(IFKAdress));
end;


{+-----------------------------------------------------------------+}
{|   Funktionsen zur Bedienung des Modulbus.                       |}
{+-----------------------------------------------------------------+}

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
     //wr( address.w, modulbus_cntrl_adr, c_fc_mod_adr_set, mil_err );
END;


procedure modulbus_wr( data:_WORD; modulbus_cntrl_adr:_BYTE; VAR ErrStatus: _DWORD);

BEGIN
     PCI_IfkWrite(Cardauswahl, modulbus_cntrl_adr, c_fc_mod_wr, data, ErrStatus );
     //wr( data, modulbus_cntrl_adr, c_fc_mod_wr, mil_err );
END;


PROCEDURE modulbus_rd( VAR data: _WORD; modulbus_cntrl_adr: _BYTE;
                                  VAR ErrStatus: _DWORD);

BEGIN
     PCI_IfkRead(Cardauswahl, modulbus_cntrl_adr, c_fc_mod_rd, data, ErrStatus);
//  rd( data, modulbus_cntrl_adr, c_fc_mod_rd, mil_err );
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

{+-----------------------------------------------------------------+}
{|                                                                 |}
{+-----------------------------------------------------------------+}



// Testet das kommando statusregister ab
function MOD_CommStatusTest(StatusBit:_DWORD):boolean;

var
    data      :_WORD;
    ErrStatus :_DWORD;

begin
     data      := 0;
     ErrStatus := 0;
     modulbus_adr_rd(data, mod_comm_status, c_fc_mod_adr, IFKAdress, ErrStatus);
     if data and StatusBit = StatusBit then MOD_CommStatusTest := true
     else MOD_CommStatusTest := false;
end;

//Schreibt HW-Adresse und LW-Adresse
function modulbus_adr_hw_lw_set(HW: WORD; LW: WORD; VAR ErrStatus: _DWORD):boolean;
begin

    PCI_TimerWait(Cardauswahl, 52, 1, ErrStatus);

    //lw-adresse festsetzen und pruefen bit muss von 0->1
    modulbus_adr_wr(mod_cstat_wr_lw_adress, mod_comm_status, c_fc_mod_adr, IFKAdress, ErrStatus);
     if MOD_CommStatusTest(mod_cstat_wr_lw_adress) <> true then begin
        Application.MessageBox('Fehler beim schreiben auf die LW-Adresse', '0->1', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;
     //in lw-adresse schreiben & pruefen, bit mus von 1->0
     modulbus_wr(LW, IFKAdress, ErrStatus );
     if MOD_CommStatusTest(mod_cstat_wr_lw_adress) = true then begin
        Application.MessageBox('Fehler beim schreiben auf die LW-Adresse', '1->0', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;

    PCI_TimerWait(Cardauswahl, 52, 1, ErrStatus);

    //hw-adresse festsetzen und pruefen bit muss von 0->1
    modulbus_adr_wr(mod_cstat_wr_hw_adress, mod_comm_status, c_fc_mod_adr, IFKAdress, ErrStatus);
     if MOD_CommStatusTest(mod_cstat_wr_hw_adress) <> true then begin
        Application.MessageBox('Fehler beim schreiben auf die HW-Adresse', '0->1', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;
     //in hw-adresse schreiben & pruefen, bit mus von 1->0
     modulbus_wr(HW, IFKAdress, ErrStatus );
     if MOD_CommStatusTest(mod_cstat_wr_hw_adress) = true then begin
        Application.MessageBox('Fehler beim schreiben auf die HW-Adresse', '1->0', 16);
        modulbus_adr_hw_lw_set := false;
        exit;
        end;

     modulbus_adr_hw_lw_set := true;

end;

// Lösche User-Flash
function MOD_Erase_User_Flash(ErrorStatus:_DWORD):boolean;

var
   ErrStatus:_DWORD;
   i        :_DWORD;

begin
    ErrStatus := 0;
    i         := 0;

    //Vorbereitung zum loeschen des User-Flash
    modulbus_adr_hw_lw_set($65,$4321,ErrStatus);

   //User Flash loeschen
    modulbus_adr_wr(mod_cstat_erase_user_flash, mod_comm_status, c_fc_mod_adr, IFKAdress,ErrStatus);

    repeat
      i:=i+1;
    until (MOD_CommStatusTest(mod_cstat_erase_user_flash) = false) or (i<256);

    if (i = 0) or (i >= 256) then begin
       Application.MessageBox('Fehler beim löschen des User-Flash', 'ABBRUCH', 16);
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

   modulbus_adr_wr(mod_cstat_erase_fifo, mod_comm_status, c_fc_mod_adr, IFKAdress,ErrStatus);

    repeat
      i:=i+1;
    until (MOD_CommStatusTest(mod_cstat_erase_fifo) = true) or (i<256);

    if (i = 0) or (i >= 256) then begin
       Application.MessageBox('Fehler beim löschen des FIFO', 'ABBRUCH', 16);
       MOD_Erase_FiFo := false;
       end
    else MOD_Erase_FiFo := true;
end;

{+-----------------------------------------------------------------+}
{|                                                                 |}
{+-----------------------------------------------------------------+}
end.
