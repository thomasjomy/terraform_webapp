resource "kubernetes_persistent_volume" "mongo_pv"{
    metadata {
      name = "mongo_pv"
    }

    spec {
      capacity = {
        storage = "10Gi"
      }

      access_modes = ["ReadWriteOnce"]
      persistent_volume_reclaim_policy = "Retain"
      storage_class_name = "mongo-sc"
      persistent_volume_source {
        host_path {
          path = "/mnt/data"
        }
      }
    }
}