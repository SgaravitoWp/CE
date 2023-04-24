data Cars;
set sashelp.cars;
run;

proc print data=Cars;
run;

data Cars;
set Cars;
rendimiento = 16850/((Weight**0.7081)*(Horsepower**0.1278));
run;

proc print data=Cars;
run;

data Cars;
set Cars;
subAbs = abs(rendimiento-MPG_Highway);
sobRel = abs(rendimiento-MPG_Highway)/MPG_Highway;
run;

/*Los carros con mayor subestamci´n absoluta son:*/
proc sort data=Cars;
    by descending subAbs;
run;

/*Los carros con mayor sobreestimaci´n relativa son:*/
proc sort data=Cars;
    by descending sobRel;
run;

/*Cree un conjunto de datos solamente con información sobre fabricante, modelo, origen, 
peso, caballos de fuerza y rendimiento en grandes autopistas, que incluya solamente los vehículos 
fabricados por Hyundai de modelos Accent, Elantra o Sonata, y en el que exista una variable definida 
como "High" para los vehículos cuyo peso es mayor a 1.2 toneladas y "Low" para los demás.*/

data Cars2;
	set Cars;
	where Make = 'Hyundai' & prxmatch('/Accent|Elantra|Sonata/i', model);
    if Weight > 1200 then typeWeight = "High";
    else typeWeight = "Low"; 
    keep Make Model Origin Weight Horsepower MPG_Highway typeWeight;
run; 