#!/bin/bash

#Create a script to generate unsuccessful SSH login attempts by using NSG rules to deny traffic

vms='10.0.0.5 10.0.0.6 10.1.0.4'
nums='0 1 2 3 4 5 6 7 8 9 10'

for num in ${nums[@]}
do 
    for vm in ${vms[@]}
    do
        ssh azadmin@$vm
    done
done