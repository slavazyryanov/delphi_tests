unit ClassDef_u;

interface

uses Graphics,SysUtils,Classes,math, Windows;

type
  TBolt = class
   private
    R:extended;               // радиус болта
    Xb,Yb:extended;           // координаты болта в глобал с-ме
    HorDim,VertDim,           // размеры от центра до болта в локал с-ме координат (со знаками)
    Xc,Yc:extended;           // координаты центра детали
    RVect,                    // радиус-вектор от середины детали до центра болта
    ReacX,                    //
    ReacY,                    // Реакции
    ReacZ:extended;           //
    Cnvs:TCanvas;             // На чем будем рисовать
    penWid:integer;           // Ширина пера
    penCol,fntCol:TColor;     // Цвет пера и текста

   public

    function  GetR:extended;
    function  GetRV:extended;                           // Возвращает радиус-вектор
    procedure GetLocalCoo(var Hor,Ver:extended);        // Возвращает гориз. и верт. размеры от локал. центра
    procedure GetGlobalCoo(var XbG,YbG:extended);       // Возвращает гориз. и верт. размеры от глоьал. центра

    procedure SetR(Rad:extended);
    procedure SetDrawParms(NpenWid:integer;NpenCol,     //
                           NfntCol:TColor);             //
    procedure SetCanvas(nCnvs:TCanvas);
    procedure SetCenter(nnX,nnY:integer);               // Задаем геометр центр детали
    procedure SetXY(nX,nY:extended);                    // Задаем глобальные коорд-ы болта(на Canvas)
    procedure Draw;                                     // рисуем :-)
    procedure ChangeCooBlt(nHor,nVert:integer);         // меняем координатв по новому размеру
    function  GetAngle:extended;
    procedure IzoDraw;
    procedure SetReactions(P1,P2,P3: extended);
    Procedure GetReactions(var R1,R2,R3: extended);
 end;

type
  TForce = class
   private
     X,Y,Z:extended;
     Fx,Fy,Fz,
     Fr:extended;
     Holst:TCanvas;
     Xc,Yc:Integer;
     Xcol,Ycol,Zcol: TColor;
     Pwid: integer;
   public
     procedure SetCenter(nnX,nnY:integer); 
     procedure SetCanvas(H:TCanvas);
     procedure SetCoords(nX,nY,nZ:extended);
     procedure GetCoords(var vX,vY,vZ:extended);
     procedure SetCompOfForce(nFX,nFY,nFZ:extended);
     procedure GetCompOfForce(var vFX,vFY,vFZ:extended);
     procedure DrawF;
     procedure SetDrPar(col1,col2,col3:TColor;wid: integer);
 end;

Type
  TMoment = class
   private
     Value : Extended;
     Znak  : integer;
     Axle  : string;
     Canv  : TCanvas;
     XM,
     YM,
     XcM,
     YcM,
     pW   : integer;
     pC   : TColor;
   public
     procedure SetXY(nX,nY:integer);
     procedure SetCenterXY(nX,nY:integer);
     procedure SetCanvas(nCan:TCanvas);
     procedure SetValue(nVal:Extended);
     procedure SetZnak(nZn: extended);
     function  GetValue: Extended;
     function  GetAxle: String;
     procedure SetAxle(nAx: String);
     procedure Draw;
     procedure SetDrawParms(penWid: integer;PenCol: TColor);
 end;

type
 TDimension = class
  private
   Xc,Yc:integer;
   Holst:TCanvas;

  public
   procedure SetDrawParams(Size,Wid:Integer;Col:TColor;Stl:TPenStyle);
   procedure SetHolst(H:TCanvas);
   procedure SetCen(nXc,nYc:integer);
   procedure DrawDim(Xb,Yb,HD,VD:Integer);
   function  SelDim(X,Y,HD,VD:Integer): boolean;
 end;


type
 TFpmDetail = class
  private
   Xc,Yc:integer;
   Holst:TCanvas;
   sA,sB,sA1,sB1,sR1,sR2:extended;
   A,B,A1,B1,R1{диаметр внешний},R2{диаметр внутр},Hdet:extended;
  public
   procedure SetHolst(H:TCanvas);
   procedure SetCen(nXc,nYc:integer);
   procedure DrawDet(flag:byte);        // flag =0  плоская   // flag =1  изометрия
   Procedure SetParamsStyk(nA,nB,nA1,nB1,nR1,nR2,nHdet:extended);
   procedure GetParamsStyk(var gA,gB,gA1,gB1,gR1,gR2,gHdet,Ast,Wstxx,Wstyy:extended);
                                                                 
 end;

 var
    blts, blts2, ForList, MomList:TList;
    Scale: extended;

implementation

