clear
fecha=$(date +%d/%m/%y)
hora=$(date +%H:%M)
Borde=3
Consola=2
Fuente=2
Usuario=$(cat temporales/tempGetUsuario.txt)
tput setaf $Borde
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
echo "(Archivos)  [1] Eliminar [2] Copiar [3] Mover [4] Permisos [5] Listado de archivos [0] Volver"
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
read accionArc
    case $accionArc in 
        
	0)
            #volver
	    	tput cup 7 2
            echo "Volviendo..."
            sleep.6
            ;;
        1)
            #Eliminar
            tput setaf $Borde
	        for fila in {5..9}
	        do
	        tput cup $fila 0
 	        tput el
	        echo "┃                                                                                                  ┃"
	        done
	        tput cup 5 2
	        tput setaf $Consola
            echo "Ingresa la ruta del archivo que quieras eliminar. Ejemplo:(~/acoppola/archivo)"
	        tput cup 6 2
            echo "➣ "
            tput cup 6 4
            read ruta
	        if test -d $ruta
		then
		    rmdir "$ruta" 2>>tempLogErrores.txt
	        else
		    tput cup 7 2
		    echo "El archivo no existe"
		    sleep 2
		    
	        fi
            ;;
        2)
          #Copiar
	  tput setaf $Borde
	        for fila in {5..9}
	        do
	        	tput cup $fila 0
 	        	tput el
	        	echo "┃                                                                                                 ┃"
	        done
	        tput cup 5 2
	        tput setaf $Consola
            	echo "Ingresa la ruta del archivo que quieras copiar. Ejemplo(~/acoppola/archivo)"
	        tput cup 7 2
	    	echo "Ingresa la ruta donde quieras copiarlo. Ejemplo(~/acoppola/archivo)"
		tput cup 6 2
            	echo "➣ "
		tput cup 8 2
	    	echo "➣ "
            	tput cup 6 4
            	read ruta
	    	tput cup 8 4
	    	read ruta2

		if test -e $ruta 2>>tempLogErrores.txt 
		then
			cp $ruta $ruta2
		else 
			tput cup 9 2
			echo "El archivo no se pudo copiar, la ruta no es correcta o el archivo no existe"
			sleep 2
	        fi
            ;;
        3)
            #Mover
	    tput setaf $Borde
	    for fila in {5..9}
		do
			tput cup $fila 0
			tput el
			echo "┃                                                                                                 ┃"
		done
		tput cup 5 2
		tput setaf $Consola
		echo "Ingresa la ruta del archivo que deseas mover. Ejemplo (~/acoppola/archivo)"
		tput cup 7 2
		echo "Ingresa la ruta donde quieras moverlo. Ejemplo (~/acoppola/carpetanueva/archivo)"
		tput cup 6 2
		echo "➣" 
		tput cup 8 2
		echo "➣" 
		tput cup 6 4
		read ruta
		tput cup 8 4
		read ruta2

			if test -e $ruta 2>>tempLogErrores.txt
			then
				mv $ruta $ruta2
			else
				tput cup 9 2
				echo "El archivo no se pudo mover, la ruta no es correcta o el archivo no existe"
				sleep 2
			fi
            ;;
        4)
            #Permisos
	    tput setaf $Borde
	    for fila in {5..9}
	    do
		    tput cup $fila 0
		    tput el 
		    echo "┃                                                                                                 ┃"
	    done
		    tput cup 5 2
	    tput setaf $Consola
	    echo "Ingresa la ruta del archivo al cual quieres ver sus permisos. Ejemplo (~/acoppola/archivo)"
	    tput cup 6 2
	    echo "➣"
	    tput cup 6 4
	    read ruta
	    if test -e $ruta 2>>tempLogErrores.txt
	    then
		    Permisos=$(ls -l $ruta)
		    echo "$Permisos" > temporales/tempPermisos.txt
		    PermisosUsuario=$(cat temporales/tempPermisos.txt | cut -c8-10)
		    rm temporales/tempPermisos.txt
		    case "$PermisosUsuario" in
			    "rwx") 
				    tput cup 8 2
				    echo "Puedes leer, modificar y ejecutar el contenido de ese archivo."
				    sleep 3
				    ;;
			    "rw-")
				    tput cup 8 2
				    echo "Puedes leer y modificar el contenido de ese archivo."
				    sleep 3
				    ;;
			    "r--")
				    tput cup 8 2
				    echo "Solo puedes leer el contenido de ese archivo."
				    sleep 3
				    ;;
			    "---")
				    tput cup 8 2
				    echo "No tienes permisos sobre ese archivo"
				    sleep 3
				    ;;
				   
		    esac

	    else
		tput cup 8 2
		echo "No se pudo leer los permisos del archivo, la ruta no es correcta o el archivo no existe"
		sleep 2
	    fi

            ;;
        5)
            #Listado de archivos    
            ;;

	*)  #Default
		tput cup 8 2
		echo "Elija una opción válida"
		sleep 2
	    ;;   
    esac
