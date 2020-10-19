unit MatemBolt;

interface

uses  SysUtils, ClassDef_u,placef_u,dimen_f,Math,Dialogs;

Procedure LocalCenterBoltField(var XLc, YLc: extended);

procedure LocalCenterBoltRadiusVect (XLc, YLc : extended; i : integer; var  Hr,Vr, R, RAngle : extended);

procedure DeterminationMaxForceOnBolt (XLc, YLc :extended; var Fmax : Extended);

procedure OpeningTakeoff (XLc, YLc, k :extended; var SigmaMax, Fzat,MomentXoZ ,
                          MomentYoZ: Extended);

procedure CalcForceAndDiameter (XLc, YLc,Fmax {по оси ХУ}, Fzat,Height{толщина одной сопряг детали},
f{коэф трения},k,s,SigmaTek,SigmaSm,SigmaMax,Amount{колво сопр деталей},MomentXoZ ,MomentYoZ
:Extended; var Vd1OnZaz,Vd1NotZaz , VFmax ,VFr,VFzatOnZaz,VFzatNotZaz:extended);

var
   px,py,pz : Extended;

implementation
uses main_u, Classes;

Procedure LocalCenterBoltField(var XLc, YLc: extended);
var i : integer;
     Hr,Vr : extended;
     //blt:TBolt;
 begin
   XLc :=0 ;
   YLc := 0;
   for i:=0 to blts2.Count-1 do
    begin
     blt :=blts2.Items[i];
     blt.GetLocalCoo(Hr,Vr);
     XLc := XLc + Hr;
     YLc := YLc + Vr;
    end;
   XLc := XLc / blts2.Count;
   YLc :=YLc / blts2.Count ;
 end;

procedure LocalCenterBoltRadiusVect (XLc, YLc : extended; i : integer; var  Hr,Vr, R, RAngle : extended);

//var     //blt:TBolt;
begin
     blt :=blts2.Items[i];
     blt.GetLocalCoo(Hr,Vr);
     Hr := Hr - XLc ;
     Vr := Vr- YLc;
     R := sqrt(Hr*Hr+Vr*Vr);
     if (Hr>0) and (Vr>0) then   RAngle := (ArcCos(abs(Hr)/R))*180/pi;
     if (Hr<0) and (Vr>0) then   RAngle := (ArcCos(abs(Vr)/R))*180/pi + 90;
     if (Hr<0) and (Vr<0) then   RAngle := (ArcCos(abs(Hr)/R))*180/pi+180;
     if (Hr>0) and (Vr<0) then   RAngle := (ArcCos(abs(Vr)/R))*180/pi+270;
     if (Hr=0) and (Vr=0) then   RAngle := 0 ;
     if (Hr=0) and (Vr>0) then   RAngle := 90 ;
     if (Hr=0) and (Vr<0) then   RAngle := 270;
     if (Hr>0) and (Vr=0) then   RAngle := 0 ;
     if (Hr<0) and (Vr=0) then   RAngle := 180 ;

end;

procedure DeterminationMaxForceOnBolt (XLc, YLc :extended; var Fmax  : Extended);

var i ,j : Integer;
   R,RAngle ,Hr,Vr, x,y,z : extended;
   vFX,vFY,vFZ,
   Frx,Fry,Frz,
   FR{суммарное от Frx,Fry}, FRAngle ,Fm {сила от моментов} , Rsum,  Fi,
   MomentF {Момент от сил } , MomentG {момент заданный сразу}: Extended;
//   blt : TBolt;
   Frc:TForce;
   mom:TMoment;
