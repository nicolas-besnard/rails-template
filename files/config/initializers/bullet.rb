if defined?(Bullet)
  Rails.application.config.after_initialize do
    Bullet.enable        = true
    Bullet.bullet_logger = true
    Bullet.rails_logger  = false
    Bullet.console       = false
    Bullet.alert         = false
    Bullet.add_footer    = false
  end
end
