unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClassDef_u, ExtCtrls, StdCtrls, Menus, placef_u, Buttons, dimen_f,
  ImgList, ForceMom_u, force_u, ComCtrls, ToolWin, fdetail_u, MatemBolt, cm_u,
  field_u, opt_u, rep_f, about_f;


type TMass=array of array of string ;


type
  TForm1 = class(TForm)
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ImageList1: TImageList;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    ToolBar1: TToolBar;
    tbSel: TToolButton;
    tbBoltPerm: TToolButton;
    ToolButton1: TToolButton;
    tbDelBlt: TToolButton;
    ToolButton3: TToolButton;
    MainMenu1: TMainMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    StatusBar1: TStatusBar;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    ToolButton2: TToolButton;
    tbIzom: TToolButton;
    tbPlane: TToolButton;
    tbScNew: TToolButton;
    tbScOpen: TToolButton;
    tbScSave: TToolButton;
    ToolButton7: TToolButton;
    PopupMenu2: TPopupMenu;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    ToolButton4: TToolButton;
    tbRunCalc: TToolButton;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    tbRect: TToolButton;
    tbCir: TToolButton;
    ToolButton8: TToolButton;
    NAddF: TMenuItem;
    N210: TMenuItem;
    tbChSt: TToolButton;
    tstN: TMenuItem;
    NFrcDel: TMenuItem;
    NAddMom: TMenuItem;
    NDelMom: TMenuItem;
    N51: TMenuItem;
    testM: TMenuItem;
    tbRep: TToolButton;
    tbPan: TToolButton;
    N49: TMenuItem;
    N50: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    valNm: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N22: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    Timer1: TTimer;
    N68: TMenuItem;
    nRep: TMenuItem;
    nRepFull: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    ToolButton5: TToolButton;
    tbZoomIn: TToolButton;
    tbZoomOut: TToolButton;
    N75: TMenuItem;
    PM3: TPopupMenu;
    standbf1: TMenuItem;
    flanecrectbf1: TMenuItem;
    bf1: TMenuItem;
    DelALL: TMenuItem;
    tbRepFull: TToolButton;
    repNew: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N15Click(Sender: TObject);
    procedure tbDelBltClick(Sender: TObject);
    procedure tbSelClick(Sender: TObject);
    procedure tbBoltPermClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure tbRunCalcClick(Sender: TObject);
    procedure NAddFClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tbChStClick(Sender: TObject);
    procedure tstNClick(Sender: TObject);
    procedure NFrcDelClick(Sender: TObject);
    procedure testMClick(Sender: TObject);
    procedure NDelMomClick(Sender: TObject);
    procedure tbRepClick(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N34Click(Sender: TObject);
    procedure valNmClick(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure nRepFullClick(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure tbZoomInClick(Sender: TObject);
    procedure tbZoomOutClick(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure standbf1Click(Sender: TObject);
    procedure DelALLClick(Sender: TObject);
    procedure repNewClick(Sender: TObject);
  private
    function  AddBolt(X,Y,Xc,Yc:integer):boolean;
    procedure DeleteBolt;
    procedure ClearCanvas;
    procedure IzoAxles;
    procedure Axles;
    procedure AddForceToMenu;
    procedure AddMomentToMenu;
    procedure DelFrcAndMomFromMenus;
    procedure CopyMoveBlt(CM,direct: byte; val: extended);

    procedure GetReport;
    procedure FileToMas(col:integer;fName:String;var M:TMass);
    function  DetermDiam(d:extended): string;


    { Private declarations }
  public
    RepTxt: TstringList;
    Num,Range, Rings,
    nHorDim,nVerDim,
    cenX,cenY,  cXold,cYold,
    SelFrc,SelMom,dx,dy,selBX,SelBY:integer;
    IzoMode:boolean;
    tmpXY,arr:array of array of extended;
    Ast,Wstxx,Wstyy,Fzat,Vd1OnZaz,Vd1NotZaz,VFzatOnZaz,VFzatNotZaz,Fmax: extended;
    Cm,Direct: byte;
    ValBlt, ktZap{к-т запаса},ktTr{к-т трения},ktBezop,sigmaTB,{предел текучести}sigmaTD: extended;
    masBol: TMass;
    Mzaz,MnotZaz: string;
    dir:string;
    function  SelAndReDraw(X,Y:integer):boolean;
    procedure ReDraw;
    procedure Delay(Seconds,Milli:Word);
    procedure FullRedraw;

    { Public declarations }
  end;

var
  Form1: TForm1;
  blt:TBolt;
  Mom:TMoment;
  Frc: TForce;
  Dim: TDimension;
  Detal: TFpmDetail;
  it,it2: TMenuItem;
  FrcMnL, MomMnL: Tlist;

implementation

uses reportfull_f, Grids;


{$R *.dfm}

function TForm1.AddBolt(X,Y,Xc,Yc: integer):boolean;
var  i:integer;
     t1,t2:extended;
     b: TBolt;
begin
   for i:=0 to blts.Count-1 do
    begin
      blt:=blts[i];
      blt.GetGlobalCoo(t1,t2);
      if (X>(t1-6)) and (X<(t1+6)) and
         (Y>(t2-6)) and (Y<(t2+6)) then
      begin
        ShowMessage('Слишком близкое расположение');
        exit;
        Result:=false;
        Image1.PopupMenu:=nil;
      end;
    end;
    blt:=TBolt.Create;
    blt.SetCanvas(Image1.Canvas);
    blt.SetCenter(Xc,Yc);
    blt.SetXY(X,Y);
    blt.SetDrawParms(2,clBlack,clBlack);
    blt.SetR(6);
    {}
    b:=TBolt.Create;
    b.SetCanvas(Image1.Canvas);
    b.SetCenter(Xc,Yc);
    b.SetXY(X,Y);
    b.SetDrawParms(2,clBlack,clBlack);
    b.SetR(6);
    {}
    blt.Draw;
    blts.Add(blt);
    blts2.Add(b);
    SetLength(arr,2,blts2.Count);
    for i:=0 to blts2.Count-1 do
       begin
        b:=blts2[i];
        arr[0,i]:=b.GetRV;
        arr[1,i]:=b.GetAngle;
       end;
    Image1.PopupMenu:=PopupMenu2;
    Result:=true;
end;

procedure TForm1.DeleteBolt;
var i: integer;
    b: TBolt;
begin
   if (blts.Count=0) or (Blt=nil) then
      exit ;
    blt.SetDrawParms(2,Image1.Canvas.Brush.Color,Image1.Canvas.Brush.Color);
    blt.Draw;
    i:=blts.IndexOf(blt);
    blts.Delete(i);
    blts2.Delete(i);
    if (blts.Count<>0) then
     blt:=blts.Items[blts.Count-1]
    else
     blt:=nil;
    for i:=0 to blts2.Count-1 do
      begin
        b:=blts2[i];
        arr[0,i]:=b.GetRV;
        arr[1,i]:=b.GetAngle;
       end;

end;

function TForm1.SelAndReDraw(X,Y:integer):boolean;
var i,iTemp:integer;
    bltXg,bltYg,hD,vD:extended;
begin
 // Axles;
  iTemp:=0;
  Result:=false;
  ClearCanvas;
  Axles;
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);

    Detal.DrawDet(0);
    if not (Blt=nil) then
      begin
      for i:=0 to blts.Count-1 do     // цикл работы с болтами (Blts.count-1 есть число болтов )
        begin
          blt:=blts.Items[i];         // получаем следующий болт
          blt.GetGlobalCoo(bltXg,bltYg);
          if (X>(bltXg-6)) and (X<(bltXg+6)) and
             (Y>(bltYg-6)) and (Y<(bltYg+6)) then
              begin
                blt.SetDrawParms(3,clRed,clRed);
                blt.Draw;
                iTemp:=i;
                result:=true;
              end
                else
              begin
                blt.SetDrawParms(2,clBlack,clBlack);
                Blt.Draw;
              end;
        end;
      end;

///
  if Izomode then
    N7Click(Self); 
///
      blt:=blts.Items[iTemp];
      blt.GetLocalCoo(hD,vD);
      StatusBar1.Panels[1].Text:=floattostr(abs(hD));
      StatusBar1.Panels[3].Text:=floattostr(abs(vD));
      blt.GetGlobalCoo(bltXg,bltYg);
      N1.Enabled:=true;
      N2.Enabled:=true;


end;

procedure TForm1.ReDraw;
var i:integer;
    Xt,Yt,Rv,X1,Y1,Fi,X2,Y2: extended;
    BltL :TBolt;
begin
  ClearCanvas;///
  if Izomode then IzoAxles else Axles;
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  if Izomode then
  begin
    Detal.DrawDet(1);
    {for i:=0 to blts.Count-1 do
    begin
      blt:=blts[i];
      Rv:=blt.GetRV;
      blt.GetLocalCoo(X1,Y1);
      tmpXY[0,i]:=X1;
      tmpXY[1,i]:=Y1;
      fi:=blt.GetAngle;
      X2:=cenX+round(Rv*cos((Fi+30)*pi/180)*cos(30*pi/180));
      Y2:=cenY-round(Rv*sin((Fi+30)*pi/180)*sin(30*pi/180));
      blt.SetXY(X2,Y2);
      blt.IzoDraw;  }
   end
  else
  begin
   Detal.DrawDet(0);
   {for i:=0 to blts.Count-1 do
    begin
      blt:=blts.Items[i];
      blt.SetCenter(cenX,cenY);
      blt.GetLocalCoo(Xt,Yt);
      Xt:=cenX+Xt;
      Yt:=cenY+Yt;
      blt.SetXY(Xt,Yt);
      blt.SetDrawParms(2,clBlack,clBlack);
      Blt.Draw;
    end; }
  end;  
end;

procedure TForm1.ClearCanvas;
begin
  Image1.Canvas.Brush.Style:=bsSolid;
  Image1.Canvas.FillRect(Form1.ClientRect);
  Image1.Canvas.Brush.Style:=bsClear;
end;

procedure TForm1.Delay(Seconds,Milli:Word);
var TimeOut:TDateTime;
begin
  TimeOut:=Now+EncodeTime(0,Seconds div 60,Seconds mod 60,Milli);
  While Now<TimeOut do
    Application.ProcessMessages;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  IzoMode:=false;
  blts:=TList.Create;
  blts2:=TList.Create;
  ForList:=TList.Create;
  MomList :=TList.Create;
  FrcMnL  :=TList.Create;
  MomMnL  :=TList.Create;
  cenX:=Round(Form1.ClientWidth/2);
  cenY:=Round(Form1.ClientHeight/2);
  GetDir(0,dir);
  OpenDialog1.InitialDir:=dir;
  SaveDialog1.InitialDir:=dir;
  Axles;
  tbBoltPermClick(self);
  tbPlane.Enabled := false;
  DecimalSeparator:=',';
  FileToMas(7,dir+'\bolts.txt',masBol);
  Timer1.Enabled:=true;
  ktBezop:=2;
  //PopupMenu3.Items.a
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if not IzoMode then
 begin
  if tbBoltPerm.Down then
    if Button=mbLeft then
      begin
        AddBolt(X,Y,cenX,cenY);
        N8Click(Self);

      end;
  if (tbSel.Down)and(scale=1) then
    if blts.Count<>0 then
      begin
        if Button=mbLeft then
          if SelAndReDraw(X,Y) then
            begin
              selBX:=X;
              selBY:=Y;
              N23.Enabled      := true;
              tbDelBlt.Enabled := true;
              Image1.PopupMenu := PopupMenu2;
            end
          else
            begin
              N23.Enabled      := false;
              tbDelBlt.Enabled := false;
              Image1.PopupMenu := nil;
            end;
     end;
 end;
if Button=mbRight then
 if IzoMode then
  Image1.PopupMenu:=nil;

if tbPan.Down then
  begin
    dx:=X;
    dy:=Y;
    cXold:=cenX;
    cYold:=cenY;
  end;
//N6Click(Self);

end;


procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if IzoMode then
    with Image1.Canvas do
      begin




      end;
end;

procedure TForm1.N1Click(Sender: TObject);
var i:integer;
    tmpCooX,tmpCooY:extended;
begin
  PlaceF.CheckBox1.Enabled:=true;
  if (PlaceF.ShowModal=mrOK) and (blt<>nil)then
  begin
  for i:=0 to Num-1 do
    begin
     blt.GetGlobalCoo(tmpCooX,tmpCooY);
     tmpCooY:=tmpCooY+range;
     if not AddBolt(round(tmpCooX),round(tmpCooY),cenX,cenY) then
     exit;
    end;
  end
  else
  ShowMessage('Выберите отсчетный болт');
end;

procedure TForm1.N2Click(Sender: TObject);
var i:integer;
    tmpCooX,tmpCooY:extended;
begin
  PlaceF.CheckBox1.Enabled:=true;
  if (PlaceF.ShowModal=mrOK) and (blt<>nil)then
  begin
  for i:=0 to Num-1 do
    begin
     blt.GetGlobalCoo(tmpCooX,tmpCooY);
     tmpCooX:=tmpCooX+range;
     if not AddBolt(Round(tmpCooX),Round(tmpCooY),cenX,cenY) then
     exit
    end;
  end
  else
  ShowMessage('Выберите отсчетный болт');
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  DeleteBolt;
  Axles;
  ReDraw;
  tbDelBlt.Enabled := false;
  N3.Enabled       := false;
  N23.Enabled      := false;
  Image1.PopupMenu := nil;

end;


procedure TForm1.N4Click(Sender: TObject);
var i,tX,tY:Integer;
    alfa:extended;

begin
  PlaceF.CheckBox1.Enabled:=false;
  PlaceF.Label3.Enabled:=false;
  PlaceF.SpinEdit3.Enabled:=false;
  if PlaceF.ShowModal=mrOK then
  begin
    alfa:=0;
    For i:=0 to Num-1 do
      begin
        tX:=cenX+Round(Range*cos(alfa*pi/180));
        tY:=cenY+Round(Range*sin(alfa*pi/180));
        AddBolt(tX,tY,cenX,cenY);
        Alfa:=alfa+360/Num;
      end;
  end;
  N1.Enabled:=true;
  N2.Enabled:=true;
end;

procedure TForm1.N7Click(Sender: TObject);
var
   i:integer;
   Rv,fi,X1,Y1,X2,Y2:extended;
  // arr: array of array of extended;
begin
  if Detal<>nil then
  begin
  ClearCanvas;
  //blts:=blts2;
  SetLength(tmpXY,2,blts.Count);
  Detal.SetCen(cenX,cenY);
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  Detal.DrawDet(1);
  IzoAxles;

  for i:=0 to blts.Count-1 do
    begin
     // blt:=blts2[i];
      Rv:=arr[0,i]{blt.GetRV};
      fi:=arr[1,i]{blt.GetAngle};
      blt:=blts[i];
      blt.SetCenter(cenX,cenY);
      X2:=cenX+round(Scale*Rv*cos((Fi+30)*pi/180)*cos(30*pi/180));
      Y2:=cenY-round(Scale*Rv*sin((Fi+30)*pi/180)*sin(30*pi/180));
      blt.SetXY(X2,Y2);
      blt.IzoDraw;
    end;

  for i:=0 to ForList.Count-1 do
    begin
      Frc:=Forlist[i];
      Frc.SetCenter(cenX,cenY);
      frc.SetDrPar(clBlue,clRed,clGreen,3);
      Frc.DrawF;
    end;

  for i:=0 to MomList.Count-1 do
    begin
      Mom:=Momlist[i];
      Mom.SetCenterXY(cenX,cenY);
      mom.Draw;
    end;

  N7.Enabled            := false;
  IzoMode               := true;
  N25.Enabled           := true;
  N23.Enabled           := false;
  N26.Enabled           := false;
  tbPlane.Enabled       := true;
  tbIzom.Enabled        := false;
  tbSel.Enabled         := false;
  tbBoltPerm.Enabled    := false;
  tbDelBlt.Enabled      := false;
  N35.Enabled           := true;
  N36.Enabled           := true;
  tbScNew.Enabled       := false;
  tbScSave.Enabled      := false;
  tbScOpen.Enabled      := false;
  N33.Enabled           := false;
  N18.Enabled           := false;
  tbRect.Enabled        := false;
  tbCir.Enabled         := false;

  if (MomList.Count>0) or (ForList.Count>0) then tbRunCalc.Enabled:=true;
  end;

end;

procedure TForm1.N6Click(Sender: TObject);
var
   i:integer;
   X1,Y1,
   X2,Y2:extended;
begin
  ClearCanvas;
  Axles;

  SetLength(tmpXY,2,blts.Count);
  detal.SetCen(CenX,CenY);
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  Detal.DrawDet(0);
  for i:=0 to blts.Count-1 do
    begin
      blt:=blts2[i];
      blt.GetLocalCoo(X1,Y1);
      tmpXY[0,i]:=X1;
      tmpXY[1,i]:=Y1;
      X2:=(cenX+Scale*X1);
      Y2:=(cenY+Scale*Y1);
      blt:=blts[i];
      Blt.SetCenter(cenX,cenY);
      blt.SetXY(round(X2),round(Y2));
      blt.Draw;
    end;
  N7.Enabled            := true;
  IzoMode               := false;
  N26.Enabled           := true;
  N25.Enabled           := false;
  tbSel.Enabled         := true;
  tbBoltPerm.Enabled    := true;
  tbPlane.Enabled       := false;
  tbIzom.Enabled        := true;
  tbDelBlt.Enabled      := false;
  N35.Enabled           := false;
  N36.Enabled           := false;
  tbScNew.Enabled       := true;
  tbRunCalc.Enabled     := false;
  tbScOpen.Enabled      := true;
  tbScSave.Enabled      := true;
  N33.Enabled           := true;
  N19.Enabled           := true;
  N18.Enabled           := true;
  tbRect.Enabled        := true;
  tbCir.Enabled         := true;
end;



procedure TForm1.N8Click(Sender: TObject);
var {chX1,chY1,i,t1,t2:integer;}
    chX,chY,lH,lV:extended;
    i: integer;
    b: TBolt;
begin
  i:=blts.IndexOf(blt);
  b:=blts2[i];
  b.GetLocalCoo(lH,lV);
  form2.SpinEdit1.Value:=Round(abs(lH));
  form2.SpinEdit2.Value:=Round(abs(lV));
  if form2.ShowModal=mrOK then
    begin
    b.ChangeCooBlt(nHorDim,nVerDim);
    Blt.ChangeCooBlt(nHorDim,nVerDim);
    N6Click(self);
    end;
  blts2[i]:=b;
    for i:=0 to blts2.Count-1 do
      begin
        b:=blts2[i];
        arr[0,i]:=b.GetRV;
        arr[1,i]:=b.GetAngle;
       end;
end;


procedure TForm1.N10Click(Sender: TObject);
var F:TextFile;
    Xt,Yt:Extended;
begin
  if (Detal<>nil) then
    N12Click(Self);
  Detal:=TFpmDetail.Create;
  Detal.SetHolst(Image1.Canvas);
  Detal.SetCen(cenX,cenY);
  tbBoltPerm.Enabled:=true;
  tbSel.Enabled:=true;
  With OpenDialog1 do
   if Execute then
   begin
    AssignFile(F,FileName);
    Reset(F);
    Read(F,FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
    Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
    Detal.DrawDet(0);
    while not Eof(F) do
      begin
        ReadLn(F,Xt,Yt);
        Xt:=cenX+Xt;
        Yt:=cenY+Yt;
        AddBolt(Round(Xt),Round(Yt),cenX,CenY)
      end;

    CloseFile(F);
    N44.Enabled:=false;
    N45.Enabled:=false;
    tbRect.Enabled:=false;
    tbCir.Enabled:=false;
    tbZoomIn.Enabled:=true;
    tbZoomOut.Enabled:=true;

  end;

  tbPan.Down:=false;
  tbRep.Enabled     := false;
  nRep.Enabled      := false;
  tbRepFull.Enabled := false;
  nRepFull.Enabled  := false;

end;


procedure TForm1.N11Click(Sender: TObject);
var F:TextFile;
    i:Integer;
    Xt,Yt:extended;
begin
  With SaveDialog1 do
    if Execute then
      begin
        AssignFile(F,FileName+'.bf');
        Rewrite(F);
        Detal.GetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet,Ast,Wstxx,Wstyy);
        WriteLn(F,FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
        for i:=0 to blts.Count-1 do
          begin
            blt:=blts[i];
            blt.GetLocalCoo(Xt,Yt);
            WriteLn(F,Xt,' ',Yt)
          end;
        CloseFile(F);
      end;
end;

procedure TForm1.N12Click(Sender: TObject);
var i:integer;
begin
  if Detal<>nil then
  Detal:=nil;
  blts.Clear;
  blts2.Clear;
  ClearCanvas;
  Axles;
  N1.Enabled         := false;
  N2.Enabled         := false;
  tbRunCalc.Enabled  := false;
  tbRect.Enabled:=true;
  tbCir.Enabled:=true;
  N44.Enabled:=true;
  N45.Enabled:=true;
  tbBoltPerm.Enabled:=false;
  tbSel.Enabled:=false;
  for i:=0 to MomList.Count-1 do
   begin
     mom:=momlist[i];
     Mom:=nil;
   end;
  for i:=0 to ForList.Count-1 do
    begin
      Frc:=Forlist[i];
      Frc:=nil;
    end;
  DelFrcAndMomFromMenus;
  for i:=0 to Blts.Count-1 do
    begin

    end;
   tbPan.Down:=false;
   tbRep.Enabled:=false;
   tbZoomIn.Enabled:=false;
   tbZoomOut.Enabled:=false;
   ForList.Count:=0;

   tbRep.Enabled     := false;
   nRep.Enabled      := false;
   tbRepFull.Enabled := false;
   nRepFull.Enabled  := false;
end;

procedure TForm1.Axles;
begin
  with Image1.Canvas do
    begin
      pen.Width  := 1;
      pen.Style  := psDashDot;
      pen.Color  := clBlack;
      MoveTo(40,cenY);                      //
      LineTo(2*cenX-40,cenY);                 //   Осевые
      MoveTo(cenX,40);                        //
      LineTo(cenX,2*cenY-60);
      font.Color:=clBlack;
      font.Name:='GOST type B';
      Font.Size:=12;
      font.Style:=[fsItalic];
      TextOut(2*cenX-40,cenY,'OX');
      TextOut(cenX+12,40,'OY');
      MoveTo(2*cenX-40,cenY);
      LineTo(2*cenX-40-12,cenY-4);
      MoveTo(2*cenX-40,cenY);
      LineTo(2*cenX-40-12,cenY+4);

      MoveTo(cenX,40);
      LineTo(cenX-4,40+12);
      MoveTo(cenX,40);
      LineTo(cenX+4,40+12);


    end;
end;

procedure TForm1.IzoAxles;
begin
   with Image1.Canvas do
     begin
      pen.Width  := 1;
      pen.Style  := psDashDot;
      pen.Color  := clBlack;
      MoveTo(cenX,cenY);
      LineTO(cenX+round(500*cos(30*pi/180)*cos(30*pi/180)),     // OX положит
             cenY-round(500*sin(30*pi/180)*sin(30*pi/180)));    //
      MoveTo(cenX,cenY);
      LineTO(cenX+round(500*cos(150*pi/180)*cos(60*pi/180)),    //  OY вверх
             cenY-round(500*sin(150*pi/180)*sin(60*pi/180)));   //
      MoveTo(cenX,cenY);
      LineTO(cenX+round(500*cos(-30*pi/180)*cos(60*pi/180)),    //  OY вниз
             cenY-round(500*sin(-30*pi/180)*sin(60*pi/180)));   //
      MoveTo(cenX,cenY);
      LineTO(cenX+round(500*cos(-150*pi/180)*cos(30*pi/180)),   //  OX влево
             cenY-round(500*sin(-150*pi/180)*sin(30*pi/180)));  //
      MoveTo(cenX,40);
      LineTo(cenX,2*cenY-40);
      font.Color:=clBlack;
      font.Name:='GOST type B';
      Font.Size:=12;
      font.Style:=[fsItalic];
      TextOut(CenX+12,30,'OZ');
      TextOut(cenX+round(500*cos(-30*pi/180)*cos(60*pi/180)),
             cenY-round(500*sin(-30*pi/180)*sin(60*pi/180)),'OY');
      TextOut(cenX+round(500*cos(-150*pi/180)*cos(30*pi/180)),
             cenY-round(500*sin(-150*pi/180)*sin(30*pi/180)),'OX');
      MoveTo(cenX,30);
      LineTo(cenX-3,30+12);
      MoveTo(cenX,30);
      LineTo(cenX+3,30+12);
      MoveTo(cenX+round(500*cos(30*pi/180)*cos(30*pi/180)),
             cenY-round(500*sin(30*pi/180)*sin(30*pi/180)));
      LineTo(cenX+3+round(488*cos(30*pi/180)*cos(30*pi/180)),
             cenY+3-round(488*sin(30*pi/180)*sin(30*pi/180)));
      MoveTo(cenX+round(500*cos(30*pi/180)*cos(30*pi/180)),
             cenY-round(500*sin(30*pi/180)*sin(30*pi/180)));
      LineTo(cenX-3+round(488*cos(30*pi/180)*cos(30*pi/180)),
             cenY-3-round(488*sin(30*pi/180)*sin(30*pi/180)));

      MoveTo(cenX+round(500*cos(150*pi/180)*cos(60*pi/180)),
             cenY-round(500*sin(150*pi/180)*sin(60*pi/180)));
      LineTO(cenX-3+round(488*cos(150*pi/180)*cos(60*pi/180)),
             cenY+3-round(488*sin(150*pi/180)*sin(60*pi/180)));
      MoveTo(cenX+round(500*cos(150*pi/180)*cos(60*pi/180)),
             cenY-round(500*sin(150*pi/180)*sin(60*pi/180)));
      LineTO(cenX+3+round(488*cos(150*pi/180)*cos(60*pi/180)),
             cenY-3-round(488*sin(150*pi/180)*sin(60*pi/180)));
     end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
  var i: integer;
begin
  for i:=0 to blts.Count-1 do
    begin
      blt:=blts[i];
      blt.Free;
    end;
  blts.Free;
  blts2.Free;
  MomList.Free;
  ForList.Free;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
  if ForMom.ShowModal= mrOK then
    begin
      Mom:=Tmoment.create;
      Mom.SetCanvas(Form1.Image1.Canvas);
      Mom.SetAxle(ForMom.momAx);
      Mom.SetZnak(ForMom.momVal);
      Mom.SetValue(ForMom.momval*1000);
      mom.SetXY(400,400);
      mom.SetCenterXY(form1.cenX,form1.cenY);
      mom.SetDrawParms(1,clBlack);
      MomList.Add(Mom);
      Mom.Draw;
      tbRunCalc.Enabled := true;
      AddMomentToMenu;
      NDelMom.Enabled   := true;
    end else
  tbRunCalc.Enabled := false;

end;

procedure TForm1.tbDelBltClick(Sender: TObject);
begin
  DeleteBolt;
  //ClearCanvas;
 // Axles;
 // ReDraw;
  N6Click(Self);
  tbDelBlt.Enabled :=false;
  N3.Enabled       := false;
  N23.Enabled      := false;
  Image1.PopupMenu := nil;
end;

procedure TForm1.tbSelClick(Sender: TObject);
begin
tbBoltPerm.Down:=not tbSel.Down
end;

procedure TForm1.tbBoltPermClick(Sender: TObject);
begin
tbSel.Down := not tbBoltPerm.Down;
tbScSave.Enabled := true;
end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
{if blts.Count<>0 then
  if not IzoMode then
    if tbSel.Down then
      begin
        if Dim <> nil then
         Dim.Free;
        blt.GetGlobalCoo(XbD,YbD);
        ClearCanvas;
        ReDraw;
        SelAndReDraw(Round(XbD),Round(YbD));
        Dim:=TDimension.Create;
        dim.SetCen(cenX,cenY);
        Dim.SetHolst(Image1.Canvas);
        Dim.SetDrawParams(12,1,clBlack,psSolid);
        blt.GetLocalCoo(HDD,VDD);
        Dim.DrawDim(Round(XbD),Round(YbD),Round(HDD),Round(VDD));
      end;  }
end;

procedure TForm1.N44Click(Sender: TObject);
begin

  Detal:=TFpmDetail.Create;
  Detal.SetHolst(Image1.Canvas);
  Detal.SetCen(cenX,cenY);
  fdet.Image1Click(fdet.Image3);
  if FDet.ShowModal=mrOK then
    begin
       tbSel.Enabled      := true;
       tbPlane.Enabled    := false;
       tbIzom.Enabled     := true;
       tbBoltPerm.Enabled := true;
       tbRect.Enabled     := false;
       tbCir.Enabled      := false;
       N44.Enabled        := false;
       N45.Enabled        := false;
    end else
    begin
       tbSel.Enabled      := false;
       tbBoltPerm.Enabled := false;
       tbPlane.Enabled    := false;
       tbIzom.Enabled     := false;
       tbRect.Enabled     := true;
       tbCir.Enabled      := true;
       N44.Enabled        := true;
       N45.Enabled        := true;
    end;
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  Detal.DrawDet(0);
  tbScSave.Enabled:=true;
end;

procedure TForm1.N45Click(Sender: TObject);
begin
  Detal:=TFpmDetail.Create;
  Detal.SetHolst(Image1.Canvas);
  Detal.SetCen(cenX,cenY);
  fdet.Image1Click(fdet.Image1);
  FDet.ShowModal;
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  Detal.DrawDet(0);
end;

procedure TForm1.tbRunCalcClick(Sender: TObject);
var lxc,lyc,SigmaMax, MomentXoZ ,MomentYoZ,
    VFmax ,VFr: extended;
begin
  try
  LocalCenterBoltField(lxc,lyc);
  DeterminationMaxForceOnBolt(lxc,lyc,Fmax);
  OpeningTakeoff(lxc,lyc,ktZap,SigmaMax, Fzat,MomentXoZ ,MomentYoZ);
  detal.GetParamsStyk(Fdet.A,Fdet.B,Fdet.A1,Fdet.B1,Fdet.D,Fdet.D1,Fdet.Hdet,Ast,Wstxx,Wstyy);
  CalcForceAndDiameter(lxc,lyc,Fmax,Fzat,Fdet.Hdet,ktTr{коэф трения},ktZap{коэф запаса},ktBezop,SigmaTB,sigmaTD,SigmaMax,2,
                       MomentXoZ ,MomentYoZ,Vd1OnZaz,Vd1NotZaz , VFmax ,VFr,VFzatOnZaz,VFzatNotZaz);
  Mzaz:=DetermDiam(Vd1OnZaz);
  MNotzaz:=DetermDiam(Vd1NotZaz);
  except
    on E: Exception do ShowMessage('Расчет не выполнен. Свяжитесь с разработчиками');
  end;
   tbRep.Enabled     := true;
   nRep.Enabled      := true;
   tbRepFull.Enabled := true;
   nRepFull.Enabled  := true;
end;

procedure TForm1.NAddFClick(Sender: TObject);
begin
  if form3.ShowModal=mrOk then
  begin
    Frc:=TForce.Create;
    Frc.SetCenter(cenX,cenY);
    Frc.SetCanvas(Image1.Canvas);
    frc.SetDrPar(clBlue,clRed,clGreen,3);
    frc.SetCoords(form3.fX,form3.fY,form3.fZ);
    frc.SetCompOfForce(form3.fFx,form3.fFy,form3.fFz);
    ForList.Add(Frc);
    Frc.DrawF;
    tbRunCalc.Enabled:=true;
    NFrcDel.Enabled:=true;
    AddForceToMenu;
  end;
 // N7Click(Self);
//  FullRedraw;
end;

procedure TForm1.FormResize(Sender: TObject);
var i:integer;
    X1,X2,Y1,Y2:extended;
begin
  Image1.ClientWidth:=Form1.ClientWidth;
  Image1.ClientHeight:=Form1.ClientHeight;
  cenX:=Round(Image1.ClientWidth/2);
  cenY:=Round(Image1.ClientHeight/2);
  ClearCanvas;
  if Izomode then IzoAxles else Axles;
  {if (Detal<>nil)and(Blts.Count>0) then
    begin
      Detal.SetCen(cenX,cenY);
      if IzoMode then
        begin
          Detal.DrawDet(1);
          N7Click(Self);
        end else
        begin
          Detal.DrawDet(0);
        end;
      ReDraw;
    end;
  if IzoMode then
    begin
     IzoAxles;
     for i:=0 to ForList.Count-1 do
       begin
         Frc:=Forlist[i];
         Frc.SetCenter(cenX,cenY);
         frc.SetDrPar(clBlue,clRed,clGreen,3);
         Frc.DrawF;
       end;
     for i:=0 to MomList.Count-1 do
       begin
         Mom:=Momlist[i];
         Mom.SetCenterXY(cenX,cenY);
         Mom.Draw;
       end;
    end
     else Axles; }
  if (Detal<>nil)and(Blts.Count>0) then
    if Izomode then N7Click(Self) else N6Click(Self);

  for i:=0 to blts.Count-1 do
    begin
      blt:=blts[i];
      X1:=tmpXY[0,i];
      Y1:=tmpXY[1,i];
      X2:=cenX+X1;
      Y2:=cenY+Y1;
      Blt.SetCenter(cenX,cenY);
      blt.SetXY(round(X2),round(Y2));
   end;
 { if fRep.Visible then
  begin
  fRep.TreeView1.Height:=Height-170;
  fRep.SpeedButton1.Top:=fRep.TreeView1.Height+40;
  fRep.SpeedButton2.Top:=fRep.TreeView1.Height+65;
  end;  }
end;

procedure TForm1.tbChStClick(Sender: TObject);
var tA,tB,tA1,tB1,tD,tD1,tHdet:extended;
begin
if not IzoMode then
  if Detal<>nil then
    begin
    Detal.GetParamsStyk(tA,tB,tA1,tB1,tD,tD1,tHdet,Ast,Wstxx,Wstyy);
      with FDet do
      begin
        edD.Text    := floattostr(tD);
        edD1.Text   := floattostr(tD1);
        edA.Text    := floattostr(tA);
        edA1.Text   := floattostr(tA1);
        edB.Text    := floattostr(tB);
        edB1.Text   := floattostr(tB1);
        edHdet.Text := floattostr(tHdet);
        if(tD<>0)and(tD1=0)and(tA=0)and(tB=0)then
        Image1Click(Fdet.Image1);
        if(tD<>0)and(tD1<>0)and(tA=0)and(tB=0)then
        Image1Click(Fdet.Image2);
        if(tD=0)and(tD1=0)and(tA<>0)and(tB<>0)then
        Image1Click(Fdet.Image3);
        if(tD=0)and(tD1=0)and(tA<>0)and(tB<>0)and(tA1<>0)and(tB1<>0)then
        Image1Click(Fdet.Image4);
      end;

    if  FDet.ShowModal=MrOk then
    begin
      ClearCanvas;
      Axles;
      ReDraw;
      Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
      Detal.DrawDet(0);
      exit;
    end   else
      begin
        Detal.GetParamsStyk(tA,tB,tA1,tB1,tD,tD1,tHdet,Ast,Wstxx,Wstyy);
        Detal.SetParamsStyk(tA,tB,tA1,tB1,tD,tD1,tHdet);
        Detal.DrawDet(0);
        exit;
      end;
   end;
end;

procedure TForm1.AddForceToMenu;
begin
  it:=TMenuItem.Create(Form1);                       //
  it.Tag:=ForList.IndexOf(Frc)+1;
  it.Name:='NFrc'+inttostr(it.Tag);                  //  Добавление
  it.Caption:='Сила № '+inttostr(it.Tag);            //  эл-та в Подменю
  it.Visible:=true;
  it.OnClick:=tstNClick;
  N35.Add(it);                                       //
  FrcMnL.Add(it);

end;

procedure TForm1.tstNClick(Sender: TObject);
var vFx,vFy,vFz,vCFx,vCFy,vCFz: extended;
begin
  NFrcDel.Enabled:=true ;
  if (((Sender as TMenuItem).tag-1)>=0) then
  Frc:=Forlist[(Sender as TMenuItem).tag-1];
  SelFrc:=(Sender as TMenuItem).MenuIndex;
  it:=N35.Items[SelFrc];
  frc.SetDrPar(clBlue,clRed,clGreen,5);
  with Form3 do
    begin
      frc.GetCoords(vFx,vFy,vFz);
      frc.GetCompOfForce(vCFx,vCFy,vCFz);
      Edit1.Text :=floattostrf(vFx,ffFixed,8,8);
      Edit2.Text :=floattostrf(vFy,ffFixed,8,8);
      Edit3.Text :=floattostrf(vFz,ffFixed,8,8);
      Edit4.Text:=floattostr(vCFx);
      Edit5.Text:=floattostr(vCFy);
      Edit6.Text:=floattostr(vCFz);
      if ShowModal=mrOk then
        begin
        frc.SetCoords(Form3.fX,Form3.fY,Form3.fZ);
        frc.SetCompOfForce(Form3.fFx,Form3.fFy,Form3.fFz);
        end;
      frc.DrawF;
    end;
  //ForMom.Show;
  if Izomode then N7Click(Self) else N6Click(Self);

end;

procedure TForm1.NFrcDelClick(Sender: TObject);
var i: integer;
begin
  FrcMnL.Delete(FrcMnL.IndexOf(it));
  it.Free;
  ForList.Delete(ForList.IndexOf(Frc));
  Frc.Free;
  NFrcDel.Enabled:=false;
  if(ForList.Count=0)then
    tbRunCalc.Enabled:=true;
  tbRunCalc.Enabled:=false;
  {Полная перерисовка}
  if IzoMode then N7Click(Self) else N6Click(Self);

   if (ForList.Count=0)and(MomList.Count=0) then
     begin
       tbRunCalc.Enabled := false;
       tbRep.Enabled     := false;
       nRep.Enabled      := false;
       tbRepFull.Enabled := false;
       nRepFull.Enabled  := false;
     end;


end;

procedure TForm1.testMClick(Sender: TObject);
begin
  NDelMom.Enabled:=true ;
  if (((Sender as TMenuItem).tag-1)>=0) then
  Mom:=Momlist[(Sender as TMenuItem).tag-1];
  SelMom:=(Sender as TMenuItem).MenuIndex;
  it2:=N36.Items[SelMom];

  mom.SetDrawParms(2,clNavy);
  with ForMom do
    begin
      ComboBox1.Text := mom.GetAxle;
      Edit1.Text     := floattostr(mom.GetValue);
      if ShowModal=mrOk then
        begin
          Mom.SetAxle(momAx);
          Mom.SetZnak(momVal);
          Mom.SetValue(momVal);
        end;
      Mom.Draw;
    end;
  if Izomode then N7Click(Self) else N6Click(Self);
end;

procedure TForm1.AddMomentToMenu;
begin
  it2:=TMenuItem.Create(Form1);
  it2.Tag:=MomList.IndexOf(Mom)+1;
  it2.Name:='NMom'+inttostr(it2.Tag);                  //  Добавление
  it2.Caption:='Момент № '+inttostr(it2.Tag);          //  эл-та в Подменю
  it2.Visible:=true;
  it2.OnClick:=testMClick;
  N36.Add(it2);
  MomMnL.Add(it2);

end;

procedure TForm1.NDelMomClick(Sender: TObject);
begin
  MomMnL.Delete(MomMnL.IndexOf(it2));
  it2.Free;
  MomList.Delete(MomList.IndexOf(Mom));
  //it2.Free;
  Mom.Free;
  NDelMom.Enabled:=false;
  {if(MomList.Count=0)then
    tbRunCalc.Enabled:=true;}
  if IzoMode then N7Click(Self) else N6Click(Self);
     if (ForList.Count=0)and(MomList.Count=0) then
     begin
       tbRunCalc.Enabled := false;
       tbRep.Enabled     := false;
       nRep.Enabled      := false;
       tbRepFull.Enabled := false;
       nRepFull.Enabled  := false;
     end;

end;

procedure TForm1.DelFrcAndMomFromMenus;
var i: integer;
begin
  for i:= 0 to MomMnL.Count-1 do
    begin
      it2:=MomMnL[i];
      it2.Free;
    end;
  for i:= 0 to FrcMnL.Count-1 do
    begin
      it:=FrcMnL[i];
      it.Free;
    end;
 { MomMnL:=nil;
  FrcMnL:=nil;
  ForList:=nil;
  MomList:=nil;}

end;

procedure TForm1.FullRedraw;
var i: integer;
begin
  ClearCanvas;
  if (Detal<>nil)and(Blts.Count>0){and()} then
    begin
      Detal.SetCen(cenX,cenY);
      if IzoMode then
        begin
          //Detal.DrawDet(1);
          N7Click(Self);
        end
      else
        begin
          //Detal.DrawDet(0);
          N6Click(Self);
        end;
      //ReDraw;
    end;
  if IzoMode then
    begin
     IzoAxles;
     for i:=0 to ForList.Count-1 do
       begin
         Frc:=Forlist[i];
         Frc.SetCenter(cenX,cenY);
         frc.SetDrPar(clBlue,clRed,clGreen,3);
         Frc.DrawF;
       end;
     for i:=0 to MomList.Count-1 do
       begin
         Mom:=Momlist[i];
         Mom.SetCenterXY(cenX,cenY);
         mom.SetDrawParms(1,clBlack);
         Mom.Draw;
       end;
    end
     else Axles;


end;

procedure TForm1.GetReport;
var tA,tB,tA1,tB1,tD,tD1,tHdet:extended;
    tHorDim,tVertDim,tFX,tFY,tFZ,tFXC,tFYC,tFZC: extended;
    i: integer;
    MomL: TMoment;
    BltL: TBolt;
    FrcL: TForce;
begin
 RepTxt:=TStringList.Create;
 //MomL:=TMoment.Create;
 //BltL:=TBolt.Create;
 //FrcL:=TForce.Create;
 Detal.GetParamsStyk(tA,tB,tA1,tB1,tD,tD1,tHdet,Ast,Wstxx,Wstyy);
 RepTxt.Add('Стык :');

        if(tD<>0)and(tD1=0)and(tA=0)and(tB=0)then
          begin
            RepTxt.Add('  Форма : круг');
            RepTxt.Add('  Диаметр : '+floattostr(tD)+' мм');
          end;
        if(tD<>0)and(tD1<>0)and(tA=0)and(tB=0)then
          begin
            RepTxt.Add('  Форма : круглый фланец');
            RepTxt.Add('  Внешний диаметр : '+floattostr(tD)+' мм');
            RepTxt.Add('  Внутренний диаметр : '+floattostr(tD1)+' мм');
          end;
        if(tD=0)and(tD1=0)and(tA<>0)and(tB<>0)then
          begin
            RepTxt.Add('  Форма : прямоугольник');
            RepTxt.Add('  Ширина : '+floattostr(tA)+' мм');
            RepTxt.Add('  Длина : '+floattostr(tB)+' мм');
          end;
        if(tD=0)and(tD1=0)and(tA<>0)and(tB<>0)and(tA1<>0)and(tB1<>0)then
          begin
            RepTxt.Add('  Форма : прямоугольный фланец');
            RepTxt.Add('  Ширина : '+floattostr(tA)+' мм');
            RepTxt.Add('  Длина : '+floattostr(tB)+' мм');
            RepTxt.Add('  Ширина выреза : '+floattostr(tA1)+' мм');
            RepTxt.Add('  Длина выреза : '+floattostr(tB1)+' мм');
          end;

 RepTxt.Add('Болтовое поле :');
 for i:=0 to blts.Count-1 do
   begin
     bltL:=blts2[i];
     bltL.GetLocalCoo(tHorDim,tVertDim);
     RepTxt.Add('  Болт №'+inttostr(i+1)+' : ГОР = '+floattostr(tHorDim)+' мм ; ВЕР = '+floattostr(tVertDim)+' мм');
   end;

 RepTxt.Add('Приложенная нагрузка :');
 for i:=0 to ForList.Count-1 do
   begin
     FrcL:=ForList[i];
     FrcL.GetCoords(tFX,tFY,tFZ);
     FrcL.GetCompOfForce(tFXC,tFYC,tFZC);
     RepTxt.Add('  Сила №'+inttostr(i+1)+' : X = '+floattostr(tFX)+' мм ; Y = '+floattostr(tFY)+' мм; Z = '+floattostr(tFZ)+' мм');
     RepTxt.Add('  Сила №'+inttostr(i+1)+' : FX = '+floattostr(tFXC)+' H ; FY = '+floattostr(tFYC)+' H; FZ = '+floattostr(tFZC)+' H');
   end;
 for i:=0 to MomList.Count-1 do
   begin
      MomL:=MomList[i];
      RepTxt.Add('  Момент №'+inttostr(i+1)+' : Ось: '+MomL.GetAxle+' ; Значение = '+floattostr(MomL.GetValue/1000)+' Н*м');
   end;
 RepTxt.Add('Настройки расчета:');
 RepTxt.Add('  Коэффициент запаса: ' +floattostr(ktZap));
 RepTxt.Add('  Коэффициент трения: ' +floattostr(ktTr));
 RepTxt.Add('  Коэффициент безопасности резьбы: ' +floattostr(ktBezop));
 RepTxt.Add('  Материал детали: ' +opt_u.Form4.ComboBox1.Text);
 RepTxt.Add('  Предел текучести материала болта: ' +opt_u.Form4.Edit3.text);

 RepTxt.Add('Результаты расчета :');
 RepTxt.Add('  Максимальная сила по условию нераскрытия стыка : '+floattostrf(Fzat,ffFixed,5,5)+' H');
 RepTxt.Add('  Максимальная сила по условию отсутствия сдвига : '+floattostrf(Fmax,ffFixed,5,5)+' H');    // Юра ГДЕ ЭТО???
 RepTxt.Add('  Сила затяжки болта с зазором : '+floattostrf(VFzatOnZaz,ffFixed,8,8)+' H');
 RepTxt.Add('  Сила затяжки болта с без зазора : '+floattostrf(VFzatNotZaz,ffFixed,5,5)+' H');
 RepTxt.Add('  Рекомендуемый болт без зазора : '+MNotzaz{floattostrf(Vd1NotZaz,ffFixed,5,5)+' мм'});
 RepTxt.Add('  Рекомендуемый болт с зазором : '+Mzaz{floattostrf(Vd1OnZaz,ffFixed,5,5)+' мм'});

 MomL:=nil;
 BltL:=nil;
 FrcL:=nil;

end;

procedure TForm1.tbRepClick(Sender: TObject);
begin
  GetReport;
// MessageBox(handle,RepTxt.GetText,'Отчет',0);
  RepTxt.SaveToFile(dir+'\Report.txt');

//  FullRep.showmodal;
  repNewClick(Self);
  WinExec(Pchar('notepad.exe '+dir+'\Report.txt'),1);
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if tbPan.Down then
    begin
      cenX:=cenX+(X-dx);
      cenY:=cenY+(Y-dy);
      //FullRedraw ;
      if IzoMode then
      N7Click(self) else
      N6Click(self); 
      if (not Izomode)and(blts.Count>0) then
      SelAndReDraw(selBX,selBY)
    end;


end;

procedure TForm1.N34Click(Sender: TObject);
begin
//
end;

procedure TForm1.CopyMoveBlt(CM, direct: byte; val: extended);
var Xb,Yb: extended;
begin
  Blt.GetGlobalCoo(Xb,Yb);
  case direct of
   0: Xb:=Xb+val; // left
   1: Xb:=Xb-val; // right
   2: Yb:=Yb-val; // Up
   3: Yb:=Yb+val; // Down
  end;
  case CM of
   0: begin       //copy
        AddBolt(round(Xb),round(Yb),cenX,cenY);
      end;
   1: begin       //move
        blt.SetXY(Xb,Yb);
        SelAndReDraw(round(Xb),round(Yb))
      end;
  end;
end;

procedure TForm1.valNmClick(Sender: TObject);
begin
//
end;

procedure TForm1.N52Click(Sender: TObject);
begin
  Direct:=(Sender as TMenuItem).Tag;
  if (Sender as TMenuItem).Parent.Caption = 'Копировать' then
   cm:=0;
  if (Sender as TMenuItem).Parent.Caption = 'Переместить' then
   cm:=1;
  if CM_f.ShowModal=mrOK then
  CopyMoveBlt(cm,direct,ValBlt);
end;




procedure TForm1.FileToMas(col: integer; fName: String; var M: TMass);
var i,j:integer;
    str:string;
    bookk:TStringList;
begin
bookk:=TStringList.Create;
bookk.LoadFromFile(fName);
m:=nil;
SetLength(M,bookk.Count);     //число строк
for i:=0 to bookk.Count-1 do  // число столбцов
SetLength(M[i],Col);
for I:=0 to bookk.Count-1 do
 begin
 str:=bookk[i];
  for j:=0 to Col-1 do
   begin
    M[i,j]:=copy(str,1,pos('|',str)-1);
    delete(str,1,pos('|',str));
 end;
end;
end;

function TForm1.DetermDiam(d:extended): string;
var I: integer;
begin
  for i:=1 to high(masBol)-1 do
    if (d>=strtofloat(MasBol[i,1])) and (d<=strtofloat(MasBol[i+1,1])) then
      begin
      result:=MasBol[I+1,0] ;
      exit;
      end else
      result:=floattostrf(d,ffFixed,9,4)+' мм';
end;

procedure TForm1.N63Click(Sender: TObject);
var F:TextFile;
    i:Integer;
    vX,vY,vZ,vFX,vFY,vFZ: extended;
begin
  With SaveDialog1 do
    if Execute then
      begin
        AssignFile(F,FileName);
        Rewrite(F);
        for i:=0 to Forlist.Count-1 do
          begin
            Frc:=Forlist[i];
            Frc.GetCoords(vX,vY,vZ);
            frc.GetCompOfForce(vFX,vFY,vFZ);
            WriteLn(F,vX,vY,vZ,vFX,vFY,vFZ);
          end;
       CloseFile(F);
     end;
end;

procedure TForm1.N64Click(Sender: TObject);
var i,j: integer;
    Xd,Yd,StepVert,StepHor: extended;
begin
if (Detal<>nil) then
  begin
    Field_f.ShowModal;
    StepVert:=(FDet.B-2*Field_f.nSpace)/(Field_f.nHor-1);
    StepHor:=(FDet.A-2*Field_f.nSpace)/(Field_f.nVert-1);
    Xd:=cenX-FDet.A/2+Field_f.nSpace;
    Yd:=cenY-FDet.B/2+Field_f.nSpace;

    for i:=0 to Field_f.nVert-1 do
    for j:=0 to Field_f.nHor-1 do
      begin
        if not((i>0)and(i<(Field_f.nVert-1))and(j>0)and(j<(Field_f.nHor-1)))then
        AddBolt(round(Xd+i*StepHor),round(Yd+j*StepVert),cenX,cenY);
      end;

  end;
end;

procedure TForm1.N66Click(Sender: TObject);
begin
opt_u.Form4.grbMats.Visible :=false;
opt_u.Form4.grbKts.Visible  :=true;
opt_u.Form4.grbBolt.Visible :=false;
opt_u.Form4.ShowModal;
end;

procedure TForm1.N67Click(Sender: TObject);
begin
opt_u.Form4.grbKts.Visible  :=false;
opt_u.Form4.grbMats.Visible :=true;
opt_u.Form4.grbBolt.Visible :=false;
opt_u.Form4.ShowModal;
end;

procedure TForm1.N62Click(Sender: TObject);
var FF: TStringList;
begin

end;

procedure TForm1.N65Click(Sender: TObject);
var i,j: integer;
    Xd,Yd,StepVert,StepHor: extended;
begin
if (Detal<>nil) then
  begin
    Field_f.ShowModal;
    StepVert:=(FDet.B-2*Field_f.nSpace)/(Field_f.nHor-1);
    StepHor:=(FDet.A-2*Field_f.nSpace)/(Field_f.nVert-1);
    Xd:=cenX-FDet.A/2+Field_f.nSpace;
    Yd:=cenY-FDet.B/2+Field_f.nSpace;
    for i:=0 to Field_f.nVert-1 do
    for j:=0 to Field_f.nHor-1 do
      begin
        AddBolt(round(Xd+i*StepHor),round(Yd+j*StepVert),cenX,cenY);
      end;

  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if blts.Count>0 then
  StatusBar1.Panels[5].Text:=inttostr(blts.Count)
  else StatusBar1.Panels[5].Text:='Нет'
end;


procedure TForm1.N42Click(Sender: TObject);
var i,j,tX,tY:Integer;
    alfa:extended;
    Step: extended;
begin
  PlaceF.Label3.Enabled:=true;
  PlaceF.SpinEdit3.Enabled:=true;
  PlaceF.CheckBox1.Enabled:=false;
  if PlaceF.ShowModal=mrOK then
  begin
    alfa:=0;
    Step:=Range/Rings;
    For j:=0 to Rings-1 do
    For i:=0 to Num-1 do
      begin
        tX:=cenX+Round(Step*(Rings-j)*cos(alfa*pi/180));
        tY:=cenY+Round(Step*(Rings-j)*sin(alfa*pi/180));
        AddBolt(tX,tY,cenX,cenY);
        Alfa:=alfa+360/Num;
      end;
  end;
  N1.Enabled:=true;
  N2.Enabled:=true;
end;

procedure TForm1.nRepFullClick(Sender: TObject);
var i: integer;
  bltL: TBolt;
  trN: TTreeNode;
  RX,RY,RZ,
  Hor,Ver: extended;
begin
  with fRep do
    begin
      TreeView1.Items.Clear;
      for i:=0 to blts2.Count-1 do
        begin
          BltL:=blts2[i];
          bltL.GetReactions(RX,RY,RZ);
          BltL.GetLocalCoo(Hor,Ver);
          trN:=TreeView1.Items.Add(nil,'Болт №'+inttostr(i+1));
          TreeView1.Items.AddChild(TrN,'Гор = '+floattostrf(Hor,ffGeneral,8,5)+' мм');
          TreeView1.Items.AddChild(TrN,'Вер = '+floattostrf(Ver*-1,ffGeneral,8,5)+' мм');
          TreeView1.Items.AddChild(TrN,'RX = '+floattostrf(RX,ffGeneral,8,5)+' Н');
          TreeView1.Items.AddChild(TrN,'RY = '+floattostrf(RY,ffGeneral,8,5)+' Н');
          TreeView1.Items.AddChild(TrN,'RZ = '+floattostrf(RZ,ffGeneral,8,5)+' Н');
        end;


      ShowModal;
    end;
 trN:=nil;
end;

procedure TForm1.N74Click(Sender: TObject);
begin
  About_f.FAbout.ShowModal;
end;

procedure TForm1.tbZoomInClick(Sender: TObject);
begin
  tbSel.Visible:=false;
  tbBoltPerm.Visible:=false;
  //tbPan.Visible:=false;
  Scale:=Scale+0.1;
  if IzoMode then
  N7Click(Self) else
  N6Click(Self);
  if Scale=1 then
    begin
      tbSel.Visible:=true;
      tbBoltPerm.Visible:=true;
      //tbPan.Visible:=true;
    end;
end;

procedure TForm1.tbZoomOutClick(Sender: TObject);
begin
  tbSel.Visible:=false;
  tbBoltPerm.Visible:=false;
  //tbPan.Visible:=false;
  Scale:=Scale-0.1;
  if (Scale=0) then
    tbZoomOut.Enabled:=false;
  if IzoMode then
  N7Click(Self) else
  N6Click(Self);
  if Scale=1 then
    begin
      tbSel.Visible:=true;
      tbBoltPerm.Visible:=true;
      //tbPan.Visible:=true;
    end;
end;

procedure TForm1.N75Click(Sender: TObject);
begin
opt_u.Form4.grbKts.Visible  :=false;
opt_u.Form4.grbBolt.Visible :=true;
opt_u.Form4.grbMats.Visible :=false;
opt_u.Form4.ShowModal;
end;

procedure TForm1.standbf1Click(Sender: TObject);
var F:TextFile;
    Xt,Yt:Extended;
    a: string;
begin
  if (Detal<>nil) then
    N12Click(Self);
  Detal:=TFpmDetail.Create;
  Detal.SetHolst(Image1.Canvas);
  Detal.SetCen(cenX,cenY);
  tbBoltPerm.Enabled:=true;
  tbSel.Enabled:=true;
  a:=(Sender as TMenuItem).Caption;
  delete(a,1,1);
  AssignFile(F,dir+'\'+a);
  Reset(F);
  Read(F,FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  Detal.SetParamsStyk(FDet.A,FDet.B,FDet.A1,FDet.B1,FDet.D,FDet.D1,Fdet.Hdet);
  Detal.DrawDet(0);
  while not Eof(F) do
    begin
      ReadLn(F,Xt,Yt);
      Xt:=cenX+Xt;
      Yt:=cenY+Yt;
      AddBolt(Round(Xt),Round(Yt),cenX,CenY)
    end;
  CloseFile(F);
  N44.Enabled:=false;
  N45.Enabled:=false;
  tbRect.Enabled:=false;
  tbCir.Enabled:=false;
  tbZoomIn.Enabled:=true;
  tbZoomOut.Enabled:=true;
  tbPan.Down:=false;
   tbRep.Enabled     := false;
   nRep.Enabled      := false;
   tbRepFull.Enabled := false;
   nRepFull.Enabled  := false;
end;

procedure TForm1.DelALLClick(Sender: TObject);
begin
  blts.Clear;
  if IzoMode then
  N7Click(Self) else
  N6Click(Self);  
end;

procedure TForm1.repNewClick(Sender: TObject);
var i: byte;
    BltL: TBolt;
    h,v,x,y,z,Fx,Fy,Fz,tA,tB,tA1,tB1,tD,tD1,tHdet: extended;
    FrcL: TForce;
    MomL: TMoment;
    
begin
  with FullRep.StringGrid1 do
  begin
  if ( blts.Count<>0) then
  for i:=0 to blts.Count-1 do
  begin
    bltL:=blts[i];
    bltL.GetLocalCoo(h,v);
    Cells[0,i] := inttostr(i+1);
    Cells[1,i] := floattostr(h)+' мм';
    Cells[2,i] := floattostr(v)+' мм';
  end;
  RowCount := blts.Count;
  end;

  with FullRep.StringGrid2 do
  begin
  if (ForList.Count<>0) then
  for i:=0 to ForList.Count-1 do
  begin
    FrcL:=ForList[i];
    FrcL.GetCoords(x,y,z);
    FrcL.GetCompOfForce(Fx,Fy,Fz);
    Cells[i+1,0] := floattostr(x)+' мм';
    Cells[i+1,1] := floattostr(y)+' мм';
    Cells[i+1,2] := floattostr(z)+' мм';
    Cells[i+1,3] := floattostr(Fx)+' Н';
    Cells[i+1,4] := floattostr(Fy)+' Н';
    Cells[i+1,5] := floattostr(Fz)+' Н';
  end;
  ColCount := ForList.Count+1;
  end;

  with FullRep.StringGrid3 do
  begin
  if (MomList.Count<>0) then
  for i:=0 to MomList.Count-1 do
  begin
    MomL:=MomList[i];
    Cells[i+1,0] := 'Момент№'+inttostr(i+1);
    Cells[i+1,1] := MomL.GetAxle;
    Cells[i+1,2] := floattostr(MomL.GetValue/1000)+' Н*м';

  end;
  ColCount := MomList.Count+1;
  end;

  if(Detal<>nil)then
  with FullRep.Memo1.Lines do
  begin
    clear;
    Detal.GetParamsStyk(tA,tB,tA1,tB1,tD,tD1,tHdet,Ast,Wstxx,Wstyy);
    if(tD<>0)and(tD1=0)and(tA=0)and(tB=0)then
      begin
        Add('  Форма : круг');
        Add('  Диаметр : '+floattostr(tD)+' мм');
      end;
    if(tD<>0)and(tD1<>0)and(tA=0)and(tB=0)then
      begin
        Add('  Форма : круглый фланец');
        Add('  Внешний диаметр : '+floattostr(tD)+' мм');
        Add('  Внутренний диаметр : '+floattostr(tD1)+' мм');
      end;
    if(tD=0)and(tD1=0)and(tA<>0)and(tB<>0)and(tA1=0)and(tB1=0)then
      begin
        Add('  Форма : прямоугольник');
        Add('  Ширина : '+floattostr(tA)+' мм');
        Add('  Длина : '+floattostr(tB)+' мм');
      end;
    if(tD=0)and(tD1=0)and(tA<>0)and(tB<>0)and(tA1<>0)and(tB1<>0)then
      begin
        Add('  Форма : прямоугольный фланец');
        Add('  Ширина : '+floattostr(tA)+' мм');
        Add('  Длина : '+floattostr(tB)+' мм');
        Add('  Ширина выреза : '+floattostr(tA1)+' мм');
        Add('  Длина выреза : '+floattostr(tB1)+' мм');
      end;
  end;

 with FullRep do
 begin
 edKzap.Text := floattostr(ktZap);
 edKtr.Text  := floattostr(ktTr);
 edKBez.Text :=floattostr(ktBezop);
 edMat.Text  :=opt_u.Form4.ComboBox1.Text;
 edLim.Text  :=opt_u.Form4.Edit3.text;

 edFSt.Text     :=floattostrf(Fzat,ffFixed,8,1)+' H';
 edFSdv.Text    :=floattostrf(Fmax,ffFixed,8,1)+' H';
 edFzZaz.Text   :=floattostrf(VFzatOnZaz,ffFixed,8,1)+' H';
 edFzNoZaz.Text :=floattostrf(VFzatNotZaz,ffFixed,8,1)+' H';
 edBltNoZaz.Text:=MNotzaz;
 edBltZaz.Text  :=Mzaz;
 end;
  FullRep.ShowModal;

  
end;

end.