begin
   Fmax := 0;
   Frx:=0;
   Fry:=0;
   Frz:=0;
   MomentF := 0;
   Fm:=0;
  for i:=0 to ForList.Count-1 do
    begin
     frc :=ForList.Items[i];
     frc.GetCoords(x,y,z);
     frc.GetCompOfForce(vFX,vFY,vFZ);
     X := X - XLc;
     Y := Y - YLc;
     if ((vFX<0) and (X>0) and (Y>0)) or ((vFX<0) and (X<0) and (Y>0))
     or ((vFX>0) and (X<0) and (Y<0)) or ((vFX>0) and (X>0) and (Y<0))
     then MomentF := (MomentF+abs(vFX*y))
     else MomentF := MomentF-(abs(vFX*y)) ;

     if ((vFY>0) and (X>0) and (Y>0)) or ((vFY<0) and (X<0) and (Y>0))
     or ((vFY<0) and (X<0) and (Y<0)) or ((vFY>0) and (X>0) and (Y<0))
     then MomentF := (MomentF+abs(vFY*x))
     else MomentF := (MomentF-abs(vFY*x));
     Frx := Frx + vFX;
     Fry := Fry + vFY;
     Frz := Frz + vFZ;
    end;

      for j:=0 to MomList.Count-1 do     //////////////???????????????????  i
       begin
        mom :=MomList.Items[j];
        if (mom.GetAxle='OZ')then              // в цикле сложить с моментами заданными (список?)
                                              //  сложить с {моментом заданным сразу}
         begin
         MomentF :=  MomentF+ mom.GetValue ;
         end;
       end;
    if Frx=0 then Frx:=0 else
    Frx := (-1)*(Frx)/blts2.Count;
    if Fry=0 then Fry:=0 else
    Fry := (-1)*(Fry)/blts2.Count;
    FR := sqrt(Frx*Frx+Fry*Fry);
 //     r:=0;
   Rsum:=0;
   for i:=0 to blts2.Count-1 do
    begin
     blt :=blts2.Items[i];
     LocalCenterBoltRadiusVect (XLc, YLc,i,Hr,Vr,R, RAngle);
     Rsum:= Rsum+R*R;
    end;
   for i:=0 to blts2.Count-1 do
    begin
     blt :=blts2.Items[i];
     LocalCenterBoltRadiusVect (XLc, YLc,i,Hr,Vr,R, RAngle);
     if Rsum<>0 then Fm :=  (MomentF*R)/Rsum;
     if (Frx>0) and ( Fry >0) then FRAngle := RadToDeg(ArcCos(abs(Frx)/FR));
     if (Frx<0) and ( Fry >0) then FRAngle := abs(RadToDeg(ArcCos(abs(Fry)/FR)))+90;
     if (Frx<0) and ( Fry <0) then FRAngle := abs(RadToDeg(ArcCos(abs(Frx)/FR)))+180;
     if (Frx>0) and ( Fry <0) then FRAngle := abs(RadToDeg(ArcCos(abs(Fry)/FR)))+270;
     if (Frx=0) and ( Fry >0) then  FRAngle := 90 ;
     if (Frx=0) and ( Fry <0) then  FRAngle := 270;
     if (Frx>0) and ( Fry =0) then  FRAngle := 0 ;
     if (Frx<0) and ( Fry =0) then  FRAngle := 180 ;
     if (Frx=0) and ( Fry =0) then  FRAngle := 0 ;
  // Fi := sqrt (Fm* Fm+FR*FR-(2*Fm*FR*cos(degToRad(180-abs(FRAngle-(RAngle+90))))));
   // Забивать в список болтов реакции
   px:={Frx+Fm*cos(RAngle+90)+}(abs(Fm)*cos(degToRad(RAngle+90))+abs(FR)*cos(degToRad(FRAngle)));
   if  abs(px)<0.0000001 then px := 0;
   py:={Fry+Fm*sin(RAngle+90)+}(abs(Fm)*sin(degToRad(RAngle+90))+abs(FR)*sin(degToRad(FRAngle)));
   if  abs(py)<0.0000001 then py := 0;
   pz := 0;
   blt.SetReactions(px,py,pz);
   Fi := sqrt (px*px + py*py);
   // Fi :=  (Fm*cos(degToRad(RAngle+90))+FR*cos(degToRad(FRAngle)))/(cos(arctan(tan(degToRad(RAngle+90))+tan(degToRad(FRAngle))))) ;
    if (abs(Fi)>= Fmax) then Fmax := Fi ;
    end;
//   Fzat:= k*Fmax/f

end;
procedure OpeningTakeoff (XLc, YLc, k :extended; var SigmaMax, Fzat,MomentXoZ ,
                          MomentYoZ: Extended);
