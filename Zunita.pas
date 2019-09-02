unit Zunita;

interface
<<<<<<< HEAD

=======
>>>>>>> master

unit Zunita;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    ImDeska: TImage;
    ImKostka: TImage;
    ImFigurkaFialova1: TImage;
    ImFigurkaFialova2: TImage;
    Memo1: TMemo;
    procedure ImKostkaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ImFigurkaFialova2Click(Sender: TObject);
    procedure ImFigurkaFialova1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;


var
hod,hrac,n:byte;
 Form3:Tform3;
 T:TextFile;
 Figurka:array [0..15] of Timage;
 Pole:array [0..999] of integer;
 type rekord = record
    Policko:byte;
    NenasezenePolicko:byte;
    Barva:byte
 end;


implementation







{$R *.dfm}












procedure TForm3.FormActivate(Sender: TObject);
Var i,j:byte;
znak:char;slovo:string;
begin
{tato procedura je taková deklerační, spustí se totiž jen při spuštění
a bude tu např. uložení hodnot, souřadnic atd.
Figurka[0]:=ImFigurkaTyrkysova1;
Figurka[1]:=ImFigurkaTyrkysova2;
Figurka[2]:=ImFigurkaTyrkysova3;
Figurka[3]:=ImFigurkaTyrkysova4;}
Figurka[4]:=ImFigurkaFialova1;
Figurka[5]:=ImFigurkaFialova2;
{Figurka[6]:=ImFigurkaFialova3;
Figurka[7]:=ImFigurkaFialova4;
Figurka[8]:=ImFigurkaZluta1;
Figurka[9]:=ImFigurkaZluta2;
Figurka[10]:=ImFigurkaZluta3;
Figurka[11]:=ImFigurkaZluta4;
Figurka[12]:=ImFigurkaRuzova1;
Figurka[13]:=ImFigurkaRuzova2;
Figurka[14]:=ImFigurkaRuzova3;
Figurka[15]:=ImFigurkaRuzova4; to n jsem jen tipnul pocet poli}
  n:=60;
  assignFile(T,'souradnice.txt');
  reset(T);
  i:=0;
  while not eof(T) do
  begin
    i:=i+1;
    Pole[i]:=0;
    read(T,znak);
    while znak<>' ' do
    begin
      Pole[i]:=Pole[i]*10+ord(znak)-ord('0');
      read(T,znak);
    end;
    while znak=' ' do
    begin
      read(T,znak);
    end;
    i:=i+1;
    Pole[i]:=0;
    while not eoln do
    begin
      Pole[i]:=Pole[i]*10+ord(znak)-ord('0');
      read(T,znak);
    end;
    n:=i;
    Pole[i]:=Pole[i]*10+ord(znak)-ord('0');
    for I := 2 to n do
    begin
    slovo:=IntToStr(Pole[i-1]);
    Memo1.Lines.Add(slovo);
    slovo:=IntToStr(Pole[i]);
    Memo1.Lines.Add(slovo);
    end;
  end;
  closeFile(T);
  i:=0;
  //tady nahrajeme souřadnice figurek na začátku a jejich hodnoty

end;

procedure posun(Figurka:TImage;Sender:TObject);
var C:TImage;I:byte;
Begin
    //for i := 4*hrac to 4*hrac+3 do Figurka[i].Enabled:=false;

    //ImKostka.Enabled:=true;
    {figurka.policko:=figurka.policko+hod;
    if figurka.policko>n then figurka.policko:=figurka.policko-n;

    figurka.left:=pole[figurka.policko];
    figurka.top:=pole[figurka.policko+n];
    pole[figurka.policko+(2*n)]:=cislo figurky}
end;

procedure TForm3.ImFigurkaFialova1Click(Sender: TObject);
begin
  posun(Figurka[4],Sender);
end;

procedure TForm3.ImFigurkaFialova2Click(Sender: TObject);
begin
  posun(Figurka[5],Sender);
end;

procedure TForm3.ImKostkaClick(Sender: TObject);
Var i:byte;
begin
hod:=random(5)+1;
if hod=1 then ImKostka.Picture.LoadFromFile('kostka1.png');
if hod=2 then ImKostka.Picture.LoadFromFile('kostka2.png');
if hod=3 then ImKostka.Picture.LoadFromFile('kostka3.png');
if hod=4 then ImKostka.Picture.LoadFromFile('kostka4.png');
if hod=5 then ImKostka.Picture.LoadFromFile('kostka5.png');
if hod=6 then ImKostka.Picture.LoadFromFile('kostka6.png');
if hod<6 then hrac:=hrac+1;
if hrac=4 then hrac:=0;
ImKostka.Enabled:=false;
{for i := 4*hrac to (4*hrac)+3 do
  begin
    //if je nasazená:
    if figurka[i].policko>15 then Figurka[i].Enabled:=true;
  end;}
end;

end.
