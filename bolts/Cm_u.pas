unit Cm_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCM_f = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CM_f: TCM_f;

implementation
uses main_u;
{$R *.dfm}

procedure TCM_f.Button1Click(Sender: TObject);
begin
  Form1.ValBlt:=strtofloat(Edit1.Text);
  ModalResult:=mrOk;
end;

procedure TCM_f.Button2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