procedure CanvasSetTextAngle(c: TCanvas; d: single{градусы});
var LogRec: TLOGFONT; { Информация о шрифте  }
begin
{Читаем текущую инф. о шрифте}
GetObject(c.Font.Handle,SizeOf(LogRec) ,Addr(LogRec) );
{ Изменяем угол }
LogRec.lfEscapement := round(d*10);
{  Устанавливаем новые параметры  }
c.Font.Handle := CreateFontIndirect(LogRec);
end;


{ TBolt }

procedure TBolt.ChangeCooBlt(nHor, nVert: integer);
begin
  if (Xb<Xc)and(Yb<Yc)then
  begin
    Xb := Xc-nHor;
    Yb := Yc-nVert;
    HorDim:=-nHor;
    VertDim:=-nVert;
  end;
  if (Xb>Xc)and(Yb<Yc)then
  begin
    Xb := Xc+nHor;
    Yb := Yc-nVert;
    HorDim:=nHor;
    VertDim:=-nVert;
  end;
  if (Xb>Xc)and(Yb>Yc)then
  begin
    Xb := Xc+nHor;
    Yb := Yc+nVert;
    HorDim:=nHor;
    VertDim:=nVert;
  end;
  if (Xb<Xc)and(Yb>Yc)then
  begin
    Xb := Xc-nHor;
    Yb := Yc+nVert;
    HorDim:=-nHor;
    VertDim:=nVert;
  end;

  RVect   := sqrt(nHor*nHor+nVert*nVert);
end;

procedure TBolt.Draw;
var i:byte;
begin
  with Cnvs do
    begin
      Pen.Color  := penCol;
      Pen.Width  := 1{penWid};
      Font.Color := fntCol;
      Pen.Style:=psSolid;
      MoveTo (round(Xb+R),round(Yb));
      for i:=0 to 6 do
        LineTo(Round(Xb+R*cos(60*i*pi/180)),Round(Yb+R*sin(60*i*pi/180)));
      Ellipse(Round(Xb+1-1.59*R*cos(60*pi/180)),Round(Yb+1-1.59*R*cos(60*pi/180)),
              Round(Xb+1.59*R*cos(60*pi/180)),Round(Yb+1.59*R*cos(60*pi/180)));
      Pen.Color  := 1;
      Ellipse(Round(Xc-3),Round(Yc-3),Round(Xc+3),Round(Yc+3));
      Pen.Color  := penWid;
    end;
end;

procedure TBolt.GetGlobalCoo(var XbG, YbG: Extended);
begin
  XbG:=Xb;
  YbG:=Yb;
end;

function TBolt.GetRV: extended;
begin
  Result:=RVect;
end;

procedure TBolt.GetLocalCoo(var Hor, Ver: extended);
begin
  Hor:=HorDim;
  Ver:=VertDim;
end;

procedure TBolt.SetCanvas(nCnvs:TCanvas);
begin
  Cnvs:=nCnvs;
end;

procedure TBolt.SetCenter(nnX, nnY: integer);
begin
  Xc := nnX;
  Yc := nnY;
end;

procedure TBolt.SetDrawParms(NpenWid: integer; NpenCol,NfntCol: TColor);
begin
  penWid  := NpenWid;
  penCol  := NpenCol;
  fntCol  := NfntCol;
end;

procedure TBolt.SetXY(nX, nY: extended);
begin
  VertDim := (nY-Yc)*1;
  HorDim  := nX-Xc;
  Xb      := Xc+(nX-Xc);
  Yb      := Yc+(nY-Yc);
  RVect   := sqrt((nX-Xc)*(nX-Xc)+(nY-Yc)*(nY-Yc));
end;

function TBolt.GetR: extended;
begin
  Result:=R;
end;

procedure TBolt.SetR(Rad: Extended);
begin
  R:=Rad;
end;


function TBolt.GetAngle: extended;
begin
  if (HorDim>0)and(VertDim<0) then
  Result:=180*ArcTan(-VertDim/HorDim)/pi;
  if (HorDim>0)and(VertDim>0) then
  Result:=360+180*ArcTan(-VertDim/HorDim)/pi;
  if (HorDim<0)and(VertDim<0) then
  Result:=180-180*ArcTan(VertDim/HorDim)/pi;
  if (HorDim<0)and(VertDim>0) then
  Result:=180-180*ArcTan(VertDim/HorDim)/pi;
  if (VertDim=0)and(HorDim>0) then Result:=0;
  if (VertDim=0)and(HorDim<0) then Result:=180;
  if (VertDim>0)and(HorDim=0) then Result:=270;
  if (VertDim<0)and(HorDim=0) then Result:=90;
end;

