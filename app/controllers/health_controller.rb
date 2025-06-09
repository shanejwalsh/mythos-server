class HealthController < ActionController::API
  def index
      render json: {
      status: "ok",
      timestamp: Time.current,
      version: ENV['GIT_SHA'] || 'unknown'
    }, status: :ok
  end
end
