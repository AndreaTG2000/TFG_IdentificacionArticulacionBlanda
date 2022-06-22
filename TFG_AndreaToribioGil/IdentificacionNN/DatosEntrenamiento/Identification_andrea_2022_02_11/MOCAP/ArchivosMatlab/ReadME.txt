En esta carpeta se encuentran los datos que se tomaron con el sistema MOCAP una vez introducidos en Matlab.

Al hacer la toma de datos hubo un problema en los primeros datos que se tomaron, por lo los primeros 488 segundos de DatosMocap1 son incorrectos
y se han sustituido por los datos de DatosMocap2. Ejecutando GraficasCrudoAngulos se pueden observar los datos completos de DatosMocap1 respecto al tiempo
(incluidos los primeros datos mal tomados), y ejecutando GraficasCrudoAngulos2 se observan los datos de DatosMocap2.

Además, los datos obtenidos del MOCAP estaban como cuaternios y tuve que pasarlos a Euler, dando como resultado DatosMocap_Euler y DatosMocap_Euler2.

Finalmente, GraficasCrudoAngulosJoint se encarga de juntar los datos dando como resultado la matriz DatosMocap donde ya todos los datos son correctos y están en
el formato de Euler. Ejecutando este script también se representan los datos ya unidos respecto al tiempo.

Queda por hacer:
-Eliminar los datos que se salen de los valores esperados (los picos)
-Analizar por qué presentan una estructura diferente
-Utilizar estos datos para entrenar redes
