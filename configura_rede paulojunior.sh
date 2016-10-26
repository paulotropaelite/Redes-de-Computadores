#!/bin/bash

usuario=`id -u`

HEIGHT=15

WIDTH=60

CHOICE_HEIGHT=40

BACKTITLE="Essa configuração foi feita pelo Paulo Junior"

TITLE="Configurar a REDE"

MENU="Escolher uma das opcoes:"

      while true
      do

	OPTIONS=(1 "Configurar minha placa de rede para DHCP"
       		 2 "Alterar o nome do Computador para nome"
        	 3 "Alterar o nome do Computador para nome_sobrenome"
		 4 "Sair")


	 CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" --stdout\
                )

	clear

	case $CHOICE in
        	1)
			if [ $usuario -eq 0 ]
			then
				ip link set dev eth0 down 2>&1 > /tmp/temp.txt
				dhclient eth0 2>&1 >> /tmp/temp.txt
				ip r s 2>&1 >> /tmp/temp.txt
			else
				sudo ip link set dev eth0 down 2>&1 > /tmp/temp.txt
				sudo dhclient eth0 2>&1 >> /tmp/temp.txt
				sudo ip r s 2>&1 >> /tmp/temp.txt
			fi

			clear
			dialog --title 'Saida dos comandos' --textbox /tmp/temp.txt 20 60
			rm -f /tmp/temp/txt
            		;;
        	2)
			nome=$( dialog --stdout --inputbox 'Digite o nome:' 0 0 )
			if [ -n "$nome" ]
			then
				if [ $usuario -eq 0 ]
				then
					hostname $nome
				else
					sudo hostname $nome
				fi
				nome=`hostname`
				dialog --title 'Saida dos comandos' --msgbox "Nome do Computador configurado para $nome" 20 60
			else
				dialog --title 'Saida dos comandos' --msgbox "Voce nao digitou corretamente ..." 20 60
			fi
            		;;
        	3)
			nome=$( dialog --stdout --inputbox 'Digite o Nome:' 0 0 )
			if [ -n "$nome" ]
			then
				sobrenome=$( dialog --stdout --inputbox 'Digite o seu Sobrenome:' 0 0 )
				if [ -n "$sobrenome" ]
				then
					separador="-"
					maquina=$nome$separador$sobrenome

					if [ $usuario -eq 0 ]
					then
						hostname $maquina
					else
						sudo hostname $maquina
					fi
					nome=`hostname`
					dialog --title 'Saida dos comandos' --msgbox "Nome do Computador configurado para $maquina" 20 60
				else
					dialog --title 'Saida dos comandos' --msgbox "Voce nao digitou corretamente..." 20 60
				fi
			else
				dialog --title 'Saida dos comandos' --msgbox "Voce nao digitou corretamente..." 20 60
			fi
            		;;
        	4)
			break
            		;;
        	*)
			break
            		;;
	esac
done

exit 0
