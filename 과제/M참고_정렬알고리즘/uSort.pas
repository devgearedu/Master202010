unit uSort;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSort = class(TForm)
    btnStart: TButton;
    BubbleSort_ListBox: TListBox;
    SelectionSort_ListBox: TListBox;
    Result_ListBox: TListBox;
    lblBubbleSort: TLabel;
    lblSelectionSort: TLabel;
    lblResult: TLabel;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RandomizeArrays;
  private
    { Private declarations }
    ThreadsRunning: Integer;
    procedure ThreadDone(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmSort: TfrmSort;

implementation

uses uSortThread;

{$R *.dfm}

{ TForm1 }

type
  PSortArray = ^TSortArray;
  TSortArray = array[0..199] of Integer;

var
  ArraysRandom: Boolean;
  BubbleSortArray, SelectionSortArray: TSortArray;


procedure TfrmSort.RandomizeArrays;
var
  I: Integer;
begin
  if not ArraysRandom then
  begin
    Randomize;
    for I := Low(BubbleSortArray) to High(BubbleSortArray) do
      BubbleSortArray[I] := Random(200);
    SelectionSortArray := BubbleSortArray;
    ArraysRandom := True;
  end;
end;

procedure TfrmSort.FormCreate(Sender: TObject);
var
  I: byte;
begin
  RandomizeArrays;
  Result_ListBox.Clear;
  BubbleSort_ListBox.Items.Clear;
  SelectionSort_ListBox.Items.Clear;

  for I := 0 to 199 do
  begin
    BubbleSort_ListBox.Items.Add(IntToStr(BubbleSortArray[I]));
    SelectionSort_ListBox.Items.Add(IntToStr(SelectionSortArray[I]));
  end;
end;

procedure TfrmSort.btnStartClick(Sender: TObject);
begin
  RandomizeArrays;
  Result_ListBox.Clear;
  ThreadsRunning := 3;
  with TBubbleSort.Create(BubbleSort_ListBox, Result_ListBox, BubbleSortArray) do
    OnTerminate := ThreadDone;

  with TSelectionSort.Create(SelectionSort_ListBox, Result_ListBox, SelectionSortArray) do
    OnTerminate := ThreadDone;
end;

procedure TfrmSort.ThreadDone(Sender: TObject);
//var
//  i: byte;
begin
  Dec(ThreadsRunning);
  if ThreadsRunning = 0 then
  begin
    btnStart.Enabled := True;
    ArraysRandom := False;
  end;
end;

end.
