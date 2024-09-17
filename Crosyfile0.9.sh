clear
fecha=$(date +%d/%m/%y)
hora=$(date +%H:%M)
Borde=3
Consola=2
Fuente=2
if test -d temporales
then
	tput cup 1 1
	echo "temporales verificado"
else
	mkdir temporales
fi
if test -d logs
then
	tput cup 2 1
	echo "logs verificado"
else
	mkdir logs
fi
if test -d credenciales
then
	tput cup 3 1
	echo "credenciales verificado"
else
	mkdir credenciales
fi
echo "Aquí aparecerá el último mensaje de error del sistema!" > temporales/tempLogErrores.txt
####################################################################################################################################################################################################################
tput setaf $Borde
tput cup 0 0
echo -n "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
tput cup 1 0
for lineaDer in {1..19}
do
	echo "┃                                                                                                 ┃"
done	
tput cup 20 0
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
tput setaf $Consola
tput cup 2 17 
echo " ____                                    ___      ___             "
tput cup 3 17
echo "/\  _ \                                /'___\ __ /\_ \            "
tput cup 4 17
echo "\ \ \/\_\  _ __   ___     ____  __  __/\ \__//\_\ //\ \      __   "
tput cup 5 17
echo " \ \ \/_/_/\ '__\/ __ \  /',__\/\ \/\ \ \  __\/\ \ \ \ \   /'__ \ "
tput cup 6 17
echo "  \ \ \L\ \ \ \//\ \L\ \/\__,  \ \ \_\ \ \ \_/\ \ \ \_\ \_/\  __/ "
tput cup 7 17
echo "   \ \____/\ \_\  \____/\/\____/\/ ____ \ \_\  \ \_\/\____\ \____"
tput cup 8 17
echo "    \/___/  \/_/ \/___/  \/___/   /___/  \/_/   \/_/\/____/\/____/"
tput cup 9 17
echo "                                    /\___/                        "
tput cup 10 17
echo "                                    \/__/                         "
tput setaf $Fuente
tput cup 14 34
echo "Cargando el programa . "
sleep .5
tput cup 14 34
echo "Cargando el programa . ."
sleep .5
tput cup 14 34
echo "Cargando el programa . . ."
sleep .5
tput cup 14 34
echo "Cargando los cocodrilos . "
sleep .5
tput cup 14 34
echo "Cargando los cocodrilos . ."
sleep .5
tput cup 14 34
echo "Cargando los cocodrilos . . ."
sleep .5
####################################################################################################################################################################################################################
tput cup 0 0
tput setaf $Borde
echo -n "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
tput cup 1 0
for lineaDer in {1..19}
do
	echo "┃                                                                                                 ┃"
done	
tput cup 20 0
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
tput cup 2 35
tput setaf $Fuente
echo "Bienvenido a Crosyfile!"
tput cup 4 25
echo "[1] Registrarse               [2] Loguearse"
tput setaf $Consola
tput cup 10 10
echo "                             .-._   _ _ _ _ _ _ _ _"
tput cup 11 10
echo "                .-''-.__.-'00  '-' ' ' ' ' ' ' ' '-."
tput cup 12 10
echo "                '.___ '    .   .--_'-' '-' '-' _'-' '._"
tput cup 13 10
echo "                  V: V 'vv-'   '_   '.       .'  _..' '.'."
tput cup 14 10
echo "                    '=.____.=_.--'   :_.__.__:_   '.   : :"
tput cup 15 10
echo "                            (((____.-'        '-.  /   : :"
tput cup 16 10
echo "                                              (((-'\ .' /"
tput cup 17 10
echo "                                             _____..'  .'"
tput cup 5 45
echo "➣ "
tput cup 5 47
read opcion
case $opcion in
    1)
	    #Registro
	    tput cup 5 45
	    echo "                           "
    	tput cup 4 25                                    
    	echo "         Registrando nuevo usuario...               "
    	tput cup 6 28
    	echo "Nombre     :"
    	tput cup 7 28
    	echo "Apellido   :"
    	tput cup 8 28
    	echo "Contraseña :"
	    tput sgr0
    	tput cup 6 41
    	read nombre
    	tput cup 7 41
    	read apellido
    	tput cup 8 41
    	read -s password
    	echo "$nombre" >> temporales/tempRegistro.txt
    	N=$(cut -c1 temporales/tempRegistro.txt)
    	Usuario=$N$apellido
    	echo "$Usuario;$password" >> credenciales/Usuarios.txt
	echo "$Usuario" > temporales/tempGetUsuario.txt
        rm temporales/tempRegistro.txt
    	;;

    2)
    	#Login
    	tput cup 5 45
	    echo "                           "
    	tput cup 4 25                                    
    	echo "           Logueando usuario...               "
    	tput cup 6 28
    	echo "Usuario     :"
    	tput cup 7 28
    	echo "Contraseña  :"
	    tput sgr0
    	tput cup 6 41
        read compUsuario #Comprobación usuario
        tput cup 7 41
        read -s compPassword #Comprobación contraseña
	    if grep "$compUsuario;$compPassword" credenciales/Usuarios.txt 2>>temporales/tempLogErrores.txt
	    then
	        Usuario=$compUsuario
		echo "$Usuario" > temporales/tempGetUsuario.txt
	    fi
    	;;

    *)
    	tput cup 4 25                                    
    	echo "Valor ingresado incorrecto, ingrese un número del 1 al 2"
    	#meter metodo aca
        read
    	;;
