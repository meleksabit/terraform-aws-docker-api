# --------------------------------
# Variables for the network module
# --------------------------------

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/28"
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.0.0/28", "10.0.0.16/28"]
}

# ----------------------------------------------------
# List of availability zones to deploy subnets across
# ----------------------------------------------------

variable "availability_zones" {
  description = "List of availability zones for subnet distribution"
  type        = list(string)
}
