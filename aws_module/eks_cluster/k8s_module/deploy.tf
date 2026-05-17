

data "aws_eks_cluster" "eks_cluster" {
  name = module.eks_module.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = module.eks_module.cluster_certificate_authority
}


provider "kubernetes" {
  host                   = module.eks_module.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
  cluster_ca_certificate = base64decode(module.eks_module.cluster_certificate_authority)
  config_path = "~/.kube/config"
}





provider "kubernetes" {
  config_path    = "~/.kube/config"
}


resource "kubernetes_deployment" "hotstar" {
  metadata {
    name      = "hotstar-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hotstarapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "hotstarapp"
        }
      }

      spec {
        container {
          name  = "hotstarcontainer"
          image = "dixit7/hotstar:v3"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}