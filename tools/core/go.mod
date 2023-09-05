module kataklysmos/core

go 1.20

replace kataklysmos/provisioner => ../provisioner

replace kataklysmos/k8smanager => ../k8smanager

require kataklysmos/provisioner v0.0.0-00010101000000-000000000000

require (
	github.com/ProtonMail/go-crypto v0.0.0-20230626094100-7e9e0395ebec // indirect
	github.com/apparentlymart/go-textseg/v13 v13.0.0 // indirect
	github.com/cloudflare/circl v1.3.3 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-version v1.6.0 // indirect
	github.com/hashicorp/hc-install v0.5.2 // indirect
	github.com/hashicorp/terraform-exec v0.18.1 // indirect
	github.com/hashicorp/terraform-json v0.17.1 // indirect
	github.com/zclconf/go-cty v1.13.2 // indirect
	golang.org/x/crypto v0.11.0 // indirect
	golang.org/x/mod v0.12.0 // indirect
	golang.org/x/sys v0.10.0 // indirect
	golang.org/x/text v0.11.0 // indirect
	kataklysmos/k8smanager v0.0.0-00010101000000-000000000000 // indirect
)