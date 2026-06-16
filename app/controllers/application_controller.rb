class ApplicationController < ActionController::API
  # Access tokens are valid for this long; after that the user must log in again.
  TOKEN_TTL = 7.days

  def issue_token(payload)
    JWT.encode(payload.merge(exp: TOKEN_TTL.from_now.to_i), secret, 'HS256')
  end

  def current_user
    return @current_user if defined?(@current_user)
    id = decoded_token['id']
    @current_user = id && User.find_by(id: id)
  end
  # Backwards-compatible alias for existing callers.
  alias_method :get_current_user, :current_user

  def authenticate_user!
    return if current_user
    render json: { error: 'Not authenticated' }, status: :unauthorized
  end

  private

  def decoded_token
    header = request.headers['Authorization']
    return {} if header.blank?

    # Tolerate both "Bearer <token>" and a bare token.
    token = header.split(' ').last
    begin
      JWT.decode(token, secret, true, algorithm: 'HS256').first
    rescue JWT::DecodeError
      {}
    end
  end

  def secret
    ENV.fetch('JWT_SECRET') do
      raise 'JWT_SECRET must be set in production' if Rails.env.production?
      'dev-secret-key'
    end
  end
end
