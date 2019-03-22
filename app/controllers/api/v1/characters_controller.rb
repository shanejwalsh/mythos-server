class Api::V1::CharactersController < ApplicationController
    before_action :find_character, only: [:show]

    def index
        @characters = Character.all
        render json: @characters
    end

    def show
        render json: @character
    end

    private 

     def find_character
        @character = Character.find_by(id: params[:id])
        render json: {error:"Character with id #{params[:id]} not found"}, status: 404 unless @character
    end


end