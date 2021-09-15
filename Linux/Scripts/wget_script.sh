#!/bin/bash

#Use wget in a loop to make many requests of a web server, Web-1 in this case

vms='10.0.0.5 10.0.0.6'

for num in {0..100}
do
    for vm in ${vms[@]}
    do
        wget $vm -O /dev/null
    done
done

#With -O, the file is being directed to /dev/null (the void)
#Remove -O to save the file to working directory