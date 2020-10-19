unit ForceMom_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForMom = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    MomZnaK:integer;
    { Private declarations }
  public
    momVal: extended;
    momAx: string;
    { Public declarations }
  end;

var
  ForMom: TForMom;

implementation
uses main_u, ClassDef_u;

{$R *.dfm}

procedure TForMom.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9',#8,'.','-',',']) then
    key:=#0;
  if key='.' then key:=DecimalSeparator;  
end;

procedure TForMom.SpeedButton1Click(Sender: TObject);
begin

  {Mom:=Tmoment.create;
  Mom.SetCanvas(Form1.Image1.Canvas);
  Mom.SetAxle(ComboBox1.Text);
  Mom.SetZnak(strtofloat(Edit1.Text));
  Mom.SetValue(strtofloat(Edit1.Text));
  mom.SetXY(400,400);
  mom.SetCenterXY(form1.cenX,form1.cenY);
  mom.SetDrawParms(1,clBlack);
  MomList.Add(Mom);
  Mom.Draw;}
  momAx :=ComboBox1.Text;
  momVal:=strtofloat(Edit1.Text);
  ModalResult:=mrOK;
end;

procedure TForMom.SpeedButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
