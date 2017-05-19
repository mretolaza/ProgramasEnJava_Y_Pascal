unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DateUtils, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
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

Procedure TForm1.Button1Click(Sender: TObject);
Var t1,t2 :TDatetime; num,cont,N:integer;  primo:boolean;
Begin
 T1:= Now;
     N := 0;
     Num := 2;
  Visible := False;
  Memo1.Lines.Clear;
  Repeat
       Primo:=True;
       Inc(Num);
       Cont:=2;
       While (Cont*Cont<=Num) And (Primo)  Do
       Begin
            Primo:= Num Mod Cont <> 0 ;
            Inc(Cont);
       End;
       IF Primo Then
       Begin
          Inc(N);
          Memo1.Lines.Add(IntTostr(N)+' '+IntToStr(Num));
       End;
      T2 := Now;
  Until millisecondsbetween(t1,t2) > 15000;
  Visible := True;
End;
End.