esac
####################################################################################################################################################################################################################
bucle=1
while [ $bucle -eq 1 ];
do 
    clear
    tput setaf $Borde
    echo -ne "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n┃                               ┃                                ┃                                ┃\n┠━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┨"
    tput cup 3 0
    for Linea in {1..18}
    do
            echo "┃                                                                                                 ┃"
    done
    tput cup 4 0
       echo  "┠━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┨"
    tput cup 16 0
    echo "┠━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┨"
    tput cup 18
    echo "┠━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┨"
    tput cup 20 0
    echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    tput cup 1 2
    tput setaf $Fuente
    echo "$Usuario"
    tput cup 1 43 
    echo "Crosyfile 0.9"
    tput cup 1 69
    echo "📅$fecha        ⌚$hora "
    tput cup 3 2
    echo "[1 Directorios]  [2 Archivos]  [3 Permisos]  [4 Fecha]  [5 Log]  [0 Salir]"
    tput cup 17 2
    tput setaf 1
    tail -1 temporales/tempLogErrores.txt
    tput cup 19 2
    tput setaf $Fuente
    echo "Creado por Coppola Alex, Graña Nicolás"
    tput cup 5 2
    tput setaf $Consola
    echo "Hola $Usuario! Ingresá el número de acción que quieras hacer"
    tput cup 6 2
    echo "➣ "
    tput cup 6 4
    read accion
    case $accion in
    0)
        #salir
	    rm temporales/tempLogErrores.txt
	    rm temporales/tempGetUsuario.txt
	    tput cup 0 0
	    tput setaf $Borde
	    echo -n "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
	    tput cup 1 0
  	    for lineaDer in {1..19}
		   do
	   	   echo "┃                                                                                                 ┃"
	    done	
	    tput cup 20 0
	    echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
	    tput setaf $Consola
        tput cup 2 17 
        echo " ____                                    ___      ___             "
        tput cup 3 17
        echo "/\  _ \                                /'___\ __ /\_ \            "
        tput cup 4 17
        echo "\ \ \/\_\  _ __   ___     ____  __  __/\ \__//\_\ //\ \      __   "
        tput cup 5 17
        echo " \ \ \/_/_/\ '__\/ __ \  /',__\/\ \/\ \ \  __\/\ \ \ \ \   /'__ \ "
        tput cup 6 17
        echo "  \ \ \L\ \ \ \//\ \L\ \/\__,  \ \ \_\ \ \ \_/\ \ \ \_\ \_/\  __/ "
        tput cup 7 17
        echo "   \ \____/\ \_\  \____/\/\____/\/ ____ \ \_\  \ \_\/\____\ \____"
        tput cup 8 17
        echo "    \/___/  \/_/ \/___/  \/___/   /___/  \/_/   \/_/\/____/\/____/"
        tput cup 9 17
        echo "                                    /\___/                        "
        tput cup 10 17
        echo "                                    \/__/                         "
	tput setaf $Fuente
	tput cup 14 38
    	echo "Goodbye, world . "
	sleep .5
        tput cup 14 38
	echo "Goodbye, world . ."
	sleep .5
	tput cup 14 38
	echo "Goodbye, world . . ."
	sleep .5
	tput cup 14 38
	echo "Goodbye, world .    "
	sleep .5
	tput cup 14 38
	echo "Goodbye, world . .   "
	sleep .5
	tput cup 14 38
	echo "Goodbye, world . . . "
        sleep .5
	bucle=0
	clear
	;;
    1)
        sh directorios.sh
        ;;
    2)
        sh archivos.sh $Usuario
        ;;
    3)
        echo "Acción para Permisos"
        ;;
    4)
        echo "Acción para fecha"
        ;;
    5)
        echo "Acción para Log"
        ;;
    *)
        tput setaf $Borde
	    for fila in {5..9}	
	    do
 	        tput cup $fila 0
	        tput el
	        echo "┃                                                                                                 ┃"
	    done
        tput cup 5 2
	    tput setaf $Consola    
        echo "Opción no válida. Intenta nuevamente."
        sleep 1.5
        main
        ;;
    esac
done
