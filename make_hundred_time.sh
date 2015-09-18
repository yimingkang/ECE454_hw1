#!/bin/bash
N=10
T=8
rm ./times
for i in `seq 1 $N`;
do
        make clean > /dev/null
        /usr/bin/time -a -p -o ./times make -j $T > /dev/null
        echo $i
done
echo "Average real ($T theads):"
cat times | grep real | sed 's/real //' | awk "{s+=\$1} END {print s/$N}"
