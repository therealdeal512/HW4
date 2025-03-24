Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  config.server_timing = true

  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  config.active_storage.service = :local

  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  # Use evented file watcher for hot reloading
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # ✅ Allow Gitpod URLs (critical for working in Gitpod)
  config.hosts << /.*\.gitpod\.io/
end

