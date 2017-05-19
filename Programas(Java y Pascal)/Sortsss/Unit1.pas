unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    StringGrid2: TStringGrid;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Label5: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

   V1: Array [1..1000000] Of Integer;
   VR: Array [1..1000000] Of Integer;

  NumCas:Integer;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

Var Control ,T,i,J :Integer;

Begin

Val (Edit1.Text,NumCas,Control);
Randomize;
 IF Control <> 0 Then
    ShowMessage('ERROR')
     Else Begin
      IF NumCas<0 Then
         ShowMessage('Unicamente Valores Mayores a 0')
          Else Begin
          StringGrid1.Visible:=True; T:=0; Begin
          StringGrid1.ColCount:=NumCas;
           For I := 0 To NumCas Do Begin
              T := Random(999)+1;
               V1[I]:=T;
               StringGrid1.Cells[I,0]:=IntToStr(T);


End; End; End; End;
 SpeedButton1.Enabled:=True;
 SpeedButton2.Enabled:=True;
 SpeedButton3.Enabled:=True;
end;


Procedure TForm1.Edit1Change(Sender: TObject);
begin
if Edit1.Text <> ''  Then
Begin
  SpeedButton1.Show;
  SpeedButton2.Show;
  SpeedButton3.Show;
  Button1.Show;
  Memo2.Show;
  Memo1.Show
End Else
ShowMessage('Ingrese un valor');
 SpeedButton1.Enabled:=False;
 SpeedButton2.Enabled:=False;
 SpeedButton3.Enabled:=False;


end;

procedure TForm1.SpeedButton1Click(Sender: TObject);

  Var Cont,I,J:Integer;

    //Variables del tiempo xD
 hh,mm,ss,ms:word;
 hh1,mm1,ss1,ms1:word;
 hht,mmt,sst,mst:real;

Begin
 decodetime(now,hh,mm,ss,ms);
 For I := 0 To NumCas-1  Do
  Begin
   Cont:=0;
    For J := 0 To NumCas-1  Do
     Begin
       IF (V1[J] < V1[i]) Or ((V1[j] = V1[i]) And (I>J)) Then   {Revisar cuantos menores hay}
           Inc(Cont);
        End;
        VR[Cont]:= V1[i];
   End;
    For I := 0 To NumCas-1 Do
     Begin
       StringGrid2.Cells[I,0]:=IntToStr(VR[i]);
     End;

   Stringgrid2.ColCount:=StringGrid1.ColCount;
   StringGrid2.Show; Label2.Show; Label6.Hide;

 DecodeTime(now,hh1,mm1,ss1,ms1);
 hht:=hh1-hh;
 mmt:=mm1-mm;
 sst:=ss1-ss;
 mst:= (hht*3600) + (mmt*60) + sst + (ms1/1000) - (ms/1000);
 Label5.Caption:= FloatToStr(mst) + ' seg';
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
       Var Num,ma,i,pos:Integer;  t:String;

 hh,mm,ss,ms:word;
 hh1,mm1,ss1,ms1:word;
 hht,mmt,sst,mst:real;
Begin

//Sort de burbuja :)

Num:=stringgrid1.ColCount;
decodetime(now,hh,mm,ss,ms);
  Repeat

    Pos:=0;
    Ma:=StrToInt(StringGrid1.Cells[0,0]);   {Sup peque�o}
    For i := 1 To Num-1 Do
    Begin
      IF StrToInt(StringGrid1.Cells[i,0])>Ma Then
      Begin
        Ma:=strtoint(stringgrid1.cells[i,0]);
        Pos:=i; {pos num + gr}
    End;
    end;
    Num:=Num-1;
    T:=StringGrid1.Cells[pos,0];
    StringGrid1.Cells[Pos,0]:=StringGrid1.Cells[Num,0];
    StringGrid1.cells[Num,0]:=t;
    StringGrid2.Hide; Label2.Hide; Label6.Show;
  until Num=1;

 DecodeTime(now,hh1,mm1,ss1,ms1);
 hht:=hh1-hh;
 mmt:=mm1-mm;
 sst:=ss1-ss;
 mst:= (hht*3600) + (mmt*60) + sst + (ms1/1000) - (ms/1000);
 Label5.Caption:= FloatToStr(mst) + ' seg';



end;

procedure TForm1.SpeedButton3Click(Sender: TObject);

Var I, J,  T :Integer;

 //Variables del tiempo xD
 hh,mm,ss,ms:word;
 hh1,mm1,ss1,ms1:word;
 hht,mmt,sst,mst:real;

Begin
decodetime(now,hh,mm,ss,ms);
StringGrid2.Show; Label2.Show; Label6.Hide;
 // Sort de Inserci�n

 StringGrid2.ColCount:= NumCas;

 For i := 1 To (NumCas-1) Do
  Begin
   J:=I;
   While ((J>0) And (V1[J] < V1[J-1])) Do
    Begin
       T:= V1[j];
        V1[j]:=V1[J-1];
         V1[J-1]:=T;
          J:= J-1;
    End;
    End;

        For I := 0 To   (NumCas-1) Do
            StringGrid2.Cells[I,0]:=IntToStr(V1[i]);
            Stringgrid2.ColCount:=StringGrid1.ColCount;

 DecodeTime(now,hh1,mm1,ss1,ms1);
 hht:=hh1-hh;
 mmt:=mm1-mm;
 sst:=ss1-ss;
 mst:= (hht*3600) + (mmt*60) + sst + (ms1/1000) - (ms/1000);
 Label5.Caption:= FloatToStr(mst) + ' seg';
end;
end.
