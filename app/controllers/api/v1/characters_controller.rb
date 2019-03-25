class Api::V1::CharactersController < ApplicationController
    before_action :find_character, only: [:show, :destroy, :update]

    def index
        @characters = Character.all
        render json: @characters
    end


    def show
        render json: @character

    end

    def new
        @character = Character.new
        render json: @character
    end 

    def create
        @character = Character.new
            @character.update(character_params)

            if @character.save 
             render json: @character  
            else 
             render json: {error:"Character cannot be created"}, status: 400
            end 
    end 

    def edit 
    end 

    def update
         if @character.update(character_params)
             render json: @character  
            else 
             render json: {error:"Character cannot be updated"}, status: 400
            end 
        else
    end


    def destroy
        @character.destroy
        render json: @character
    end



    private 

     def find_character
        @character = Character.find_by(id: params[:id])
        render json: {error:"Character with id #{params[:id]} not found"}, status: 404 unless @character
    end

    def character_params
        params.require(:character).permit(
            :id,
            :first_name,
            :last_name,
            :alias,
            :motto,
            :species,
            :bio,
            :alignment,
            :age,
            :status,
            :gender,
            :traits_positive,
            :traits_negative,
            :feats,
            :sprite_data,
            :user_id
        )
    end 
end