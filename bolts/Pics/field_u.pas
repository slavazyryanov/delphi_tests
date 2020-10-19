unit field_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons;

type
  TField_f = class(TForm)
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
   nVert,nHor: integer;
   nSpace: extended;
    { Public declarations }
  end;

var
  Field_f: TField_f;

implementation

{$R *.dfm}

procedure TField_f.BitBtn1Click(Sender: TObject);
begin
  nVert:=SpinEdit1.Value;
  nHor:=SpinEdit2.Value;
  nSpace:=strtofloat(Edit1.Text);
  ModalResult:=mrOk;
end;

end.
