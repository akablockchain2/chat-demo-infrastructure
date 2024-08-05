# Defines a variable for the AWS EKS cluster name
variable "cluster_name" {
  default = "demo"
  type = string
  description = "AWS EKS CLuster Name"
  nullable = false
}