procedure TBolt.IzoDraw;
var i:integer;
begin
  with Cnvs do
    begin

      Pen.Color  := penCol;
      Pen.Width  := 1{penWid};
      Font.Color := fntCol;
      Pen.Style  := psSolid;

      MoveTo (Round(Xb+1*R*cos(30*pi/180)),Round(Yb-6));
      for i:=0 to 6 do
        begin
          LineTo(Round(Xb+1*R*cos(60*i*pi/180)*cos(30*pi/180)),
                 Round(Yb-4+1*R*sin(60*i*pi/180)*sin(30*pi/180)));
        end;
      MoveTo (Round(Xb+1*R*cos(30*pi/180)),round(Yb));
      for i:=0 to 3 do
        begin
          LineTo(Round(Xb+1*R*cos(60*i*pi/180)*cos(30*pi/180)),
                 Round(Yb+1*R*sin(60*i*pi/180)*sin(30*pi/180)));
          LineTo(Round(Xb+1*R*cos(60*i*pi/180)*cos(30*pi/180)),
                 Round(Yb-4+1*R*sin(60*i*pi/180)*sin(30*pi/180)));
          MoveTo(Round(Xb+1*R*cos(60*i*pi/180)*cos(30*pi/180)),
                 Round(Yb+1*R*sin(60*i*pi/180)*sin(30*pi/180))); 
        end;
    end;
end;


procedure TBolt.SetReactions(P1,P2,P3: extended);
begin
  ReacX:=P1;
  ReacY:=P2;
  ReacZ:=P3;
end;

procedure TBolt.GetReactions(var R1, R2, R3: extended);
begin
  R1:=ReacX;
  R2:=ReacY;
  R3:=ReacZ;
end;


{ TForce }

procedure TForce.DrawF;
var fcxh,fcyh,fcxv,fcyv,FXh,FXv,FYh,FYv,FZv,znX,znY,znZ:integer;
begin
  with Holst do
    begin
      fcxh:=round(Scale*X*cos(30*pi/180)*cos(30*pi/180));
      fcyh:=round(Scale*X*sin(30*pi/180)*sin(30*pi/180));
      fcxv:=round(Scale*Y*cos(150*pi/180)*cos(60*pi/180));
      fcyv:=round(Scale*Y*sin(150*pi/180)*sin(60*pi/180));
      fxh:=0;
      fxv:=0;
      fyh:=0;
      fyv:=0;
      znX:=sign(Fx);
      znY:=sign(Fy);
      znZ:=sign(Fz);
      if (abs(Fx)>=abs(Fy))and(abs(Fx)>=abs(Fz))then
        begin
        FXh:=round(100*znX*cos(30*pi/180)*cos(30*pi/180));
        FXv:=round(100*znX*sin(30*pi/180)*sin(30*pi/180));
        end else
        begin
        FXh:=round(50*znX*cos(30*pi/180)*cos(30*pi/180));
        FXv:=round(50*znX*sin(30*pi/180)*sin(30*pi/180));
        end;
      if (abs(Fy)>=abs(Fx))and(abs(Fy)>=abs(Fz))then
        begin
        FYh:=round(100*znY*cos(150*pi/180)*cos(60*pi/180));
        FYv:=round(100*znY*sin(150*pi/180)*sin(60*pi/180));
        end else
        begin
        FYh:=round(50*znY*cos(150*pi/180)*cos(60*pi/180));
        FYv:=round(50*znY*sin(150*pi/180)*sin(60*pi/180));
        end;
      if (abs(Fz)>=abs(Fx))and(abs(Fz)>=abs(Fy))then
        begin
          FZv:=100*znZ;
        end
        else
        begin
          Fzv:=50*znZ;
        end;
      //FZv:=100;

      Pen.Style := psDashDot;
      Pen.Color := clNavy;
      Pen.Width := 1;

      MoveTo(Xc,Yc);
      LineTO(Xc+fcxh,Yc-fcyh);
      LineTO(Xc+fcxh+fcxv,Yc-fcyh-fcyv);
      LineTO(Xc+fcxh+fcxv,Yc-fcyh-fcyv-round(Scale*Z));    //Точка приложения

      Pen.Color := clBlack;
      Brush.Color:=clRed;
      Ellipse(Xc+fcxh+fcxv-3,Yc-fcyh-fcyv-round(Scale*Z)-3,Xc+fcxh+fcxv+3,Yc-fcyh-fcyv-round(Scale*Z)+3);


      Pen.Style := psDashDot;
      Pen.Width := Pwid;
      Pen.Color := Xcol;
      LineTo(Xc+fcxh+fcxv+FXh,Yc-fcyh-fcyv-round(Scale*Z)-FXv);
      MoveTO(Xc+fcxh+fcxv,Yc-fcyh-fcyv-round(Scale*Z));
      if Fy<>0 then
      begin
      Pen.Color := Ycol;
      LineTo(Xc+fcxh+fcxv+FYh,Yc-fcyh-fcyv-round(Scale*Z)-FYv);
      MoveTO(Xc+fcxh+fcxv,Yc-fcyh-fcyv-round(Scale*Z));
      end;
      Pen.Color := Zcol;
      LineTo(Xc+fcxh+fcxv,Yc-fcyh-fcyv-round(Scale*Z)-Round(FZv));

      Pen.Color := clBlack;
      Pen.Width := 1;
      Brush.Color:=clwhite; 
    end;
