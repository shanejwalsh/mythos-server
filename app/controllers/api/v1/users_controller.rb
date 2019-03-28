class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: []

    def index 
        @users = User.all
        render json: @users
    end 

    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        render json: {id: @user.id, username: @user.username, token: issue_token({id: @user.id})}
      else
        render json: {error: "Username/password combination invalid."}, status: 401
      end
    end
  
  def validate
    @user = get_current_user
    if @user
      render json: {id: @user.id, username: @user.username, token: issue_token({id: @user.id})}
    else
      render json: {error: "Username/password combination invalid."}, status: 401
    end
  end

  def get_characters
    @user = get_current_user
    if @user
      render json: @user.characters
    else
      render json: {error: "Not a valid user."}, status: 401
    end
  end

    def create
        @user = User.new(user_params)
            if @user.save
             render json: @user  
            else 
              render json: {error:"User cannot be created"}, status: 400
            end 
        end 

    private 

      def user_params
        params.require(:user).permit(
            :username,
            :password
        )
      end 

      def find_user
        @user = User.find_by(id: params[:id])
        render json: {error:"User not found"}, status: 404 unless @user
      end  
end