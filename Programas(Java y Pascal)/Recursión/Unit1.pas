unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Function Fibo(N:Integer):Integer;
Begin
 IF N = 1  Then
    Fibo:=0
   Else
 IF N = 2  Then
    Fibo:=1
   Else
 IF N > 2  Then
   Fibo:=Fibo(N-1) + Fibo(N-2);
End;

Function Fact(N:Integer): Integer;
Begin
  IF N = 0 Then
    Fact:=1
    Else
  IF N > 0 Then
   Begin
     Fact:=N*Fact(N-1)
   End Else
   ShowMessage('Únicamente Números  mayores a 0');
End;

procedure TForm1.Button1Click(Sender: TObject);
begin
Edit2.Text:=IntToStr(Fibo(StrToInt(Edit1.Text)));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Edit2.Text:=IntToStr(Fact(StrToInt(Edit1.Text)));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
end;

end.
