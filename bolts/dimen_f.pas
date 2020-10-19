unit dimen_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Buttons;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main_u;
{$R *.dfm}

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=char(vk_Escape) then
    close;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Form1.nHorDim:=SpinEdit1.Value;
  Form1.nVerDim:=SpinEdit2.Value;
  ModalResult:=mrOk;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
//  Form1.nHorDim:=0;
//  Form1.nVerDim:=0;
  ModalResult:=mrCancel;
end;

procedure TForm2.FormShow(Sender: TObject);
var Xb,Yb:extended;
begin
  blt.GetGlobalCoo(Xb,Yb);
  Left:=Round(Xb+20+Form1.Left);
  Top:=Round(Yb+20+Form1.Top);
end;

end.
