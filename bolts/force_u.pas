unit force_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, Menus;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    fX,fY,fZ,
    fFx,fFy,fFz:extended;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses Main_u;

{$R *.dfm}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  fX:=StrToFloat(Edit1.Text);
  fY:=StrToFloat(Edit2.Text);
  fZ:=StrToFloat(Edit3.Text);
  //main_u.Frc.SetCoords(X,Y,Z);
  fFx:=StrToFloat(Edit4.Text);
  fFy:=StrToFloat(Edit5.Text);
  fFz:=StrToFloat(Edit6.Text);
 // main_u.Frc.SetCompOfForce(Fx,Fy,Fz);
  ModalResult:=mrOK;
  //Form1.ReDraw;
  //Form1.N7Click(self);
end;


procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  ModalResult:=MrCancel;
end;

procedure TForm3.Edit4Change(Sender: TObject);
begin
 // SpeedButton3.Enabled:=true;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
var F2: TextFile;
    i: byte;
    list: TstringList;
    s: string;
begin
  list:=TStringList.Create;
  i:=0;
  With OpenDialog1 do
    if Execute then
      begin
        AssignFile(F2,FileName);
        Reset(F2);
        while not EoF(F2) do
          begin
          ReadLn(F2,s) ;
          list.add(s);
          end;
       // for i:=0 to 5 do
       //  TEdit(FindComponent('Form4.Edit'+inttostr(i+1))).Text:=list[i];
      Edit1.Text:=List[0];
      Edit2.Text:=List[1];
      Edit3.Text:=List[2];
      Edit4.Text:=List[3];
      Edit5.Text:=List[4];
      Edit6.Text:=List[5];
      CloseFile(F2);
      end;

end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
var F1: TextFile;
    i: byte;
begin
  With SaveDialog1 do
    if Execute then
      begin
        AssignFile(F1,FileName);
        Rewrite(F1);
        Writeln(F1,Edit1.Text);
        Writeln(F1,Edit2.Text);
        Writeln(F1,Edit3.Text);
        Writeln(F1,Edit4.Text);
        Writeln(F1,Edit5.Text);
        Writeln(F1,Edit6.Text);
        CloseFile(F1);
      end;

end;

end.
