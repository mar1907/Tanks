program tancuri;
uses graph,wincrt;
type matrice=array[1..100,1..100] of byte;
     tanc=record
        cordx,cordy,hp,ap,mp,mpr,armf,arml,armp:integer;
        nsev:char;
     end;
var gd,gm:integer;
    a:matrice;
    tanc1,tanc2:tanc;
    nivel:string;
    careu,prim1,enterda,devast:boolean;


{Procedura castigator (felicita castigatorul, e accesata de procedura meniu1,
nu acceseaza nimic)}
procedure castigator;
var i:integer;
begin
        clearviewport;
        settextstyle(defaultfont,horizdir,6);
        setcolor(blue);
        outtextxy(400,300,'Felicitari!');
        settextstyle(defaultfont,horizdir,1);
        setcolor(yellow);
        for i:=1 to 1000 do
                putpixel(random(1366),random(768),random(15));
        setcolor(yellow);
        readkey;
        clearviewport;
end;


{Procedura explozie (afiseaza o 'explozie', e accesata de procedura meniu1,
nu acceseaza nimic)}
procedure explozie;
begin
        setcolor(red);
        if tanc1.hp<=0 then
                begin
                        setfillstyle(solidfill,red);
                        fillellipse((tanc1.cordy-1)*100+60,(tanc1.cordx-1)*100+60,40,40);
                        setfillstyle(solidfill,brown);
                        fillellipse((tanc1.cordy-1)*100+60,(tanc1.cordx-1)*100+60,30,30);
                end;
        if tanc2.hp<=0 then
                begin
                        setfillstyle(solidfill,red);
                        fillellipse((tanc2.cordy-1)*100+60,(tanc2.cordx-1)*100+60,40,40);
                        setfillstyle(solidfill,brown);
                        fillellipse((tanc2.cordy-1)*100+60,(tanc2.cordx-1)*100+60,30,30);
                end;
        delay(2000);
        settextstyle(defaultfont,horizdir,6);
        setcolor(cyan);
        setfillstyle(solidfill,red);
        outtextxy(550,300,'BOOM!');
        delay(500);
        floodfill(1,1,red);
        setcolor(yellow);
        settextstyle(defaultfont,horizdir,1);
        setfillstyle(solidfill,black);
        delay(500);
        floodfill(1,1,black);
end;


{Procedura afisare_harta (afiseaza harta si componentele ei, e accesata de
procedura reafisare, nu acceseaza nimic)}
procedure afisare_harta;
var i,j:byte;
begin
        setcolor(green);
        line(10,10,1110,10);
        line(10,510,1110,510);
        line(10,10,10,510);
        line(1110,10,1110,510);
        if careu=true then
                begin
                        line(10,110,1110,110);
                        line(10,210,1110,210);
                        line(10,310,1110,310);
                        line(10,410,1110,410);
                        line(110,10,110,510);
                        line(210,10,210,510);
                        line(310,10,310,510);
                        line(410,10,410,510);
                        line(510,10,510,510);
                        line(610,10,610,510);
                        line(710,10,710,510);
                        line(810,10,810,510);
                        line(910,10,910,510);
                        line(1010,10,1010,510);
                end;
        for i:=1 to 5 do
                for j:=1 to 11 do
                        case a[i,j] of
                                3:begin
                                        setcolor(white);
                                        circle((j-1)*100+60,(i-1)*100+60,20);
                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+100,(i-1)*100+60);
                                        line((j-1)*100+36,(i-1)*100+80,(j-1)*100+84,(i-1)*100+80);
                                end;
                                4:begin
                                        setcolor(white);
                                        circle((j-1)*100+60,(i-1)*100+60,20);
                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+20,(i-1)*100+60);
                                        line((j-1)*100+36,(i-1)*100+80,(j-1)*100+84,(i-1)*100+80);
                                end;
                                5:begin
                                        setfillstyle(solidfill,brown);
                                        bar((j-1)*100+11,(i-1)*100+11,(j-1)*100+109,(i-1)*100+109);
                                        setfillstyle(solidfill,black);
                                end;
                                1:begin
                                        setcolor(magenta);
                                        circle((j-1)*100+60,(i-1)*100+60,20);
                                        case tanc1.nsev of
                                                'n':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+60,(i-1)*100+20);
                                                        line((j-1)*100+40,(i-1)*100+36,(j-1)*100+40,(i-1)*100+84);
                                                        line((j-1)*100+80,(i-1)*100+36,(j-1)*100+80,(i-1)*100+84);
                                                end;
                                                's':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+60,(i-1)*100+100);
                                                        line((j-1)*100+40,(i-1)*100+36,(j-1)*100+40,(i-1)*100+84);
                                                        line((j-1)*100+80,(i-1)*100+36,(j-1)*100+80,(i-1)*100+84);
                                                end;
                                                'e':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+100,(i-1)*100+60);
                                                        line((j-1)*100+36,(i-1)*100+40,(j-1)*100+84,(i-1)*100+40);
                                                        line((j-1)*100+36,(i-1)*100+80,(j-1)*100+84,(i-1)*100+80);
                                                end;
                                                'v':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+20,(i-1)*100+60);
                                                        line((j-1)*100+36,(i-1)*100+40,(j-1)*100+84,(i-1)*100+40);
                                                        line((j-1)*100+36,(i-1)*100+80,(j-1)*100+84,(i-1)*100+80);
                                                end;
                                        end;
                                end;
                                2:begin
                                        setcolor(blue);
                                        circle((j-1)*100+60,(i-1)*100+60,20);
                                        case tanc2.nsev of
                                                'n':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+60,(i-1)*100+20);
                                                        line((j-1)*100+40,(i-1)*100+36,(j-1)*100+40,(i-1)*100+84);
                                                        line((j-1)*100+80,(i-1)*100+36,(j-1)*100+80,(i-1)*100+84);
                                                end;
                                                's':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+60,(i-1)*100+100);
                                                        line((j-1)*100+40,(i-1)*100+36,(j-1)*100+40,(i-1)*100+84);
                                                        line((j-1)*100+80,(i-1)*100+36,(j-1)*100+80,(i-1)*100+84);
                                                end;
                                                'e':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+100,(i-1)*100+60);
                                                        line((j-1)*100+36,(i-1)*100+40,(j-1)*100+84,(i-1)*100+40);
                                                        line((j-1)*100+36,(i-1)*100+80,(j-1)*100+84,(i-1)*100+80);
                                                end;
                                                'v':begin
                                                        line((j-1)*100+60,(i-1)*100+60,(j-1)*100+20,(i-1)*100+60);
                                                        line((j-1)*100+36,(i-1)*100+40,(j-1)*100+84,(i-1)*100+40);
                                                        line((j-1)*100+36,(i-1)*100+80,(j-1)*100+84,(i-1)*100+80);
                                                end;
                                        end;
                                end;
                        end;
