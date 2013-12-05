Rails.application.config.middleware.use OmniAuth::Builder do
    provider :desk, 'UXqQdPlvb4aiywFLklgb', 'Uvy1rifO4qP9rPeAx4mHQv0IHTiLbZleCmYuk0SG', :site => 'https://you-should-hire-fotios.desk.com'
end
