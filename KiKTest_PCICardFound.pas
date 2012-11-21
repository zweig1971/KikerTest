unit KiKTest_PCICardFound;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TPCICardSelect = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    PCICardFound_Panel: TPanel;
    Label2: TLabel;
    PCICardUse_Panel: TPanel;
    PCICardChoose_ComboBox: TComboBox;
    OK_Button: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OK_ButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  PCICardSelect: TPCICardSelect;

implementation

uses UnitMil;

{$R *.DFM}

procedure TPCICardSelect.FormCreate(Sender: TObject);

var CardCounter: integer;
    i:integer;

begin
  // PCI Mil Karten zählen & anzeigen
  CardCounter := PCI_PCIcardCount();
  PCICardSelect.PCICardFound_Panel.Caption := IntToStr(CardCounter);

  // Welche karte nutzt man
  PCICardSelect.PCICardUse_Panel.Caption := IntToStr(Cardauswahl);

  for i := 1 to CardCounter do begin
      PCICardSelect.PCICardChoose_ComboBox.Items.Add(IntToStr(i));
  end;
end;

procedure TPCICardSelect.OK_ButtonClick(Sender: TObject);

var i:integer;
    ChoosePCICard:_WORD;
    status: _WORD;
    Error_Char:t_Error_Char;
    Error_string:string;


begin
  // Ausgewaehlte Karte uebernehmen
  ChoosePCICard := StrToInt(PCICardSelect.PCICardChoose_ComboBox.Text);

  // Karte versuchen zu öffnen
  status := PCI_DriverOpen(ChoosePCICard);
    if(status <> StatusOK) then begin
      PCI_ErrorString(status, Error_Char); // ausgabe bei fehlerfall
      for i := 1 to Length(Error_Char) do begin
          Error_string := Error_string + Error_Char[i];
      end;
      Application.MessageBox(PChar(Error_string), 'SHIT !', 16);
    end else begin
        if(Cardauswahl <> ChoosePCICard) then PCI_DriverClose(Cardauswahl);
        Cardauswahl := ChoosePCICard;
    end;
    PCICardSelect.Close;
end;

end.
