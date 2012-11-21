unit KIKTest_ChosseIFKMB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UnitMil, ExtCtrls;

type
  TKickerChooseIFKMBK = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    IFKCount_Panel: TPanel;
    Label2: TLabel;
    IFKFound_ListBox: TListBox;
    Label3: TLabel;
    IFKSelect_ComboBox: TComboBox;
    Update_Button: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    ListBox2: TListBox;
    ComboBox2: TComboBox;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Update_ButtonClick(Sender: TObject);
    procedure IFKSelect_ComboBoxChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KickerChooseIFKMBK: TKickerChooseIFKMBK;
  KickerSearch:boolean;

implementation

uses modulbus, KiKTest_GlobalVariable, KiKTest_MainUnit, KikTest_GlobalFunc,
  KIKTest_TriggerMain;



{$R *.DFM}

procedure TKickerChooseIFKMBK.Button1Click(Sender: TObject);

var done:boolean;
    MBX_string:string;
    temp_string:string;
    i    :integer;
    ErrStatus: _DWORD;
    KikVersion: _WORD;
    KikRevision: _Word;
    Freq_MHz:_WORD;

begin
    i:= 0;

    MBKOnlineIndex := KickerChooseIFKMBK.ComboBox2.ItemIndex;

    // Nach was wurde gefragt kicker oder trigger
    if (KickerSearch = true) then begin
       try
          MBKAdress := StrToInt('$'+ KickerChooseIFKMBK.ComboBox2.Text);
       except
          messagebox(0,'Ungültige MBK !','Warnung',16);
       end;
    end else begin
       try
          TriggerAdress := StrToInt('$'+ KickerChooseIFKMBK.ComboBox2.Text);
       except
          messagebox(0,'Ungültige TriggerAdress !','Warnung',16);
       end;
    end;

    MBX_string := KickerChooseIFKMBK.ListBox2.Items[KickerChooseIFKMBK.ComboBox2.ItemIndex];

    while (i+9)<= Length(MBX_string) do
    begin
       temp_string:=temp_string+MBX_string[i+9];
       i:= i+1;
    end;

    if (KickerSearch = true) then KickerTesT.MBXID_Panel.Caption:= temp_string
    else TriGGerMain.TriggerCardID_Panel.Caption:= temp_string;

   //----------------------------------------------------
   //Version und Revison der karte auslesen & anzeigen
  //----------------------------------------------------

    if(KickerSearch = true) then begin

      ErrStatus := 0;

      Kiker_ReadVersion(KikVersion, KikRevision,ErrStatus);
      Kiker_ReadFrequenz(Freq_MHz,ErrStatus);

      if (ErrStatus = 0) then begin
       KickerTesT.Version_Panel.Caption  := IntToStr(KikVersion);
       KickerTesT.Revision_Panel.Caption := IntToStr(KikRevision);
       KickerTest.CardClockPanel.Caption := IntToSTR(Freq_MHz);
      end else begin
       KickerTesT.Version_Panel.Caption  := '---';
       KickerTesT.Revision_Panel.Caption := '---';
       KickerTest.CardClockPanel.Caption := '---';
      end;
      // ----- Resets  ------
      Kicker_PowerUpReset(done);
      if(done <> true) then messagebox(0,'PowerUp ist fehlgeschlagen !','Huch ?',16);
      Kicker_ReadCounterStrobes(mod_kicker_counter_1);
      Kicker_ReadCounterStrobes(mod_kicker_counter_2);
      Kicker_ReadCounterStrobes(mod_kicker_counter_3);
      Kicker_ReadCounterStrobes(mod_kicker_counter_4);
      Kicker_ReadCounterStrobes(mod_kicker_counter_5);
    end;
    KickerChooseIFKMBK.Close;
end;

procedure TKickerChooseIFKMBK.FormCreate(Sender: TObject);

begin
     //IFK
     KickerChooseIFKMBK.IFKCount_Panel.Caption := IntToStr(IFKCount);
     KickerChooseIFKMBK.IFKFound_ListBox.Items.Clear;
     KickerChooseIFKMBK.IFKFound_ListBox.Items  := IFKOnline;

     KickerChooseIFKMBK.IFKSelect_ComboBox.Items.Clear;
     KickerChooseIFKMBK.IFKSelect_ComboBox.Items     := IFKOnline;
     KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex := IFKOnlineIndex;

     //MBK
     KickerChooseIFKMBK.Panel4.Caption := IntToStr(MBKCount);
     KickerChooseIFKMBK.ListBox2.Items.Clear;
     KickerChooseIFKMBK.ListBox2.Items  := MBKOnline;

     KickerChooseIFKMBK.ComboBox2.Items.Clear;
     KickerChooseIFKMBK.ComboBox2.Items     := MBKOnlineNr;
     KickerChooseIFKMBK.ComboBox2.ItemIndex := MBKOnlineIndex;
end;


// UPDATE IFK
procedure TKickerChooseIFKMBK.Update_ButtonClick(Sender: TObject);

begin
    // Liste loeschen
    IFKOnline.Clear;

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

    KickerChooseIFKMBK.IFKFound_ListBox.Items.Clear;
    KickerChooseIFKMBK.IFKFound_ListBox.Items  := IFKOnline;
    KickerChooseIFKMBK.IFKCount_Panel.Caption  := IntToStr(IFKCount);

    KickerChooseIFKMBK.IFKSelect_ComboBox.Items.Clear;
    KickerChooseIFKMBK.IFKSelect_ComboBox.Items     := IFKOnline;
    KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex := 0;
    IFKOnlineIndex := 0;

    // Auswahl IFK aussuchen
    try
       IFKAdress := StrToInt('$'+ KickerChooseIFKMBK.IFKSelect_ComboBox.Text);
    except
       messagebox(0,'Keine IFK gefunden !','Warnung',16);
    end;
     KickerTesT.IFKUse_Panel.Caption:= IntToStr(IFKAdress);
  end;

// IFK select click !
procedure TKickerChooseIFKMBK.IFKSelect_ComboBoxChange(Sender: TObject);
begin
     IFKOnlineIndex := KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex;

     try
        IFKAdress := StrToInt('$'+ KickerChooseIFKMBK.IFKSelect_ComboBox.Text);
     except
        messagebox(0,'Ungültige IFK !','Warnung',16);
     end;

     KickerTesT.IFKUse_Panel.Caption:= IntToHex(IFKAdress,0);

end;

//UPDATE MBK
procedure TKickerChooseIFKMBK.Button3Click(Sender: TObject);

begin
    // Liste loeschen
    MBKOnline.Clear;
    MBKOnlineNr.Clear;

    // MBKs suchen
    MBKFound(MBKOnline, MBKOnlineNr, MBKCount);

    KickerChooseIFKMBK.ListBox2.Items.Clear;
    KickerChooseIFKMBK.ListBox2.Items  := MBKOnline;
    KickerChooseIFKMBK.Panel4.Caption  := IntToStr(MBKCount);

    KickerChooseIFKMBK.ComboBox2.Items.Clear;
    KickerChooseIFKMBK.ComboBox2.Items     := MBKOnlineNr;
    KickerChooseIFKMBK.ComboBox2.ItemIndex := 0;
    MBKOnlineIndex := 0;

    // Auswahl IFK aussuchen
    try
       MBKAdress := StrToInt('$'+ KickerChooseIFKMBK.ComboBox2.Text);
    except
       messagebox(0,'Keine MBK gefunden !','Warnung',16);
    end;
end;

// MBK select click !
end.
