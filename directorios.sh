clear
fecha=$(date +%d/%m/%y)
hora=$(date +%H:%M)
Borde=3
Consola=2
Fuente=2
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
echo "(Directorio)  [1] Crear [2] Eliminar [0] Volver"
tput cup 17 2
tput setaf 1
tail -1 tempLogErrores.txt
tput cup 19 2
tput setaf $Fuente
echo "Creado por Coppola Alex, Graña Nicolás"
tput cup 5 2
tput setaf $Consola
echo "Ingresa el número de acción que quieras hacer"
tput cup 6 2
echo "➣ "
tput cup 6 4
read accionDir

case $accionDir in
        0)
            #volver 
            tput cup 7 2
            echo "Volviendo..."
            sleep.6
            ;;
    
        1)
            #crear 
            tput setaf $Borde
	        for fila in {5..9}
	        do
	    	    tput cup $fila 0
		    tput el
		    echo "┃                                                                                                 ┃"
	        done
	        tput cup 5 2
	        tput setaf $Consola
	        echo "Ingresa la ruta en donde quieras crear el directorio. Ejemplo:(~/acoppola/nombreDirectorio)"
	        tput cup 6 2
            echo "➣ "
            tput cup 6 4
            read ruta
	        if test -d $ruta 
	        then
		        tput cup 7 2
		        echo "El directorio no se ha podido generar, la ruta es incorrecta o ya está en uso"
	        else
		    mkdir "$ruta" 2>>tempLogErrores.txt
	        fi
            main
	        ;;
        2)
            #eliminar
            tput setaf $Borde
	        for fila in {5..9}
	        do
	        tput cup $fila 0
 	        tput el
	        echo "┃                                                                                                 ┃"
	        done
	        tput cup 5 2
	        tput setaf $Consola
            echo "Ingresa la ruta del directorio que quieras eliminar. Ejemplo:(~/acoppola/nombreDirectorio)"
	        tput cup 6 2
            echo "➣ "
            tput cup 6 4
            read ruta
	        if test -d $ruta 
		then
		    rmdir "$ruta" 2>>tempLogErrores.txt
	        else
		    tput cup 7 2
		    echo "El directorio no existe"
	        fi
            main
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
            echo "Opción inválida, ingresa un número del 1 al 3"
            sleep 1
	        mostrar_menu_directorios
            ;;
    esac
