 //uses Crt;
 uses GraphABC;
var a,b,si,st,d,n : real; h,f,cfnt,ch_inc,cfy,cfx : integer; sumt, sumi,inc_check : boolean; ch : char;


function integral(ai: real) : real;
begin
  Result := ((ai*ai*ai*ai)/2 - (2*ai*ai*ai)/3 + ai*ai + 11*ai);
end;


function main_func(at: real) : real;
begin
  Result := (2*at*at*at - 2*at*at + 2*at + 11);
end;


procedure generate_field;
begin
  setpenwidth(4);
  Line(1000,700,1500,700);
  Line(1000,200,1500,200);
  Line(1000,200,1000,700);
  Line(1500,200,1500,700);
  
  setpenwidth(3);
  Line(1050,650,1450,650);
  Line(1450,650,1445,645);
  Line(1450,650,1445,655);
  TextOut(1445,660,'x');
  
  Line(1050,650,1050,250);
  Line(1050,250,1055,255);
  Line(1050,250,1045,255);
  TextOut(1030,245,'y');
  
  TextOut(1130,175,'f(x) = 2x^3 - 2x^2 + 2x + 11');
  TextOut(1005,675-24,'x:');
  TextOut(1005+24,675-24,cfx);
  TextOut(1005,675,'y:');
  TextOut(1005+24,675,cfy);
  TextOut(1005+24*3,675,'Общий масштаб:');
  TextOut(1005+24*10,675,cfnt);
end;


procedure generate_graphic;
var j,aa,bb : integer;
begin
  aa := round(a);
  bb := round(b);
  //SetPenStyle(psDot); {штрих для а и b}
  //Line(1050+aa*cfnt*cfx, 650 -(2*aa*aa*aa - 2*aa*aa + 2*aa + 11)*cfnt*cfy, 1050+aa*cfnt*cfx, 650); {начало а}
  //Line(1050+bb*cfnt*cfx, 650 -(2*bb*bb*bb - 2*bb*bb + 2*bb + 11)*cfnt*cfy, 1050+bb*cfnt*cfx, 650); {начало b}
  //SetPenStyle(psSolid); {Возвращение в нормальную линию}
  //FloodFill(1051+aa*cfnt*cfx, 648, clSilver);
  
  //Line(1050, 650 - (2*0*0*0 - 2*0*0 + 2*0 + 11)*cfnt, 1050 + (j+1)*cfnt, 650 -(2*(j+1)*(j+1)*(j+1) - 2*(j+1)*(j+1) + 2*(j+1) + 11)*cfnt);
  for j := 0 to 100*cfnt do begin
    Line(1050+j*cfnt*cfx, 650 -(2*j*j*j - 2*j*j + 2*j + 11)*cfnt*cfy, 1050 + (j+1)*cfnt*cfx, 650 -(2*(j+1)*(j+1)*(j+1) - 2*(j+1)*(j+1) + 2*(j+1) + 11)*cfnt*cfy);
    if (1050+j*cfnt*cfx >= 1500) or (650 -(2*j*j*j - 2*j*j + 2*j + 11)*cfnt*cfy <= 200) then begin
     SetPenColor(clWhite);
     Rectangle(1000,197,1500,1);
     SetPenColor(clBlack);
     break; 
     end; 
    //LineTo(1050+j*2,650 -(2*j*j*j - 2*j*j + 2*j + 11)*2);
    //SetPixel(j,700 -(2*j*j*j - 2*j*j + 2*j + 11), clBlack);
  end;
  
  generate_field;
end;


procedure reset;
begin
  ClearWindow;
  generate_field;
  generate_graphic;
end;


procedure cont;
begin
  TextOut(0,24*20,'Нажмите <Enter> для продолжения.');
  readln(ch);
  if ch <> #13 then cont else TextOut(0,24*20,'                                                                                                   ');
end;


