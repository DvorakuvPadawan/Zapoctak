unit Zunita;

interface
<<<<<<< HEAD
#zmena cislo jedna
=======
>>>>>>> master

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    ImDeska: TImage;
    ImKostka: TImage;
    ImFigurkaFialova1: TImage;
    procedure ImKostkaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;hod,hrac:byte;

implementation

{$R *.dfm}





procedure TForm3.ImKostkaClick(Sender: TObject);
begin
hod:=random(5);
if hod=0 then ImKostka.Picture.LoadFromFile('kostka1.png');
if hod=1 then ImKostka.Picture.LoadFromFile('kostka2.png');
if hod=2 then ImKostka.Picture.LoadFromFile('kostka3.png');
if hod=3 then ImKostka.Picture.LoadFromFile('kostka4.png');
if hod=4 then ImKostka.Picture.LoadFromFile('kostka5.png');
if hod=5 then ImKostka.Picture.LoadFromFile('kostka6.png');
if hod<>5 then hrac:=hrac+1;
if hrac=5 then hrac:=1;
//if hrac=1 then begin ImFigurkaRuzova1.enabled:=true;
//ImFigurkaRuzova2.enabled:=true;...end;
ImKostka.Enabled:=false;
end;

end.
