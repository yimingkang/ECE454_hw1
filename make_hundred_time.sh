#!/bin/bash
N=10
rm ./.times
for i in `seq 1 $N`;
do
        /usr/bin/time -a -p -o ./.times vpr iir1.map4.latren.net k4-n10.xml place.out route.out -nodisp -place_only -seed 0 > /dev/null
        echo $i
done
echo "Average user :"
cat ./.times | grep user | sed 's/user //' | awk "{s+=\$1} END {print s/$N}"
