 resource "aws_db_instance" "myrds" {
    allocated_storage   = var.dbstorage
   storage_type        = var.storage_type
   identifier          = "rdstf"
   engine              = "mysql"
   engine_version      = var.db_version
   instance_class      = var.inst_class
   username            = var.db_user
   password            = var.db_passwd
   publicly_accessible = true
   skip_final_snapshot = true

   tags = {
     Name = "MyRDS"
   }
 }