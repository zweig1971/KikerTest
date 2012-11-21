program Project1;

uses
  Forms,
  KiKTest_MainUnit in 'KiKTest_MainUnit.pas' {KickerTesT},
  KIKTest_ChosseIFKMB in 'KIKTest_ChosseIFKMB.pas' {KickerChooseIFKMBK},
  modulbus in 'modulbus.pas',
  KiKTest_GlobalVariable in 'KiKTest_GlobalVariable.pas',
  UnitMil in 'PCIMilTreiber_DelphiUnits\UnitMil.pas',
  KikTest_GlobalFunc in 'KikTest_GlobalFunc.pas',
  KiKTest_Info in 'KiKTest_Info.pas' {KickerTest_Info},
  KiKTest_ShowLogFile in 'KiKTest_ShowLogFile.pas' {KiKShowLogFile},
  KiKTest_EchoTest in 'KiKTest_EchoTest.pas' {KickerEchoTest},
  KiKTest_PCICardFound in 'KiKTest_PCICardFound.pas' {PCICardSelect},
  KIKTest_TriggerMain in 'KIKTest_TriggerMain.pas' {TriGGerMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TKickerTesT, KickerTesT);
  Application.CreateForm(TKickerChooseIFKMBK, KickerChooseIFKMBK);
  Application.CreateForm(TKickerTest_Info, KickerTest_Info);
  Application.CreateForm(TKiKShowLogFile, KiKShowLogFile);
  Application.CreateForm(TKickerEchoTest, KickerEchoTest);
  Application.CreateForm(TPCICardSelect, PCICardSelect);
  Application.CreateForm(TTriGGerMain, TriGGerMain);
  Application.Run;
end.
