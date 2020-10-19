unit About_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFAbout = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    a,d: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbout: TFAbout;

implementation

{$R *.dfm}

procedure TFAbout.Timer1Timer(Sender: TObject);
begin
  with Image2.Canvas do
    begin
    
      Font.Name:='Times New Roman';
      Font.Style:=[fsBold];
      Font.Size:=14;
      Font.Color:=RGB(random(255),random(255),random(255));
      TextOut(10,10,'Б');
      Font.Color:=RGB(random(255),random(255),random(255));
      TextOut(10+TextWidth('Б'),10,'о');
      Font.Color:=RGB(random(255),random(255),random(255));
      TextOut(10+TextWidth('Бо'),10,'л');
      Font.Color:=RGB(random(255),random(255),random(255));
      TextOut(10+TextWidth('Бол'),10,'т');
      Font.Color:=RGB(random(255),random(255),random(255));
      TextOut(10+TextWidth('Болт'),10,'ы');

    end;
  if FAbout.AlphaBlendValue=240 then
  d:=-1;
  if FAbout.AlphaBlendValue=10 then
  d:=1;
  a:=a+d*10;;
  FAbout.AlphaBlendValue:=a;
end;

procedure TFAbout.FormCreate(Sender: TObject);
begin
  a:=240;
  //d:=5;
end;

procedure TFAbout.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;

procedure TFAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=false;
end;

end.
