data "azurerm_client_config" "current1" {}


module "vm_kafka" {
  source = "./modules/compute"

  resource_group_name = module.common_infrastructure.created_resource_group_name
  location            = var.location
  vm_name             = "vm-kafka-0"
  public_key          = var.ssh_key
  sid_username        = "oracle"
  vm_sku              = var.vm_kafka_sku

  vm_source_image_reference     = var.vm_kafka_image_reference
  aad_system_assigned_identity  = true
  public_ip_address_resource_id = module.network.db_server_puplic_ip_resources[2].id

  tags                           = module.common_infrastructure.tags
  db_subnet                      = module.network.db_subnet

  availability_zone = 1


  vm_os_disk = {
    name                   = "osdisk-kafka"
    caching                = "ReadWrite"
    storage_account_type   = "Premium_LRS"
    disk_encryption_set_id = null
    disk_size_gb           = 128
  }
  
}
#   module "vm_win" {
#   source = "./modules/compute"

#   resource_group_name = module.common_infrastructure.created_resource_group_name
#   location            = var.location
#   vm_name             = "vm-win-0"
#   public_key          = var.ssh_key
#   sid_username        = "oracle"
#   vm_sku              = var.vm_win_sku

#   vm_source_image_reference     = var.vm_win_image_reference
#   aad_system_assigned_identity  = true
#   public_ip_address_resource_id = module.network.db_server_puplic_ip_resources[3].id

#   tags                           = module.common_infrastructure.tags
#   db_subnet                      = module.network.db_subnet

#   availability_zone = 1


#   vm_os_disk = {
#     name                   = "osdisk-win"
#     caching                = "ReadWrite"
#     storage_account_type   = "Premium_LRS"
#     disk_encryption_set_id = null
#     disk_size_gb           = 128
#   }


#   depends_on = [module.network, module.common_infrastructure]
# }






