unit rep_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, classDef_u, ComCtrls;

type
  TfRep = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TreeView1: TTreeView;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
  private
    { Private declarations }
  public
   indexNode: integer;
    { Public declarations }
  end;

var
  fRep: TfRep;

implementation
uses main_u;

{$R *.dfm}

procedure TfRep.FormShow(Sender: TObject);
begin
Left:=Form1.Left+Form1.Width-fRep.Width;
Top:=Form1.Top;
Height:=Form1.Height;
GroupBox1.Height:=Height-4;
end;

procedure TfRep.SpeedButton1Click(Sender: TObject);
begin
TreeView1.SaveToFile('rep.txt');
ModalResult:=mrOK;
end;

procedure TfRep.SpeedButton2Click(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TfRep.TreeView1Click(Sender: TObject);
var send,par: TtreeNode;
    Xn,Yn: extended;
begin
  send:=TreeView1.Selected;
  indexNode:=send.Index;
  if send.getFirstChild=nil then
  begin
  par:=send.Parent;
  indexNode:=par.Index;
  end;
  blt:=blts[indexNode];
  Blt.GetGlobalCoo(Xn,Yn);
  Form1.SelAndReDraw(round(Xn),round(Yn));
end;

end.
