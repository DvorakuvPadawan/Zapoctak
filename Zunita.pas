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
      Label2: TLabel;
    procedure ImKostkaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ImFigurkaTyrkysova1Click(Sender: TObject);
    procedure ImFigurkaTyrkysova2Click(Sender: TObject);
    procedure ImFigurkaTyrkysova3Click(Sender: TObject);
    procedure ImFigurkaTyrkysova4Click(Sender: TObject);
    procedure ImFigurkaFialova1Click(Sender: TObject);
    procedure ImFigurkaFialova2Click(Sender: TObject);
    procedure ImFigurkaFialova3Click(Sender: TObject);
    procedure ImFigurkaFialova4Click(Sender: TObject);
    procedure ImFigurkaZluta1Click(Sender: TObject);
    procedure ImFigurkaZluta2Click(Sender: TObject);
    procedure ImFigurkaZluta3Click(Sender: TObject);
    procedure ImFigurkaZluta4Click(Sender: TObject);
    procedure ImFigurkaRuzova1Click(Sender: TObject);
    procedure ImFigurkaRuzova2Click(Sender: TObject);
    procedure ImFigurkaRuzova3Click(Sender: TObject);
    procedure ImFigurkaRuzova4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

type rekord = record
    Obrazek:TImage;
    Policko:byte;
    Start:byte;
    DomecekX:longint;
    DomecekY:longint;
    Kolo:boolean;
 end;
var
hod,hrac,n:byte;
Hraji:array [0..3] of byte;
 Form3:Tform3;
 T:TextFile;
 Pole:array [0..999] of integer;
 var Figurka:array [0..15] of rekord;

implementation

{$R *.dfm}

procedure TForm3.FormActivate(Sender: TObject);
Var i,j:byte;
radek:string;
begin
{tato procedura je taková deklerační, spustí se totiž jen při spuštění
a bude tu např. uložení hodnot, souřadnic atd.}
Figurka[0].Obrazek:=ImFigurkaTyrkysova1;
Figurka[1].Obrazek:=ImFigurkaTyrkysova2;
Figurka[2].Obrazek:=ImFigurkaTyrkysova3;
Figurka[3].Obrazek:=ImFigurkaTyrkysova4;
Figurka[4].Obrazek:=ImFigurkaFialova1;
Figurka[5].Obrazek:=ImFigurkaFialova2;
Figurka[6].Obrazek:=ImFigurkaFialova3;
Figurka[7].Obrazek:=ImFigurkaFialova4;
Figurka[8].Obrazek:=ImFigurkaZluta1;
Figurka[9].Obrazek:=ImFigurkaZluta2;
Figurka[10].Obrazek:=ImFigurkaZluta3;
Figurka[11].Obrazek:=ImFigurkaZluta4;
Figurka[12].Obrazek:=ImFigurkaRuzova1;
Figurka[13].Obrazek:=ImFigurkaRuzova2;
Figurka[14].Obrazek:=ImFigurkaRuzova3;
Figurka[15].Obrazek:=ImFigurkaRuzova4;
  n:=64;
  assignFile(T,'souradnik.txt');
  reset(T);
  i:=0;
  while not eof(T) do
  begin
    j:=1;
    readln(T,radek);
    if (ord(radek[j])>=ord('0')) and (ord(radek[j])<=ord('9')) then
    begin
      i:=i+1;
      if i<=n then
      begin
        Pole[i]:=0;
        Pole[i+n]:=0;
      end else if i<=n+16 then
      begin
        Figurka[i-n-1].DomecekX:=0;
        Figurka[i-n-1].DomecekY:=0;
      end;
    end;

      while (ord(radek[j])>=ord('0')) and (ord(radek[j])<=ord('9')) do
      begin
        if i<=n then Pole[i]:=Pole[i]*10+ord(radek[j])-ord('0') else
        if i<=n+16 then Figurka[i-n-1].DomecekX:=Figurka[i-n-1].DomecekX*10+ord(radek[j])-ord('0');

        j:=j+1;
      end;
      while ((ord(radek[j])<ord('0')) or (ord(radek[j])>ord('9'))) and (j<=length(radek)) do
      begin
        j:=j+1;
      end;
      while ((ord(radek[j])>=ord('0')) and (ord(radek[j])<=ord('9'))) and (j<=length(radek)) do
      begin
        if i<=n then Pole[i+n]:=Pole[i+n]*10+ord(radek[j])-ord('0') else
        if i<=n+16 then Figurka[i-n-1].DomecekY:=Figurka[i-n-1].DomecekY*10+ord(radek[j])-ord('0');
        j:=j+1;
      end;

  end;
  closeFile(T);
  for i:= 0 to 3 do Figurka[i].Start:=6;
  for i:= 4 to 7 do Figurka[i].Start:=24;
  for i:= 8 to 11 do Figurka[i].Start:=38;
  for i:= 12 to 15 do Figurka[i].Start:=56;

  //tady nahrajeme souřadnice figurek na začátku a jejich hodnoty
  for I := 0 to 15 do
  begin
    Figurka[i].Policko:=0;
    Figurka[i].Obrazek.Left:=Figurka[i].DomecekX;
    Figurka[i].Obrazek.Top:=Figurka[i].DomecekY;
    Figurka[i].Obrazek.Enabled:=false;
  end;
  for i := 1 to 64 do
    begin
      pole[i+(2*n)]:=16;
    end;
  hrac:=0;
  

