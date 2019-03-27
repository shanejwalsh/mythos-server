class Api::V1::CharactersController < ApplicationController
    include Generator
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
        @character.update(sprite_data: generate_sprite(@character.species))

        if @character.save 
            render json: @character  
        else 
            render json: {error:"Character cannot be created"}, status: 400
        end 
    end 


    def create_guest

    end
    
    
    def update
         if @character.update(character_params)
             render json: @character  
         else 
             render json: {error:"Character cannot be updated"}, status: 400
         end
    end


    def destroy
        @character.destroy
        render json: @character
    end



    def clone
        @character_no_id = @character.attributes.select  {|key| key != "id"} 
        @clone = Character.new(@character_no_id)
        @clone.user_id = params[:user]

            if @clone.save
                render json: @clone 
            else 
                render json: {error: "Character cannot be cloned"}
            end 
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