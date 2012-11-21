unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
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
    Step_Button: TButton;
    Loop_SpeedButton: TSpeedButton;
    Panel11: TPanel;
    Label9: TLabel;
    LoopCounter_Panel: TPanel;
    Label10: TLabel;
    ErrorCounter_Panel: TPanel;
    Label11: TLabel;
    CardID_Panel: TPanel;
    Label12: TLabel;
    CardClockPanel: TPanel;
    Label13: TLabel;
    Bevel1: TBevel;
    Panel16: TPanel;
    SystemMessages_ListBox: TListBox;
    Label14: TLabel;
    Clear_Button: TButton;
    Panel17: TPanel;
    Label15: TLabel;
    IFKCount_Panel: TPanel;
    Label16: TLabel;
    IFKNr_ComboBox: TComboBox;
    IFKsOnline_ListBox: TListBox;
    Label17: TLabel;
    Update_Button: TButton;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
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
    Counter1Activ: TCheckBox;
    Counter2Activ: TCheckBox;
    Counter3Activ: TCheckBox;
    Counter4Activ: TCheckBox;
    Counter5Activ: TCheckBox;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
