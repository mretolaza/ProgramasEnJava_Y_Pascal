unit ArchivosDirectos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids;

type
  TStringGrid = class(Grids.TStringGrid);
  TForm1 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    Procedure Agregar;
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
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
Var
  Form1: TForm1;
  RE: TReg;
  TE: TReg;
  SE: TReg;
  AR: File Of TReg;
  Fila:Integer;
  Selec:Boolean;

implementation

uses Unit2;
{$R *.dfm}


Procedure Clean;
Var I,J,Z:integer;
Begin
Z:=0;
While Z<>FileSize(Ar)+1 Do
 Begin
      For i := 0 to 6 do
        Begin
          IF (Form1.StringGrid1.Cells[i,z]='')or (form1.StringGrid1.Cells[i,z]='0') then
              Form1.StringGrid1.Cells[i,z]:='';
              //Form1.StringGrid1.DeleteRow(Form1.StringGrid1.Row);
        End;
Inc(z);
 End;
 End;

Procedure BorrarRefresh;
Var i:Integer;
Begin
   AssignFile(ar,'datos.c5');
   Reset(ar);
//rewrite(ar);
    Form1.StringGrid1.Cells[0,0]:='#';
    Form1.StringGrid1.Cells[1,0]:='Código';
    Form1.StringGrid1.Cells[2,0]:='Nombre';
    Form1.StringGrid1.Cells[3,0]:='Dirección';
    Form1.StringGrid1.Cells[4,0]:='e-mail';
    Form1.StringGrid1.Cells[5,0]:='Saldo';
  For i := 1 to filesize(ar) do
  Begin
  Seek(ar,i-1); // busqueda
  While filepos(ar)<i do read(ar,re); {pos actual}
  Form1.StringGrid1.Cells[0,i]:=inttostr(i);
  Form1.StringGrid1.Cells[1,i]:=inttostr(re.cod);
  Form1.StringGrid1.Cells[2,i]:=re.nom;
  Form1.StringGrid1.Cells[3,i]:=re.dir;
  Form1.StringGrid1.Cells[4,i]:=re.email;
  Form1.StringGrid1.Cells[5,i]:=floattostr(re.saldo);
  Clean;
End;
Form1.stringgrid1.RowCount:=filesize(ar)+1;
End;

procedure TForm1.Button1Click(Sender: TObject);

Var  Control:integer; Num:extended;
Begin
Val (LabeledEdit5.Text,Num,Control);

IF (LabeledEdit1.Text='')Or (LabeledEdit2.Text='') Or (labelededit3.Text='') Or (LabeledEdit4.Text='') Or (LabeledEdit5.Text='') Then
    ShowMessage('ERROR, Alguno de los valores no fue ingresado')
Else Begin

IF Control <> 0 Then
Begin
  ShowMessage('ERROR en datos')
End Else Begin

  Re.cod:=strtoint(labelededit1.Text);
  Re.nom:=LabeledEdit2.Text;
  Re.dir:=LabeledEdit3.Text;
  Re.email:=LabelEdedit4.Text;
  Re.saldo:=StrToFloat(labelededit5.Text);
  Write(Ar,Re);
  Agregar;
  ShowMessage('Ha Ingresado Los datos, Ir a botón Mostrar');
End;
    End;
End;

procedure TForm1.Button2Click(Sender: TObject);
Var Cont,Cont1,i:Integer;
Begin
 i := MessageDlg('¿Desea Borrar TODO el contenido del Registro para siempre?', mtError, mbOKCancel, 0);
    IF i = mrOK Then
    Begin
      For cont :=0 to StringGrid1.ColCount-1 do
         For cont1 :=0 to StringGrid1.RowCount-1 do
          StringGrid1.Cells[cont,cont1] := '';
            Rewrite(Ar);
            StringGrid1.Cells[0,0]:='#';
            StringGrid1.Cells[1,0]:='Código';
            StringGrid1.Cells[2,0]:='Nombre';
            StringGrid1.Cells[3,0]:='Dirección';
            StringGrid1.Cells[4,0]:='e-mail';
            StringGrid1.Cells[5,0]:='Saldo';
    End;
    End;
procedure TForm1.Button3Click(Sender: TObject);
Var i :integer;
Begin

    i := MessageDlg('¿Desea Eliminar la Fila seleccionada?', mtError, mbOKCancel, 0);
    IF i = mrOK Then
    Begin
     
    End;
     BorrarRefresh;
    End;

procedure TForm1.Button4Click(Sender: TObject);
Var I:Integer;
Begin
 i := MessageDlg('¿Desea Modificar la Fila seleccionada?', mtError, mbOKCancel, 0);
    IF i = mrOK Then
    Begin
      IF (Fila=0) Or (LabeledEdit1.Text='') Or (LabeledEdit2.Text='') Or (LabeledEdit3.Text='') Or (LabeledEdit4.Text='') Or  (LabeledEdit5.Text='') Or (Selec=False) Then
