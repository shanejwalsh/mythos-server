class Api::V1::GeneratorsController < ApplicationController
    include Generator

    def first_name
      render json: {first_name: generate_first_name}
    end
    def last_name
      render json: {last_name: generate_last_name}
    end
    def alias
      render json: {alias: generate_alias}
    end
    def motto
      render json: {motto: generate_motto}
    end
    def species
      render json: {species: generate_species}
    end
    def bio
      render json: {bio: generate_bio}
    end
    def alignment
      render json: {alignment: generate_alignment}
    end
    def trait_positive
      render json: {trait_positive: generate_trait_positive}
    end
    def trait_negative
      render json: {trait_negative: generate_trait_negative}
    end
    def age
      render json: {age: generate_age}
    end
    def status
      render json: {status: generate_status}
    end
    def gender
      render json: {gender: generate_gender}
    end
    def feats
      render json: {feats: generate_feats}
    end
end