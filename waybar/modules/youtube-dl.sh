#!/bin/bash
echo "----------------------------------------------";
echo "------------------youtube-dl------------------";
echo "----------------------------------------------";
echo "                ingresa enlace                ";
echo "----------------------------------------------";
read enlace ;
exec i3-sensible-terminal  -e youtube-dl $enlace ;
sleep 1;
exit 0;
