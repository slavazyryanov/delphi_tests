unit fdetail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFDet = class(TForm)
    Panel1: TPanel;
    lbD: TLabel;
    lbD1: TLabel;
    lbA: TLabel;
    lbB: TLabel;
    lbB1: TLabel;
    lbA1: TLabel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    edD: TEdit;
    edD1: TEdit;
    edA: TEdit;
    edB: TEdit;
    edA1: TEdit;
    edB1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edHdet: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    dir: string;
    im: byte;
    { Private declarations }
  public
    D,D1,A,B,A1,B1,Hdet:extended;
    { Public declarations }
  end;

var
  FDet: TFDet;

implementation

{$R *.dfm}

procedure TFDet.FormCreate(Sender: TObject);
begin
  GetDir(0,dir);
  dir:=dir+'\Pics';
end;

procedure TFDet.Image1Click(Sender: TObject);
begin
  with (Sender as TImage).Canvas do
    begin
      if (Sender as TImage).Name='Image1' then
        begin
          im:=1;
          Image2.Picture.LoadFromFile(dir+'\fdet_circ_fl.bmp');
          Image3.Picture.LoadFromFile(dir+'\fdet_rec.bmp');
          Image4.Picture.LoadFromFile(dir+'\fdet_rec_fl.bmp');
          edD.Visible  := true;
          edD1.Visible := false;
          edA.Visible  := false;
          edB.Visible  := false;
          edA1.Visible := false;
          edB1.Visible := false;
          lbD.Visible  := true;
          lbD1.Visible := false;
          lbA.Visible  := false;
          lbB.Visible  := false;
          lbA1.Visible := false;
          lbB1.Visible := false;
          label2.Visible:=true;
          label3.Visible:=false;
          label4.Visible:=false;
          label5.Visible:=false;
          //label6.Visible:=false;
          label7.Visible:=false;
          label8.Visible:=false;
        end;
      if (Sender as TImage).Name='Image2' then
        begin
          im:=2;
          Image1.Picture.LoadFromFile(dir+'\fdet_circ.bmp');
          Image3.Picture.LoadFromFile(dir+'\fdet_rec.bmp');
          Image4.Picture.LoadFromFile(dir+'\fdet_rec_fl.bmp');
          edD.Visible  := true;
          edD1.Visible := true;
          edA.Visible  := false;
          edB.Visible  := false;
          edA1.Visible := false;
          edB1.Visible := false;
          lbD.Visible  := true;
          lbD1.Visible := true;
          lbA.Visible  := false;
          lbB.Visible  := false;
          lbA1.Visible := false;
          lbB1.Visible := false;
          label2.Visible:=true;
          label3.Visible:=true;
          label4.Visible:=false;
          label5.Visible:=false;
          //label6.Visible:=false;
          label7.Visible:=false;
          label8.Visible:=false;
        end;
      if (Sender as TImage).Name='Image3' then
        begin
          im:=3;
          Image1.Picture.LoadFromFile(dir+'\fdet_circ.bmp');
          Image2.Picture.LoadFromFile(dir+'\fdet_circ_fl.bmp');
          Image4.Picture.LoadFromFile(dir+'\fdet_rec_fl.bmp');
          edD.Visible  := false;
          edD1.Visible := false;
          edA.Visible  := true;
          edB.Visible  := true;
          edA1.Visible := false;
          edB1.Visible := false;
          lbD.Visible  := false;
          lbD1.Visible := false;
          lbA.Visible  := true;
          lbB.Visible  := true;
          lbA1.Visible := false;
          lbB1.Visible := false;
          label2.Visible:=false;
          label3.Visible:=false;
          label4.Visible:=true;
          label5.Visible:=true;
          //label6.Visible:=false;
          label7.Visible:=false;
          label8.Visible:=false;
        end;
      if (Sender as TImage).Name='Image4' then
        begin
          im:=4;
          Image1.Picture.LoadFromFile(dir+'\fdet_circ.bmp');
          Image2.Picture.LoadFromFile(dir+'\fdet_Circ_fl.bmp');
          Image3.Picture.LoadFromFile(dir+'\fdet_rec.bmp');
          edD.Visible  := false;
          edD1.Visible := false;
          edA.Visible  := true;
          edB.Visible  := true;
          edA1.Visible := true;
          edB1.Visible := true;
          lbD.Visible  := false;
          lbD1.Visible := false;
          lbA.Visible  := true;
          lbB.Visible  := true;
          lbA1.Visible := true;
          lbB1.Visible := true;
          label2.Visible:=false;
          label3.Visible:=false;
          label4.Visible:=false;
          label5.Visible:=false;
          //label6.Visible:=false;
          label7.Visible:=true;
          label8.Visible:=true;
        end;
      Pen.Width:=1;
      Pen.Color:=clNavy;
      MoveTo(0,0);
      LineTo(0,60-Pen.Width);
      LineTo(80-Pen.Width,60-Pen.Width);
      LineTo(80-Pen.Width,0);
      LineTo(0,0);
      Pen.Color:=clBlack;
      BitBtn1.Visible:=true;
      BitBtn2.Visible:=true;
    end;
end;

procedure TFDet.BitBtn1Click(Sender: TObject);
begin
  case im of
    1: begin
          D:=strtofloat(edD.Text);
          D1:=0;A:=0;B:=0;A1:=0;B1:=0;
       end;
    2: begin
          D:=strtofloat(edD.Text);
          D1:=strtofloat(edD1.Text);
          A:=0;B:=0;A1:=0;B1:=0;
       end;
    3: begin
          A:=strtofloat(edA.Text);
          B:=strtofloat(edB.Text);
          D:=0;D1:=0;A1:=0;B1:=0;
       end;
    4: begin
          A:=strtofloat(edA.Text);
          B:=strtofloat(edB.Text);
          A1:=strtofloat(edA1.Text);
          B1:=strtofloat(edB1.Text);
          D:=0;D1:=0;
       end;
  end;
  Hdet:=strtofloat(edHdet.Text);
end;

procedure TFDet.BitBtn2Click(Sender: TObject);
begin
   D:=0;D1:=0;A:=0;B:=0;A1:=0;B1:=0;
end;

end.
