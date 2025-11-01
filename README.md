# Infra code — Terraform modular approach for each Azure environment

This repository contains opinionated, modular Terraform code for provisioning Azure resources per-environment (for example `prepod` and `prod`). It demonstrates a modular approach where each resource type is implemented as a module and consumed by environment-specific configurations.

## Highlights

- Modular Terraform modules under `modules/` (resource groups, storage accounts, etc.).
- Environment folders under `env/` (each environment contains the Terraform configuration that composes modules and provides variables/state configuration).
- Simple layout suitable for teams that want one directory per environment and reusable modules for resource types.

## Repository structure

```
README.md
LICENSE
env/                  # Environment-specific Terraform configs (e.g., prepod, prod)
	prepod/
		main.tf
		provider.tf
		terraform.tfvars
		variables.tf
		terraform.tfstate*
	prod/
modules/              # Reusable modules
	azurerm_resource_group/
		main.tf
		variable.tf
	azurerm_storage_account/
		main.tf
		variable.tf
```

## Quick start (local)

Prerequisites

- Terraform 1.5+ (or the project-recommended version)
- Azure CLI (for authentication) or service principal credentials

Steps

1. Authenticate with Azure:

```powershell
az login
# or for non-interactive CI: az login --service-principal -u <appId> -p <password> --tenant <tenant>
```

2. Choose an environment and initialize Terraform (example: `env/prepod`):

```powershell
cd env\prepod
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

3. To destroy the environment (be careful):

```powershell
terraform destroy -var-file="terraform.tfvars"
```

## How modules are organized

- `modules/azurerm_resource_group` — creates an Azure Resource Group. Inputs are `name`, `location`, and optional `tags`.
- `modules/azurerm_storage_account` — creates an Azure storage account. Inputs include `name`, `resource_group_name`, `location`, `account_tier`, etc.

Each module exposes clear `variables` and `outputs`. When composing environments, pass variables from the environment `terraform.tfvars` and wire outputs between modules where needed.

## State management recommendations

- Use a remote backend (recommended: Azure Storage Account) for environment state to enable collaboration and locking. The example tree contains local state files for simplicity; move to a remote backend for production.
- Protect access to Terraform state — it may contain secrets.

Example remote backend snippet (replace placeholders):

```hcl
terraform {
	backend "azurerm" {
		resource_group_name  = "rg-tf-state"
		storage_account_name = "tfstate<unique>"
		container_name       = "tfstate"
		key                  = "env/prepod.terraform.tfstate"
	}
}
```

## Conventions & best practices

- Keep modules generic and parameterized.
- Keep environment folders small: let them only wire modules and set environment-specific values.
- Use naming conventions for resources that include environment name to avoid collisions.
- Store secrets in a secure secret store (Azure Key Vault), not in `terraform.tfvars` or the state.
- Add tests for modules (for example using Terratest or kitchen-terraform) when adding production modules.

## CI/CD recommendations

- Use a pipeline to run `terraform fmt`, `terraform validate`, `terraform plan` and require approval before `apply` for production environments.
- Use separate service principals with least privilege for CI runs per environment.

## Troubleshooting

- If `terraform init` fails, check provider versions and your network/credentials.
- If an apply partially fails, investigate the state file, fix config, and re-run `terraform apply`.

## Contributing

1. Fork the repo
2. Create a feature branch
3. Add tests for module changes
4. Submit a Pull Request with a concise description

## License

This repository is licensed under the terms in `LICENSE`.

---

If you'd like I can also:

- Add a `CONTRIBUTING.md` or `CODE_OF_CONDUCT.md`.
- Add example `backend.tf` files for `prepod` and `prod` with Azure Storage account wiring.
- Add module-level README files under each `modules/*` describing inputs/outputs and examples.

Tell me which of the above extras you want next and I'll add them.