end;


{Procedura afisare_detalii (afiseaza armura tancurilor precum si puterea lor
de atac si punctele de miscare, e accesata de procedura reafisare, nu
acceseaza nimic)}
procedure afisare_detalii;
var s:string;
begin
        setcolor(magenta);
        outtextxy(75,550,'Tancul 1');
        with tanc1 do
                begin
                        case armf of
                                75:setcolor(green);
                                50:setcolor(yellow);
                                25:setcolor(red);
                        end;
                        arc(100,630,45,135,30);
                        case arml of
                                75:setcolor(green);
                                50:setcolor(yellow);
                                25:setcolor(red);
                        end;
                        arc(100,630,135,225,30);
                        arc(100,630,315,360,30);
                        arc(100,630,0,45,30);
                        case armp of
                                75:setcolor(green);
                                50:setcolor(yellow);
                                25:setcolor(red);
                        end;
                        arc(100,630,315,225,30);
                        setcolor(white);
                        line(100,630,100,570);
                        line(69,666,69,594);
                        line(131,666,131,594);
                        str(hp,s);
                        outtextxy(170,550,'Puncte de viata: '+s);
                        str(ap,s);
                        outtextxy(170,560,'Puncte de atac: '+s);
                        str(mp,s);
                        outtextxy(170,570,'Puncte de miscare: '+s);
                        str(mpr,s);
                        setcolor(magenta);
                        outtextxy(170,580,'Puncte de miscare ramase: '+s);
                        str(armf,s);
                        setcolor(white);
                        outtextxy(170,590,'Armura frontala: '+s);
                        str(arml,s);
                        outtextxy(170,600,'Armura laterala: '+s);
                        str(armp,s);
                        outtextxy(170,610,'Armura posterioara: '+s);
                end;
        setcolor(blue);
        outtextxy(775,550,'Tancul 2');
        with tanc2 do
                begin
                        case armf of
                                75:setcolor(green);
                                50:setcolor(yellow);
                                25:setcolor(red);
                        end;
                        arc(800,630,45,135,30);
                        case arml of
                                75:setcolor(green);
                                50:setcolor(yellow);
                                25:setcolor(red);
                        end;
                        arc(800,630,135,225,30);
                        arc(800,630,315,360,30);
                        arc(800,630,0,45,30);
                        case armp of
                                75:setcolor(green);
                                50:setcolor(yellow);
                                25:setcolor(red);
                        end;
                        arc(800,630,315,225,30);
                        setcolor(white);
                        line(800,630,800,570);
                        line(769,666,769,594);
                        line(831,666,831,594);
                        str(hp,s);
                        outtextxy(870,550,'Puncte de viata: '+s);
                        str(ap,s);
                        outtextxy(870,560,'Puncte de atac: '+s);
                        str(mp,s);
                        outtextxy(870,570,'Puncte de miscare: '+s);
                        str(mpr,s);
                        setcolor(blue);
                        outtextxy(870,580,'Puncte de miscare ramase: '+s);
                        str(armf,s);
                        setcolor(white);
                        outtextxy(870,590,'Armura frontala: '+s);
                        str(arml,s);
                        outtextxy(870,600,'Armura laterala: '+s);
                        str(armp,s);
                        outtextxy(870,610,'Armura posterioara: '+s);
                end;
end;


{Procedura reafisare (curata ecranul si acceseaza procedurile de afisare,
e accesata de procedura principal si mutare, acceseaza procedurile
afisare_harta si afisare_detalii)}
procedure reafisare;
begin
        clearviewport;
        afisare_harta;
        afisare_detalii;
        setcolor(yellow);
end;