end;

procedure TForce.GetCompOfForce(var vFX, vFY, vFZ: extended);
begin
  vFX:=Fx;
  vFY:=Fy;
  vFZ:=Fz;
end;

procedure TForce.GetCoords(var vX, vY, vZ: extended);
begin
  vX:=X;
  vY:=Y;
  vZ:=Z;
end;

procedure TForce.SetCanvas(H: TCanvas);
begin
  Holst:=H;
end;

procedure TForce.SetCenter(nnX, nnY: integer);
begin
  Xc:=nnX;
  Yc:=nnY;
end;

procedure TForce.SetCompOfForce(nFX, nFY, nFZ: extended);
begin
  FX := nFX;
  FY := nFY;
  FZ := nFZ;
  Fr := sqrt(nFX*nFX+nFY*nFY+nFZ*nFZ)
end;

procedure TForce.SetCoords(nX, nY, nZ: extended);
begin
  X := nX;
  Y := nY;
  Z := nZ;
end;

procedure TForce.SetDrPar(col1, col2, col3: TColor; wid: integer);
begin
  Xcol:=col1;
  Ycol:=col2;
  Zcol:=col3;
  Pwid:=wid;
end;

{ TMoment }

procedure TMoment.Draw;
var Im:TPicture;
begin
  im:=TPicture.Create;
  Im.Bitmap.Transparent:=true;
  Im.Bitmap.TransparentColor:=clWhite;

  with Canv do
    begin
      Font.Color:=pC;

      if (Axle='OZ')then
      begin
        if(Znak=1)then
          im.LoadFromFile('Pics\OZ_plus.bmp');
        if(Znak=-1)then
          im.LoadFromFile('Pics\OZ_minus.bmp');
        Canv.Draw(XcM-16,YcM-Round(Ym/2),Im.Graphic);
        Canv.TextOut(XcM+16,YcM-Round(Ym/2)+20,'Moz');
      end;
      if (Axle='OX')then
      begin
        if(Znak=1)then
          im.LoadFromFile('Pics\OX_plus.bmp');
        if(Znak=-1)then
          im.LoadFromFile('Pics\OX_minus.bmp');
        Canv.Draw(XcM-16+round(XM*cos(-150*pi/180)*cos(30*pi/180)),
                  YcM-16-round(YM*sin(-150*pi/180)*sin(30*pi/180)),Im.Graphic);
        Canv.TextOut(XcM+10+round((XM)*cos(-150*pi/180)*cos(30*pi/180)),
                     YcM-16-round((YM)*sin(-150*pi/180)*sin(30*pi/180))+15,'Mox');
      end;
      if (Axle='OY')then
      begin
        if(Znak=1)then
          im.LoadFromFile('Pics\OX_plus.bmp');
        if(Znak=-1)then
          im.LoadFromFile('Pics\OX_minus.bmp');
        Canv.Draw(XcM-16+round(XM*cos(-30*pi/180)*cos(60*pi/180)),
                  YcM-16-round(YM*sin(-30*pi/180)*sin(60*pi/180)),Im.Graphic);
        Canv.TextOut(XcM+10+round(XM*cos(-30*pi/180)*cos(60*pi/180)),
                     YcM-16-round(YM*sin(-30*pi/180)*sin(60*pi/180))+15,'Moy');
      end;


    end;
end;

function TMoment.GetAxle: String;
begin
  Result:=Axle;
end;

function TMoment.GetValue: Extended;
begin
  result:=Value;
end;

procedure TMoment.SetAxle(nAx: String);
begin
  Axle:=nAx;
end;

procedure TMoment.SetCanvas(nCan: TCanvas);
begin
  Canv:=nCan;
end;

procedure TMoment.SetCenterXY(nX, nY: integer);
begin
  XcM:=nx;
  YcM:=nY;
end;

procedure TMoment.SetDrawParms(penWid: integer;PenCol: TColor);
begin
  pW:=penWid;
  pC:=PenCol;
end;