var i: Integer;
    SigmaZat ,SigmaZat1,SigmaZat2,SigmaMin , SigmaFz , SigmaMomXoZ,SigmaMomYoZ,
    Ast, Wstxx, Wstyy,
    gA,gB,gA1,gB1,gR1,gR2,gHdet,x,y,z, vFX,vFY,vFZ: extended ;
    // blt : TBolt;
     mom :TMoment;
     frs :TForce ;
//     stk:TFpmDetail;

begin
    // k := 1,5;// брать из интерфейса
     detal.GetParamsStyk(gA,gB,gA1,gB1,gR1,gR2,gHdet,Ast, Wstxx, Wstyy);
     //Ast:= gA*gB-gA1*gB1 ;
     MomentXoZ :=0;
     MomentYoZ :=0;
     SigmaFz :=  0;
     for i:=0 to ForList.Count-1 do
      begin
       frs :=ForList.Items[i];
       frs.GetCompOfForce(vFX,vFY,vFZ);
       frc.GetCoords(x,y,z);
       X := X - XLc;
       Y := Y - YLc;
       SigmaFz := -vFZ{*(0.25} {кси - доля внешней нагрузки)}/Ast;
       MomentXoZ :=0;
       MomentYoZ :=0;
       if Z<>0 then
        begin
        if ((vFX<0) and (X>=0) and (vFZ>0) and (Z>0)) or ((vFX<0) and (X<=0) and (vFZ<0) and (Z>0))
        or ((vFX>0) and (X>=0) and (vFZ>0) and (Z<0)) or ((vFX>0) and (X<=0) and (vFZ<0) and (Z<0))
        then MomentXoZ := MomentXoZ+(abs(vFX*z)+abs(vFZ*x))
        else MomentXoZ := MomentXoZ-(abs(vFX*z)-abs(vFZ*x)) ;

        if ((vFy>0) and (Y>=0) and (vFZ<0) and (Z>0)) or ((vFy>0) and (Y<=0) and (vFZ>0) and (Z>0))
        or ((vFy<0) and (Y>=0) and (vFZ<0) and (Z<0)) or ((vFy<0) and (Y<=0) and (vFZ>0) and (Z<0))
        then MomentYoZ := MomentYoZ+(abs(vFy*z)+abs(vFZ*y))
        else MomentYoZ := MomentYoZ-(abs(vFy*z)+(abs(vFZ*y))) ;
       end;
      end;
     for i:=0 to MomList.Count-1 do
      begin
      mom :=MomList.Items[i];

      if (mom.GetAxle='OX')then
      begin
       MomentYoZ := MomentYoZ+mom.GetValue;
      end;
      if (mom.GetAxle='OY')then
      begin
         MomentXoZ := MomentXoZ+mom.GetValue;
      end;
     end;

        SigmaMomXoZ := MomentXoZ/Wstyy;
        SigmaMomYoZ := MomentYoZ/Wstxx;


      SigmaZat1 := k*(SigmaFz + SigmaMomXoZ+ SigmaMomYoZ);
//      SigmaZat2 := k*(SigmaFz + SigmaMomYoZ);
//     if abs(SigmaZat1) > abs(SigmaZat2)then
//      begin
       Fzat:= abs(SigmaZat1*Ast/blts2.Count);
       SigmaMax := SigmaZat1+SigmaFz+SigmaMomXoZ+SigmaMomYoZ;
//      end;
//     if abs(SigmaZat1) < abs(SigmaZat2)then
//      begin
//       Fzat:= SigmaZat2*Ast/blts2.Count;
//       SigmaMax := SigmaZat2+SigmaFz+SigmaMomYoZ;
//      end;
end;
procedure CalcForceAndDiameter (XLc, YLc,Fmax {по оси ХУ}, Fzat,Height{толщина одной сопряг детали},
f{коэф трения},k,S,SigmaTek{болта},SigmaSm{материала},SigmaMax,Amount{колво сопр деталей},MomentXoZ ,MomentYoZ
:Extended; var Vd1OnZaz,Vd1NotZaz , VFmax ,VFr,VFzatOnZaz,VFzatNotZaz:extended);
var i : integer ;
    Hr,Vr,d1OnZaz,d1NotZaz,d1,Fm,Fm1max,Fm2max, Fr,Fm1 ,R, RAngle,Fm2 ,Rsum ,RsumX,RsumY,
    FZ,vFX,vFY,vFZ :  Extended  ;
   // blt : TBolt;
    frs :TForce ;  
