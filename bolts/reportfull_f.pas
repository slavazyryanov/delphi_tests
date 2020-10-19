unit reportfull_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFullRep = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edMat: TEdit;
    edKtr: TEdit;
    edKzap: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edFSt: TEdit;
    edFSdv: TEdit;
    edFzZaz: TEdit;
    Label12: TLabel;
    edBltZaz: TEdit;
    edLim: TEdit;
    edKBez: TEdit;
    edFzNoZaz: TEdit;
    edBltNoZaz: TEdit;
    GroupBox3: TGroupBox;
    StringGrid1: TStringGrid;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox4: TGroupBox;
    StringGrid2: TStringGrid;
    GroupBox5: TGroupBox;
    StringGrid3: TStringGrid;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox6: TGroupBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullRep: TFullRep;

implementation

uses ClassDef_u;

{$R *.dfm}

procedure TFullRep.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
    begin
      Font.Name:='Arial';
      Font.Size:=7;
      ColWidths[1]:=Length('Горизонтальная')*6;
      ColWidths[2]:=Length('Вертикальная')*6;
    end;
  with StringGrid2 do
    begin
      Font.Name:='Arial';
      Font.Size:=7;
      //ColWidths[1]:=Length('Горизонтальная')*6;
     // ColWidths[2]:=Length('Вертикальная')*6;
      Cells[0,0]:='Координата X';
      Cells[0,1]:='Координата Y';
      Cells[0,2]:='Координата Z';
      Cells[0,3]:='Составляющая Fx';
      Cells[0,4]:='Составляющая Fy';
      Cells[0,5]:='Составляющая Fz';
      ColWidths[0]:=Length('Составляющая Fz')*6;
    end;
  with StringGrid3 do
    begin
      Font.Name:='Arial';
      Font.Size:=7;
      //ColWidths[1]:=Length('Горизонтальная')*6;
     // ColWidths[2]:=Length('Вертикальная')*6;
      Cells[0,0]:='   Имя';
      Cells[0,1]:='Ось';
      Cells[0,2]:='Значение:';
      ColWidths[0]:=Length('Значение:')*6;
    end;
end;

end.
