ringcount=$1
echo $ringcount

for i in $(seq 1 $ringcount); do
    echo "Creating ring $i..."
    kubectl create ns ring$i
    echo "Deploying master for ring$i..."
    kubectl apply -f jmeter-master-configmap.yaml -n ring$i
    kubectl apply -f jmaster.yaml -n ring$i
done

for i in $(seq 1 $ringcount); do
    echo "Wait for master for ring$i complete..."
    kubectl rollout status deployment jmeter-master1 -n "ring$i" --timeout=90s
    echo "Deploying slaves for ring$i..."
    kubectl apply -f jslaves_svc.yaml -n ring$i
    kubectl apply -f jslave.yaml -n ring$i
done