{Procedura ataca (calculeaza succesul atacului si eventual puterea loviturii
pe care o returneaza in procedura anterioara pentru a fi afisata si deseneaza
o linie rosie intre tancuri pentru a desemna lovitura, e accesata de procedura
mutare, nu acceseaza nimic)}
Procedure ataca(var nr_tanc:integer; var lovitura:integer);
var succes:boolean;
    dist:integer;
begin
        if nr_tanc=1 then
           with tanc1 do
               begin
                        succes:=true;
                        if (nsev='n')and(tanc2.nsev='n') then
                                if random(100)>tanc2.armp then
                                        succes:=false;
                        if (nsev='n')and(tanc2.nsev='s') then
                                if random(100)>tanc2.armf then
                                        succes:=false;
                        if (nsev='n')and((tanc2.nsev='e')or(tanc2.nsev='v')) then
                                if random(100)>tanc2.arml then
                                        succes:=false;
                        if (nsev='s')and(tanc2.nsev='s') then
                                if random(100)>tanc2.armp then
                                        succes:=false;
                        if (nsev='s')and(tanc2.nsev='n') then
                                if random(100)>tanc2.armf then
                                        succes:=false;
                        if (nsev='s')and((tanc2.nsev='e')or(tanc2.nsev='v')) then
                                if random(100)>tanc2.arml then
                                        succes:=false;
                        if (nsev='e')and(tanc2.nsev='e') then
                                if random(100)>tanc2.armp then
                                        succes:=false;
                        if (nsev='e')and(tanc2.nsev='v') then
                                if random(100)>tanc2.armf then
                                        succes:=false;
                        if (nsev='e')and((tanc2.nsev='n')or(tanc2.nsev='s')) then
                                if random(100)>tanc2.arml then
                                        succes:=false;
                        if (nsev='v')and(tanc2.nsev='v') then
                                if random(100)>tanc2.armp then
                                        succes:=false;
                        if (nsev='v')and(tanc2.nsev='e') then
                                if random(100)>tanc2.armf then
                                        succes:=false;
                        if (nsev='v')and((tanc2.nsev='n')or(tanc2.nsev='s')) then
                                if random(100)>tanc2.arml then
                                        succes:=false;
                        if succes=true then
                                lovitura:=0
                        else
                                begin
                                        dist:= round(int(sqrt((cordx-tanc2.cordx)*(cordx-tanc2.cordx)+(cordy-tanc2.cordy)*(cordy-tanc2.cordy))));
                                        lovitura:=tanc1.ap-((dist-1)*5)+(random(11)-5);
                                end;
                        tanc2.hp:=tanc2.hp-lovitura;
                        if tanc2.hp<0 then
                                tanc2.hp:=0;
                end
        else
           with tanc2 do
                begin
                        succes:=true;
                        if (nsev='n')and(tanc1.nsev='n') then
                                if random(100)>tanc1.armp then
                                        succes:=false;
                        if (nsev='n')and(tanc1.nsev='s') then
                                if random(100)>tanc1.armf then
                                        succes:=false;
                        if (nsev='n')and((tanc1.nsev='e')or(tanc1.nsev='v')) then
                                if random(100)>tanc1.arml then
                                        succes:=false;
                        if (nsev='s')and(tanc1.nsev='s') then
                                if random(100)>tanc1.armp then
                                        succes:=false;
                        if (nsev='s')and(tanc1.nsev='n') then
                                if random(100)>tanc1.armf then
                                        succes:=false;
                        if (nsev='s')and((tanc1.nsev='e')or(tanc1.nsev='v')) then
                                if random(100)>tanc1.arml then
                                        succes:=false;
                        if (nsev='e')and(tanc1.nsev='e') then
                                if random(100)>tanc1.armp then
                                        succes:=false;
                        if (nsev='e')and(tanc1.nsev='v') then
                                if random(100)>tanc1.armf then
                                        succes:=false;
                        if (nsev='e')and((tanc1.nsev='n')or(tanc1.nsev='s')) then
                                if random(100)>tanc1.arml then
                                        succes:=false;
                        if (nsev='v')and(tanc1.nsev='v') then
                                if random(100)>tanc1.armp then
                                        succes:=false;
                        if (nsev='v')and(tanc1.nsev='e') then
                                if random(100)>tanc1.armf then
                                        succes:=false;
                        if (nsev='v')and((tanc1.nsev='n')or(tanc1.nsev='s')) then
                                if random(100)>tanc1.arml then
                                        succes:=false;
                        if succes=true then
                                lovitura:=0
                        else
                                begin
                                        dist:= round(int(sqrt((cordx-tanc1.cordx)*(cordx-tanc1.cordx)+(cordy-tanc1.cordy)*(cordy-tanc1.cordy))));
                                        lovitura:=tanc1.ap-((dist-1)*5)+(random(11)-5);
                                end;
                        tanc1.hp:=tanc1.hp-lovitura;
                        if tanc1.hp<0 then
                                tanc1.hp:=0;
                end;
        setcolor(red);
        line(((tanc1.cordy-1)*100+60),((tanc1.cordx-1)*100+60),((tanc2.cordy-1)*100+60),((tanc2.cordx-1)*100+60));
        setcolor(yellow);
end;

