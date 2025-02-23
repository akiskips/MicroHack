data "azurerm_client_config" "current1" {}


module "vm_kafka" {
  source = "./modules/compute"

  resource_group_name = module.common_infrastructure.created_resource_group_name
  location            = var.location
  vm_name             = "vm-kafka-0"
  public_key          = var.ssh_key
  sid_username        = "oracle"
  vm_sku              = var.vm_kafka_sku

  vm_source_image_reference     = var.vm_kakfa_image_reference
  aad_system_assigned_identity  = true
  public_ip_address_resource_id = module.network.db_server_puplic_ip_resources[0].id

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
  
  module "vm_win" {
  source = "./modules/compute"

  resource_group_name = module.common_infrastructure.created_resource_group_name
  location            = var.location
  vm_name             = "vm-win-0"
  public_key          = var.ssh_key
  sid_username        = "oracle"
  vm_sku              = var.vm_win_sku

  vm_source_image_reference     = var.vm_win_image_reference
  aad_system_assigned_identity  = true
  public_ip_address_resource_id = module.network.db_server_puplic_ip_resources[0].id

  tags                           = module.common_infrastructure.tags
  db_subnet                      = module.network.db_subnet

  availability_zone = 1


  vm_os_disk = {
    name                   = "osdisk-win"
    caching                = "ReadWrite"
    storage_account_type   = "Premium_LRS"
    disk_encryption_set_id = null
    disk_size_gb           = 128
  }


  depends_on = [module.network, module.common_infrastructure]
}



module "storage_primary" {
  source = "./modules/storage"

  resource_group = module.common_infrastructure.resource_group
  is_data_guard  = module.common_infrastructure.is_data_guard
  naming         = "oracle-primary"
  vm             = module.vm_primary.vm
  tags           = module.common_infrastructure.tags
  database_disks_options = {
    data_disks = var.database_disks_options.data_disks
    asm_disks  = var.database_disks_options.asm_disks
    redo_disks = var.database_disks_options.redo_disks
  }
  availability_zone = module.vm_primary.availability_zone

  # role_assignments = {
  #   role_assignment_1 = {
  #     name                             = "Contributor"
  #     skip_service_principal_aad_check = false
  #   }
  # }
}




