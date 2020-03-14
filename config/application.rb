require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Media
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.i18n.default_locale = :ja


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.initialize_on_precompile = false

    # 認証トークンをremoteフォームに埋め込む
   config.action_view.embed_authenticity_token_in_remote_forms = true

   #Rspec関係
   config.generators do |g|
      g.test_framework :rspec,
                   fixtures: true,
                   view_specs: false,
                   helper_specs: false,
                   routing_specs: false,
                   controller_specs: true,
                   request_specs: false
     g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

  end
end