{Functia atac_posibil (verifica posibilitatea unui atac si returneaza true
daca e posibil si false daca nu, e accesata de procedura mutare, nu acceseaza
nimic)}
function atac_posibil(nr_tanc:integer):boolean;
begin
        if nr_tanc=1 then
            with tanc1 do
                case nivel of
                        'Kursk':begin
                                        if ((nsev='n')and(cordy=tanc2.cordy)and(cordx>tanc2.cordx)and((a[cordx-1,cordy]=0)or(a[cordx-1,cordy]=2)))or
                                        ((nsev='s')and(cordy=tanc2.cordy)and(cordx<tanc2.cordx)and((a[cordx+1,cordy]=0)or(a[cordx+1,cordy]=2)))or
                                        ((nsev='v')and(cordx=tanc2.cordx)and(cordy>tanc2.cordy)and((a[cordx,cordy-1]=0)or(a[cordx,cordy-1]=2)))or
                                        ((nsev='e')and(cordx=tanc2.cordx)and(cordy<tanc2.cordy)and((a[cordx,cordy+1]=0)or(a[cordx,cordy+1]=2))) then
                                                atac_posibil:=true
                                        else
                                                atac_posibil:=false;
                                end;
                        'El_Alam':begin
                                        atac_posibil:=false;
                                        if (((cordx=1)and(tanc2.cordx=1))or((cordx=5)and(tanc2.cordx=5)))and(((nsev='e')and(cordy<tanc2.cordy))or((nsev='v')and(cordy>tanc2.cordy))) then
                                                atac_posibil:=true;
                                        if ((tanc2.cordx=5)and(tanc2.cordy=3))and((nsev='e')or(nsev='s'))and(((cordx=4)and(cordy=2))or((cordx=3)and(cordy=1))) then
                                                atac_posibil:=true;
                                        if ((tanc2.cordx=1)and(tanc2.cordy=3))and((nsev='e')or(nsev='n'))and(((cordx=2)and(cordy=2))or((cordx=3)and(cordy=1))) then
                                                atac_posibil:=true;
                                        if ((tanc2.cordx=1)and(tanc2.cordy=9))and((nsev='v')or(nsev='n'))and(((cordx=2)and(cordy=10))or((cordx=3)and(cordy=11))) then
                                                atac_posibil:=true;
                                        if ((tanc2.cordx=5)and(tanc2.cordy=9))and((nsev='v')or(nsev='s'))and(((cordx=4)and(cordy=10))or((cordx=3)and(cordy=11))) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=3))and((nsev='v')or(nsev='n'))and(((tanc2.cordx=4)and(tanc2.cordy=2))or((tanc2.cordx=3)and(tanc2.cordy=1))) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=3))and((nsev='v')or(nsev='s'))and(((tanc2.cordx=2)and(tanc2.cordy=2))or((tanc2.cordx=3)and(tanc2.cordy=1))) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=9))and((nsev='e')or(nsev='s'))and(((tanc2.cordx=2)and(tanc2.cordy=10))or((tanc2.cordx=3)and(tanc2.cordy=11))) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=9))and((nsev='e')or(nsev='n'))and(((tanc2.cordx=4)and(tanc2.cordy=10))or((tanc2.cordx=3)and(tanc2.cordy=11))) then
                                                atac_posibil:=true;
                                        if ((cordy<3)and(tanc2.cordy<3))and(((nsev='n')and(cordx>tanc2.cordx))or((nsev='s')and(cordx<tanc2.cordx))) then
                                                atac_posibil:=true;
                                        if ((cordy>9)and(tanc2.cordy>9))and(((nsev='n')and(cordx>tanc2.cordx))or((nsev='s')and(cordx<tanc2.cordx))) then
                                                atac_posibil:=true;
                                        if ((cordy=1)and(tanc2.cordy=2))and((nsev='e')and((cordx=tanc2.cordx)or(cordx=tanc2.cordx+1))or((cordx=tanc2.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordy=2)and(tanc2.cordy=1))and((nsev='v')and((cordx=tanc2.cordx)or(cordx=tanc2.cordx+1))or((cordx=tanc2.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordy=10)and(tanc2.cordy=11))and((nsev='e')and((cordx=tanc2.cordx)or(cordx=tanc2.cordx+1))or((cordx=tanc2.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordy=11)and(tanc2.cordy=10))and((nsev='v')and((cordx=tanc2.cordx)or(cordx=tanc2.cordx+1))or((cordx=tanc2.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=3))and(nsev='v')and(tanc2.cordx=4)and(tanc2.cordy=1) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=3))and(nsev='v')and(tanc2.cordx=2)and(tanc2.cordy=1) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=9))and(nsev='e')and(tanc2.cordx=4)and(tanc2.cordy=11) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=9))and(nsev='e')and(tanc2.cordx=2)and(tanc2.cordy=11) then
                                                atac_posibil:=true;
                                        if ((cordx=4)and(cordy=1))and(nsev='e')and(tanc2.cordx=5)and(tanc2.cordy=3) then
                                                atac_posibil:=true;
                                        if ((cordx=2)and(cordy=1))and(nsev='e')and(tanc2.cordx=1)and(tanc2.cordy=3) then
                                                atac_posibil:=true;
                                        if ((cordx=4)and(cordy=11))and(nsev='v')and(tanc2.cordx=5)and(tanc2.cordy=9) then
                                                atac_posibil:=true;
                                        if ((cordx=2)and(cordy=11))and(nsev='v')and(tanc2.cordx=1)and(tanc2.cordy=9) then
                                                atac_posibil:=true;
                                  end;
                        'Falaise':begin
                                        atac_posibil:=false;
                                        if (nsev='e')and(tanc2.cordy-cordy>=tanc2.cordx-cordx) then
                                                atac_posibil:=true;
                                        if (nsev='v')and(cordy-tanc2.cordy>=cordx-tanc2.cordx) then
                                                atac_posibil:=true;
                                        if (nsev='n')and(cordx-tanc2.cordx>=cordy-tanc2.cordy) then
                                                atac_posibil:=true;
                                        if (nsev='s')and(tanc2.cordx-cordx>=tanc2.cordy-cordy) then
                                                atac_posibil:=true;
                                  end;
                end
        else
            with tanc2 do
                case nivel of
                        'Kursk':begin
                                        if ((nsev='n')and(cordy=tanc1.cordy)and(cordx>tanc1.cordx)and((a[cordx-1,cordy]=0)or(a[cordx-1,cordy]=1)))or
                                        ((nsev='s')and(cordy=tanc1.cordy)and(cordx<tanc1.cordx)and((a[cordx+1,cordy]=0)or(a[cordx+1,cordy]=1)))or
                                        ((nsev='v')and(cordx=tanc1.cordx)and(cordy>tanc1.cordy)and((a[cordx,cordy-1]=0)or(a[cordx,cordy-1]=1)))or
                                        ((nsev='e')and(cordx=tanc1.cordx)and(cordy<tanc1.cordy)and((a[cordx,cordy+1]=0)or(a[cordx,cordy+1]=1))) then
                                                atac_posibil:=true
                                        else
                                                atac_posibil:=false;
                                end;
                        'El_Alam':begin
                                        atac_posibil:=false;
                                        if (((cordx=1)and(tanc1.cordx=1))or((cordx=5)and(tanc1.cordx=5)))and(((nsev='e')and(cordy<tanc1.cordy))or((nsev='v')and(cordy>tanc1.cordy))) then
                                                atac_posibil:=true;
                                        if ((tanc1.cordx=5)and(tanc1.cordy=3))and((nsev='e')or(nsev='s'))and(((cordx=4)and(cordy=2))or((cordx=3)and(cordy=1))) then
                                                atac_posibil:=true;
                                        if ((tanc1.cordx=1)and(tanc1.cordy=3))and((nsev='e')or(nsev='n'))and(((cordx=2)and(cordy=2))or((cordx=3)and(cordy=1))) then
                                                atac_posibil:=true;
                                        if ((tanc1.cordx=1)and(tanc1.cordy=9))and((nsev='v')or(nsev='n'))and(((cordx=2)and(cordy=10))or((cordx=3)and(cordy=11))) then
                                                atac_posibil:=true;
                                        if ((tanc1.cordx=5)and(tanc1.cordy=9))and((nsev='v')or(nsev='s'))and(((cordx=4)and(cordy=10))or((cordx=3)and(cordy=11))) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=3))and((nsev='v')or(nsev='n'))and(((tanc1.cordx=4)and(tanc1.cordy=2))or((tanc1.cordx=3)and(tanc1.cordy=1))) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=3))and((nsev='v')or(nsev='s'))and(((tanc1.cordx=2)and(tanc1.cordy=2))or((tanc1.cordx=3)and(tanc1.cordy=1))) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=9))and((nsev='e')or(nsev='s'))and(((tanc1.cordx=2)and(tanc1.cordy=10))or((tanc1.cordx=3)and(tanc1.cordy=11))) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=9))and((nsev='e')or(nsev='n'))and(((tanc1.cordx=4)and(tanc1.cordy=10))or((tanc1.cordx=3)and(tanc1.cordy=11))) then
                                                atac_posibil:=true;
                                        if ((cordy<3)and(tanc1.cordy<3))and(((nsev='n')and(cordx>tanc1.cordx))or((nsev='s')and(cordx<tanc1.cordx))) then
                                                atac_posibil:=true;
                                        if ((cordy>9)and(tanc1.cordy>9))and(((nsev='n')and(cordx>tanc1.cordx))or((nsev='s')and(cordx<tanc1.cordx))) then
                                                atac_posibil:=true;
                                        if ((cordy=1)and(tanc1.cordy=2))and((nsev='e')and((cordx=tanc1.cordx)or(cordx=tanc1.cordx+1))or((cordx=tanc1.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordy=2)and(tanc1.cordy=1))and((nsev='v')and((cordx=tanc1.cordx)or(cordx=tanc1.cordx+1))or((cordx=tanc1.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordy=10)and(tanc1.cordy=11))and((nsev='e')and((cordx=tanc1.cordx)or(cordx=tanc1.cordx+1))or((cordx=tanc1.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordy=11)and(tanc1.cordy=10))and((nsev='v')and((cordx=tanc1.cordx)or(cordx=tanc1.cordx+1))or((cordx=tanc1.cordx-1))) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=3))and(nsev='v')and(tanc1.cordx=4)and(tanc1.cordy=1) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=3))and(nsev='v')and(tanc1.cordx=2)and(tanc1.cordy=1) then
                                                atac_posibil:=true;
                                        if ((cordx=5)and(cordy=9))and(nsev='e')and(tanc1.cordx=4)and(tanc1.cordy=11) then
                                                atac_posibil:=true;
                                        if ((cordx=1)and(cordy=9))and(nsev='e')and(tanc1.cordx=2)and(tanc1.cordy=11) then
                                                atac_posibil:=true;
                                        if ((cordx=4)and(cordy=1))and(nsev='e')and(tanc1.cordx=5)and(tanc1.cordy=3) then
                                                atac_posibil:=true;
                                        if ((cordx=2)and(cordy=1))and(nsev='e')and(tanc1.cordx=1)and(tanc1.cordy=3) then
                                                atac_posibil:=true;
                                        if ((cordx=4)and(cordy=11))and(nsev='v')and(tanc1.cordx=5)and(tanc1.cordy=9) then
                                                atac_posibil:=true;
                                        if ((cordx=2)and(cordy=11))and(nsev='v')and(tanc1.cordx=1)and(tanc1.cordy=9) then
                                                atac_posibil:=true;
                                  end;
                        'Falaise':begin
                                        atac_posibil:=false;
                                        if (nsev='e')and(tanc1.cordy-cordy>=tanc1.cordx-cordx) then
                                                atac_posibil:=true;
                                        if (nsev='v')and(cordy-tanc1.cordy>=cordx-tanc1.cordx) then
                                                atac_posibil:=true;
                                        if (nsev='n')and(cordx-tanc1.cordx>=cordy-tanc1.cordy) then
                                                atac_posibil:=true;
                                        if (nsev='s')and(tanc1.cordx-cordx>=tanc1.cordy-cordy) then
                                                atac_posibil:=true;
                                  end;
                end;
