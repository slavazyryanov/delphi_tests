unit placef_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Buttons;

type
  TPlaceF = class(TForm)
    btnApply: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlaceF: TPlaceF;

implementation

uses main_u;

{$R *.dfm}

procedure TPlaceF.btnApplyClick(Sender: TObject);
begin
  Form1.Num   := SpinEdit1.Value;
  Form1.Rings := SpinEdit3.Value;
  if CheckBox1.Checked then
    Form1.Range := (-1)*SpinEdit2.Value
  else
    Form1.Range := SpinEdit2.Value

end;

end.
