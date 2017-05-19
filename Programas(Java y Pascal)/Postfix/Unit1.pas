unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Math, ExtCtrls;



  Type

  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Label1: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  Private

  Public

  end;

  Type

  TPOSTFIX = Class

  Private

    OP:String; //Operandos  Operaci�n en Postfix    si es una variable se pasan al resultado
    Num:Array[1..1000] Of Double; //N�meros formato listo para operar.

  Public
     Error: String; // Funci�n de Control
     Constructor Create(Exp:String); //Expreci�n en InFix
     Function Eval(x,y,z :Double) : Double;

  End;


var
  Form1: TForm1;
  LimIx,LimIy,LimSx,LimSY,Paso,X,Y:Real;
  F:TPostFix;
  N:Double;
  i,vc:Integer;
  Ts:Boolean;
  T:string;// tomar n�mero solamente.

implementation

Constructor TPOSTFIX.Create(Exp:String);

   Var
   Stack : Array [1..1000] Of Char;
   Sp:Integer;

//Implementar un stack Con todas sus funciones.

Procedure MakeNull;
Begin
  Sp:=0;
End;

Procedure Push ( E:Char);
Begin
    IF Sp < 1000 Then
    Begin
    Sp:=Sp+1;
    Stack[SP]:=E;
    End Else
    //ShowMessage('Stack Overflow');
End;

Function Pop :Char;
Begin
  IF   Sp > 0   Then
   Begin
    Pop:=Stack[SP];
    Sp:=Sp-1;
   End Else
    //ShowMessage('Stack UnderFlow');
End;

Function Tops:Char;
Begin
IF SP > 0  Then
Begin
   Tops:=stack[sp]
End Else
 //ShowMessage ('Stacks Underflow');
End;

Function Jerarc(C:Char): Integer; //Funcion De Jerarqu�a  devuelve los n�meros 0,1,2,3,4;
Begin
    //Jerarc:=Pos(C,'(+-*/^~') Div 2;
  Case c of
  '(': Jerarc:=0;
  '+','-': Jerarc:=1;
  '*','/': Jerarc:=2;
  '~': Jerarc:=2;
  '^': Jerarc:=3;
  's','c','t','g','h','j': Jerarc:=2;
  end;
End;

Function Empty : Boolean;
 Begin
    Empty:=Sp=0;
 End;

Procedure Signo(s:Char); {Car�cter que es el signo}
Begin
  while (Not Empty ) And (Jerarc(Tops)>=Jerarc(s)) Do
  Begin
     Op:=Op+Pop;
  End;
  Push(s);
End;

Begin
   MakeNull;
   i:=1;
   OP:='';
   Ts:=False; {Tocar Signo}
   Error:=''; //Mi Bandera de error
   Exp:=Uppercase(Exp); //Comenzar mi Ciclo
   //showmessage(exp);
   While (Error ='') And (i <length(Exp)+1 )  Do
   Begin
      Case Exp[i] Of
       'X','Y','Z':
         Begin
          IF Ts  Then Signo('*');
           OP:=OP + Exp[i];
           Inc(I);
           TS:=True;
          End;

          '+','-','*','/','^':
            Begin
            IF (Not Ts) Then
              IF Exp[i] = '-' Then  {Unario = Menos  }
                 Signo('~')
              ELSE
               Error:='Revise su Signos en Posici�n' + IntToStr(i)
            ELSE
            Signo(Exp[i]);
            Inc(i);
            TS:=False;
            End;

           ' ': Begin
                Inc(i); // Espacio en blanco
                End;

           '0'..'9': Begin
                        T:=Copy(Exp,I,Length(Exp));
                        VAL(T,N,VC);
                        IF VC <> 0 Then
                         Begin
                           T:=Copy(T,1,VC-1);
                           I:=I+VC-1;
                           VAL(T,N,VC);
                         End
                         Else
                           I:=Length(Exp)+1;
                           OP:=OP + '#';
                           Num[Length(OP)]:= N;
                           Ts:=true;
                         End;
           '(' : Begin
                  PUSH('('); Inc(I);
                 End;
            ')' :Begin
                  While (NOT Empty ) And (Tops <> '(') Do     //Validar SI nunca mete un patentesis xD jaajaj
                    OP:=OP + Pop;
                    Pop; Inc(I);
                   End;
          Else
          Begin
          Error:= 'ERROR En la posici�n' +IntToStr(i);
          End;

         End;
      End;

 While NOT Empty  Do
     OP:= OP +  Pop;
     //showmessage(op);
 End;

