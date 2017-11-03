resource "digitalocean_droplet" "docker" {
  name        = "node${count.index + 1}"
  region      = "nyc1"
  size        = "${var.size}"
  resize_disk = "false"
  image       = "ubuntu-16-04-x64"
  ssh_keys    = ["43:0f:4e:76:7e:87:6f:be:f7:53:3a:80:5e:7f:88:df"]
  count       = "3"
}

output "ip" {
  value = "${join(",",digitalocean_droplet.docker.*.ipv4_address)}"
}

/*
resource "digitalocean_droplet" "docker2" {
  name        = "docker2"
  region      = "nyc1"
  size        = "${var.size}"
  resize_disk = "false"
  image       = "ubuntu-16-04-x64"
}

resource "digitalocean_droplet" "docker3" {
  name        = "docker3"
  region      = "nyc1"
  size        = "${var.size}"
  resize_disk = "false"
  image       = "ubuntu-16-04-x64"
}
*/
