class Character < ApplicationRecord
  extend Generator

  # Generate an entirely random character
  def self.generate_full_character
    new_character = Character.new
    new_character.first_name = generate_first_name
    new_character.last_name = generate_last_name
    new_character.alias = generate_alias
    new_character.motto = generate_motto
    new_character.species = generate_species
    new_character.bio = generate_bio
    new_character.alignment = generate_alignment
    new_character.traits_positive = "#{generate_trait_positive}, #{generate_trait_positive}, #{generate_trait_positive}"
    new_character.traits_negative = "#{generate_trait_negative}, #{generate_trait_negative}, #{generate_trait_negative}"
    new_character.age = generate_age
    new_character.status = generate_status
    new_character.gender = generate_gender
    new_character.feats = generate_feats
    new_character.save
  end
end
