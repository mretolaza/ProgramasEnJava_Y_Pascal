unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, pngimage, Grids;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Button1: TButton;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    StringGrid2: TStringGrid;
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure boton;
    Procedure WinPlaye(col: Integer; fil: Integer;J:Integer);
    Procedure WinO;
  end;

var
  Form2: TForm2;

  Nombre1,Nombre2:String;

  Player:Integer;

  Control1,Control2,Control3,Control4,Control5,Control6,Control7:Integer;
  MatrizR: Array[0..12,0..11] Of Integer;
  SP:   Array[1..7] Of Integer;
  Win:Boolean;


implementation

{$R *.dfm}


Procedure TForm2.boton;     //Boton de Inicio
Begin
  IF (Form2.CheckBox1.Checked=true) And (Form2.CheckBox2.Checked=true) Then
       Begin
         ShowMessage('Turn Off ' + Nombre1);
         Form2.SpeedButton1.Show;
         Form2.SpeedButton2.Show;
         Form2.SpeedButton3.Show;
         Form2.SpeedButton4.Show;
         Form2.SpeedButton5.Show;
         Form2.SpeedButton6.Show;
         Form2.SpeedButton7.Show;
       End;
End;

Procedure TForm2.WinO;
  Begin
  IF Win = True Then
     Begin

         Form2.SpeedButton1.Hide;
         Form2.SpeedButton2.Hide;
         Form2.SpeedButton3.Hide;
         Form2.SpeedButton4.Hide;
         Form2.SpeedButton5.Hide;
         Form2.SpeedButton6.Hide;
         Form2.SpeedButton7.Hide;
     End;

End;

//Evaluo en Matriz
Procedure TForm2.WinPlaye(Col:Integer;Fil:Integer;J:Integer);
Begin
Fil:=3; Inc(Col);
While(Fil<12) And (Win=False) Do
Begin
Col:=3;
  While(Col<11)  And( Win = False) Do
  Begin
    {Izquierda} IF (MatrizR[Col,Fil]*MatrizR[Col-1,Fil]*MatrizR[Col-2,Fil]*MatrizR[Col-3,Fil]=J*J*J*J)    Then
      Win:=True
    Else
     {Derecha}  IF (MatrizR[Col,Fil]*MatrizR[Col+1,Fil]*MatrizR[Col+2,Fil]*MatrizR[Col+3,Fil] =J*J*J*J)   Then
       Win:=True
    Else
    {Abajo}     IF (MatrizR[Col,Fil]*MatrizR[Col,Fil+1]*MatrizR[Col,Fil+2]*MatrizR[Col,Fil+3] = J*J*J*J)  Then
       Win:=True
    Else
    {Arriba} IF (MatrizR[Col,Fil]*MatrizR[Col,Fil-1]*MatrizR[Col,Fil-2]*MatrizR[Col,Fil-3] = J*J*J*J)     Then
       Win:=True
    Else {DiagonalArribaIzquieda}
             IF(MatrizR[Col,Fil]*MatrizR[Col-1,Fil-1]*MatrizR[Col-2,Fil-2]*MatrizR[Col-3,Fil-3]=J*J*J*J)  Then
       Win:=True
    Else {DiagonalArribaDerecha}
            IF (MatrizR[Col,Fil]*MatrizR[Col+1,Fil-1]*MatrizR[Col+2,Fil-2]*MatrizR[Col+3,Fil-3]=J*J*J*J)  Then
       Win:=True
    Else {DiagonalAbajoDerecha}
            IF (MatrizR[Col,Fil]*MatrizR[Col+1,Fil+1]*MatrizR[Col+2,Fil+2]*MatrizR[Col+3,Fil+3]=J*J*J*J)  Then
       Win:=True
    Else {DiagonalArribaIzquierda}
           IF (MatrizR[Col,Fil]*MatrizR[Col-1,Fil+1]*MatrizR[Col-2,Fil+2]*MatrizR[Col-3,Fil+3]=J*J*J*J)   Then
       Win:=True;
       Inc(Col);
    End;
  Inc(Fil);
