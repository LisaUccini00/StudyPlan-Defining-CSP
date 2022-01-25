include "ing_informatica.dzn";
%include "ing_biomedica.dzn";

int: SSD_C=0;
int: SSD_A=1;
int: t;
int: cmin; 
int: cmax;
int: amin; 
int: amax;

set of int: num_ins;
string: CdS;

%per ogni insegnamento conosco: SSD, n°crediti
set of int: dominio = 0..1; 

array[num_ins] of string: Insegnamenti;
array[num_ins] of int: n_crediti; 
array[num_ins] of dominio: SSD; 
array[num_ins] of var dominio: PdS; 

constraint
  sum(i in num_ins)(SSD[i]*PdS[i]*n_crediti[i])<=amax;
  
constraint
  sum(i in num_ins)(SSD[i]*PdS[i]*n_crediti[i])>=amin;
  
constraint
  sum(i in num_ins)(PdS[i]*n_crediti[i])-
  sum(i in num_ins)(SSD[i]*PdS[i]*n_crediti[i]) <=cmax;

constraint
  sum(i in num_ins)(PdS[i]*n_crediti[i])-
  sum(i in num_ins)(SSD[i]*PdS[i]*n_crediti[i]) >=cmin;
  
constraint
  sum(i in num_ins)(PdS[i]*n_crediti[i]) == 180-t;
                
solve satisfy;

output["Piano di studi del CdS "++ show(CdS) ++ ": \n\n"] ++ [show(Insegnamenti[i]) ++ "=" ++ show(PdS[i]) ++ "\n"| i in num_ins];
