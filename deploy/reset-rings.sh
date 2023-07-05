#!/usr/bin/env bash
#Script writtent to stop a running jmeter master test
#Kindly ensure you have the necessary kubeconfig

working_dir=$(pwd)

#Get namespace variable
ringcount=$1
for i in $(seq 1 $ringcount); do
    ring="ring$i"

    echo "Destroying ring$i..."
    kubectl delete ns $ring --wait=false
done
