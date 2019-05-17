n = 2;
a = 3;
eq1_data="1 2 3 4 5 6";
str_result2 = "";
input_eq = (strrep(eq1_data,"^",".^"));
S = @(x) eval(input_eq);
x1 = 1:5;
x2 = 11:15;
y1 = S(x1)+S(x2);
y2 = S(x1+x2);
disp(y1);
disp(y2);
if( isequal(y1, y2) )
   %display linear 
   %set(handles.classification, 'String', 'Linear');
   str_result2 = strcat( str_result2, 'Linear ');
else
   %set(handles.classification, 'String', 'Non-Linear');
   str_result2 = strcat( str_result2, 'Non-Linear ');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% time invariant of system %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 2;
a = 3;
k = 2;
%input_eq = (strrep(eq1_data,"^",".^"));
S = @(x) eval(input_eq);
x1 = 5;
tv1 = S(x1)-k;
tv2 = S(x1-k);
disp(tv1);
disp(tv2);
if( isequal(tv1, tv2) )
   %display time-invariant
   %set(handles.classification, 'String', 'Invariant');
   str_result2 = strcat( str_result2, ', time Invariant ');
else
   %set(handles.classification, 'String', 'Variant');
   str_result2 = strcat( str_result2, ', Time Non - Invariant ');
end
set(handles.classification, 'String', str_result2);
