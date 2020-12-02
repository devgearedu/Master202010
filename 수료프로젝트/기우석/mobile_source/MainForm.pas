unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, Data.DB, FMX.Edit,
  FMX.TabControl, uMobile_Client;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    btnMultiView: TSpeedButton;
    Panel1: TPanel;
    MultiView1: TMultiView;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle6: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Label2: TLabel;
    Label4: TLabel;
    DataSource1: TDataSource;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Label1: TLabel;
    TabItem3: TTabItem;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Rectangle3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cafeClass: TServerMethods1Client;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2, uMobileDM;



procedure TForm1.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(uMobileDM

  TabControl1.TabIndex := 0;
  TabControl1.Tabs[1].Enabled := False;
  TabControl1.Tabs[2].Enabled := False;
  btnMultiView.Enabled := False;

  // TabControl1.TabStop;
end;

end.
