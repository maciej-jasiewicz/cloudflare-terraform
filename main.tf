terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

variable "api_token" {
  sensitive = true
}

variable "zone_id" {
  type = string
}

variable "account_id" {
  type = string
}

variable "domain" {
  type = string
}

provider "cloudflare" {
  api_token = var.api_token
}

resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  value   = "203.0.113.10"
  type    = "A"
  proxied = true
}