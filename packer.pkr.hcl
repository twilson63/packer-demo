packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.6"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

packer {
  required_plugins {
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}


source "googlecompute" "basicexample" {
  project_id = "arweave-437622"
  source_image = "ubuntu-2204-jammy-v20240927"
  ssh_username = "ubuntu"
  zone = "us-east1-c"
}

build {
  sources = ["sources.googlecompute.basicexample"]

  provisioner "shell" {
    script = "install.sh"
  }

  provisioner "ansible" {
    playbook_file = "ansible_playbook.yml"
    extra_arguments = [ "--become" ]  # Use sudo

  }
}