ShowMessage('Debe de ingresar todos los espacios para poder modificar el archivo')
Else Begin
  Re.Cod:=StrToInt(LabeledEdit1.Text);
  Re.Nom:=LabeledEdit2.Text;
  Re.Dir:=LabeledEdit3.Text;
  Re.Email:=LabeledEdit4.Text;
  Re.Saldo:=StrToFloat(LabeledEdit5.Text);
  Reset(Ar);
  Seek(Ar,Fila-1);
  Write(Ar,Re);
  LabeledEdit1.Text:='';
  LabeledEdit2.Text:='';
  LabeledEdit3.Text:='';
  LabeledEdit4.Text:='';
  LabeledEdit5.Text:='';
       For i := 0 To Fila-1 Do
          Begin
             Seek(Ar,i);
             Read(Ar,Re);
          StringGrid1.Cells[0,i+1]:=IntToStr(i+1);
          StringGrid1.Cells[1,i+1]:=IntToStr(Re.Cod);
          StringGrid1.Cells[2,i+1]:=Re.Nom;
          StringGrid1.Cells[3,i+1]:=Re.Dir;
          StringGrid1.Cells[4,i+1]:=Re.Email;
          StringGrid1.Cells[5,i+1]:=FloatToStr(Re.Saldo);
          End;
End;

    End;
    End;
procedure TForm1.Button5Click(Sender: TObject);
Var
i,j,p:integer;
Begin
 For i := 0 to filesize(ar)-1 do
Begin
   Seek(ar,i);
   p:=i;
   Read(Ar,Re);
  For j := i To filesize(ar)-1 Do
  Begin
    seek(ar,j);
    While filepos(ar)<=j do read(ar,se);
    IF AnsiUpperCase(Re.Nom)>AnsiUpperCase(Se.Nom) Then
    Begin
      Re:=Se;
      P:=J;
    End;
  End;
  seek(Ar,i);
  read(Ar,Se);
  seek(Ar,i);
  write(Ar,re);
  seek(Ar,p);
  write(Ar,Se);
End;
  For i := 1 to filesize(ar) do
Begin
  seek(ar,i-1);
  While filepos(ar)<i do read(ar,re);
  StringGrid1.Cells[0,i]:=inttostr(i);
  StringGrid1.Cells[1,i]:=inttostr(re.cod);
  StringGrid1.Cells[2,i]:=re.nom;
  StringGrid1.Cells[3,i]:=re.dir;
  StringGrid1.Cells[4,i]:=re.email;
  StringGrid1.Cells[5,i]:=floattostr(re.saldo);
end;
stringgrid1.RowCount:=filesize(ar)+1;
End;

procedure TForm1.Button6Click(Sender: TObject);
Var
i,j,pos:integer;
Begin
 For i := 0 To filesize(ar)-1 do
Begin
   Seek(ar,i);
   pos:=i;
   Read(Ar,Re);
  For j := i To filesize(ar)-1 Do
  Begin
    seek(ar,j);
    While FilePos(ar)<=j do Read(ar,Te);
    IF Re.cod>Te.cod then
    Begin
      Re:=te;
      Pos:=J;
    End;
  End;
  Seek(Ar,i);
  Read(Ar,te);
  Seek(Ar,i);
  Write(Ar,re);
  Seek(Ar,pos);
  Write(Ar,te);
end;
  For i := 1 to filesize(ar) do
Begin
  seek(ar,i-1);
  While filepos(ar)<i do read(ar,re);
  StringGrid1.Cells[0,i]:=inttostr(i);
  StringGrid1.Cells[1,i]:=inttostr(re.cod);
  StringGrid1.Cells[2,i]:=re.nom;
  StringGrid1.Cells[3,i]:=re.dir;
  StringGrid1.Cells[4,i]:=re.email;
  StringGrid1.Cells[5,i]:=floattostr(re.saldo);
end;
stringgrid1.RowCount:=filesize(ar)+1;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
StringGrid1.Show;
Form1.Width:=1275;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
closefile(ar);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
BorrarRefresh;
end;

procedure TForm1.Agregar;
Begin
seek(ar,filesize(ar)-1);
While Not eof(ar) do
Begin
Read(ar,re);
StringGrid1.Cells[0,FileSize(ar)]:=inttostr(filesize(ar));
StringGrid1.Cells[1,FileSize(ar)]:=inttostr(re.cod);
StringGrid1.Cells[2,FileSize(ar)]:=re.Nom;
StringGrid1.Cells[3,FileSize(ar)]:=re.Dir;
StringGrid1.Cells[4,FileSize(ar)]:=re.email;
StringGrid1.Cells[5,FileSize(ar)]:=floattostr(re.saldo);
LabeledEdit1.Text:='';
LabeledEdit2.Text:='';
LabeledEdit3.Text:='';
LabeledEdit4.Text:='';
LabeledEdit5.Text:='';;
StringGrid1.RowCount:=filesize(ar)+1;
End;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Fila:=Arow;
  Selec:=CanSelect;
end;

end.
