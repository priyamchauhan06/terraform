output "example" {
  description = "Example output"
  value       = module.this.enabled ? local.example : null
}