En esta carpeta se encuentran las redes realizadas.
Dentro se encuentran:

Carpetas:
-DatosEntrenamiento

-PreparacionRedes: contiene las tablas y scripts para recortar los datos y hacer un análisis estático en las redes.

	Tablas: 
	-BigTable: tabla con todas las tomas (con los datos ya mejorados)
	-Tablas individuales mejoradas: se han copiado las tablas que se obtuvieron en la carpeta de DatosMejorados.

	Scripts:
	-GraficasCrudo: representa los datos a partir de BigTable (ya mejorada)
	-Individuales_GraficasCrudo: lo mismo que el anterior pero para cada toma de datos
	-RecortarDatos: coge solamente los datos desde 4 a 6s de cada toma y los copia en un nuevo archivo llamado recortado.
	También junta todas las tomas recortadas en BigTable_Recortada y ordena las filas de esta tabla aleatoriamente
	dando lugar a BigTable_Rand.

	Carpetas:
	-Datos recortados:
		
		Tablas: 
		-BigTable_Recortada: tabla con todas las tomas (con los datos ya recortados)
		-BigTable_Rand: tabla con todas las tomas (con los datos ya recortados) cuyas filas están ordenadas aleatoriamente
		-Tablas individuales recortadas


		Scripts:
		-RecortarDatos: utilizado para obtener las tablas de esta carpeta

-BasesDatosRedes: contiene las tablas y scripts para preparar las bases de datos.

	Tablas:
	-BigTable_Recortada: tabla con todas las tomas (con los datos ya recortados)

	-BigTable_Rand: tabla con todas las tomas (con los datos ya recortados) cuyas filas están ordenadas aleatoriamente
	-BigTable_P0: igual que la rand pero solo con las tomas que tienen cs0=0
	-BigTable_Y0: igual que la rand pero solo con las tomas que tienen cs1=0
	-BigTable_P0orY0: igual que la rand pero solo con las tomas que tienen cs0=0 o cs1=0

	-Tablas individuales recortadas

	Scripts:
	-CrearBasesDatos: script para dividir los datos ya recortados de BigTable_Rand en las diferentes bases de datos

	Carpetas:
	-BasesDatos: carpeta con las cuatro bases de datos creadas
		Tablas:
		-BD_complete
		-BD_P0
		-BD_Y0
		-BD_P0orY0

-CreacionRedes: contiene los inputs y outputs de cada red
	
	Carpetas:
	-BD_complete
	-BD_P0
	-BD_Y0
	-BD_P0orY0

	Cada una tiene la base de datos correspondiente, el script para generar los inputs y outputs y los archivos generados con este.

-EvaluacionRedes: contiene las redes neuronales de prueba hechas. Dentro de esta carpeta:

	Excel:
	-EvaluacionRedes: tiene toda la información y resultados de las redes creadas con nftool y ntstool (también
	con el identificador de cada red)

	Carpetas:
	-Cada carpeta tiene un nº que se corresponde con el identificador de la red y dentro están todos los archivos 
	generados de cada una.

-ValidacionRedes