procedure TMoment.SetValue(nVal: Extended);
begin
  Value:=nVal;
end;

procedure TMoment.SetXY(nX, nY: integer);
begin
  XM:=nX;
  YM:=nY;
end;

procedure TMoment.SetZnak(nZn: Extended);
begin
  Znak:=sign(nZn);
end;

{ TDimension }

procedure TDimension.DrawDim(Xb, Yb, HD, VD: Integer);
var hDstr,vDstr: string;
begin
  hDstr:=IntToStr(abs(HD));
  vDstr:=IntToStr(abs(VD));
  with Holst do
  begin

    if (HD>0)and(VD<0) then  // right-top
    begin
    MoveTo(Xb,Yb);
    LineTo(Xb,Yb-30);
    MoveTo(Xc,Yb-20);
    LineTo(Xb+10,Yb-20);
    MoveTo(Xb,Yb-20);
    LineTo(Xb-8,Yb-20-2);
    MoveTo(Xb,Yb-20);
    LineTo(Xb-8,Yb-20+2);
    MoveTo(Xc,Yb-20);
    LineTo(Xc+8,Yb-20-2);
    MoveTo(Xc,Yb-20);
    LineTo(Xc+8,Yb-20+2);

    MoveTo(Xb,Yb);
    LineTo(Xb+30,Yb);
    MoveTo(Xb+20,Yc);
    LineTo(Xb+20,Yb-10);
    MoveTo(Xb+20,Yb);
    LineTo(Xb+20+2,Yb+8);
    MoveTo(Xb+20,Yb);
    LineTo(Xb+20-2,Yb+8);
    MoveTo(Xb+20,Yc);
    LineTo(Xb+20+2,Yc-8);
    MoveTo(Xb+20,Yc);
    LineTo(Xb+20-2,Yc-8);

    end;
    if (HD>0)and(VD>0) then  // right-bottom
    begin
    MoveTo(Xb,Yb);
    LineTo(Xb,Yb+30);
    MoveTo(Xc,Yb+20);
    LineTo(Xb+10,Yb+20);
    MoveTo(Xb,Yb+20);
    LineTo(Xb-8,Yb+20-2);
    MoveTo(Xb,Yb+20);
    LineTo(Xb-8,Yb+20+2);
    MoveTo(Xc,Yb+20);
    LineTo(Xc+8,Yb+20-2);
    MoveTo(Xc,Yb+20);
    LineTo(Xc+8,Yb+20+2);

    MoveTo(Xb,Yb);
    LineTo(Xb+30,Yb);
    MoveTo(Xb+20,Yc);
    LineTo(Xb+20,Yb+10);
    MoveTo(Xb+20,Yb);
    LineTo(Xb+20+2,Yb-8);
    MoveTo(Xb+20,Yb);
    LineTo(Xb+20-2,Yb-8);
    MoveTo(Xb+20,Yc);
    LineTo(Xb+20+2,Yc+8);
    MoveTo(Xb+20,Yc);
    LineTo(Xb+20-2,Yc+8);
    end;
    if (HD<0)and(VD<0) then  //left-top
    begin
    MoveTo(Xb,Yb);
    LineTo(Xb,Yb-30);
    MoveTo(Xc,Yb-20);
    LineTo(Xb-10,Yb-20);
    MoveTo(Xb,Yb-20);
    LineTo(Xb+8,Yb-20-2);
    MoveTo(Xb,Yb-20);
    LineTo(Xb+8,Yb-20+2);
    MoveTo(Xc,Yb-20);
    LineTo(Xc-8,Yb-20-2);
    MoveTo(Xc,Yb-20);
    LineTo(Xc-8,Yb-20+2);

    MoveTo(Xb,Yb);
    LineTo(Xb-30,Yb);
    MoveTo(Xb-20,Yc);
    LineTo(Xb-20,Yb-10);
    MoveTo(Xb-20,Yb);
    LineTo(Xb-20+2,Yb+8);
    MoveTo(Xb-20,Yb);
    LineTo(Xb-20-2,Yb+8);
    MoveTo(Xb-20,Yc);
    LineTo(Xb-20+2,Yc-8);
    MoveTo(Xb-20,Yc);
    LineTo(Xb-20-2,Yc-8);

    end;
    if (HD<0)and(VD>0) then     // left-bottom
    begin
    MoveTo(Xb,Yb);
    LineTo(Xb,Yb+30);
    MoveTo(Xc,Yb+20);
    LineTo(Xb-10,Yb+20);
    MoveTo(Xb,Yb+20);
    LineTo(Xb+8,Yb+20-2);
    MoveTo(Xb,Yb+20);
    LineTo(Xb+8,Yb+20+2);
    MoveTo(Xc,Yb+20);
    LineTo(Xc-8,Yb+20-2);
    MoveTo(Xc,Yb+20);
    LineTo(Xc-8,Yb+20+2);

    MoveTo(Xb,Yb);
    LineTo(Xb-30,Yb);
    MoveTo(Xb-20,Yc);
    LineTo(Xb-20,Yb+10);
    MoveTo(Xb-20,Yb);
    LineTo(Xb-20+2,Yb-8);
    MoveTo(Xb-20,Yb);
    LineTo(Xb-20-2,Yb-8);
    MoveTo(Xb-20,Yc);
    LineTo(Xb-20+2,Yc+8);
    MoveTo(Xb-20,Yc);
    LineTo(Xb-20-2,Yc+8);
    end;
    if(VD>0)then                     // under axis
      begin
        TextOut(xc+Round((HD+length(hDstr))/2),Yb+5,hDstr);
      end;
    if(VD<0)then                     // up axis
      begin
       TextOut(xc+Round((HD+length(hDstr))/2),Yb-40,hDstr);
      end;
    CanvasSetTextAngle(Holst,90);
    if(HD>0)then                      // right axis
      begin
       TextOut(Xb,Yb-Round((VD-length(vDstr))/2),vDstr);
      end;
    if(HD<0)then                      // left axis
      begin
        TextOut(Xb-40,Yb-Round((VD-length(vDstr))/2),vDstr);
      end;
    CanvasSetTextAngle(Holst,0);
    end;