Function TPostFix.Eval(X,Y,Z: Double):Double;

  Var Stack: Array [1..20] Of Double;
      Sp,I:Integer;  a,b:Double;

Procedure Push(D:Double);
Begin
IF Sp<20 then
Begin
  Sp:=Sp+1;
  Stack[Sp]:=D;
End;
End;

Function Pop:Double;
Begin
 IF   Sp > 0   Then
   Begin
    Pop:=Stack[SP];
    Sp:=Sp-1;
   End Else
End;

Begin
Error:='';
sp := 0;
For i  := 1 to Length(OP) Do
 Case OP[i] Of
  '#':Push(Num[i]);
  'X':Push (x);
  'Y':Push (y);
  'Z':Push (z);
  '+':Push (Pop+Pop);
  '-':Push (-Pop+Pop);
  '*':Push (Pop*Pop);
  '/': Begin
   B:=Pop;
   A:=Pop;
    IF B=0 Then
      Error:='Divici�n con cero,Math error jiji'
      Else
       Push(a/b);
        End;
    '^' : Begin
        B:=Pop;
        A:=Pop;
        //Validar el dominio del power
          Push(Power(A,B));
          //Push(exp(b*ln(a)));
          End;
    '~' : Push(-Pop);
end;
Eval:=Pop;
End;

Function xp(x:real):integer;
Begin
	Xp:=trunc(Form1.image1.width*(x-LimIx)/(LimSx-LimIx))
End;

Function yp(y:real):integer;
Begin
	Yp:=Trunc(Form1.image1.height*(LimSY-y)/(LimSy-LimIy))
End;

Function F2(X:Real):Real;
Begin
F2:=F.Eval(X,0,0);
End;

{$R *.dfm}

Procedure TForm1.Button1Click(Sender: TObject);
Begin

F:=Tpostfix.Create(edit1.Text);
//showmessage(floattostr(f.eval(0,0,0)));
Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
//Image1.Canvas.Brush.Color:= $F0FAFF;

Paso:=(LimSx-LimIx)/100;
X:=LimIx; Y:=F2(x);

LimIy:=LimIx;
LimSy:=LimSX;

{While x<LimSx do
Begin
	    x:=x+paso;
      Y:=F2(x);
   IF y<LimIy Then
		  LimIy:=y;
   IF y>LimSy Then
      LimSy:=y;
End;  }

X:=LimIx;Y:=f.Eval(x,0,0);
Image1.Canvas.Pen.Color:=clpurple;
Image1.canvas.moveto(0,yp(0));
Image1.canvas.lineto(Image1.Width,yp(0));
Image1.canvas.moveto(xp(0),0);
Image1.canvas.lineto(xp(0),Image1.Height);
Image1.canvas.moveto(xp(x),yp(y));

While x<LimSx do

	Begin
		x:=x+paso;
		y:=f.Eval(x,0,0);
    Image1.Canvas.Pen.Color:=$1E69D2;
		Image1.canvas.lineto(xp(x),yp(y));
	End;
End;



procedure TForm1.Button2Click(Sender: TObject);
Var Control1,Control2,Control3,Control4:Integer;


Begin

IF (LabeledEdit1.Text='') Or (LabeledEdit2.Text='') Then
    ShowMessage('Alguno de los valores no ha sido ingresado')

    Else

    Val(LabeledEdit1.Text,LimIx,Control1);
    Val(LabeledEdit2.Text,LimSx,Control2);

IF(Control1<>0) Or (Control2<>0) Then
    ShowMessage('ERROR, Alguno de los valores ha sido mal ingresado')

    Else Begin
    Button1.Enabled:=True;
    End;
end;

end.
