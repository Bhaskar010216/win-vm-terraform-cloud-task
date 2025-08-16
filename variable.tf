variable "rg" {
  type        = string
  default     = "bhaskar-16thaug"
  description = "it is resource group"
}

variable "location" {
  type        = string
  default     = "Central US"
  description = "it is location of rg"
}

variable "vn" {
  type        = string
  default     = "raj-vn"
  description = "it is vn name"
}

variable "as" {
  type        = list(string)
  default     = ["10.0.0.0/18"]
  description = "it is address space"
}
variable "sn" {
  type        = string
  default     = "raj-sn"
  description = "it is subnet"
}

variable "address_prefixes" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "it is address prefix"
}

variable "ip" {
  type        = string
  default     = "my-public-ip"
  description = "it is name of the public ip"
}

variable "nic" {
  type        = string
  default     = "raj-nic"
  description = "it is nic name"
}

variable "vmname" {
  type        = string
  default     = "raj-vm"
  description = "it is vm name"
}
variable "size" {
  type       = string
  default    = "Standard_F2"
  description = "it is size of the vm"
}

variable "username" {
  type        = string
  default     = "Bhaskar"
  description = "it is user name"
}

variable "password" {
  type        = string
  default     = "Bhaskar123"
  description = "it is password"
}
