#!/bin/bash

rm statsmemudm.txt

i=0
while [ $i -le $1 ]
do 
    docker stats oai-udm --no-stream | awk '{ print $4 }' | awk '{if(NR>1) print $NF}' | tee --append statsmemudm.txt;
    i=$(( $i + 1 ))

done

