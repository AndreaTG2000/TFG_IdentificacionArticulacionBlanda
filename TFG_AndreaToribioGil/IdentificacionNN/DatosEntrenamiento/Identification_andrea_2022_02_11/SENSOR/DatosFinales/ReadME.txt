En esta carpeta se encuentran otras dos carpetas: una con los datos ya pasados a Excel y otra con los datos en Matlab.

Para pasar los datos de csv a excel utilicé una macro que se encuentra también dentro de la carpeta de Excel.

Dentro de la carpeta de Matlab se encuentran tres scripts:

-Import: con el que pase los archivos del excel de cada toma a una tabla de matlab y generé cada archivo correspondiente que la guardara.

-Join: junté todos las tomas de datos para que coincidieran con cómo se habían tomado los datos según el tiempo. Estos datos conjuntos los guardé en la
tabla BigTable. Esta fué la secuencia usada:

for i = 50:-10:-50
    for k = -50:10:50
        load (sprintf('P%d_Y%d.mat',i,k));
        bigtable = [bigtable;mytable];        
    end
end

-GraficasCrudo: representa los datos almacenados en BigTable en distintas gráficas.

Una vez dentro de la carpeta de Matlab hay otra carpeta que se llama DatosMejorados. En esta se encuentran:

Tablas:

-BigTable: la tabla generada con el script Join de la carpeta madre que se ha copiado en esta carpeta para trabajar con ella.
-BigTable_Mejorada: tabla con los mismos datos que BigTable pero con los ángulos pasados a grados y habiendo quitado las tendencias.
-Tablas individuales mejoradas: datos de cada toma mejorados igual que en BigTable_Mejorada.

Scripts:

-DatosMejorados: a partir de la tabla BigTable hace modificaciones (pasando los ángulos a grados y quitando las tendencias) y guarda la nueva tabla 
en BigTable_Mejorada. Además, se dividen todos los datos de esta tabla según las tomas para dar lugar a cada tabla individual mejorada.
-GraficasCrudoMejoradas: se modifican los datos de BigTable mejorándolos (grados y tendencias) y se representan respecto al tiempo.