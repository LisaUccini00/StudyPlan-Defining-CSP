# Study Plan Defining CSP
## Descrizione

Il programma permette di ottenere un piano di studio valido, dato un insieme di parametri. 

## Utilizzo

Per utilizzare il software è necessario avere installato nel proprio dispositivo [MiniZinc](https://www.minizinc.org/doc-2.5.3/en/installation.html).

L'eseguibile schedule.mzn implementa il modello MiniZinc del problema e si aspetta di ricevere i parametri da un datafile. Il repository contiene due datafile di esempio (ing_informatica.dzn e ing_biomedica.dzn), ma può essere sottomesso un problema personalizzato definendo i seguenti parametri nel file .dzn:
- **t**:numero di crediti per la prova finale;
- **cmin**:numero di crediti minimo per gli insegnamenti caratterizzanti;
- **cmax**:numero di crediti massimo per gli insegnamenti caratterizzanti;
- **amin**:numero di crediti minimo per gli insegnamenti affini;
- **amax**:numero di crediti massimo per gli insegnamenti affini;
- **num_ins**:numero di insegnamenti totale che definiscono il Corso di Studi;
- **CdS**:nome del Corso di Studi;
- **Insegnamenti**:una lista che definisce i nomi degli insegnamenti contenuti;  
- **n_crediti**:una lista che associa ad ogni insegnamento il numero di crediti; 
- **SSD**:una lista che associa ad ogni insegnamento il parametro SSD_C oppure SSD_A, in modo tale da definire se l'insegnamento è caratterizzante(C) o affine(A). 

Un file così definito può essere incluso nel modello (include "datafile.dzn"). E' possibile includere un unico datafile alla volta nello stesso modello, in quanto lo stesso parametro non può essere definito più di una volta. 

Per la risoluzione è suggerito il *solver* Gecode 6.3.0, già implementato nel bundle MiniZinc. 

## Note
I datafile di esempio rappresentano una libera interpretazione di alcuni Corsi di Studi forniti dall'[Università degli Studi di Firenze](https://www.unifi.it/), in paricolar modo Ingengeria Informatica e Ingegneria Biomedica. 


