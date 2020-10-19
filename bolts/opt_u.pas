unit opt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, ExtCtrls;

type
  TForm4 = class(TForm)
    grbKts: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    grbMats: TGroupBox;
    ComboBox1: TComboBox;
    Table1: TTable;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    grbBolt: TGroupBox;
    Label5: TLabel;
    Edit3: TEdit;
    Button5: TButton;
    Button6: TButton;
    Label6: TLabel;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
   sig: extended;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses main_u;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
if grbKts.Visible then
  begin
    Form1.ktZap:=strtofloat(Edit1.Text);
    Form1.ktTr :=strtofloat(Edit2.Text);
    Form1.ktBezop:=strtofloat(Edit4.Text);
    ModalResult:=mrOk;
  end;
if grbMats.Visible then
  begin
    if ComboBox1.ItemIndex>0 then
    Form1.sigmaTD:=sig
    else Form1.sigmaTD:=240;
    ModalResult:=mrOk;
  end;
if grbBolt.Visible then
  begin
    Form1.sigmaTB := strtofloat(Edit3.Text);
    ModalResult:=mrOk;
  end;

end;

procedure TForm4.Button2Click(Sender: TObject);
begin
if grbKts.Visible then
  begin
    Form1.ktZap := 1.5;
    Form1.ktTr  := 0.15;
    Form1.ktBezop  := 2;
    Edit1.Text  := '1.5';
    Edit2.Text  := '0.15';
    Edit4.Text  := '2'
  end;
if grbMats.Visible then
  begin
    Form1.sigmaTD:=240;
    label4.Caption:='240';
    ComboBox1.Text:='Сталь 3'
  end;
if grbBolt.Visible then
  begin
    Form1.sigmaTB :=240;
    Edit3.Text    :='240';
  end;
  Form1.Delay(1,0);
  ModalResult:=mrCancel;
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['1'..'9','0',#8,',','.']) then key:=#0;
if key='.' then key := DecimalSeparator;
 
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
if (Sender as Tedit).text = '' then
  begin
   (Sender as Tedit).text:='1';
   //ShowMessage('Некорректные вводные');
  end;

end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Table1.TableName:=Form1.dir+'\mats.db';
  Table1.Active:=true;
  while not Table1.Eof do
  begin
    ComboBox1.Items.Add(Table1.Fields.Fields[1].AsString);
    Table1.Next;
  end;
  Table1.Active:=false;
  grbMats.Top:=2;
  grbKts.Top:=2;
  label4.Caption:='240';
  ComboBox1.Text:='Сталь 3';
//Form4.Height:=132;
  Form1.ktZap  := 1.5;
  Form1.ktTr   := 0.15;
  Form1.sigmaTD := 240;
  Form1.sigmaTB := 240;
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
var n: string;
begin
  Table1.Active:=true;
  n:=Table1.Fields.Fields[1].FieldName;
  Table1.Locate(n,ComboBox1.Text,[loCaseInsensitive,loPartialKey]);
  sig:=Table1.Fields.Fields[2].AsFloat;
  label4.Caption:=Table1.Fields.Fields[2].AsString;
  Table1.Active:=false;
end;

end.
