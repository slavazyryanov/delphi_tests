program proga;

uses
  Forms,
  main_u in 'main_u.pas' {Form1},
  ClassDef_u in 'ClassDef_u.pas',
  placef_u in 'placef_u.pas' {PlaceF},
  dimen_f in 'dimen_f.pas' {Form2},
  ForceMom_u in 'ForceMom_u.pas' {ForMom},
  force_u in 'force_u.pas' {Form3},
  fdetail_u in 'fdetail_u.pas' {FDet},
  Cm_u in 'Cm_u.pas' {CM_f},
  field_u in 'Pics\field_u.pas' {Field_f},
  opt_u in 'opt_u.pas' {Form4},
  rep_f in 'rep_f.pas' {fRep},
  About_f in 'About_f.pas' {FAbout},
  reportfull_f in 'reportfull_f.pas' {FullRep};

{$R *.res}

begin

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPlaceF, PlaceF);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForMom, ForMom);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFDet, FDet);
  Application.CreateForm(TCM_f, CM_f);
  Application.CreateForm(TField_f, Field_f);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TfRep, fRep);
  Application.CreateForm(TFAbout, FAbout);
  Application.CreateForm(TFullRep, FullRep);
  Application.Run;

end.
