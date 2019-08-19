Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "174368840908-b4tgdtvr7fmd42rikahg3pec6e4jnik6.apps.googleusercontent.com", "vEOOdQBargRe3CvkfcfOQw1p"
end