require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Votvot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  
    ## devise : 이메일 인증 설정

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.default_url_options = { host: 'http://...' }
    ActionMailer::Base.smtp_settings = {
      :address              => 'smtp.gmail.com',
      :domain               => 'mail.google.com',
      :port                 => 587,
      :user_name            => ENV["GOOGLE_EMAIL_ID"],
      :password             => ENV["GOOGLE_EMAIL_PASSWORD"],
      :authentication       => 'login',
      :enable_starttls_auto => true
    }
  end
end