end;


{Procedura mutare (citeste si realizeaza toate mutarile unui jucator dintr-o
tura eventual atacul primeste ca parametrii 1 sau 2 in functie de tancul care
muta, e accesata de procedura principal, acceseaza procedurile ataca,
atac-posibil, reafisare)}
Procedure mutare(var nr_tanc:integer);
var atac,misc_r:boolean;
    lovitura:integer;
    nr_tanc_s,lovitura_s:string;
    b:char;
begin
        if nr_tanc=1 then
                with tanc1 do
                        begin
                                atac:=false;
                                str(nr_tanc,nr_tanc_s);
                                mpr:=mp;
                                repeat
                                        outtextxy(1,1,'Tura tancului '+nr_tanc_s);
                                        b:=readkey;
                                        misc_r:=true;
                                        if b<>' ' then
                                                begin
                                                        b:=readkey;
                                                        case b of
                                                                'K':begin
                                                                        if nsev<>'v' then
                                                                                nsev:='v'
                                                                        else
                                                                                if (cordy-1>0) then
                                                                                        begin
                                                                                                if a[cordx,cordy-1]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx,cordy-1]:=nr_tanc;
                                                                                                                cordy:=cordy-1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                                'M':begin
                                                                        if nsev<>'e' then
                                                                                nsev:='e'
                                                                        else
                                                                                if (cordy+1<12) then
                                                                                        begin
                                                                                                if a[cordx,cordy+1]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx,cordy+1]:=nr_tanc;
                                                                                                                cordy:=cordy+1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                                'H':begin
                                                                        if nsev<>'n' then
                                                                                nsev:='n'
                                                                        else
                                                                                if (cordx-1>0) then
                                                                                        begin
                                                                                                if a[cordx-1,cordy]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx-1,cordy]:=nr_tanc;
                                                                                                                cordx:=cordx-1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                                'P':begin
                                                                        if nsev<>'s' then
                                                                                nsev:='s'
                                                                        else
                                                                                if (cordx+1<6) then
                                                                                        begin
                                                                                                if a[cordx+1,cordy]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx+1,cordy]:=nr_tanc;
                                                                                                                cordx:=cordx+1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                        end;
                                                        if misc_r=false then
                                                                delay(2000)
                                                        else
                                                                mpr:=mpr-1;
                                                end
                                        else
                                                if atac_posibil(nr_tanc)=true then
                                                        begin
                                                                ataca(nr_tanc,lovitura);
                                                                atac:=true;
                                                                str(lovitura,lovitura_s);
                                                                outtextxy(500,1,'Atacul a luat '+lovitura_s+' din punctele de viata ale adversarului!');
                                                                delay(2000);
                                                        end
                                                else
                                                        begin
                                                                outtextxy(500,1,'Imposibil de lovit!');
                                                                delay(2000);
                                                        end;
                                        reafisare;
                                        if atac=true then
                                                outtextxy(500,1,'Atacul a luat '+lovitura_s+' din punctele de viata ale adversarului!');
                                until (atac=true)or(mpr=0);
                        end
        else
                with tanc2 do
                        begin
                                atac:=false;
                                str(nr_tanc,nr_tanc_s);
                                mpr:=mp;
                                repeat
                                        outtextxy(1,1,'Tura tancului '+nr_tanc_s);
                                        b:=readkey;
                                        misc_r:=true;
                                        if b<>' ' then
                                                begin
                                                        b:=readkey;
                                                        case b of
                                                                'K':begin
                                                                        if nsev<>'v' then
                                                                                nsev:='v'
                                                                        else
                                                                                if (cordy-1>0) then
                                                                                        begin
                                                                                                if a[cordx,cordy-1]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx,cordy-1]:=nr_tanc;
                                                                                                                cordy:=cordy-1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                                'M':begin
                                                                        if nsev<>'e' then
                                                                                nsev:='e'
                                                                        else
                                                                                if (cordy+1<12) then
                                                                                        begin
                                                                                                if a[cordx,cordy+1]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx,cordy+1]:=nr_tanc;
                                                                                                                cordy:=cordy+1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                                'H':begin
                                                                        if nsev<>'n' then
                                                                                nsev:='n'
                                                                        else
                                                                                if (cordx-1>0) then
                                                                                        begin
                                                                                                if a[cordx-1,cordy]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx-1,cordy]:=nr_tanc;
                                                                                                                cordx:=cordx-1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                                'P':begin
                                                                        if nsev<>'s' then
                                                                                nsev:='s'
                                                                        else
                                                                                if (cordx+1<6) then
                                                                                        begin
                                                                                                if a[cordx+1,cordy]=0 then
                                                                                                        begin
                                                                                                                a[cordx,cordy]:=0;
                                                                                                                a[cordx+1,cordy]:=nr_tanc;
                                                                                                                cordx:=cordx+1;
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                                misc_r:=false;
                                                                                                        end;
                                                                                        end
                                                                                else
                                                                                        begin
                                                                                                outtextxy(500,1,'Imposibil');
                                                                                                misc_r:=false;
                                                                                        end;
                                                                    end;
                                                        end;
                                                        if misc_r=false then
                                                                delay(2000)
                                                        else
                                                                mpr:=mpr-1;
                                                end
                                        else
                                                if atac_posibil(nr_tanc)=true then
                                                        begin
                                                                ataca(nr_tanc,lovitura);
                                                                atac:=true;
                                                                str(lovitura,lovitura_s);
                                                                outtextxy(500,1,'Atacul a luat '+lovitura_s+' din punctele de viata ale adversarului!');
                                                                delay(2000);
                                                        end
                                                else
                                                        begin
                                                                outtextxy(500,1,'Imposibil de lovit!');
                                                                delay(2000);
                                                        end;
                                        reafisare;
                                until (atac=true)or(mpr=0);
                        end;
        tanc1.mpr:=tanc1.mp;
        tanc2.mpr:=tanc2.mp;
