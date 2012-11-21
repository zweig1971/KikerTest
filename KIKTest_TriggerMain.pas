unit KIKTest_TriggerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask;

type
  TTriGGerMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    K1KanalIn_CheckBox: TCheckBox;
    K1TriggerLevel_Edit: TEdit;
    Label7: TLabel;
    K1Hysterese_CheckBox: TCheckBox;
    K1KompTest_CheckBox: TCheckBox;
    K1ECLIn_CheckBox: TCheckBox;
    Label8: TLabel;
    K1Activ_CheckBox: TCheckBox;
    Panel5: TPanel;
    Label9: TLabel;
    Panel6: TPanel;
    K2KanalIn_CheckBox: TCheckBox;
    K2TriggerLevel_Edit: TEdit;
    K2Hysterese_CheckBox: TCheckBox;
    K2KompTest_CheckBox: TCheckBox;
    K2ECLIn_CheckBox: TCheckBox;
    K2Activ_CheckBox: TCheckBox;
    Panel7: TPanel;
    Label10: TLabel;
    Panel8: TPanel;
    K3TriggerLevel_Edit: TEdit;
    K3Hysterese_CheckBox: TCheckBox;
    K3KompTest_CheckBox: TCheckBox;
    K3ECLIn_CheckBox: TCheckBox;
    Panel11: TPanel;
    Label12: TLabel;
    Panel12: TPanel;
    K5KanalIn_CheckBox: TCheckBox;
    K5TriggerLevel_Edit: TEdit;
    K5Hysterese_CheckBox: TCheckBox;
    K5KompTest_CheckBox: TCheckBox;
    K5ECLIn_CheckBox: TCheckBox;
    K5Activ_CheckBox: TCheckBox;
    Panel13: TPanel;
    Label13: TLabel;
    Panel14: TPanel;
    K6KanalIn_CheckBox: TCheckBox;
    K6TriggerLevel_Edit: TEdit;
    K6Hysterese_CheckBox: TCheckBox;
    K6KompTest_CheckBox: TCheckBox;
    K6ECLIn_CheckBox: TCheckBox;
    K6Activ_CheckBox: TCheckBox;
    Panel17: TPanel;
    Label15: TLabel;
    Panel18: TPanel;
    K8KanalIn_CheckBox: TCheckBox;
    K8TriggerLevel_Edit: TEdit;
    K8Hysterese_CheckBox: TCheckBox;
    K8KompTest_CheckBox: TCheckBox;
    K8ECLIn_CheckBox: TCheckBox;
    K8Activ_CheckBox: TCheckBox;
    Panel19: TPanel;
    TriggerSysMessages_ListBox: TListBox;
    Label16: TLabel;
    Clear_Button: TButton;
    Panel20: TPanel;
    TriggerCardID_Panel: TPanel;
    Label17: TLabel;
    Close_Button: TButton;
    Send_Button: TButton;
    Label18: TLabel;
    TriggerIFKUse_Panel: TPanel;
    Edit_Button: TButton;
    K3Activ_CheckBox: TCheckBox;
    Panel9: TPanel;
    Label11: TLabel;
    Panel10: TPanel;
    K4TriggerLevel_Edit: TEdit;
    K4Hysterese_CheckBox: TCheckBox;
    K4KompTest_CheckBox: TCheckBox;
    K4ECLIn_CheckBox: TCheckBox;
    K4KanalIn_CheckBox: TCheckBox;
    K4Activ_CheckBox: TCheckBox;
    K3KanalIn_CheckBox: TCheckBox;
    Panel15: TPanel;
    Label14: TLabel;
    Panel16: TPanel;
    K7KanalIn_CheckBox: TCheckBox;
    K7TriggerLevel_Edit: TEdit;
    K7Hysterese_CheckBox: TCheckBox;
    K7KompTest_CheckBox: TCheckBox;
    K7ECLIn_CheckBox: TCheckBox;
    K7Activ_CheckBox: TCheckBox;
    procedure Close_ButtonClick(Sender: TObject);
    procedure Clear_ButtonClick(Sender: TObject);
    procedure Edit_ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure K1TriggerLevel_EditExit(Sender: TObject);
    procedure K2TriggerLevel_EditExit(Sender: TObject);
    procedure K3TriggerLevel_EditExit(Sender: TObject);
    procedure K4TriggerLevel_EditExit(Sender: TObject);
    procedure K1Activ_CheckBoxClick(Sender: TObject);
    procedure K2Activ_CheckBoxClick(Sender: TObject);
    procedure K3Activ_CheckBoxClick(Sender: TObject);
    procedure K4Activ_CheckBoxClick(Sender: TObject);
    procedure Send_ButtonClick(Sender: TObject);
    procedure K1TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K2TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K3TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K4TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K5TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K6TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K7TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure K8TriggerLevel_EditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TriGGerMain: TTriGGerMain;

implementation

uses KIKTest_ChosseIFKMB, UnitMil, KikTest_GlobalFunc, modulbus,
  KiKTest_GlobalVariable;

{$R *.DFM}
// überprüfen der eingabewerte für den Trigger
procedure CheckTriggerInput(InputEdit:TEdit);

var TriggerVolt:single;

