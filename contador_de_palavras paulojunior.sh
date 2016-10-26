#!/bin/bash


 #Este script foi elaborado pelo Paulo Junior


 #Este script serve para poder contar as palavras de um texto e assim poder ordenar de A a Z


 echo "digite o nome do arquivo" 


 #Este comando vai imprimir na tela a seguinte mensagem entre ""


read arq 

 #Este comando vai capturar a palavra digitada e transferir para a variavel "arq" 

cat $arq | egrep -o '\w+' | grep .... | sort -f | uniq -c -i | sort -n -r | head 

 #O comando [egrep -o '\w+'] serve para trazer somente as palavras, 	                                                                                      #E o comando [grep ....] serve para limitar o tamando da palavra 
#E o comando [sort -f] serve para ignorar as maisculas e minusculas nas palavras
#E o comando [uniq -c -i] serve para criar a contagem e ignorar as maisculas e minusculas nas palavras
#E o comando [sort -n -r] serve para ordenar do maior para o menor 
#E o comando [head] serve para mostrar os 10 primeiros

