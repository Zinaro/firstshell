#!/bin/zsh

# ls -l or ll

pel="$1"

for dosya in "$pel"/*
do
    destur=$(stat -c "%A" "$dosya")
    xwedi=$(stat -c "%U" "$dosya")
    grup=$(stat -c "%G" "$dosya")
    mezinahi=$(stat -c "%s" "$dosya")
    dirok=$(stat -c "%y" "$dosya" | cut -d '.' -f1)
    nav=$(basename "$dosya")
    
    if [ -d "$dosya" ]
    then
        t="d"
    elif [ -L "$dosya" ]
    then
        t="l"
    else
        t="-"
    fi
    printf "\e[92m%s %s\e[31m %8s \e[31m%10s \e[93m%10s\e[94m %10s \e[96m%s\e[0m\n" "$t" "$destur" "$xwedi" "$grup" "$mezinahi" "$dirok" "$nav"

done