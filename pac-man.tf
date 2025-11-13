terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "pac-man" {
  metadata {
    annotations = {
      name = "pac_man_web_app"
    }

    labels = {
      namespace = "pac-man"
    }

    name = "pac-man"
  }
}

module "mongo" {
  source               = "./modules/mongo"
  kubernetes_namespace = "pac-man"
}

module "pac-man" {
  source               = "./modules/pacman"
  kubernetes_namespace = "pac-man"
  depends_on           = [module.mongo]
}
