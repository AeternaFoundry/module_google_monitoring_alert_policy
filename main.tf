resource "google_monitoring_alert_policy" "monitoring_alert_policies" {
  for_each = var.monitoring_alert_policies

  combiner              = each.value.combiner
  display_name          = each.value.display_name
  deletion_policy       = each.value.deletion_policy
  enabled               = each.value.enabled
  notification_channels = each.value.notification_channels
  project               = each.value.project
  severity              = each.value.severity
  user_labels           = each.value.user_labels

  dynamic "conditions" {
    for_each = each.value.conditions
    content {
      dynamic "condition_absent" {
        for_each = conditions.value.condition_absent != null ? [conditions.value.condition_absent] : []
        content {
          dynamic "aggregations" {
            for_each = condition_absent.value.aggregations != null ? condition_absent.value.aggregations : []
            content {
              alignment_period     = aggregations.value.alignment_period
              cross_series_reducer = aggregations.value.cross_series_reducer
              group_by_fields      = aggregations.value.group_by_fields
              per_series_aligner   = aggregations.value.per_series_aligner
            }
          }
          duration = condition_absent.value.duration
          filter   = condition_absent.value.filter
          dynamic "trigger" {
            for_each = condition_absent.value.trigger != null ? [condition_absent.value.trigger] : []
            content {
              count   = trigger.value.count
              percent = trigger.value.percent
            }
          }
        }
      }
      dynamic "condition_matched_log" {
        for_each = conditions.value.condition_matched_log != null ? [conditions.value.condition_matched_log] : []
        content {
          filter           = condition_matched_log.value.filter
          label_extractors = condition_matched_log.value.label_extractors
        }
      }
      dynamic "condition_monitoring_query_language" {
        for_each = conditions.value.condition_monitoring_query_language != null ? [conditions.value.condition_monitoring_query_language] : []
        content {
          duration                = condition_monitoring_query_language.value.duration
          evaluation_missing_data = condition_monitoring_query_language.value.evaluation_missing_data
          query                   = condition_monitoring_query_language.value.query
          dynamic "trigger" {
            for_each = condition_monitoring_query_language.value.trigger != null ? [condition_monitoring_query_language.value.trigger] : []
            content {
              count   = trigger.value.count
              percent = trigger.value.percent
            }
          }
        }
      }
      dynamic "condition_prometheus_query_language" {
        for_each = conditions.value.condition_prometheus_query_language != null ? [conditions.value.condition_prometheus_query_language] : []
        content {
          alert_rule                = condition_prometheus_query_language.value.alert_rule
          disable_metric_validation = condition_prometheus_query_language.value.disable_metric_validation
          duration                  = condition_prometheus_query_language.value.duration
          evaluation_interval       = condition_prometheus_query_language.value.evaluation_interval
          labels                    = condition_prometheus_query_language.value.labels
          query                     = condition_prometheus_query_language.value.query
          rule_group                = condition_prometheus_query_language.value.rule_group
        }
      }
      dynamic "condition_sql" {
        for_each = conditions.value.condition_sql != null ? [conditions.value.condition_sql] : []
        content {
          dynamic "boolean_test" {
            for_each = condition_sql.value.boolean_test != null ? [condition_sql.value.boolean_test] : []
            content {
              column = boolean_test.value.column
            }
          }
          dynamic "daily" {
            for_each = condition_sql.value.daily != null ? [condition_sql.value.daily] : []
            content {
              dynamic "execution_time" {
                for_each = daily.value.execution_time != null ? [daily.value.execution_time] : []
                content {
                  hours   = execution_time.value.hours
                  minutes = execution_time.value.minutes
                  nanos   = execution_time.value.nanos
                  seconds = execution_time.value.seconds
                }
              }
              periodicity = daily.value.periodicity
            }
          }
          dynamic "hourly" {
            for_each = condition_sql.value.hourly != null ? [condition_sql.value.hourly] : []
            content {
              minute_offset = hourly.value.minute_offset
              periodicity   = hourly.value.periodicity
            }
          }
          dynamic "minutes" {
            for_each = condition_sql.value.minutes != null ? [condition_sql.value.minutes] : []
            content {
              periodicity = minutes.value.periodicity
            }
          }
          query = condition_sql.value.query
          dynamic "row_count_test" {
            for_each = condition_sql.value.row_count_test != null ? [condition_sql.value.row_count_test] : []
            content {
              comparison = row_count_test.value.comparison
              threshold  = row_count_test.value.threshold
            }
          }
        }
      }
      dynamic "condition_threshold" {
        for_each = conditions.value.condition_threshold != null ? [conditions.value.condition_threshold] : []
        content {
          dynamic "aggregations" {
            for_each = condition_threshold.value.aggregations != null ? condition_threshold.value.aggregations : []
            content {
              alignment_period     = aggregations.value.alignment_period
              cross_series_reducer = aggregations.value.cross_series_reducer
              group_by_fields      = aggregations.value.group_by_fields
              per_series_aligner   = aggregations.value.per_series_aligner
            }
          }
          comparison = condition_threshold.value.comparison
          dynamic "denominator_aggregations" {
            for_each = condition_threshold.value.denominator_aggregations != null ? condition_threshold.value.denominator_aggregations : []
            content {
              alignment_period     = denominator_aggregations.value.alignment_period
              cross_series_reducer = denominator_aggregations.value.cross_series_reducer
              group_by_fields      = denominator_aggregations.value.group_by_fields
              per_series_aligner   = denominator_aggregations.value.per_series_aligner
            }
          }
          denominator_filter      = condition_threshold.value.denominator_filter
          duration                = condition_threshold.value.duration
          evaluation_missing_data = condition_threshold.value.evaluation_missing_data
          filter                  = condition_threshold.value.filter
          dynamic "forecast_options" {
            for_each = condition_threshold.value.forecast_options != null ? [condition_threshold.value.forecast_options] : []
            content {
              forecast_horizon = forecast_options.value.forecast_horizon
            }
          }
          threshold_value = condition_threshold.value.threshold_value
          dynamic "trigger" {
            for_each = condition_threshold.value.trigger != null ? [condition_threshold.value.trigger] : []
            content {
              count   = trigger.value.count
              percent = trigger.value.percent
            }
          }
        }
      }
      display_name = conditions.value.display_name
    }
  }

  dynamic "alert_strategy" {
    for_each = each.value.alert_strategy != null ? [each.value.alert_strategy] : []
    content {
      auto_close = alert_strategy.value.auto_close
      dynamic "notification_channel_strategy" {
        for_each = alert_strategy.value.notification_channel_strategy != null ? alert_strategy.value.notification_channel_strategy : []
        content {
          notification_channel_names = notification_channel_strategy.value.notification_channel_names
          renotify_interval          = notification_channel_strategy.value.renotify_interval
        }
      }
      notification_prompts = alert_strategy.value.notification_prompts
      dynamic "notification_rate_limit" {
        for_each = alert_strategy.value.notification_rate_limit != null ? [alert_strategy.value.notification_rate_limit] : []
        content {
          period = notification_rate_limit.value.period
        }
      }
    }
  }

  dynamic "documentation" {
    for_each = each.value.documentation != null ? [each.value.documentation] : []
    content {
      content = documentation.value.content
      dynamic "links" {
        for_each = documentation.value.links != null ? documentation.value.links : []
        content {
          display_name = links.value.display_name
          url          = links.value.url
        }
      }
      mime_type = documentation.value.mime_type
      subject   = documentation.value.subject
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

