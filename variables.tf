variable "monitoring_alert_policies" {
  description = <<EOT
Map of monitoring_alert_policies, attributes below
Required:
    - combiner
    - display_name
    - conditions (block):
        - condition_absent (optional, block):
            - aggregations (optional, block):
                - alignment_period (optional)
                - cross_series_reducer (optional)
                - group_by_fields (optional)
                - per_series_aligner (optional)
            - duration (required)
            - filter (optional)
            - trigger (optional, block):
                - count (optional)
                - percent (optional)
        - condition_matched_log (optional, block):
            - filter (required)
            - label_extractors (optional)
        - condition_monitoring_query_language (optional, block):
            - duration (required)
            - evaluation_missing_data (optional)
            - query (required)
            - trigger (optional, block):
                - count (optional)
                - percent (optional)
        - condition_prometheus_query_language (optional, block):
            - alert_rule (optional)
            - disable_metric_validation (optional)
            - duration (optional)
            - evaluation_interval (optional)
            - labels (optional)
            - query (required)
            - rule_group (optional)
        - condition_sql (optional, block):
            - boolean_test (optional, block):
                - column (required)
            - daily (optional, block):
                - execution_time (optional, block):
                    - hours (optional)
                    - minutes (optional)
                    - nanos (optional)
                    - seconds (optional)
                - periodicity (required)
            - hourly (optional, block):
                - minute_offset (optional)
                - periodicity (required)
            - minutes (optional, block):
                - periodicity (required)
            - query (required)
            - row_count_test (optional, block):
                - comparison (required)
                - threshold (required)
        - condition_threshold (optional, block):
            - aggregations (optional, block):
                - alignment_period (optional)
                - cross_series_reducer (optional)
                - group_by_fields (optional)
                - per_series_aligner (optional)
            - comparison (required)
            - denominator_aggregations (optional, block):
                - alignment_period (optional)
                - cross_series_reducer (optional)
                - group_by_fields (optional)
                - per_series_aligner (optional)
            - denominator_filter (optional)
            - duration (required)
            - evaluation_missing_data (optional)
            - filter (optional)
            - forecast_options (optional, block):
                - forecast_horizon (required)
            - threshold_value (optional)
            - trigger (optional, block):
                - count (optional)
                - percent (optional)
        - display_name (required)
Optional:
    - deletion_policy
    - enabled
    - notification_channels
    - project
    - severity
    - user_labels
    - alert_strategy (block):
        - auto_close (optional)
        - notification_channel_strategy (optional, block):
            - notification_channel_names (optional)
            - renotify_interval (optional)
        - notification_prompts (optional)
        - notification_rate_limit (optional, block):
            - period (optional)
    - documentation (block):
        - content (optional)
        - links (optional, block):
            - display_name (optional)
            - url (optional)
        - mime_type (optional)
        - subject (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    combiner              = string
    display_name          = string
    deletion_policy       = optional(string)
    enabled               = optional(bool)
    notification_channels = optional(list(string))
    project               = optional(string)
    severity              = optional(string)
    user_labels           = optional(map(string))
    conditions = list(object({
      condition_absent = optional(object({
        aggregations = optional(list(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string)
          group_by_fields      = optional(list(string))
          per_series_aligner   = optional(string)
        })))
        duration = string
        filter   = optional(string)
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      condition_matched_log = optional(object({
        filter           = string
        label_extractors = optional(map(string))
      }))
      condition_monitoring_query_language = optional(object({
        duration                = string
        evaluation_missing_data = optional(string)
        query                   = string
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      condition_prometheus_query_language = optional(object({
        alert_rule                = optional(string)
        disable_metric_validation = optional(bool)
        duration                  = optional(string)
        evaluation_interval       = optional(string)
        labels                    = optional(map(string))
        query                     = string
        rule_group                = optional(string)
      }))
      condition_sql = optional(object({
        boolean_test = optional(object({
          column = string
        }))
        daily = optional(object({
          execution_time = optional(object({
            hours   = optional(number)
            minutes = optional(number)
            nanos   = optional(number)
            seconds = optional(number)
          }))
          periodicity = number
        }))
        hourly = optional(object({
          minute_offset = optional(number)
          periodicity   = number
        }))
        minutes = optional(object({
          periodicity = number
        }))
        query = string
        row_count_test = optional(object({
          comparison = string
          threshold  = number
        }))
      }))
      condition_threshold = optional(object({
        aggregations = optional(list(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string)
          group_by_fields      = optional(list(string))
          per_series_aligner   = optional(string)
        })))
        comparison = string
        denominator_aggregations = optional(list(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string)
          group_by_fields      = optional(list(string))
          per_series_aligner   = optional(string)
        })))
        denominator_filter      = optional(string)
        duration                = string
        evaluation_missing_data = optional(string)
        filter                  = optional(string)
        forecast_options = optional(object({
          forecast_horizon = string
        }))
        threshold_value = optional(number)
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      display_name = string
    }))
    alert_strategy = optional(object({
      auto_close = optional(string)
      notification_channel_strategy = optional(list(object({
        notification_channel_names = optional(list(string))
        renotify_interval          = optional(string)
      })))
      notification_prompts = optional(list(string))
      notification_rate_limit = optional(object({
        period = optional(string)
      }))
    }))
    documentation = optional(object({
      content = optional(string)
      links = optional(list(object({
        display_name = optional(string)
        url          = optional(string)
      })))
      mime_type = optional(string)
      subject   = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitoring_alert_policies : (
        length(v.conditions) >= 1
      )
    ])
    error_message = "Each conditions list must contain at least 1 items"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

