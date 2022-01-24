require_relative 'boot'

#require 'rails'
require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
 require "action_controller/railtie"
 require "action_mailer/railtie"
 require "action_view/railtie"
# require "action_cable/engine"
 require "sprockets/railtie"
 require "rails/test_unit/railtie" 

 # Require the gems listed in Gemfile, including any gems
 # you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WwwDrgcms
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.load_defaults "6.0" 
    config.time_zone = 'Ljubljana'
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :en  
    config.i18n.fallbacks      = [:en]
  end
end

DrgCms.add_forms_path Rails.root.join('app/forms')