Rails.application.configure do
  config.action_mailer.default_url_options = { host: "3.137.8.21" }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: 'akakak0002@gmail.com',
    password: 'tinkqerlbwsjvgao',
    authentication: 'plain'
  }
end
