#!/bin/bash

CurDate=`date +'%d/%m/%Y %T'`


#Checking whether the directory exists or not
DIR="artefactory"
if [ -d "$DIR" ]; then
	if [ -f "$DIR/artefact.txt" ]; then
		>$DIR/artefact.txt
        else
           touch $DIR/artefact.txt
	fi
else
  ###  creating the directory as its not existing
  mkdir $DIR
  touch $DIR/artefact.txt
fi

curl -s -k https://raw.githubusercontent.com/jfrog/SwampUp2021/main/README.md >> $DIR/artefact.txt

sed -i "s|SwampUp|SwampUp ${CurDate}|g" $DIR/artefact.txt

sed -i "s| 2021||g" $DIR/artefact.txt
