#!/usr/bin/env bash
#Script created to launch Jmeter tests directly from the current terminal without accessing the jmeter master pod.
#It requires that you supply the path to the jmx file
#After execution, test script jmx file may be deleted from the pod itself but not locally.

working_dir="`pwd`"

jmx="$1"
[ -n "$jmx" ] || read -p 'Enter path to the jmx file ' jmx

if [ ! -f "$jmx" ];
then
    echo "Test script file was not found in PATH"
    echo "Kindly check and input the correct file path"
    exit
fi

test_name="$(basename "$jmx")"

#Get namesapce variable
ns="$2"
[ -n "$ns" ] || read -p 'Enter namespace ' ns
if [ -z "$ns" ];
then
    echo "Namespace cannot be empty"
    exit
fi

#Get Master pod details

master_pod=`kubectl get po -n $ns  | grep jmeter-master | awk '{print $1}'`

kubectl -n $ns cp "$jmx"  "$master_pod:/$test_name"

## Echo Starting Jmeter load test

kubectl exec -n $ns -ti $master_pod -- /bin/bash /load_test "$test_name" JVM_ARGS="-Xms24576m -Xmx24576m"