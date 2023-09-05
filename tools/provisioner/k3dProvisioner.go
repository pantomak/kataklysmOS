package provisioner

type K3dProvisioner struct {
}

func (p *K3dProvisioner) ProvisionK8sCluster() K8sCluster {
	return K8sCluster{
		apiUrl:   "https://api.k8s.example.com",
		registry: "registry.k8s.example.com",
	}
}
