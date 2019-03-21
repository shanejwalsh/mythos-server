class Api::V1::CharactersController < ApplicationController

    #return all characters
    def index
        @characters = Character.all
        render json: @characters
    end
end