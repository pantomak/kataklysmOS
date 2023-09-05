package core

import (
	"kataklysmos/provisioner"
)

type ProvisionOptions struct {
	Platform string
}

type Workload struct {
	Name           string
	JMeterFile     string
	RingCount      int
	WorkersPerRing int
	K8sCluster     provisioner.K8sCluster
}

type Coordinator struct {
}

func (c *Coordinator) ProvisionK8sCluster(options ProvisionOptions) provisioner.K8sCluster {
	var p provisioner.K8sProvisioner
	switch options.Platform {
	case "k3d":
		p = &provisioner.K3dProvisioner{}
	case "azure":
		p = &provisioner.TfProvisioner{WorkingDir: "kataklysmos/terraform/azure"}
	}
	return p.ProvisionK8sCluster()
}

func (c *Coordinator) DeployCoreComponents(k8sCluster provisioner.K8sCluster) {
	// Deploy reporting components
	deployReporting()
	// Deploy monitoring components
	deployMonitoring()
	// Deploy coordination components
}

func (c *Coordinator) RunWorkload(workload Workload) {
}

func deployReporting() {
}

func deployMonitoring() {
}

func deployRings(count int) {
}

func checkCapacity() {
}
