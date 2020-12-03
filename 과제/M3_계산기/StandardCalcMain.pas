{*******************************************************}
{           M3: 계산기 만들기                           }
{                      - 이준섭 (eggfried@gmail.com)    }
{*******************************************************}


unit StandardCalcMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TStandardCalcMainForm = class(TForm)
    Panel1: TPanel;
    ButtonDot: TButton;
    Button0: TButton;
    ButtonEqual: TButton;
    ButtonPlus: TButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    ButtonMinus: TButton;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    ButtonMult: TButton;
    Button9: TButton;
    Button8: TButton;
    Button7: TButton;
    ButtonDiv: TButton;
    ButtonBackSpace: TButton;
    ButtonClean: TButton;
    ButtonReset: TButton;
    LabelCalcProcess: TLabel;
    MemoValueList: TMemo;
    LabelStandardCalcNumber: TLabel;
    Image1: TImage;
    procedure ButtonResetClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure ButtonCleanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);

    procedure NumberOperation(InputValue: string);
    procedure ButtonPlusClick(Sender: TObject);
    procedure SpcOperation(InputValue: string);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonEqualClick(Sender: TObject);
    procedure ButtonMultClick(Sender: TObject);
    procedure ButtonDivClick(Sender: TObject);
    procedure ButtonBackSpaceClick(Sender: TObject);
    procedure NumberBackSpace;
    procedure ButtonDotClick(Sender: TObject);
    procedure NumberDot;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StandardCalcMainForm: TStandardCalcMainForm;

implementation
var
  InputKeyValue: string;
  OperationValue1: Double;
  OperationValue2: Double;
  OperationValue3: Double;
  OperationSpc: Byte;                                                           //등호 저장
  Operation1stSwitch: Boolean = True;
{$R *.dfm}



procedure TStandardCalcMainForm.Button0Click(Sender: TObject);
begin
  NumberOperation('0');
end;

procedure TStandardCalcMainForm.Button1Click(Sender: TObject);
begin
  NumberOperation('1');
end;

procedure TStandardCalcMainForm.Button2Click(Sender: TObject);
begin
  NumberOperation('2');
end;

procedure TStandardCalcMainForm.Button3Click(Sender: TObject);
begin
  NumberOperation('3');
end;

procedure TStandardCalcMainForm.Button4Click(Sender: TObject);
begin
  NumberOperation('4');
end;

procedure TStandardCalcMainForm.Button5Click(Sender: TObject);
begin
  NumberOperation('5');
end;

procedure TStandardCalcMainForm.Button6Click(Sender: TObject);
begin
  NumberOperation('6');
end;

procedure TStandardCalcMainForm.Button7Click(Sender: TObject);
begin
  NumberOperation('7');
end;

procedure TStandardCalcMainForm.Button8Click(Sender: TObject);
begin
  NumberOperation('8');
end;

procedure TStandardCalcMainForm.Button9Click(Sender: TObject);
begin
  NumberOperation('9');
end;

procedure TStandardCalcMainForm.ButtonBackSpaceClick(Sender: TObject);
begin
  NumberBackSpace;                                                      //백스페이스
end;

procedure TStandardCalcMainForm.ButtonCleanClick(Sender: TObject);         //Clean버튼 액정 숫자 초기화
begin
   LabelStandardCalcNumber.Caption := '0';
   InputKeyValue := '';
   LabelCalcProcess.Caption := '';
   OperationValue1 := 0;
   OperationValue2 := 0;
   Operation1stSwitch := True;
end;

procedure TStandardCalcMainForm.ButtonDivClick(Sender: TObject);
begin
  SpcOperation('/');
end;

procedure TStandardCalcMainForm.ButtonDotClick(Sender: TObject);
begin
  NumberDot;
end;

procedure TStandardCalcMainForm.ButtonEqualClick(Sender: TObject);
begin
  SpcOperation('=');
end;

procedure TStandardCalcMainForm.ButtonMinusClick(Sender: TObject);
begin
  SpcOperation('-');
end;

procedure TStandardCalcMainForm.ButtonMultClick(Sender: TObject);
begin
  SpcOperation('*');