end;


{Procedura enter (asteapta citirea tastei enter intre doua ture, e accesata de
procedura principal, nu acceseaza nimic)}
procedure enter;
var b:char;
begin
        if enterda=true then
                begin
                        outtextxy(1000,1,'Apasa ENTER!');
                        repeat
                                b:=readkey;
                        until b=#13;
                end;
end;


{Procedura devastare (primeste ca parametru numarul turei fiind activ doar
la nivelul Falaise are rolul de a face inaccesibile partile laterale ale
hartii distrugand orice tanc se afla acolo,e accesata de procedura principal,
acceseaza procedura reafisare)}
procedure devastare(tura:integer);
var i:integer;
begin
        if (tura mod 3=0)and(tura<13) then
                begin
                        for i:=1 to 5 do
                                begin
                                        a[i,tura div 3]:=5;
                                        a[i,12-tura div 3]:=5;
                                end;
                        if (tanc1.cordy=tura div 3)or(tanc1.cordy=12-tura div 3) then
                                tanc1.hp:=0;
                        if (tanc2.cordy=tura div 3)or(tanc2.cordy=12-tura div 3) then
                                tanc2.hp:=0;
                        reafisare;
                end;
end;


{Procedura principal (apeleaza alte proceduri pentru a permite jucatorilor sa
mute pe ture si verifica daca s-a terminat jocul, e accesata de procedura
meniu1, acceseaza procedurile reafisare, enter, devastare si mutare)}
procedure principal;
var x,y,tura:integer;
begin
        if prim1=true then
                begin
                        x:=1;
                        y:=2;
                end
        else
                begin
                        x:=2;
                        y:=1;
                end;
        reafisare;
        tura:=1;
        repeat
                mutare(x);
                if not((tanc1.hp=0)or(tanc2.hp=0)) then
                        enter;
                if (tanc2.hp>0)and(tanc1.hp>0) then
                        begin
                                mutare(y);
                                if not((tanc1.hp=0)or(tanc2.hp=0)) then
                                        enter;
                        end;
                inc(tura);
                if (nivel='Falaise')and(devast=true) then
                        devastare(tura);
        until (tanc2.hp=0) or (tanc1.hp=0);
