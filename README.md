# SoftFly
##### RTF 1 - FUNDAMENTOS DE SISTEMAS DE INFORMACIÓN 2016  
<br />
#### Proceso de construcción del proyecto
A continuación se describe los pasos que se llevaron a cabo para la creación de este demo.
<br /><br /><br />
##### Creación y configuración inicial del proyecto
 - Se crea un proyecto vacío de tipo **aplicación web**  
![alt text][1]

 - Se nombra el proyecto y se indica la ruta en donde se va a guardar. Además se chequea la opción de crear una carpera para almacenar las librerías del proyecto  
![alt text][2]

 - Se elige el servidor de despliegue **Glassfish server** con la versión **javaEE 7**  
![alt text][3]

- Elegimos el framework **JavaServer Faces** para controlar fácilmente los eventos generados por el usuario en la UI  
![alt text][4]

- Nos aseguramos que lenguaje de las páginas sea **Facelets** para poder generar las UI con formato *XHTM*  
![alt text][5]

##### Creación de la base de datos
La base de datos se crea apartir del script que se encuentra alojado en este repositorio.  
Utilizamos la herramienta *phpMyAdmin* para los siguientes pasos.

- Ingresamos las credenciales para el acceso al gestor de base datos
![alt text][6]

-  Creamos una base de datos con el nombre *softfly*  
![alt text][7]

- Nos dirigimos a la pestaña de *importar* y luego seleccionamos el script de la BD y presionamos en el botón *continuar*
![alt text][8]

- Verificamos que se hayan creado las siguientes tablas  
![alt text][9]

##### Conexión de la BD con el proyecto
- Creamos un **pool de conexiones** que establecerá la comunicación con la BD
![alt text][10]

- Nombramos el *pool de conexiones* y seleccionamos la conexión a la BD
![alt text][11]

- Escribimos las credenciales del gestor de base de datos y verificamos que se esté seleccionando la BD correcta.  
![alt text][12]

- Creamos un **recurso JDBC**
![alt text][13]

- Seleccionamos el pool de conexiones que creamos anteriormete y especificamos un **nombre** para el JNDI  
![alt text][14]

##### Generando los POJOS  
Generaremos los POJOS a través de las entidades de la BD, para esto seguimos los siguientes pasos.
- En la opción de *persistencia* seleccionamos la opción *crear las clases a partir de la BD*  
![alt text][15]

- Seleccionamos todas las tablas que estén disponibles y las pasamos a la otra columna, donde estas serán las entidades que se van a generar.  
![alt text][16]

- Elegimos un paquete donde se guardarán los modelos generados y damos clic en *siguiente*  
![alt text][17]

- Seleccionamos la manera en se van a trabajar las colecciones de datos que se producirán en las relaciones de las entidades y presionamos el botón *finalizar*   
![alt text][19]

##### Generando las vistas
A partir de las entidades generadas anteriormente, generaremos unas vistas *JSF*  
- En la opción de **persistencia** elegimos el siguiente tipo de archivo  
![alt text][20]

- Seleccionamos todas las entidades a las que queramos generar una vista  
![alt text][21]

- Indicamos los paquetes donde se almacenarán los **session bean**, las clases y páginas **JSF**  
![alt text][22]

##### Despliegue
![alt text][23]
<br/><br/>
![alt text][24]

[1]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-15_13-35-23.png
[2]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-15_13-37-24.png
[3]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-15_13-38-09.png
[4]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_08-40-14.png
[5]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_08-40-27.png
[6]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_08-51-59.png
[7]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_08-56-07.png
[8]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-13-04.png
[9]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-22-34.png
[10]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-42-34.png
[11]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-42-41.png
[12]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-43-02.png
[13]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-47-40.png
[14]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_09-47-50.png
[15]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_10-56-47.png
[16]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_10-57-16.png
[17]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_10-58-49.png
[18]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_10-58-49.png
[19]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_10-59-00.png
[20]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_11-01-58.png
[21]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_11-02-07.png
[22]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_11-18-46.png
[23]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_18-51-28.png
[24]: https://raw.githubusercontent.com/yoinergomez/RTF01_FSI_2016/master/img/Captura%20de%20pantalla_2016-10-19_18-51-56.png
