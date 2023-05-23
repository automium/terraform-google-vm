variable "name" {}
variable "type" {
  default = "pd-ssd"
}
variable "num_volumes" {
  default = 0
}
variable "size" {}
variable "region" {
  type        = string
  description = "Region where volumes should be created."
  default     = null
}
variable "zones" {
  default     = null
}
variable "instance" {}
variable "interface" {
  default = "SCSI"
}
variable "provisioned_iops" {
  default = null
}
