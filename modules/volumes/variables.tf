variable "name" {}
variable "type" {
  default = "pd-ssd"
}
variable "num_volumes" {
  default = 0
}
variable "size" {}
variable "zones" {}
variable "instance" {}
variable "interface" {
  default = "SCSI"
}
variable "provisioned_iops" {
  default = null
}