end;

procedure TStandardCalcMainForm.ButtonPlusClick(Sender: TObject);
begin
  SpcOperation('+');
end;

procedure TStandardCalcMainForm.ButtonResetClick(Sender: TObject);
begin
  MemoValueList.Clear;
end;

procedure TStandardCalcMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;                                                         //메모리 회수
end;

procedure TStandardCalcMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    96: button0click(self);                                                 //Numpad 0 ~ 9
    97: button1click(self);
    98: button2click(self);
    99: button3click(self);
    100: button4click(self);
    101: button5click(self);
    102: button6click(self);
    103: button7click(self);
    104: button8click(self);
    105: button9click(self);

    48: button0click(self);                                                     //0 ~ 9
    49: button1click(self);
    50: button2click(self);
    51: button3click(self);
    52: button4click(self);
    53: button5click(self);
    54: button6click(self);
    55: button7click(self);
    56: button8click(self);
    57: button9click(self);

    107: ButtonPlusClick(self);                                                 //+
    109: ButtonMinusClick(self);                                                //-
    106: ButtonMultClick(self);
    111: ButtonDivClick(self);

    13: ButtonEqualClick(self);                                                 //=, enter
    8: ButtonBackSpaceClick(self);
    110: ButtonDotClick(self);                                                  //.
  end;


end;


procedure TStandardCalcMainForm.NumberBackSpace;                                //백스페이스
begin
  if InputKeyValue.Length > 1  then
    InputKeyValue := Copy(InputKeyValue, 1, InputKeyValue.Length - 1)
  else
    InputKeyValue := '0';

  LabelStandardCalcNumber.Caption := FormatFloat(',0.#####', strtofloat(InputKeyValue));
end;

procedure TStandardCalcMainForm.NumberDot;
begin
  try
    InputKeyValue := InputKeyValue + '.';
    LabelStandardCalcNumber.Caption := FormatFloat(',0.#####', strtofloat(InputKeyValue));
  except
    ButtonCleanClick(self);
    ShowMessage('소수점 중복 사용으로 초기화 되었습니다.');
  end;

end;

procedure TStandardCalcMainForm.NumberOperation(InputValue: string);            //단순 숫자 입력
begin
  InputKeyValue := InputKeyValue + InputValue;
  LabelStandardCalcNumber.Caption := FormatFloat(',0.#####', strtofloat(InputKeyValue));
end;

procedure TStandardCalcMainForm.SpcOperation(InputValue: string);               //연산자 입력시 처리
begin
  LabelCalcProcess.Caption := LabelCalcProcess.Caption + ' ' + InputKeyValue +
    ' ' + InputValue;


  try
    if Operation1stSwitch then                                                    //첫 루틴
    begin
      OperationValue1 := strtofloat(InputKeyValue);                               //현재 입력되어 있는 숫자
      Operation1stSwitch := False;
      InputKeyValue := '';
    end
    else
    begin
      OperationValue2 := strtofloat(InputKeyValue);                               //첫 루틴 이후 도는 루틴

      case OperationSpc of
        0 : OperationValue1 := OperationValue1 + OperationValue2;
        1 : OperationValue1 := OperationValue1 - OperationValue2;
        2 : OperationValue1 := OperationValue1 * OperationValue2;
        3 : OperationValue1 := OperationValue1 / OperationValue2;
        4 : begin
              MemoValueList.Lines.Add(FloatToStr(OperationValue1));
              ButtonCleanClick(self);
            end;
      end;

      InputKeyValue := '';
    end;

    if InputValue = '+' then OperationSpc := 0;                                   //등호들 저장
    if InputValue = '-' then OperationSpc := 1;
    if InputValue = '*' then OperationSpc := 2;
    if InputValue = '/' then OperationSpc := 3;
    if InputValue = '=' then OperationSpc := 4;

    LabelStandardCalcNumber.Caption := FormatFloat(',0.#####', OperationValue1);  //결과 값 출력
  except
    ShowMessage('부호를 연속으로 사용하지 마세요');
  end;




end;

end.
