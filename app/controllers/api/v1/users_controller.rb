class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def show
    render json: @user
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      refresh_token = @user.refresh_tokens.create!
      render json: { id: @user.id, username: @user.username, createdAt: @user.created_at, token: issue_token({ id: @user.id }), refresh_token: refresh_token.token }
    else
      render json: { error: 'Username/password combination invalid.' }, status: :unauthorized
    end
  end

  def validate
    @user = current_user
    if @user
      render json: { id: @user.id, username: @user.username, createdAt: @user.created_at, token: issue_token({ id: @user.id }) }
    else
      render json: { error: 'Invalid or expired token.' }, status: :unauthorized
    end
  end

  def refresh
    token = RefreshToken.active.find_by(token: params[:refresh_token])
    if token
      render json: { token: issue_token({ id: token.user_id }), refresh_token: token.token }
    else
      render json: { error: 'Invalid or expired refresh token.' }, status: :unauthorized
    end
  end

  def logout
    token = RefreshToken.find_by(token: params[:refresh_token])
    token&.destroy
    render json: { message: 'Logged out successfully.' }
  end

  def get_characters
    @user = current_user
    if @user
      render json: @user.characters
    else
      render json: { error: 'Not a valid user.' }, status: :unauthorized
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { error: 'User cannot be created', details: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    render json: { error: 'User not found' }, status: :not_found unless @user
  end
end