end;


procedure posun(CisloFigurky:byte;Sender:TObject);
var C:TImage;I:byte;Label2:TLabel;ImKostka: TImage;
Begin

    if Figurka[CisloFigurky].policko>0 then
    begin
      //16 znamená prázdné políčko, protože figurky jsou číslované od 0, kvůli zjednodušení psaní intervalů forcyklů
      //zde asi může být chyba (již opravená), že bez podmínky by se přepsala souřadnice uložena v Pole[2n]
      Pole[Figurka[CisloFigurky].policko+(2*n)]:=16;
      Figurka[CisloFigurky].policko:=Figurka[CisloFigurky].Policko+hod;
    end else
    begin
      Figurka[CisloFigurky].policko:=Figurka[CisloFigurky].Start;
    end;

    if Figurka[CisloFigurky].Policko>n then begin
        Figurka[CisloFigurky].Policko:=Figurka[CisloFigurky].policko-n;
        Figurka[CisloFigurky].Kolo:=true;
        end;
        if Pole[Figurka[CisloFigurky].policko+(2*n)]<16 then
    begin
      Figurka[Pole[Figurka[CisloFigurky].policko+(2*n)]].policko:=0;
      Figurka[Pole[Figurka[CisloFigurky].policko+(2*n)]].Kolo:=false;
      Figurka[Pole[Figurka[CisloFigurky].policko+(2*n)]].Obrazek.Left:=Figurka[Pole[Figurka[CisloFigurky].policko+(2*n)]].DomecekX;
      Figurka[Pole[Figurka[CisloFigurky].policko+(2*n)]].Obrazek.Top:=Figurka[Pole[Figurka[CisloFigurky].policko+(2*n)]].DomecekY;
    end;
    Pole[Figurka[CisloFigurky].policko+(2*n)]:=CisloFigurky;
    
    //kdyz uz figurka objela kolo, tak ji radi do ovcince ...
	if Figurka[CisloFigurky].Kolo=true  then
  begin
  if Figurka[CisloFigurky].Policko>Figurka[CisloFigurky].Start then
	  begin
		  (*Figurka[CisloFigurky].covc:=Figurka[CisloFigurky].Policko-Figurka[CisloFigurky].Start-1;
		  Figurka[CisloFigurky].Obrazek.Left:=Figurka[CisloFigurky].ovcinecX[Figurka[CisloFigurky].covc];
		  Figurka[CisloFigurky].Obrazek.Top:=Figurka[CisloFigurky].ovcinecY[Figurka[CisloFigurky].covc]; *)
      Figurka[CisloFigurky].Obrazek.Visible:=false;
      Figurka[CisloFigurky].Policko:=100;
      Figurka[CisloFIgurky].Obrazek.Enabled:=false;
      Hraji[CisloFigurky div 4 ]:= Hraji[CisloFigurky div 4 ]+1;

	  end
    else begin
          Figurka[CisloFigurky].Obrazek.Left:=pole[Figurka[CisloFigurky].policko];
          Figurka[CisloFigurky].Obrazek.Top:=pole[figurka[CisloFigurky].policko+n];
      end;

 end
 else begin
            (*Figurka[CisloFigurky].Obrazek.Left:=Figurka[CisloFigurky].ovcinecX[1];
          Figurka[CisloFigurky].Obrazek.Top:=Figurka[CisloFigurky].ovcinecY[1];  *)
          Figurka[CisloFigurky].Obrazek.Left:=pole[Figurka[CisloFigurky].policko];
          Figurka[CisloFigurky].Obrazek.Top:=pole[figurka[CisloFigurky].policko+n];
      end;
     
    for i := 4*hrac to 4*hrac+3 do Figurka[i].Obrazek.Enabled:=false;
end;

procedure TForm3.ImFigurkaTyrkysova1Click(Sender: TObject);
begin
  posun(0,Sender);
  //toto nevím proč nefunfuje v proceduře posun, tak se to musí dát do každé Figurka.click procedury:
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[0]=4 then begin
       Label2.Caption:='Vyhrála jsi tyrkysová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaTyrkysova2Click(Sender: TObject);