End;
end;


procedure TForm2.SpeedButton1Click(Sender: TObject);

Var Fil,Fil1:Integer;

Begin

Fil:=8; Fil1:=Fil-Control1;

Inc(Player);  Inc(Control1);
IF Sp[1]>0 Then
Begin

IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85,Sp[1]*75,$F5F0FF,fssurface);
   Sp[1]:=Sp[1]-1;
   MatrizR[3,fil1]:=1;
   StringGrid2.Cells[3,fil1]:= IntToStr(MatrizR[3,fil1]);
   WinPlaye(1,Fil1,1);
        //Ganador
   IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;

  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85,Sp[1]*75,$F5F0FF,fssurface);
   Sp[1]:=Sp[1]-1;
   MatrizR[3,fil1]:=2;
   StringGrid2.Cells[3,fil1]:= IntToStr(MatrizR[3,fil1]);
   WinPlaye(1,Fil1,2);
       //Ganador
   IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;

End Else
SpeedButton1.Hide;

end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
Var Fil,Fil1:Integer;
begin

Fil:=8; Fil1:=Fil-Control2;

Inc(Player); Inc(Control2);

IF Sp[2]>0 Then
Begin
IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85*2,Sp[2]*75,$F5F0FF,fssurface);
   Sp[2]:=Sp[2]-1;
   MatrizR[4,fil1]:=1;
   StringGrid2.Cells[4,fil1]:= IntToStr(MatrizR[4,fil1]);
   WinPlaye(2,Fil1,1);

       //Ganador
   IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;

  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85*2,Sp[2]*75,$F5F0FF,fssurface);
   Sp[2]:=Sp[2]-1;
   MatrizR[4,fil1]:=2;
   StringGrid2.Cells[4,fil1]:= IntToStr(MatrizR[4,fil1]);
   WinPlaye(2,Fil1,2);

       //Ganador
   IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;
End Else
SpeedButton2.Hide;


end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
Var Fil,Fil1:Integer;

Begin

Fil:=8; Fil1:=Fil-Control3;

Inc(Player);  Inc(Control3);
IF Sp[3]>0 Then
Begin

IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85*3,Sp[3]*75,$F5F0FF,fssurface);
   Sp[3]:=Sp[3]-1;
   MatrizR[5,fil1]:=1;
   StringGrid2.Cells[5,fil1]:= IntToStr(MatrizR[5,fil1]);
   WinPlaye(3,Fil1,1);

     //Ganador
   IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;

  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85*3,Sp[3]*75,$F5F0FF,fssurface);
   Sp[3]:=Sp[3]-1;
   MatrizR[5,fil1]:=2;
   StringGrid2.Cells[5,fil1]:= IntToStr(MatrizR[5,fil1]);
   WinPlaye(3,Fil1,2);
         //Ganador
    IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;

End Else
SpeedButton3.Hide;

end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
Var Fil,Fil1:Integer;

Begin

Fil:=8; Fil1:=Fil-Control4;

Inc(Player);  Inc(Control4);
IF Sp[4]>0 Then
Begin

IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85*4,Sp[4]*75,$F5F0FF,fssurface);
   Sp[4]:=Sp[4]-1;
   MatrizR[6,fil1]:=1;
   StringGrid2.Cells[6,fil1]:= IntToStr(MatrizR[6,fil1]);
   WinPlaye(4,Fil1,1);
               //Ganador
     IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;
  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85*4,Sp[4]*75,$F5F0FF,fssurface);
   Sp[4]:=Sp[4]-1;
   MatrizR[6,fil1]:=2;
   StringGrid2.Cells[6,fil1]:= IntToStr(MatrizR[6,fil1]);
   WinPlaye(4,Fil1,2);
             //Ganador
     IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;

