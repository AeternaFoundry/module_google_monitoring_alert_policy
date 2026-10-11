output "monitoring_alert_policies_id" {
  description = "Map of id values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no id are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "monitoring_alert_policies_alert_strategy" {
  description = "Map of alert_strategy values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no alert_strategy are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => one(v.alert_strategy) if v.alert_strategy != null && length(v.alert_strategy) > 0 }
}
output "monitoring_alert_policies_combiner" {
  description = "Map of combiner values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no combiner are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.combiner if v.combiner != null && length(v.combiner) > 0 }
}
output "monitoring_alert_policies_conditions" {
  description = "Map of conditions values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no conditions are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.conditions if v.conditions != null && length(v.conditions) > 0 }
}
output "monitoring_alert_policies_creation_record" {
  description = "Map of creation_record values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no creation_record are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.creation_record if v.creation_record != null && length(v.creation_record) > 0 }
}
output "monitoring_alert_policies_deletion_policy" {
  description = "Map of deletion_policy values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no deletion_policy are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "monitoring_alert_policies_display_name" {
  description = "Map of display_name values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no display_name are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "monitoring_alert_policies_documentation" {
  description = "Map of documentation values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no documentation are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => one(v.documentation) if v.documentation != null && length(v.documentation) > 0 }
}
output "monitoring_alert_policies_enabled" {
  description = "Map of enabled values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no enabled are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.enabled if v.enabled != null }
}
output "monitoring_alert_policies_name" {
  description = "Map of name values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no name are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "monitoring_alert_policies_notification_channels" {
  description = "Map of notification_channels values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no notification_channels are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.notification_channels if v.notification_channels != null && length(v.notification_channels) > 0 }
}
output "monitoring_alert_policies_project" {
  description = "Map of project values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no project are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.project if v.project != null && length(v.project) > 0 }
}
output "monitoring_alert_policies_severity" {
  description = "Map of severity values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no severity are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.severity if v.severity != null && length(v.severity) > 0 }
}
output "monitoring_alert_policies_user_labels" {
  description = "Map of user_labels values across all monitoring_alert_policies, keyed the same as var.monitoring_alert_policies except keys with no user_labels are omitted"
  value       = { for k, v in google_monitoring_alert_policy.monitoring_alert_policies : k => v.user_labels if v.user_labels != null && length(v.user_labels) > 0 }
}