end;


{Procedura cit_afis (citeste din fisierele batalilor specificatiile tancurilor
si harta, afiseaza o prezentare a bataliei, e accesata de procedura meniu2,
nu acceseaza nimic)}
procedure cit_afis (var f:text);
var i,j,m:byte;
    s:string;
begin
        for i:=1 to 5 do
                for j:=1 to 11 do
                   begin
                        read(f,m);
                        a[i,j]:=m;
                   end;
        with tanc1 do
                begin
                        read(f,cordx,cordy,hp,ap,mp,mpr,armf,arml,armp);
                        readln(f);
                        read(f,nsev);
                end;
        with tanc2 do
                begin
                        read(f,cordx,cordy,hp,ap,mp,mpr,armf,arml,armp);
                        readln(f);
                        read(f,nsev);
                end;
        clearviewport;
        setcolor(white);
        i:=1;
        while not eof(f) do
                begin
                        readln(f,s);
                        outtextxy(1,i*10,s);
                        inc(i);
                end;
        outtextxy(1,(i+2)*10,'Apasa o tasta!');
        readkey;
        clearviewport;
end;


{Procedura meniu2 (porneste meniul secundar de alegere a nivelului, e accesata
de procedura meniu1, acceseaza procedura cit_afis)}
procedure meniu2;
var b:char;
    f:text;