begin
  vFX:=0;
  vFY:=0;
  vFZ:=0;
  if SigmaMax <>0 then
   begin
    if SigmaMax>SigmaSm then
     begin
      ShowMessage('Недостаточна прочность основания');
      exit;
     end;
   end;
  if Fmax<>0 then
  begin
  d1NotZaz := sqrt(4*Fmax/(pi*0.4*SigmaTek)) ;
  if (Fmax/(Height*d1NotZaz))<(SigmaTek*0.8) then Vd1NotZaz := d1NotZaz
  else
   begin
    ShowMessage('Болт сминает - возьмите другой материал болта');
    exit;
   end;
  end;
  for i:=0 to ForList.Count-1 do
   begin
    FZ:=0;
    frs :=ForList.Items[i];
    frs.GetCompOfForce(vFX,vFY,vFZ);
    vFZ := FZ + vFZ;
   end;
  vFZ := vFZ/blts2.Count;
  RsumX:=0;
  RsumY:=0;
  Fm1max:=0;
  Fm2max:=0;
  for i:=0 to blts2.Count-1 do
    begin
    blt :=blts2.Items[i];
     LocalCenterBoltRadiusVect (XLc, YLc,i,Hr,Vr,R, RAngle);
     RsumX:= RsumX+Hr*Hr;
     RsumY:= RsumY+Vr*Vr;
    end;
  for i:=0 to blts2.Count-1 do
    begin
     blt :=blts2.Items[i];
     LocalCenterBoltRadiusVect (XLc, YLc,i,Hr,Vr,R, RAngle);
     if RSumX<>0 then
     Fm1 := MomentXoZ*Hr/RsumX else Fm1:=0;
     if RSumy<>0 then
     Fm2 := MomentYoZ*Vr/RsumY else Fm2:=0;
     pz := Fm1+ Fm2;
    if  abs(pz)<0.0000001 then pz := 0;
    blt.SetReactions(px,py,pz);
     if (abs(Fm1)>= Fm1max) then Fm1max := Fm1 ;
     if (abs(Fm2)>= Fm2max) then Fm2max := Fm2 ;
    end;
     Fm:= Fm1max+Fm2max;
 //   end;
  if Fzat <>0 then
   begin
    VFr:=0.25*(abs(Fm)+abs(vFZ))+Fzat;    //????????????/
    //типа цикл и работа с файлом

    if VFr <= 800*SigmaTek/240  then d1 := 4.918  ;
    if (VFr <= 1500*SigmaTek/240) and (VFr > 800*SigmaTek/240) then d1 := 6.647  ;
    if (VFr <= 2500*SigmaTek/240) and (VFr > 1500*SigmaTek/240) then d1 := 8.376  ;
    if (VFr <= 3800*SigmaTek/240) and (VFr > 2500*SigmaTek/240)  then d1 := 10.106 ;
    if (VFr <= 5200*SigmaTek/240) and (VFr > 3800*SigmaTek/240) then d1 := 11.835 ;
    if (VFr <= 8000*SigmaTek/240) and (VFr > 5200*SigmaTek/240) then d1 := 13.835 ;
    if (VFr <= 10500*SigmaTek/240) and (VFr > 8000*SigmaTek/240) then d1:= 15.294;
    if (VFr <= 14000*SigmaTek/240) and (VFr > 10500*SigmaTek/240)  then d1:= 17.294;
    if (VFr <= 19000*SigmaTek/240) and (VFr > 14000*SigmaTek/240) then  d1:= 19.294;
    if (VFr <= 21000*SigmaTek/240) and (VFr > 19000*SigmaTek/240) then d1:= 20.752;
    if (VFr <= 34000*SigmaTek/240) and (VFr > 21000*SigmaTek/240) then d1:= 23.752;
    if (VFr <= 46000*SigmaTek/240) and (VFr > 34000*SigmaTek/240) then d1:= 26.211;
    if (VFr <= 73000*SigmaTek/240) and (VFr > 46000*SigmaTek/240) then d1:= 31.670;
    if (VFr <= 110000*SigmaTek/240) and (VFr > 73000*SigmaTek/240) then d1:=33.733;
    if Vd1NotZaz < d1 then Vd1NotZaz := d1
    else Vd1NotZaz:=Vd1NotZaz;
    //if then else
   end;
   VFzatNotZaz:=Fzat;
    //сравнить с табличкой из Иванова 1.4 и проверить
    //  диам болта на прочность