End Else
SpeedButton4.Hide;

end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
Var Fil,Fil1:Integer;

Begin

Fil:=8; Fil1:=Fil-Control5;

Inc(Player);  Inc(Control5);

IF Sp[5]>0 Then
Begin

IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85*5,Sp[5]*75,$F5F0FF,fssurface);
   Sp[5]:=Sp[5]-1;
   MatrizR[7,fil1]:=1;
   StringGrid2.Cells[7,fil1]:= IntToStr(MatrizR[7,fil1]);
   WinPlaye(5,Fil1,1);
   //Ganador
     IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;
  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85*5,Sp[5]*75,$F5F0FF,fssurface);
   Sp[5]:=Sp[5]-1;
   MatrizR[7,fil1]:=2;
   StringGrid2.Cells[7,fil1]:= IntToStr(MatrizR[7,fil1]);
   WinPlaye(5,Fil1,2);
    IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;

End Else
SpeedButton5.Hide;

end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
Var Fil,Fil1:Integer;

Begin

Fil:=8; Fil1:=Fil-Control6;

Inc(Player);  Inc(Control6);

IF Sp[6]>0 Then
Begin

IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85*6,Sp[6]*75,$F5F0FF,fssurface);
   Sp[6]:=Sp[6]-1;
   MatrizR[8,fil1]:=1;
   StringGrid2.Cells[8,fil1]:= IntToStr(MatrizR[8,fil1]);
   WinPlaye(6,Fil1,1);

      // Ganador
    IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;

  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85*6,Sp[6]*75,$F5F0FF,fssurface);
   Sp[6]:=Sp[6]-1;
   MatrizR[8,fil1]:=2;
   StringGrid2.Cells[8,fil1]:= IntToStr(MatrizR[8,fil1]);
   WinPlaye(6,Fil1,2);
           //Ganador
     IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;
End Else
SpeedButton6.Hide;

end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
  Var Fil,Fil1:Integer;
Begin
Fil:=8; Fil1:=Fil-Control7;
Inc(Player);  Inc(Control7);

IF Sp[7]>0 Then
Begin

IF odd(Player) then
  Begin
   Image1.Canvas.Brush.Color:=$9314FF;  //Rosado   Jugador 1
   Image1.Canvas.FloodFill(85*7,Sp[7]*75,$F5F0FF,fssurface);
   Sp[7]:=Sp[7]-1;
   MatrizR[9,fil1]:=1;
   StringGrid2.Cells[9,fil1]:= IntToStr(MatrizR[9,fil1]);
   WinPlaye(7,Fil1,1);
             //Ganador
       IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre1);
       WinO;
     End;

  End Else Begin
   Image1.Canvas.Brush.Color:=$8B008B;  //lila   Jugador 2
   Image1.Canvas.FloodFill(85*7,Sp[7]*75,$F5F0FF,fssurface);
   Sp[7]:=Sp[7]-1;
   MatrizR[9,fil1]:=2;
   StringGrid2.Cells[9,fil1]:= IntToStr(MatrizR[9,fil1]);
   WinPlaye(7,Fil1,2);
               //Ganador
      IF Win=True Then
     Begin
       ShowMessage('The Winner It�s : ' + Nombre2);
       WinO;
     End;
  End;

End Else
SpeedButton7.Hide;

end;

procedure TForm2.Button1Click(Sender: TObject);
Var i,j,co,fi:Integer;
Begin
Win:=False;
Control1:=0;  Control2:=0; Control3:=0; Control4:=0;
Control5:=0;  Control6:=0; Control7:=0;
LabeledEdit1.Text:=''; LabeledEdit2.Text:='';
Label1.Caption:=''; Label2.Caption:='';
CheckBox1.Checked:=False; CheckBox2.Checked:=False;

//Lenado de Matriz

