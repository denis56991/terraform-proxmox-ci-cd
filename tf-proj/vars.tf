variable "connect" {
  type = object({
    api-url          = string
    api-token-id     = string
    api-token-secret = string
  })
  default = {
    api-url          = "https://my-proxmox.ru/api2/json"
    api-token-id     = "user@pve!token"
    api-token-secret = "******-*****-******-*****"
  }
}

# Конфигурация пула
variable "pool_conf" {
  type = object({
    name    = string
    comment = string
  })
  default = {
    name    = "my-test-pool"
    comment = "Всякое тестовое"
  }

}

# Конвигурация ВМ
variable "vm_conf" {
  type = object({
    id       = number
    name     = string
    template = string
    cores    = number
    sockets  = number
    memory   = number
    size     = string
    ip       = string
    sshkey   = string

  })
  default = {
    id       = 111
    name     = "srv-test-1"
    template = "ubuntu2404-template"

    cores   = 2
    sockets = 1
    memory  = 2 # значкние указано в Гб, оно в ресурсе преобразовывается в МБ

    size = "40G"

    ip     = "192.168.1.2"
    sshkey = "ssh-ed25519 AAAAC3N........."

  }

}

