unit KiKTest_EchoTest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TKickerEchoTest = class(TForm)
    Panel1: TPanel;
    Close_Button: TButton;
    Loop_SpeedButton: TSpeedButton;
    Label1: TLabel;
    LoopCounter_Panel: TPanel;
    Label2: TLabel;
    ErrorCounter_Panel: TPanel;
    ResetKicker_Button: TButton;
    SystemMess_ListBox: TListBox;
    Label3: TLabel;
    Clear_Button: TButton;
    ErrorStop_CheckBox: TCheckBox;
    Step_Button: TButton;
    procedure Clear_ButtonClick(Sender: TObject);
    procedure ResetKicker_ButtonClick(Sender: TObject);
    procedure Step_ButtonClick(Sender: TObject);
    procedure Loop_SpeedButtonClick(Sender: TObject);
    procedure Close_ButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KickerEchoTest: TKickerEchoTest;

implementation

uses KikTest_GlobalFunc, KiKTest_GlobalVariable, UnitMil, modulbus;

{$R *.DFM}

// Ein Echo durchlauf-Test
procedure echo_durchlauf(LoopCounter:_DWORD; var Error:boolean);

var i:integer;
    mySendData:_WORD;
    ReadData:_WORD;
    ErrorStatus:_DWORD;
    Error_Char:t_Error_Char;
    Error_string:string;
    ErrorCounter:_WORD;

begin
    ReadData := 0;
    ErrorStatus :=0;

    mySendData := LoopCounter mod $10000;

    // Daten versenden und wieder lesen
    modulbus_adr_wr(mySendData, mod_kicker_EchoReg, MBKAdress,IFKAdress,ErrorStatus);
    modulbus_adr_rd(ReadData, mod_kicker_EchoReg, MBKAdress, IFKAdress, ErrorStatus);

    //
    if(ErrorStatus <> StatusOK) then begin
       PCI_ErrorString(ErrorStatus, Error_Char); // ausgabe bei fehlerfall
       for i := 1 to Length(Error_Char) do begin
           Error_string := Error_string + Error_Char[i];
       end;
       KickerEchoTest.SystemMess_ListBox.Items.Add(Error_string);
       Error := True;
    end;

    // daten vergleichen
    if (ReadData <> mySendData) then begin
       KickerEchoTest.SystemMess_ListBox.Items.Add(IntToHex(mySendData,4)
       +' / '+IntToHex(ReadData,4)+'  ' + DateTimeToStr(Now));
       Error := True;
     end;

    // Ausgabe
    if(LoopCounter mod 100 = 0) or (Error = True) then begin
       if(Error = True) then begin
         ErrorCounter:= StrToInt(KickerEchoTest.ErrorCounter_Panel.Caption);
         ErrorCounter:= ErrorCounter + 1;
         KickerEchoTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCounter);
       end else begin
           KickerEchoTest.LoopCounter_Panel.Caption := IntToStr(LoopCounter);
       end;

       KickerEchoTest.Update;
       Application.ProcessMessages;
    end;
end;


procedure TKickerEchoTest.Clear_ButtonClick(Sender: TObject);
begin
     KickerEchoTest.LoopCounter_Panel.Caption  := '0';
     KickerEchoTest.ErrorCounter_Panel.Caption := '0';
     KickerEchoTest.SystemMess_ListBox.Clear;
end;

procedure TKickerEchoTest.ResetKicker_ButtonClick(Sender: TObject);

var done:boolean;

begin
     Kicker_PowerUpReset(done);
     if(done <> true) then messagebox(0,'PowerUp ist fehlgeschlagen !','Huch ?',16);
end;

procedure TKickerEchoTest.Step_ButtonClick(Sender: TObject);

var LoopCounter:_DWORD;
    Error:boolean;

begin
     Error:=false;
     KickerEchoTest.Loop_SpeedButton.Down := false;
     LoopCounter:= StrToInt(KickerEchoTest.LoopCounter_Panel.Caption);
     LoopCounter := LoopCounter +1;
     echo_durchlauf(LoopCounter,Error);
     KickerEchoTest.LoopCounter_Panel.Caption := IntToStr(LoopCounter);
end;

procedure TKickerEchoTest.Loop_SpeedButtonClick(Sender: TObject);

var LoopCounter:_DWORD;
    Error:boolean;

begin
     LoopCounter:= StrToInt(KickerEchoTest.LoopCounter_Panel.Caption);

     while KickerEchoTest.Loop_SpeedButton.Down = true do
     begin
          Error:=false;
          LoopCounter := LoopCounter +1;
          echo_durchlauf(LoopCounter,Error);
          if(Error = true) and (KickerEchoTest.ErrorStop_CheckBox.Checked = true)then begin
             KickerEchoTest.Loop_SpeedButton.Down := false;
             KickerEchoTest.Update;
             Application.ProcessMessages;
          end;
     end;
     KickerEchoTest.LoopCounter_Panel.Caption := IntToStr(LoopCounter);
end;

procedure TKickerEchoTest.Close_ButtonClick(Sender: TObject);
begin
     KickerEchoTest.Close;
end;

end.
