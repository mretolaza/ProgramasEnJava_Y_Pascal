unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    Button4: TButton;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    CheckBox1: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    Type TReg=Record
           Cod : Integer;
           Nom: String[30];
           Dir    : String[20];
           Email:String[30];
           Saldo:Extended;
    End;

var
  Form2: TForm2;
  RE: TReg;
  TE: TReg;
  SE: TReg;
  AR: File Of TReg;
  Fila:Integer;
  Selec,Buscar:Boolean;
  Cambio:TReg; //Cambio de borrar contacto nada más
  pos:Integer;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);    //Buscar
Var i:Integer;  Popis:Boolean;
Begin
IF LabeledEdit1.Text='' Then
ShowMessage('Debe de ingresar el código de búsqueda')
Else Begin

Buscar:=False;
Popis:=False;
  Reset(Ar);
  Te.Cod:=StrToInt(LabeledEdit1.Text);
  For i := 0 To FileSize(Ar)-1 Do
  Begin
    Seek(Ar,i);
    Read(Ar,Re);
      IF Re.Cod=Te.Cod Then
       Begin
         StringGrid1.RowCount:=2;
         Selec:=True;
         Buscar:=True;
         ShowMessage('Ha encontrado el dato');
         Popis:=True;
         Te:=Re;
         Pos:=i;
         StringGrid1.Cells[0,1]:='#1';
         StringGrid1.Cells[1,1]:=IntToStr(Re.Cod);
         StringGrid1.Cells[2,1]:=Re.Nom;
         StringGrid1.Cells[3,1]:=Re.Dir;
         StringGrid1.Cells[4,1]:=Re.Email;
         StringGrid1.Cells[5,1]:=FloatToStr(Re.Saldo);
       End;
  End;
End;


  IF (Popis=False) then
     ShowMessage('El dato no existe');
End;



procedure TForm2.Button2Click(Sender: TObject);
var i:Integer;
Begin
 IF Selec Then
 Begin
   For i := 2 To  6 Do
   Begin
     IF TLabeledEdit(FindComponent('labeledEdit' + IntToStr(i))).Text<>'' Then
     Case i  Of
     2: // Código
     Begin
       Te.Cod:=StrToInt(LabeledEdit2.Text);
       Seek(Ar,Pos);
       Write(Ar,te);
     End;
     3: //Nombre
     Begin
      Te.Nom:=LabeledEdit3.Text;
      Seek(Ar,Pos);
      Write(Ar,Te);
     End;
     4:// Dirección
     Begin
     Te.Dir:=LabeledEdit4.Text;
     Seek(Ar,Pos);
     Write(Ar,Te);
     End;
     5: //email
     Begin
     Te.Email:=LabeledEdit5.Text;
     Seek(Ar,Pos);
     Write(Ar,Te);
     End;
     6: // Saldo
     Begin
     Te.Saldo:=StrToFloat(LabeledEdit6.Text);
     Seek(Ar,Pos);
     Write(Ar,Te);
     End;
     End;
   End;
 End;
      Selec:=False;
      ShowMessage('Ha sido modificado con éxito');
End;

procedure TForm2.Button3Click(Sender: TObject);
Var i:Integer;
Begin
IF Buscar  Then
Begin
 For i := pos+1 To FileSize(Ar)-1 Do
  Begin
    Seek(Ar,i);
    Read(Ar,Cambio);
    Seek(Ar,i-1);
    Write(Ar,Cambio);
  End;
     Seek(Ar,FileSize(Ar)-1);
     Truncate(Ar);
End;
Buscar:=False;
End;

procedure TForm2.Button4Click(Sender: TObject);
begin
Form2.Hide;
LabeledEdit1.Text:='';
LabeledEdit2.Text:='';
LabeledEdit3.Text:='';
LabeledEdit4.Text:='';
LabeledEdit5.Text:='';
LabeledEdit6.Text:='';
Pos:=0;
Selec:=False;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked  then
Form2.Width:=921;
end;

procedure TForm2.FormCreate(Sender: TObject);
Var i:Integer;
Begin
   AssignFile(ar,'datos.c5');
   Reset(ar);
//rewrite(ar);
    Form2.StringGrid1.Cells[0,0]:='#';
    Form2.StringGrid1.Cells[1,0]:='Código';
    Form2.StringGrid1.Cells[2,0]:='Nombre';
    Form2.StringGrid1.Cells[3,0]:='Dirección';
    Form2.StringGrid1.Cells[4,0]:='e-mail';
    Form2.StringGrid1.Cells[5,0]:='Saldo';
  For i := 1 to filesize(ar) do
  Begin
  Seek(ar,i-1);
  While filepos(ar)<i do read(ar,re);
  Form2.StringGrid1.Cells[0,i]:=inttostr(i);
  Form2.StringGrid1.Cells[1,i]:=inttostr(re.cod);
  Form2.StringGrid1.Cells[2,i]:=re.nom;
  Form2.StringGrid1.Cells[3,i]:=re.dir;
  Form2.StringGrid1.Cells[4,i]:=re.email;
  Form2.StringGrid1.Cells[5,i]:=floattostr(re.saldo);
End;
Form2.stringgrid1.RowCount:=filesize(ar)+1;
End;

End.