procedure sumint;
begin
  reset;
  si := integral(b) - integral(a);
  TextOut(0,24*0,'Площадь фигуры ограниченной прямой, вычисленная с помощью интеграла равна: ');
  
  setpenwidth(2);
  SetFontSize(9);
  TextOut(34,76,a);
  TextOut(34,20,b);
  Line(38,34,38,74);
  Line(38,34,42,34);
  Line(42,34,44,36);
  Line(38,74,34,74);
  Line(34,74,32,72);
  setpenwidth(3);
  SetFontSize(15);
  
  TextOut(48,40,'(2x^3 - 2x^2 + 2x + 11)dx = ');
  TextOut(300,40,si);
  sumi := true;
  cont;
end;


procedure sumtra;
var i : integer; ff : real;
begin
  reset;
  st := 0;
  TextOut(0,24*0,'Впишите количество трапеций:');
  readln(h);
  d := (b-a)/h;
  n := a;
  SetPenColor(clRed);
  //ff := a;
  //Line(1050+ff*cfnt*cfx, 650 -(2*ff*ff*ff - 2*ff*ff + 2*ff + 11)*cfnt*cfy, 1050+(ff + round(d))*cfnt*cfx, 650 -(2*(ff + round(d))*(ff + round(d))*(ff + round(d)) - 2*(ff + round(d))*(ff + round(d)) + 2*(ff + round(d)) + 11)*cfnt*cfy);
  //ff := ff + d;
  //while ff < round(b) do begin
    //Line(1050+ff*cfnt*cfx, 650 -(2*ff*ff*ff - 2*ff*ff + 2*ff + 11)*cfnt*cfy, 1050+ff*cfnt*cfx, 650);
    //Line(1050+ff*cfnt*cfx, 650 -(2*ff*ff*ff - 2*ff*ff + 2*ff + 11)*cfnt*cfy, 1050+(ff + round(d))*cfnt*cfx, 650 -(2*(ff + round(d))*(ff + round(d))*(ff + round(d)) - 2*(ff + round(d))*(ff + round(d)) + 2*(ff + round(d)) + 11)*cfnt*cfy);
    //ff := ff + round(d);
  //end;
  //Line(1050+round(a)*cfnt*cfx, 650 -(2*round(a)*round(a)*round(a) - 2*round(a)*round(a) + 2*round(a) + 11)*cfnt*cfy, 1050+round(a)*cfnt*cfx, 650);
  //for i := 1 to h do begin
    //Line(1050+round(ff)*cfnt*cfx, 650 -(2*round(ff)*round(ff)*round(ff) - 2*round(ff)*round(ff) + 2*round(ff) + 11)*cfnt*cfy, 1050+round(ff)*cfnt*cfx, 650);
    //ff := ff + d;
  //end;
  //SetPenColor(clWhite);
  //Rectangle(1000,197,1500,1);
  //SetPenColor(clBlack);
  //TextOut(1130,175,'f(x) = 2x^3 - 2x^2 + 2x + 11');
  for i := 1 to h do begin
    Line(1050+round(n)*cfnt*cfx, 650 -(2*round(n)*round(n)*round(n) - 2*round(n)*round(n) + 2*round(n) + 11)*cfnt*cfy, 1050+round(n)*cfnt*cfx, 650);
    Line(1050+round(n)*cfnt*cfx, 650 -(2*round(n)*round(n)*round(n) - 2*round(n)*round(n) + 2*round(n) + 11)*cfnt*cfy, 1050+round(n+d)*cfnt*cfx, 650 -(2*round(n+d)*round(n+d)*round(n+d) - 2*round(n+d)*round(n+d) + 2*round(n+d) + 11)*cfnt*cfy);
    st := st + ((main_func(n)+main_func(n+d))/2)*d;
    n := n + d;
  end;
  Line(1050+round(n)*cfnt*cfx, 650 -(2*round(n)*round(n)*round(n) - 2*round(n)*round(n) + 2*round(n) + 11)*cfnt*cfy, 1050+round(n)*cfnt*cfx, 650);
    Line(1050+round(n)*cfnt*cfx, 650 -(2*round(n)*round(n)*round(n) - 2*round(n)*round(n) + 2*round(n) + 11)*cfnt*cfy, 1050+round(n+d)*cfnt*cfx, 650 -(2*round(n+d)*round(n+d)*round(n+d) - 2*round(n+d)*round(n+d) + 2*round(n+d) + 11)*cfnt*cfy);
  SetPenColor(clWhite);
  Rectangle(1000,197,1500,1);
  SetPenColor(clBlack);
  TextOut(1130,175,'f(x) = 2x^3 - 2x^2 + 2x + 11');
  TextOut(0,24*1,'Площадь фигуры ограниченной прямой, вычисленная с помощью метода трапеции равна:');
  TextOut(0,24*2,st);
  sumt := true;
  cont;
  reset;
