final provider.tf

terraform {
required_providers {
azurerm = {
            source = "hashicorp/azurerm"
            version = "4.39.0"
}
}
}
provider "azurerm" {
features {}
client_id="2b819951-5b0b-4439-a9c4-9f6ad8bcce40"
client_secret="KN38Q~UH4bw4IEL9rnEUWxOjbvfj4tEpPUSpoaK0"
tenant_id="7e1b4521-93b6-473d-8e77-cf32c35bff05"
subscription_id="34a1c0d5-ab81-462c-89db-795e1572cd70"
}
