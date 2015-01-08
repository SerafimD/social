require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Social
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec, view_specs: false,
      fixture: true,
      fixture_replacement: "factory_girl"
      g.assets = false
      g.helper = false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
    config.active_record.raise_in_transactional_callbacks = true
    config.serve_static_assets = true
  end
end