begin
     if(InputEdit.Text = '') then begin
        InputEdit.Text := '0';
     end else begin
         try
            TriggerVolt:=StrToFloat(InputEdit.Text);
         except
            InputEdit.Color := clRed;
            messagebox(0,'Fehlerhafte eingabe...','Och mano...',16);
            InputEdit.Color := clWhite;
            InputEdit.Text := '0';
         end;

         if(TriggerVolt > TriggerVoltMax) or (TriggerVolt < TriggerVoltMin) then begin
           InputEdit.Color := clRed;
           messagebox(0,'Wert ist ausserhalb des erlaubten Bereiches (-5/+5)','Ja verdammte schei...',16);
           InputEdit.Color := clWhite;
           InputEdit.Text := '0';
         end else begin
           InputEdit.Text := Format('%2f', [TriggerVolt]);
           InputEdit.Text := TriGGerMain.K1TriggerLevel_Edit.Text;
         end;
     end;
end;


procedure TTriGGerMain.Close_ButtonClick(Sender: TObject);
begin
    TriGGerMain.Close;
end;

procedure TTriGGerMain.Clear_ButtonClick(Sender: TObject);
begin
     TriGGerMain.TriggerSysMessages_ListBox.Items.Clear;
end;

procedure TTriGGerMain.Edit_ButtonClick(Sender: TObject);
begin
     KickerSearch := false;
     KickerChooseIFKMBK.ShowModal;
end;

procedure TTriGGerMain.FormCreate(Sender: TObject);
begin
     TriGGerMain.TriggerIFKUse_Panel.Caption := IntToHex(IFKAdress,0);
end;


procedure TTriGGerMain.K1TriggerLevel_EditExit(Sender: TObject);
begin
     CheckTriggerInput(TriGGerMain.K1TriggerLevel_Edit);
end;

procedure TTriGGerMain.K2TriggerLevel_EditExit(Sender: TObject);
begin
     CheckTriggerInput(TriGGerMain.K2TriggerLevel_Edit);
end;

procedure TTriGGerMain.K3TriggerLevel_EditExit(Sender: TObject);
begin
     CheckTriggerInput(TriGGerMain.K3TriggerLevel_Edit);
end;

procedure TTriGGerMain.K4TriggerLevel_EditExit(Sender: TObject);
begin
     CheckTriggerInput(TriGGerMain.K4TriggerLevel_Edit);
end;

procedure TTriGGerMain.K1Activ_CheckBoxClick(Sender: TObject);
begin
     if(TriGGerMain.K1Activ_CheckBox.Checked = true) then TriGGerMain.K1TriggerLevel_Edit.Enabled := true
     else TriGGerMain.K1TriggerLevel_Edit.Enabled := false;
end;

procedure TTriGGerMain.K2Activ_CheckBoxClick(Sender: TObject);
begin
     if(TriGGerMain.K2Activ_CheckBox.Checked = true) then TriGGerMain.K2TriggerLevel_Edit.Enabled := true
     else TriGGerMain.K2TriggerLevel_Edit.Enabled := false;
end;

procedure TTriGGerMain.K3Activ_CheckBoxClick(Sender: TObject);
begin
     if(TriGGerMain.K3Activ_CheckBox.Checked = true) then TriGGerMain.K3TriggerLevel_Edit.Enabled := true
     else TriGGerMain.K3TriggerLevel_Edit.Enabled := false;
end;

procedure TTriGGerMain.K4Activ_CheckBoxClick(Sender: TObject);
begin
     if(TriGGerMain.K4Activ_CheckBox.Checked = true) then TriGGerMain.K4TriggerLevel_Edit.Enabled := true
     else TriGGerMain.K4TriggerLevel_Edit.Enabled := false;
end;

procedure TTriGGerMain.K1TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
      if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K2TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K3TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K4TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K5TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K6TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K7TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.K8TriggerLevel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = '.' then key:= ',';
end;

procedure TTriGGerMain.Send_ButtonClick(Sender: TObject);

var Vout:real;
    DAC_Word:_WORD;
    status:integer;

begin
     if(TriggerAdress = 0) then messagebox(0,'Keine gültige Trigger-Adresse','Was denn...',16);

     if(TriGGerMain.K1Activ_CheckBox.Checked = true) then begin
       Vout := StrToFloat(TriGGerMain.K1TriggerLevel_Edit.Text);
       CalculateDAC (Vout, DAC_Word);
       Trigger_DataWrite(DAC_Word, mod_trigger_dacA);
       TriggerVoltDacA := TriGGerMain.K1TriggerLevel_Edit.Text;// für das savefile
     end else TriggerVoltDacA := 'NA';

    if(TriGGerMain.K2Activ_CheckBox.Checked = true) then begin
       Vout := StrToFloat(TriGGerMain.K2TriggerLevel_Edit.Text);
       CalculateDAC (Vout, DAC_Word);
       Trigger_DataWrite(DAC_Word, mod_trigger_dacB);
       TriggerVoltDacB := TriGGerMain.K2TriggerLevel_Edit.Text;
     end else TriggerVoltDacB := 'NA';

    if(TriGGerMain.K3Activ_CheckBox.Checked = true) then begin
       Vout := StrToFloat(TriGGerMain.K3TriggerLevel_Edit.Text);
       CalculateDAC (Vout, DAC_Word);
       Trigger_DataWrite(DAC_Word, mod_trigger_dacC);
       TriggerVoltDacC := TriGGerMain.K3TriggerLevel_Edit.Text;
     end else TriggerVoltDacC := 'NA';

    if(TriGGerMain.K4Activ_CheckBox.Checked = true) then begin
       Vout := StrToFloat(TriGGerMain.K4TriggerLevel_Edit.Text);
       CalculateDAC (Vout, DAC_Word);
       Trigger_DataWrite(DAC_Word, mod_trigger_dacD);
       TriggerVoltDacD := TriGGerMain.K4TriggerLevel_Edit.Text;
     end else TriggerVoltDacD := 'NA';
end;





end.