begin
        clearviewport;
        setcolor(red);
        settextstyle(defaultfont,horizdir,2);
        outtextxy(480,50,'Unde vei face istorie?');
        settextstyle(defaultfont,horizdir,1);
        outtextxy(550,200,'1. Kursk');
        outtextxy(550,300,'2. El Alamein');
        outtextxy(550,400,'3. Falaise');
        b:=readkey;
        case b of
                '1':begin
                        nivel:='Kursk';
                        assign(f,'Kursk.txt');
                        reset(f);
                        cit_afis(f);
                    end;
                '2':begin
                        nivel:='El_Alam';
                        assign(f,'El_Alam.txt');
                        reset(f);
                        cit_afis(f)
                    end;
                '3':begin
                        nivel:='Falaise';
                        assign(f,'Falaise.txt');
                        reset(f);
                        cit_afis(f);
                    end;
        end;
        close(f);
        clearviewport;
        setcolor(yellow);
end;


{Procedura instructiuni (afiseaza instructiunile pentru joc, e accesata de
procedura meniu1, nu acceseaza nimic)}
procedure instructiuni;
var f:text;
    i:integer;
    s:string;
begin
        clearviewport;
        assign(f,'Instruc.txt');
        reset(f);
        i:=1;
        while not eof(f) do
            begin
                readln(f,s);
                outtextxy(1,i*10,s);
                inc(i);
            end;
        outtextxy(1,(i+2)*10,'Apasa o tasta!');
        readkey;
        close(f);
        clearviewport;
end;


{Procedura setari (seteaza anumite preferinte pentru joc, e accesata de
procedura meniu1, nu acceseaza nimic)}
procedure setari;
var b:char;
    i:integer;
begin
        for i:=1 to 4 do
                begin
                        clearviewport;
                        settextstyle(defaultfont,horizdir,2);
                        outtextxy(550,50,'Setari');
                        settextstyle(defaultfont,horizdir,1);
                        outtextxy(550,200,'Afisare careu? (d/n)');
                        outtextxy(550,300,'Incepe jucatorul 1? (d/n)');
                        outtextxy(550,400,'Schimbare tura cu ENTER? (d/n)');
                        outtextxy(550,500,'Devastare harta in nivelul Falaise? (d/n)');
                        outtextxy(530,(i+1)*100,'->');
                        case i of
                                1:begin
                                        repeat
                                                b:=readkey;
                                        until (b='d')or(b='n');
                                        if b='d'then
                                                careu:=true
                                        else
                                                careu:=false;
                                end;
                                2:begin
                                        repeat
                                                b:=readkey;
                                        until (b='d') or (b='n');
                                        if b='d' then
                                                prim1:=true
                                        else
                                                prim1:=false;
                                end;
                                3:begin
                                        repeat
                                                b:=readkey;
                                        until (b='d') or (b='n');
                                        if b='d' then
                                                enterda:=true
                                        else
                                                enterda:=false;
                                end;
                                4:begin
                                        repeat
                                                b:=readkey;
                                        until (b='d') or (b='n');
                                        if b='d' then
                                                devast:=true
                                        else
                                                devast:=false;
                                end;
                        end;
                end;
        clearviewport;
end;


{Procedura meniu1 (porneste meniul principal, e accesata din programul
principal, acceseaza instructiuni,meniu2,principal,explozie,castigator,
setari)}
procedure meniu1;
var b:char;
begin
        clearviewport;
        repeat
                setcolor(yellow);
                settextstyle(defaultfont,horizdir,2);
                outtextxy(565,50,'TANCURI!');
                settextstyle(defaultfont,horizdir,1);
                outtextxy(550,200,'1. Batalie noua');
                outtextxy(550,300,'2. Instructiuni');
                outtextxy(550,500,'4. Iesire');
                outtextxy(550,400,'3. Setari');
                b:=readkey;
                case b of
                        '1':begin
                                meniu2;
                                principal;
                                explozie;
                                castigator;
                            end;
                        '2':instructiuni;
                        '3':setari;
                end;
        until b='4';
        setcolor(white);
end;


{Procedura inceput (afiseaza un ecran de "introducere", e accesata de
programul principal, nu acceseaza nimic}
procedure inceput;
begin
        clearviewport;
        settextstyle(defaultfont,horizdir,3);
        setcolor(red);
        outtextxy(550,250,'Tancuri!');
        settextstyle(defaultfont,horizdir,1);
        setcolor(cyan);
        outtextxy(550,500,'Creat de Supuran Marius');
        outtextxy(585,510,'(Apasa o tasta)');
        readkey;
        clearviewport;
end;


{Programul principal, apeleaza meniu1,inceput}
begin
        randomize;
        careu:=true;
        prim1:=true;
        enterda:=true;
        devast:=true;
        gd:=detect;
        initgraph(gd,gm,'');
        inceput;
        meniu1;
        closegraph;
end.