end;

function TDimension.SelDim(X,Y,HD,VD:Integer): boolean;
begin
  if(X>(Xc+HD))and(X<Xc)and
    (Y>(Yc+VD))and(Y<(Yc+VD+30))then


end;

procedure TDimension.SetCen(nXc, nYc: integer);
begin
  Xc:=nXc;
  Yc:=nYc;
end;

procedure TDimension.SetDrawParams(Size, Wid: Integer; Col: TColor;
  Stl: TPenStyle);
begin
 with Holst do
   begin
    Font.Size  := Size;
    Font.Color := Col;
    pen.Style  := stl;
    pen.Width  := Wid;
  end;

end;

procedure TDimension.SetHolst(H: TCanvas);
begin
  Holst:=H;
end;

{ TFpmDetail }

procedure TFpmDetail.DrawDet(flag: byte );
var tXh,tYh,tXv,tYv,i,Rx,Ry,Rx2,Ry2: integer;
    alfa:extended;
begin
  with Holst do
  begin
   pen.Style:=psSolid;
   pen.Width:=2;
   Brush.Style:=bsClear;
   if flag=0 then
    begin
      if(R1<>0)and(R2=0)and(A=0)and(B=0)then
        Ellipse(Xc-Round(Scale*R1/2),Yc-Round(Scale*R1/2),Xc+Round(Scale*R1/2),Yc+Round(Scale*R1/2));
      if(R1<>0)and(R2<>0)and(A=0)and(B=0)then
        begin
          Ellipse(Xc-Round(Scale*R1/2),Yc-Round(Scale*R1/2),Xc+Round(Scale*R1/2),Yc+Round(Scale*R1/2));
          Ellipse(Xc-Round(Scale*R2/2),Yc-Round(Scale*R2/2),Xc+Round(Scale*R2/2),Yc+Round(Scale*R2/2));
        end;
      if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1=0)and(B1=0)then
        Rectangle(Xc-Round(Scale*A/2),Yc-Round(Scale*B/2),Xc+Round(Scale*A/2),Yc+Round(Scale*B/2));
      if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1<>0)and(B1<>0)then
        begin
          Rectangle(Xc-Round(Scale*A/2),Yc-Round(Scale*B/2),Xc+Round(Scale*A/2),Yc+Round(Scale*B/2));
          Rectangle(Xc-Round(Scale*A1/2),Yc-Round(Scale*B1/2),Xc+Round(Scale*A1/2),Yc+Round(Scale*B1/2));
        end;
     end;
   if flag=1 then
    begin
      txh:=round(Scale*A/2*cos(30*pi/180)*cos(30*pi/180));
      tyh:=round(Scale*A/2*sin(30*pi/180)*sin(30*pi/180));
      txv:=round(Scale*B/2*cos(150*pi/180)*cos(60*pi/180));
      tyv:=round(Scale*B/2*sin(150*pi/180)*sin(60*pi/180));
      if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1=0)and(B1=0)then
        begin
          txh:=round(Scale*A/2*cos(30*pi/180)*cos(30*pi/180));
          tyh:=round(Scale*A/2*sin(30*pi/180)*sin(30*pi/180));
          txv:=round(Scale*B/2*cos(150*pi/180)*cos(60*pi/180));
          tyv:=round(Scale*B/2*sin(150*pi/180)*sin(60*pi/180));
          MoveTO(Xc+txh,Yc-tyh);
          LineTO(Xc+txh+txv,Yc-tyh-tyv);
          LineTO(Xc-txh+txv,Yc+tyh-tyv);
          LineTO(Xc-txh-txv,Yc+tyh+tyv);
          LineTO(Xc+txh-txv,Yc-tyh+tyv);
          LineTO(Xc+txh,Yc-tyh);

          MoveTO(Xc+txh,Yc-tyh+Round(Scale*Hdet));
          pen.Style:=psClear;
          LineTO(Xc+txh+txv,Yc-tyh-tyv+Round(Scale*Hdet));
          LineTO(Xc-txh+txv,Yc+tyh-tyv+Round(Scale*Hdet));
          pen.Style:=psSolid;
          LineTO(Xc-txh+txv,Yc+tyh-tyv);                     //  Vertikal 1
          MoveTO(Xc-txh+txv,Yc+tyh-tyv+Round(Scale*Hdet));         //
          LineTO(Xc-txh-txv,Yc+tyh+tyv+Round(Scale*Hdet));

          LineTO(Xc-txh-txv,Yc+tyh+tyv);                    //   Vertikal 2
          MoveTO(Xc-txh-txv,Yc+tyh+tyv+Round(Scale*Hdet));        //

          LineTO(Xc+txh-txv,Yc-tyh+tyv+Round(Scale*Hdet));

          LineTO(Xc+txh-txv,Yc-tyh+tyv);                     //  Vertikal 3

       end;
      if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1<>0)and(B1<>0)then
        begin
          MoveTO(Xc+txh,Yc-tyh);
          LineTO(Xc+txh+txv,Yc-tyh-tyv);
          LineTO(Xc-txh+txv,Yc+tyh-tyv);
          LineTO(Xc-txh-txv,Yc+tyh+tyv);
          LineTO(Xc+txh-txv,Yc-tyh+tyv);
          LineTO(Xc+txh,Yc-tyh);

          txh:=round(Scale*A1/2*cos(30*pi/180)*cos(30*pi/180));
          tyh:=round(Scale*A1/2*sin(30*pi/180)*sin(30*pi/180));
          txv:=round(Scale*B1/2*cos(150*pi/180)*cos(60*pi/180));
          tyv:=round(Scale*B1/2*sin(150*pi/180)*sin(60*pi/180));

          MoveTO(Xc+txh,Yc-tyh);
          LineTO(Xc+txh+txv,Yc-tyh-tyv);
          LineTO(Xc-txh+txv,Yc+tyh-tyv);
          LineTO(Xc-txh-txv,Yc+tyh+tyv);
          LineTO(Xc+txh-txv,Yc-tyh+tyv);
          LineTO(Xc+txh,Yc-tyh);

          MoveTO(Xc+txh+txv,Yc-tyh-tyv+Round(Scale*Hdet));
          LineTO(Xc+txh+txv,Yc-tyh-tyv);                     //  Vertikal 1
          MoveTO(Xc+txh+txv,Yc-tyh-tyv+Round(Scale*Hdet));         //
          LineTO(Xc-txh+txv,Yc+tyh-tyv+Round(Scale*Hdet));
          MoveTO(Xc+txh+txv,Yc-tyh-tyv+Round(Scale*Hdet));        //   Vertikal 2//
          LineTO(Xc+txh-txv,Yc-tyh+tyv+Round(Scale*Hdet));
          {LineTO(Xc+txh-txv,Yc-tyh+tyv); }
          
          txh:=round(Scale*A/2*cos(30*pi/180)*cos(30*pi/180));
          tyh:=round(Scale*A/2*sin(30*pi/180)*sin(30*pi/180));
          txv:=round(Scale*B/2*cos(150*pi/180)*cos(60*pi/180));
          tyv:=round(Scale*B/2*sin(150*pi/180)*sin(60*pi/180));

          MoveTO(Xc-txh+txv,Yc+tyh-tyv+Round(Scale*Hdet));
          LineTO(Xc-txh+txv,Yc+tyh-tyv);                     //  Vertikal 1
          MoveTO(Xc-txh+txv,Yc+tyh-tyv+Round(Scale*Hdet));         //
          LineTO(Xc-txh-txv,Yc+tyh+tyv+Round(Scale*Hdet));
          LineTO(Xc-txh-txv,Yc+tyh+tyv);                    //   Vertikal 2
          MoveTO(Xc-txh-txv,Yc+tyh+tyv+Round(Scale*Hdet));        //
          LineTO(Xc+txh-txv,Yc-tyh+tyv+Round(Scale*Hdet));
          LineTO(Xc+txh-txv,Yc-tyh+tyv);

        end;
      if(R1<>0)and(R2=0)and(A=0)and(B=0)then
        begin
          Brush.Style:=bsSolid;
          Rx:=round(Scale*R1*cos((30)*pi/180)*cos(30*pi/180)/2)+12;
          Ry:=round(Scale*R1*sin((30)*pi/180)*sin(30*pi/180))+6;
          Ellipse(Xc-Rx,Yc-Ry+Round(Scale*Hdet),Xc+Rx,Yc+Ry+Round(Scale*Hdet));
          Ellipse(Xc-Rx,Yc-Ry,Xc+Rx,Yc+Ry);
          Brush.Style:=bsClear;
        end;
      if(R1<>0)and(R2<>0)and(A=0)and(B=0)then
        begin
          Brush.Style:=bsSolid;
          Rx:=round(Scale*R1*cos((30)*pi/180)*cos(30*pi/180)/2)+12;
          Ry:=round(Scale*R1*sin((30)*pi/180)*sin(30*pi/180))+6;
          Rx2:=round(Scale*R2*cos((30)*pi/180)*cos(30*pi/180)/2)+12;
          Ry2:=round(Scale*R2*sin((30)*pi/180)*sin(30*pi/180))+6;
          Ellipse(Xc-Rx,Yc-Ry+Round(Scale*Hdet),Xc+Rx,Yc+Ry+Round(Scale*Hdet));
          Ellipse(Xc-Rx,Yc-Ry,Xc+Rx,Yc+Ry);
          Ellipse(Xc-Rx2,Yc-Ry2,Xc+Rx2,Yc+Ry2);
          Arc(Xc-Rx2,Yc-Ry2+Round(Scale*Hdet),Xc+Rx2,Yc+Ry2+Round(Scale*Hdet),
              Xc+Rx2,Yc+Round(Scale*Hdet),Xc-Rx2,Yc+Round(Scale*Hdet));
          Brush.Style:=bsClear;
        end;

    end;

  end;