/////////////////////болт с зазором/////////////////////
    // сравнить с табличкой из Иванова 1.4 и взять s
  { if  VFzatOnZaz >= 800*SigmaTek/240 then s:=5 ;
    if  VFzatOnZaz >= 1500*SigmaTek/240 then s:=4.8 ;
    if  VFzatOnZaz >= 2500*SigmaTek/240 then s:=4.6 ;
    if  VFzatOnZaz >= 3800*SigmaTek/240 then s:=4.4 ;
    if  VFzatOnZaz >= 5200*SigmaTek/240 then s:=4.42 ;
    if  VFzatOnZaz >= 8000*SigmaTek/240 then s:=4 ;
    if  VFzatOnZaz >= 10500*SigmaTek/240 then s:=3.75 ;
    if  VFzatOnZaz >= 14000*SigmaTek/240 then s:=3.5 ;
    if  VFzatOnZaz >= 19000*SigmaTek/240 then s:=3.25 ;
    if  VFzatOnZaz >= 21000*SigmaTek/240 then s:=3 ;
    if  VFzatOnZaz >= 34000*SigmaTek/240 then s:= 2.75;
    if  VFzatOnZaz >= 46000*SigmaTek/240 then s:=2.5;
    if  VFzatOnZaz >= 73000*SigmaTek/240 then s:=2;
    if  VFzatOnZaz >= 110000*SigmaTek/240 then s:=1.5; }
    VFzatOnZaz:= Fmax*k/f;
    if  VFzatOnZaz < Fzat then VFzatOnZaz := Fzat;                              // Спросить
    VFr:=0.25*(abs(Fm)+abs(vFZ))+VFzatOnZaz;
   {s:=0;
   if VFr <= 800*SigmaTek/240   then s:=5 ;
  if (VFr <= 1500*SigmaTek/240) and (VFr > 800*SigmaTek/240) then s:=4.8 ;
  if (VFr <= 2500*SigmaTek/240) and (VFr > 1500*SigmaTek/240) then s:=4.6 ;
  if (VFr <= 3800*SigmaTek/240) and (VFr > 2500*SigmaTek/240) then s:=4.4 ;
  if (VFr <= 5200*SigmaTek/240) and (VFr > 3800*SigmaTek/240) then s:=4.42 ;
  if (VFr <= 8000*SigmaTek/240) and (VFr > 5200*SigmaTek/240) then s:=4 ;
  if (VFr <= 10500*SigmaTek/240) and (VFr > 8000*SigmaTek/240) then s:=3.75 ;
  if (VFr <= 14000*SigmaTek/240) and (VFr > 10500*SigmaTek/240) then s:=3.5 ;
  if (VFr <= 19000*SigmaTek/240) and (VFr > 14000*SigmaTek/240) then s:=3.25 ;
  if (VFr <= 21000*SigmaTek/240) and (VFr > 19000*SigmaTek/240) then s:=3 ;
  if (VFr <= 34000*SigmaTek/240) and (VFr > 21000*SigmaTek/240) then s:= 2.75;
  if (VFr <= 46000*SigmaTek/240) and (VFr > 34000*SigmaTek/240) then s:=2.5;
  if (VFr <= 73000*SigmaTek/240) and (VFr > 46000*SigmaTek/240) then s:=2;
  if (VFr <= 110000*SigmaTek/240) and (VFr > 73000*SigmaTek/240) then s:=1.5 ;
 if s=0 then s:=1.5;     //можно избавиться введя запас прочности для болта  }
  Vd1OnZaz:= sqrt(4*1.3*VFr/(pi*SigmaTek/s));

  // сравнить с табличкой из Иванова 1.4 и проверить
//  диам болта на прочность

end;

end.
 