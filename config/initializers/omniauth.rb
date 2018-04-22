Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, 584340308588152, 451de733ddb3998eee829a17ebaf6ca1, {:scope =>
  #   'public_profile'},
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'user_about_me'}

end