end;


procedure KeyDown(ch_inc : integer);
begin
  reset;
  TextOut(0,24*0,'Для прекращения нажмите <Escape>');
  //repeat
   //cfnt_check := cfnt;
   case ch_inc of
     VK_Up : begin cfy := cfy + 1; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); end;
     VK_Down : begin cfy := cfy - 1; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); end;
     VK_Left : begin cfx := cfx - 1; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); end;
     VK_Right : begin cfx := cfx + 1; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); end;
     VK_W : begin cfnt := cfnt + 1; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); end;
     VK_S : begin cfnt := cfnt - 1; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); end;
     VK_Escape : inc_check := True;
   end;
   //if cfnt_check <> cfnt then generate_graphic;
  //until ch_inc = VK_Escape;
end;


procedure pogr;
begin
  reset;
  if sumt and sumi then begin
   TextOut(0,24*0,'Погрешность способов равна: ');
   TextOut(0,24*1,abs(st-si));
   TextOut(0,24*3,'Где полученные суммы были равны: ');
   TextOut(0,24*4,si);
   TextOut(0,24*5,st); end else TextOut(0,24*0,'Не все способы были выполнены');
  cont;
end;


procedure predel;
begin
  reset;
  TextOut(0,24*0,'Впишите пределы интегрирования:');
  readln(a,b);
  sumi := False;
  sumt := False;
  cont;
end;


begin
  SetWindowWidth(1600);
  SetWindowHeight(900);
  SetFontSize(15);
  
  cfnt := 1;
  cfx := 1; {коэффициенты масштаба}
  cfy := 1;
  
  predel;
  
  //TextOut(0,0,'Впишите коэффициент масштабирования:');
  //readln(cfnt);
  
  repeat
    reset;
    //ClrScr;
    TextOut(0,24*0,'Пределы интегрирования:');
    TextOut(0,24*1,'a = ');
    TextOut(36,24*1,a);
    TextOut(0,24*2,'b = ');
    TextOut(36,24*2,b);
    TextOut(0,24*3,'Выберите действие, которое хотите выполнить');
    TextOut(0,24*4,'1 – Методом интеграла');
    TextOut(0,24*5,'2 – Методом трапеций');
    TextOut(0,24*6,'3 – Оценка погрешности полученного результата между двумя методами');
    TextOut(0,24*7,'4 – Назначение других пределов');
    TextOut(0,24*8,'5 – Для изменение масштаба функции с помощью стрелок для x и y, с помощью W и S для общего');
    TextOut(0,24*9,'0 – Выход из программы');
    readln(f);
    case f of
     0: CloseWindow;
     1: sumint;
     2: sumtra;
     3: pogr;
     4: predel;
     5: begin; inc_check := False; reset; TextOut(0,24*0,'Для прекращения нажмите <Escape>'); while inc_check = False do begin OnKeyDown := KeyDown; end; end;
    end;
  until f = 0;
end.