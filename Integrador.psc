//Función para no repetir las lineas de código de
//esperar y borrar.
Funcion sinRepetirCodigo()
	Escribir "Presione una tecla para volver al menú principal";
	Esperar Tecla;
	Borrar Pantalla;
FinFuncion




//función: CARGAR ARTICULOS

Funcion cargarArticulos(precios,stock,cantidadProductos,detalles)      //¿cómo hago para que siga agregando productos si quiere?
	Borrar Pantalla;
	Definir respuesta como caracter;
	Definir contadorProductos Como Entero;
	
	Escribir "Ud se encuentra en la sección de carga de productos";
	Repetir
		Escribir "¿Cuántos articulos desea agregar? (recuerde que hay un máximo de 30 en esta ocación)";
		Leer cantidadProductos;
		Mientras cantidadProductos<=0 o cantidadProductos>30 Hacer
			Escribir "Recuerde que hay un máximo de 30 articulos en esta ocación, vuelva a introducir una cantidad válida mayor que 0.";
			Leer cantidadProductos;
		FinMientras
		Para posicion=1 hasta cantidadProductos Hacer
			Escribir "Ingrese los detalles, el precio y el stock del articulo ",posicion;
			Escribir "Detalles del articulo:";
			Leer detalles[posicion];
			Escribir "Precio del articulo:";
			Leer precios[posicion];
			Escribir "Cantidad disponible del articulo:";
			Leer stock[posicion];
		FinPara
		Escribir "Sus articulos se cargaron de forma exitosa";
		Escribir "¿Desea seguir cargando articulos? (si/no)";
		Leer respuesta;
	Hasta Que respuesta="no";
	sinRepetirCodigo();
FinFuncion



//función: VENDER ARTICULOS

funcion venderArticulos(precios,stock,cantidadProductos,codigo por referencia,detalles)
	Borrar Pantalla;
	Definir respuesta Como Logico;
	Si stock[1]=null Entonces 
		Escribir "No hay articulos para vender";
		sinRepetirCodigo();
	SiNo
		leerCodigo(codigo);
		Escribir "El articulo a vender es: ",detalles[codigo]; //podria poner los detalles para especificar cual es el articulo a vender
		Escribir "¿vender?";
		Leer respuesta;
		si respuesta=Verdadero Entonces
			stock[codigo]<-stock[codigo] - 1;
			Escribir "La venta fue exitosa. Restamos un articulo al stock, ahora tiene ",stock[codigo]," unidades";
		FinSi
		sinRepetirCodigo();
	FinSi
FinFuncion


//función: MOSTRAR ARTICULOS


Funcion mostrarStock(stock, cantidadProductos, codigo)
	Escribir "El stock del articulo indicado es: ", stock[codigo];
	sinRepetirCodigo();
FinFuncion



//función: MOSTRAR INVENTARIO

Funcion mostrarInventario(precios,stock,cantidadProductos,codigo por referencia,detalles)
	Borrar Pantalla;
	Definir respuesta Como Logico;
	Si stock[1]=null Entonces 
		Escribir "No hay articulos para mostrar";
		sinRepetirCodigo();
	SiNo
		leerCodigo(codigo);
		Escribir "Aquí tiene el inventario del articulo que selecionó: ",detalles[codigo]; //podria poner los detalles para especificar cual es el articulo a vender
		sinRepetirCodigo();
	FinSi
Fin Funcion




funcion leerCodigo(codigo por referencia)
	Escribir "Ingrese el código del articulo";
	Leer codigo;
	Mientras codigo<=0 o codigo>30 Hacer
		Escribir "Ingrese un código válido, por favor (del 1 al 30)";
		Leer codigo;
	FinMientras
FinFuncion




//COMIENZO DE PROCESO PRINCIPAL
Algoritmo Integrador
	Definir posicion, precios, codigo, stock, opcionMenu, cantidadProductos Como Entero;
	//Definir detalles Como Caracter;
	opcionMenu=1;
	cantidadProductos<-30;
	Dimension precios[cantidadProductos];
	Dimension stock[cantidadProductos];
	Dimension detalles[cantidadProductos];
	
	Mientras opcionMenu <> 0 Hacer
		Escribir "Ud se encuentra en el menú principal. Elija una opción, por favor";
		Escribir "1: Para ver el inventario";
		Escribir "2: Para cargar un nuevo articulo";
		Escribir "3: Para vender un articulo";
		Escribir "4: Para conocer el stock de un determinado articulo";
		Escribir "0: Para salir";
		Leer opcionMenu;
		Segun opcionMenu Hacer
			1:
				mostrarInventario(stock,precios,cantidadProductos,detalles, codigo);
				
			2:
				cargarArticulos(precios,stock,cantidadProductos,detalles);
				
			3:
				venderArticulos(precios,stock,cantidadProductos, codigo, detalles);
				
			4:
				mostrarStock(stock,cantidadProductos,codigo);
				
		FinSegun
	FinMientras
	
FinAlgoritmo
