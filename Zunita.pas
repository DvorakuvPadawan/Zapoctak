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
    ImFigurkaFialova3: TImage;
    ImFigurkaRuzova3: TImage;
    ImFigurkaFialova4: TImage;
    ImFigurkaRuzova1: TImage;
    ImFigurkaRuzova2: TImage;
    ImFigurkaRuzova4: TImage;
    ImFigurkaTyrkysova1: TImage;
    ImFigurkaTyrkysova2: TImage;
    ImFigurkaTyrkysova3: TImage;
    ImFigurkaTyrkysova4: TImage;
    ImFigurkaZluta1: TImage;
    ImFigurkaZluta2: TImage;
    ImFigurkaZluta3: TImage;
    ImFigurkaZluta4: TImage;
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
 DomecekF:array[0..7] of integer;
 DomecekT:array[0..7] of integer;     //souradnice prvniho policka 0 Left, 1 Top
 DomecekZ:array[0..7] of integer;
 DomecekR:array[0..7] of integer;
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
Figurka[15]:=ImFigurkaRuzova4; n je 64 policek}
  n:=64;
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
for i:=2*n to i:=3*n do     //inicializuje polohy figurek na 0 (aby fungovalo vykopnutí)
    pole[i]:=0;

  DomecekR[0]:=160;
  DomecekR[1]:=551;
  DomecekR[2]:=104;
  DomecekR[3]:= 503;
  DomecekR[4]:=104;
  DomecekR[5]:= 447;
  DomecekR[6]:=32;
  DomecekR[7]:= 415;
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
    if pole[figurka.policko+(2*n)]<>0 then                               //vykopnutí
         pole[figurka.policko+(2*n)] - cislo figurky   .left:=domecekBARVA;
                                       ktera tam byla  .top:=domecekBARVA; 
pole[figurka.policko+(2*n)]:=cislo figurky, která je právě na tahu}
end;

procedure TForm3.ImFigurkaFialova1Click(Sender: TObject);
begin
  posun(Figurka[4],Sender);
end;

procedure TForm3.ImFigurkaFialova2Click(Sender: TObject);
begin
  posun(Figurka[5],Sender);
end;
procedure TForm3.ImFigurkaFialova3Click(Sender: TObject);
begin
  posun(Figurka[6],Sender);
end;
procedure TForm3.ImFigurkaFialova4Click(Sender: TObject);
begin
  posun(Figurka[7],Sender);
end;

Procedure TForm3.ImKostkaClick(Sender: TObject);
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
