# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Allowed origins come from ALLOWED_ORIGINS (comma-separated). Defaults cover the
# deployed client and local dev. Avoid '*' so the API only answers known frontends.
allowed_origins = ENV.fetch('ALLOWED_ORIGINS') do
  'https://mythos-client-production.up.railway.app,http://localhost:3000'
end.split(',').map(&:strip).reject(&:empty?)

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(*allowed_origins)

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
