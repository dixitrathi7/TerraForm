locals {
  common_tags = {
    #company      = "${var.company}"
    environment = "${var.environment}"
    project = "${var.environment}"
#    ManagedBy = "${var.managedby}"
 #   cost_ignore = "${var.cost_ignore}"
  }
}