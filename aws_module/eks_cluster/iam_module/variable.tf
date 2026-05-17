variable "cluster_role_name" {
    type = string
    }

    variable "node_role_name" {
    type = string
    }

variable "cluster_policy_name" {
      default = "cluster_policy"

      }
    
variable "node_policy_name" {
      default = "node_policy"
      }