# Задаем пул для ВМ 
resource "proxmox_pool" "pool" {
  poolid  = var.pool_conf.name
  comment = var.pool_conf.comment
}
