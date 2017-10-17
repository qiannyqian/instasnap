Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
    scope: 'email, public_profile', display: 'popup', info_fields: 'first_name, email'
end
