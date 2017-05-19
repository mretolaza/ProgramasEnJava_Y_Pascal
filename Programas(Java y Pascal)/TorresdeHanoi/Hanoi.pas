unit Hanoi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
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

Procedure THanoi(NumA:Integer;T1,T2,T3:Char);
Begin
   IF NumA = 1  Then
   Form1.Memo1.Lines.Add('    Mover de    ' + T1 + '   Hacia   ' + T3);

   IF NumA>1 Then
   begin
    THanoi(NumA-1,T1,T3,T2);
    THanoi(1,T1,T2,T3);
    THanoi(NumA-1,T2,T1,T3);
   end;
End;

procedure TForm1.Button1Click(Sender: TObject);
begin
(THanoi(strtoint(labelededit1.Text),'A','B','C'));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Lines.Clear;
end;

end.
