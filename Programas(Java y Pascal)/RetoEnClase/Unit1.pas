unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Procedure Reto1(De,Hasta:Integer);
Begin
  IF De <= Hasta  Then
  Begin
    Reto1(De+1,Hasta);
    Form1.Memo1.Lines.Add(IntToStr(De));
  End;
End;

Function Xn(X:Real;N:Integer):Real;
Begin
 IF N = 0  Then
    Xn:=1
 Else Begin
 IF N MOD 2 = 0 Then
   Xn:=Sqr(Xn(X,(N Div 2)))
   Else Begin
 IF Odd(N) Then
    Xn:=Sqr(Xn(X,(N Div 2)))*X;
      End;
 End; End;


procedure TForm1.Button1Click(Sender: TObject);
Var N:Integer;
begin
N:=StrToInt(Edit1.Text);
Reto1(1,N);
end;

procedure TForm1.Button2Click(Sender: TObject);
Var X,N:Integer;

Begin
X:=StrToInt(Edit1.Text);
N:=StrToInt(Edit2.Text);
Edit3.Text:=FloatToStr(Xn(X,N));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.Clear;
Edit1.Text:='';
end;

end.
