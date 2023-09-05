package provisioner

type K8sProvisioner interface {
	ProvisionK8sCluster() K8sCluster
}
