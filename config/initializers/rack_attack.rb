class Rack::Attack
  throttle('login', limit: 5, period: 60) do |req|
    req.ip if req.path == '/api/v1/users/login' && req.post?
  end

  throttle('signup', limit: 3, period: 60) do |req|
    req.ip if req.path == '/api/v1/users' && req.post?
  end

  throttle('refresh', limit: 10, period: 60) do |req|
    req.ip if req.path == '/api/v1/users/refresh' && req.post?
  end

  self.throttled_responder = lambda do |_env|
    [429, { 'Content-Type' => 'application/json' }, ['{"error":"Too many requests. Please try again later."}']]
  end
end
