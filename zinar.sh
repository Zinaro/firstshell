#!/bin/zsh

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
    printf "%s%s %8s %10s %10s %10s %s\n" "$t" "$destur" "$xwedu" "$grup" "$mezinahi" "$dirok" "$nav"
done