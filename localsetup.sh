mkdir -p /tmp/influxvol
mkdir -p /tmp/grafanavol
k3d cluster create katacluster -p 8080:80@loadbalancer --agents 6 --k3s-arg "--disable=traefik@server:0" \
    --volume /tmp/influxvol:/tmp/influxvol@agent:0,1,2 \
    --volume /tmp/grafanavol:/tmp/grafanavol@agent:0,1,2

# build images in docker and import in k3d
docker build -t testframework/jmetermaster:latest -f ./master/Dockerfile .
docker build -t testframework/jmeterslave:latest -f ./slave/Dockerfile .
docker build -t testframework/reporter:latest -f ./reporter/Dockerfile .
k3d image import testframework/jmetermaster:latest -c katacluster
k3d image import testframework/jmeterslave:latest -c katacluster
k3d image import testframework/reporter:latest -c katacluster

# taint nodes to allow reporting pods to run on them
kubectl taint nodes k3d-katacluster-agent-0 sku=reporter:NoSchedule
kubectl taint nodes k3d-katacluster-agent-1 sku=reporter:NoSchedule
kubectl taint nodes k3d-katacluster-agent-2 sku=reporter:NoSchedule

cd helm
helm install kataklysmos-reporting ./kataklysmos-reporting -n kataklysmos-reporting --create-namespace