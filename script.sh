#!/bin/bash
dir=$1
option1=$2
option2=$3

if test -z ${dir};
then read -p "enter a directory path: " dir; fi


if [ -d "$dir" ]; 
then 
if test -z ${option1};
then read -p "choose either ana, del or arr: " option1; fi 

while [[ ${option1} != "ana" && ${option1} != "del" && ${option1} != "arr" ]]
do read -p "Error! please choose either ana, del or arr: " option1; done 

if [[ ${option1} = "ana" ]]
then read -p "enter a regular expression: " option2;
grep -ro ${option2} ${dir} | wc -l;


elif [[ ${option1} = "del" ]]
then read -p "enter a file size: " option2;
find ${dir} -type f -size +${option2}k -delete


elif [[ ${option1} = "arr" ]]
then read -p "enter an extention type: " option2;
mkdir -p hi
find ${dir} -name "*."${option2} -exec mv {} ./hi \;
fi

else echo "Warning: '$dir' NOT found."
fi




