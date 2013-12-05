API_KEY = 'UXqQdPlvb4aiywFLklgb'
API_SECRET = 'Uvy1rifO4qP9rPeAx4mHQv0IHTiLbZleCmYuk0SG'
API_SITE = 'https://you-should-hire-fotios.desk.com'

Desk.configure do |config|
  config.support_email = "support@you-should-hire-fotios.desk-mail.com"
  config.subdomain = 'you-should-hire-fotios'
  config.consumer_key = API_KEY
  config.consumer_secret = API_SECRET
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :desk, API_KEY, API_SECRET, :site => API_SITE
end
