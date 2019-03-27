class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: []

    def index 
        @users = User.all
        render json: @users
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