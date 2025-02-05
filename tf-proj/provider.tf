terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.connect.api-url
  pm_api_token_id     = var.connect.api-token-id
  pm_api_token_secret = var.connect.api-token-secret
  #  pm_tls_insecure = true           # Отключение проверки сертификатов (по желанию)
}
