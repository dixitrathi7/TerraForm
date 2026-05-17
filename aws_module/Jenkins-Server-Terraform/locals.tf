locals {
  common_tags = {
    #company      = "${var.company}"
    Environment  = "${var.environment}"
    ManagedBy    = "${var.managedby}"
    cost_ignore  = "${var.cost_ignore}"
  }
}