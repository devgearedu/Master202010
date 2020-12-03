{*******************************************************}
{           M3: ���� �����                           }
{                      - ���ؼ� (eggfried@gmail.com)    }
{*******************************************************}


unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.ActnMan, Vcl.CategoryButtons, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage;

type
  TFormMain = class(TForm)
    SplitViewMainTab: TSplitView;
    ActionManager1: TActionManager;
    PanelMainTop: TPanel;
    PanelCenter: TPanel;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    LabelTopCaption: TLabel;
    ImageMainMenuButton: TImage;
    ActionStandardCalcMainForm: TAction;
    ActionSplashFormOpen: TAction;
    procedure ImageMainMenuButtonClick(Sender: TObject);
    procedure ActionStandardCalcMainFormExecute(Sender: TObject);
    procedure StandardCalcMainFormOpen;
    procedure FormCreate(Sender: TObject);
    procedure ActionSplashFormOpenExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses StandardCalcMain, Splash;



{$R *.dfm}

procedure TFormMain.ActionSplashFormOpenExecute(Sender: TObject);
begin
  SplashForm := TSplashForm.create(Application);
  SplashForm.Show;

  SplitViewMainTab.Close;
end;

procedure TFormMain.ActionStandardCalcMainFormExecute(Sender: TObject);

begin
  SplitViewMainTab.Close;
  StandardCalcMainFormOpen;
  StandardCalcMainForm.SetFocus;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  StandardCalcMainFormOpen;

end;

procedure TFormMain.ImageMainMenuButtonClick(Sender: TObject);             //���ø�Ʈ �޴� �¿��� ��ư
begin
  SplitViewMainTab.Opened := not SplitViewMainTab.Opened;
end;

procedure TFormMain.StandardCalcMainFormOpen;
var
  I: Byte;

begin
  for I := 0 to Application.ComponentCount - 1 do                          //ǥ�� ���� �ߺ� ���� ��� ����
    if Application.Components[I] is TStandardCalcMainForm then exit;

  StandardCalcMainForm := TStandardCalcMainForm.Create(Application);
  StandardCalcMainForm.Show;
  StandardCalcMainForm.ManualDock(PanelCenter);

  StandardCalcMainForm.SetFocus;                                           //ǥ�� ������ Ű�е� �̿��� ���� Active�̵�
end;

end.