end;

procedure TFpmDetail.GetParamsStyk(var gA, gB, gA1, gB1, gR1, gR2, gHdet,Ast,Wstxx,Wstyy: extended);
var c,h:extended;
begin
    gA := A  ;
    gB := B  ;
    gA1:= A1 ;
    gB1:= B1 ;
    gR1:= R1 ;
    gR2:= R2 ;
    gHdet:=Hdet;
    if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1=0)and(B1=0)then
      begin
        Ast:=A*B;
        Wstxx:= A*B*B/6;
        Wstyy:= A*A*B/6;
      end;
    if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1<>0)and(B1<>0)then
      begin
        Ast:=A*B-A1*B1;
        Wstxx:=(A*B*B*B-A1*B1*B1*B1)/(6*B);
        Wstyy:=(B*A*A*A-B1*A1*A1*A1)/(6*A);
      end;
    if(R1<>0)and(R2=0)and(A=0)and(B=0)then
      begin
        Ast:=pi*R1*R1/4;
        Wstxx:=0.1*R1*R1*R1;
        Wstyy:=Wstxx;
      end;
    if(R1<>0)and(R2<>0)and(A=0)and(B=0)then
      begin
        Ast:=pi*R1*R1/4 - pi*R2*R2/4;
        c:=R2/R1;
        Wstxx:=pi*R1*R1*R1*(1-c*c*c*c)/32;
        Wstyy:=Wstxx;
      end;
    if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1=A)and(B1<>0)then
      begin
        Ast:=A*B-A1*B1;
        h:=B-B1;
        Wstxx:=A*(B*B*B-h*h*h)/(6*B);
        Wstyy:=A*A*(B-h)/6;
      end;
    {if(R1=0)and(R2=0)and(A<>0)and(B<>0)and(A1<>0)and(B1=B)then
      begin
        Ast:=A*B-A1*B1;
        h:=A-A1;
        Wstyy:=A*(B*B*B-h*h*h)/(6*B);
        Wstxx:=A*A*(B-h)/6;
      end;  }
end;

procedure TFpmDetail.SetCen(nXc, nYc: integer);
begin
  Xc:=nXc;
  Yc:=nYc;
end;

procedure TFpmDetail.SetHolst(H: TCanvas);
begin
  Holst:=H;
end;

procedure TFpmDetail.SetParamsStyk(nA, nB, nA1, nB1, nR1, nR2, nHdet: extended);
begin
  A    := nA;
  B    := nB;
  A1   := nA1;
  B1   := nB1;
  R1   := nR1;
  R2   := nR2;
  Hdet := nHdet;

end;

initialization

Scale:=1;

end.
