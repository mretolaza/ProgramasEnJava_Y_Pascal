unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
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

Function  Factor( Num:Integer): Integer;
    Begin
	   IF (Num > 0) Then
	       Begin
        //Factor:=Num*Factor(Num-1);
         Result:=Num*Factor(Num-1);
         End Else
         Factor:=1;
     End;

procedure TForm1.Button1Click(Sender: TObject);
begin
Label1.Caption:=IntToStr(Factor(StrToInt(Edit1.Text)));
end;

end.
