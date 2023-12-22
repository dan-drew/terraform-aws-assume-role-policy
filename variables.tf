variable "type" {
  type = string
  description = "Name of service to create policy for"
  validation {
    condition = lookup(local.assume_roles, var.type, null) != null
    error_message = "Unknown service type"
  }
}