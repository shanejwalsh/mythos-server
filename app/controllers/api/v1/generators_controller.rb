class Api::V1::GeneratorsController < ApplicationController
    include Generator

    def first_name
      render json: generate_first_name
    end
    def last_name
      render json: generate_last_name
    end
    def alias
      render json: generate_alias
    end
    def motto
      render json: generate_motto
    end
    def species
      render json: generate_species
    end
    def bio
      render json: generate_bio
    end
    def alignment
      render json: generate_alignment
    end
    def trait_positive
      render json: generate_trait_positive
    end
    def trait_negative
      render json: generate_trait_negative
    end
    def age
      render json: generate_age
    end
    def status
      render json: generate_status
    end
    def gender
      render json: generate_gender
    end
    def feats
      render json: generate_feats
    end
end