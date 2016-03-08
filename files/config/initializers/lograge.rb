if defined?(Lograge)
  Rails.application.config.lograge.enabled = true
  Rails.application.config.lograge.custom_options = lambda do |event|
    options = event.payload.slice(:request_id, :user_id, :visit_id)
    options[:params] = event.payload[:params].except("controller", "action")
    options
  end
end
