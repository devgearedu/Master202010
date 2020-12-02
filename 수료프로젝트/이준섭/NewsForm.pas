unit NewsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCalendars;

type
  TfrmNews = class(TForm)
    CalendarView1: TCalendarView;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNews: TfrmNews;

implementation

{$R *.dfm}

procedure TfrmNews.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree
end;

end.
