En esta carpeta se encuentran las redes realizadas.
Dentro se encuentran:

Carpetas:
-DatosEntrenamiento: contiene los datos tomados para el entrenamiento de las redes (incluyendo el preprocesamiento de los mismos).

-PreparacionRedes: contiene las tablas y scripts para recortar los datos y hacer un análisis estático en las redes.

-BasesDatosRedes: contiene las tablas y scripts para preparar las bases de datos.
	Tablas:
	-BigTable_Recortada: tabla con todas las tomas (con los datos ya recortados)

	-BigTable_Rand: tabla con todas las tomas (con los datos ya recortados) cuyas filas están ordenadas aleatoriamente
	-BigTable_P0: igual que la rand pero solo con las tomas que tienen alpha=0
	-BigTable_Y0: igual que la rand pero solo con las tomas que tienen beta=0
	-BigTable_P0orY0: igual que la rand pero solo con las tomas que tienen alpha=0 o beta=0

-CreacionRedes: contiene los inputs y outputs de cada red	
	Carpetas:
	-BD_complete
	-BD_P0
	-BD_Y0
	-BD_P0orY0

	Cada una tiene la base de datos correspondiente, el script para generar los inputs y outputs y los archivos generados con este.

-EvaluacionRedes: contiene las redes neuronales realizadas. Dentro de esta carpeta:
	Excel:
	-EvaluacionRedes: tiene toda la información y resultados de las redes creadas con Neural Net Fitting (también
	con el identificador de cada red)

	Carpetas:
	-Cada carpeta tiene un nº que se corresponde con el identificador de la red y dentro están todos los archivos 
	generados de cada una.

-ValidacionRedes
	Carpetas:
	-Comparison: comparación entre los resultados de las redes, TF y valores de la plataforma real.
	-DatosBrazoValidacion: tiene los datos tomados en la plataforma real para la validación de las redes (con el preprocesamiento incluido)
	-DatosRedesValidacion: implementación de las redes para los datos de validación
	-DatosTFValidacion: implementación de las TF para los datos de validación
