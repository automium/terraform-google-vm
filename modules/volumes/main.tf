data "google_compute_zones" "available" {
  region  = var.region
}

resource "google_compute_disk" "add_disk" {
  name  = "${var.name}-${count.index}"
  type  = var.type
  zone  = var.zones == null ? data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)] : var.zones[count.index % length(var.zones)]
  size  = var.size
  count = var.num_volumes
  #interface = var.interface # in beta
  physical_block_size_bytes = 4096
}

resource "google_compute_attached_disk" "attach_disk" {
  count = var.num_volumes
  disk     = google_compute_disk.add_disk.*.id[count.index]
  instance = var.instance[count.index]
  zone  = var.zones == null ? data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)] : var.zones[count.index % length(var.zones)]
}

