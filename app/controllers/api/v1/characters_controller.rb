class Api::V1::CharactersController < ApplicationController
    include Generator
    before_action :authenticate_user!, only: [:update, :destroy, :clone]
    before_action :find_character, only: [:show, :destroy, :update, :clone]
    before_action :require_ownership!, only: [:update, :destroy]


    def index
        @characters = Character.includes(:user)
        render json: CharacterBlueprint.render(@characters)
    end


    def show
        render json: CharacterBlueprint.render(@character)
    end

    def create
        @character = Character.new(character_params)
        @character.user = current_user  # nil for guests
        if(@character.sprite_data.blank?)
            @character.sprite_data = generate_sprite(@character.species)
        end

        if @character.save
            render json: CharacterBlueprint.render(@character), status: :created
        else
            render json: {error:"Character cannot be created"}, status: 400
        end
    end



    def update
        if @character.update(character_params)
            render json: CharacterBlueprint.render(@character)
        else
            render json: {error:"Character cannot be updated"}, status: 400
        end
    end


    def destroy
        @character.destroy
        render json: CharacterBlueprint.render(@character)
    end



    def clone
        attributes = @character.attributes.except("id", "created_at", "updated_at", "user_id")
        @clone = Character.new(attributes)
        @clone.user = current_user
        if @clone.save
            render json: CharacterBlueprint.render(@clone), status: :created
        else
            render json: {error: "Character cannot be cloned"}, status: 400
        end
    end



    private

     def find_character
        @character = Character.find_by(id: params[:id])
        render json: {error:"Character with id #{params[:id]} not found"}, status: 404 unless @character
    end

    def require_ownership!
        return if @character && current_user && @character.user_id == current_user.id
        render json: {error: "You do not own this character"}, status: :forbidden
    end

    def character_params
        params.expect(
            character: [
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
                :sprite_data
            ]
        )
    end
end