begin
  posun(1,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
   if Hraji[0]=4 then begin
       Label2.Caption:='Vyhrála jsi tyrkysová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaTyrkysova3Click(Sender: TObject);
begin
  posun(2,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
   if Hraji[0]=4 then begin
       Label2.Caption:='Vyhrála jsi tyrkysová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaTyrkysova4Click(Sender: TObject);
begin
  posun(3,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
   if Hraji[0]=4 then begin
       Label2.Caption:='Vyhrála jsi tyrkysová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaZluta1Click(Sender: TObject);
begin
posun(8,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[2]=4 then begin
       Label2.Caption:='Vyhrála jsi žlutá!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaZluta2Click(Sender: TObject);
begin
  posun(9,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[2]=4 then begin
       Label2.Caption:='Vyhrála jsi žlutá!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaZluta3Click(Sender: TObject);
begin
  posun(10,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[2]=4 then begin
       Label2.Caption:='Vyhrála jsi žlutá!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaZluta4Click(Sender: TObject);
begin
  posun(11,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[2]=4 then begin
       Label2.Caption:='Vyhrála jsi žlutá!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaFialova1Click(Sender: TObject);
begin
  posun(4,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[1]=4 then begin
       Label2.Caption:='Vyhrála jsi fialová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaFialova2Click(Sender: TObject);
begin
  posun(5,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[1]=4 then begin
       Label2.Caption:='Vyhrála jsi fialová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaFialova3Click(Sender: TObject);
begin
  posun(6,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[1]=4 then begin
       Label2.Caption:='Vyhrála jsi fialová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaFialova4Click(Sender: TObject);
begin
  posun(7,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[1]=4 then begin
       Label2.Caption:='Vyhrála jsi fialová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaRuzova1Click(Sender: TObject);
begin
  posun(12,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[3 ]=4 then begin
       Label2.Caption:='Vyhrála jsi ružová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaRuzova2Click(Sender: TObject);
begin
  posun(13,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;if Hraji[3 ]=4 then begin
       Label2.Caption:='Vyhrála jsi ružová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaRuzova3Click(Sender: TObject);
begin
  posun(14,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[3 ]=4 then begin
       Label2.Caption:='Vyhrála jsi ružová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImFigurkaRuzova4Click(Sender: TObject);
begin
  posun(15,Sender);
  ImKostka.Picture.LoadFromFile('kostka_logo.png');
  ImKostka.Enabled:=true;
  if Hraji[3 ]=4 then begin
       Label2.Caption:='Vyhrála jsi ružová!';
       for i := 0 to 15 do
             Figurka[i].Obrazek.Enabled:=false;
       ImKostka.Enabled:=False  ;
      end;
end;

procedure TForm3.ImKostkaClick(Sender: TObject);
Var i:byte;
begin
hod:=random(6)+1;

case hrac of
0:  begin Label2.Caption:='tyrkysová';
          for i:=4 to 15 do Figurka[i].Obrazek.Enabled:=false;
    end;
1:  begin Label2.Caption:='fialová';
    for i:=8 to 15 do Figurka[i].Obrazek.Enabled:=false;
    for i:= 0 to 3 do Figurka[i].Obrazek.Enabled:=false;
    end;
2:  begin Label2.Caption:='žlutá';
    for i:=0 to 7 do Figurka[i].Obrazek.Enabled:=false;
    for i:= 12 to 15 do Figurka[i].Obrazek.Enabled:=false;
    end;
3:  begin Label2.Caption:='růžová';
    for i:=0 to 11 do Figurka[i].Obrazek.Enabled:=false;
    end;
 end;
if hod=1 then ImKostka.Picture.LoadFromFile('kostka1.png');
if hod=2 then ImKostka.Picture.LoadFromFile('kostka2.png');
if hod=3 then ImKostka.Picture.LoadFromFile('kostka3.png');
if hod=4 then ImKostka.Picture.LoadFromFile('kostka4.png');
if hod=5 then ImKostka.Picture.LoadFromFile('kostka5.png');
if hod=6 then ImKostka.Picture.LoadFromFile('kostka6.png');
for i := 4*hrac to (4*hrac)+3 do
  begin
    //if je nasazená:
    if (figurka[i].policko>0) and (figurka[i].Policko<99) then Figurka[i].Obrazek.Enabled:=true;
    if (figurka[i].policko=0) and (hod=6) then Figurka[i].Obrazek.Enabled:=true;


  end;
  //kdyz si hrac nemuze nasadit, nemuze jet, takze kostka bude aktivní:
for i := 4*hrac to (4*hrac)+3 do if Figurka[i].Obrazek.Enabled=true then ImKostka.Enabled:=false;
if hod<6 then hrac:=hrac+1;
if hrac=4 then hrac:=0;
end;

end.
