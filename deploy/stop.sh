#!/usr/bin/env bash
#Script writtent to stop a running jmeter master test
#Kindly ensure you have the necessary kubeconfig

working_dir=$(pwd)

#Get namespace variable
ringcount=$1
for i in $(seq 1 $ringcount); do
    ring="ring$i"

    master_pod=$(kubectl get pods -n $ring | grep jmeter-master | awk '{print $1}')

    kubectl exec -n $ring -ti $master_pod bash /jmeter/apache-jmeter-5.5/bin/stoptest.sh
done