For Co := 0 to 12 do
  For Fi := 0 to 11 do
    Begin
     StringGrid2.Cells[Co,Fi]:= '0';
     MatrizR[Co,Fi]:=0;
    End;

For i := 1 To 7 Do
  Begin
    SP[i]:=6;
    End;

    Player:= 0;
    Inc(Player);

 // Dibujado Del Tablero

Image1.Canvas.Pen.Width:=2;
Image1.Canvas.Brush.Color:= $E6E0B0;
Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
Image1.Canvas.Pen.Color:= $C1B6FF;
Image1.Canvas.Pen.Width:=4;
Image1.Canvas.MoveTo(60,0);

 FOR i := 1 To 7 Do
    FOR j := 1 To 6 Do
    Begin
      Image1.Canvas.Pen.Width:=1;
      Image1.Canvas.Brush.Color:=$F5F0FF;
      Image1.Canvas.Ellipse(i*85+35,j*75+35,i*85-35,j*75-35);   //Dibujando los circulos del tablero
      Image1.Canvas.Pen.Width:=2;
      Image1.Canvas.Pen.Color:= $C1B6FF;
      Image1.Canvas.MoveTo(i*85-45,0);           //Lineas de en medio
      Image1.Canvas.LineTo(i*85-45,Image1.Height);
    End;
     Image1.Canvas.MoveTo(7*85+45,0);                 //Dibujando las l�neas del tablero.
     Image1.Canvas.LineTo(7*85+45,Image1.Height);
end;

Procedure TForm2.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
IF CheckBox1.Checked  then
   Label1.Caption:=Nombre1;
boton;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
IF CheckBox2.Checked  then
  Label2.Caption:=Nombre2;
boton;
end;

procedure TForm2.FormCreate(Sender: TObject);

 Var i, j, Co,Fi:integer;
Begin
Win:=False;   //inicializaci�n de Variables.

Control1:=0;Control2:=0;Control3:=0;
Control4:=0;Control5:=0;Control6:=0;
Control7:=0;

//Lenado de Matriz

For Co := 0 to 12 do
  For Fi := 0 to 11 do
    Begin
     StringGrid2.Cells[Co,Fi]:= '0';
     MatrizR[co,Fi]:= 0;
    End;

For i := 1 To 7 Do
  Begin
    SP[i]:=6;
    End;

    Player:= 0;
    Inc(Player);

  // Dibujado Del Tablero

Image1.Canvas.Pen.Width:=2;
Image1.Canvas.Brush.Color:= $E6E0B0;
Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
Image1.Canvas.Pen.Color:= $C1B6FF;
Image1.Canvas.Pen.Width:=4;
Image1.Canvas.MoveTo(60,0);

 FOR i := 1 To 7 Do
    FOR j := 1 To 6 Do
    Begin
      Image1.Canvas.Pen.Width:=1;
      Image1.Canvas.Brush.Color:=$F5F0FF;
      Image1.Canvas.Ellipse(i*85+35,j*75+35,i*85-35,j*75-35);   //Dibujando los circulos del tablero
      Image1.Canvas.Pen.Width:=2;
      Image1.Canvas.Pen.Color:= $C1B6FF;
      Image1.Canvas.MoveTo(i*85-45,0);           //Lineas de en medio
      Image1.Canvas.LineTo(i*85-45,Image1.Height);
    End;
     Image1.Canvas.MoveTo(7*85+45,0);                 //Dibujando las l�neas del tablero.
     Image1.Canvas.LineTo(7*85+45,Image1.Height);
end;

procedure TForm2.LabeledEdit1Change(Sender: TObject);
begin
IF LabeledEdit1.Text='8' Then

  ShowMessage('Press Ok');
  Nombre1:=(LabeledEdit1.Text);
end;

procedure TForm2.LabeledEdit2Change(Sender: TObject);
begin
IF LabeledEdit2.Text='8' then
   ShowMessage('Press Ok');
   Nombre2:=LabeledEdit2.Text;
end;

end.
