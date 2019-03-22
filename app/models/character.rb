class Character < ApplicationRecord
  extend Generator

  # Generate an entirely random character
  def self.build_full_character
    new_character = Character.new(generate_full_character)
    new_character.save
  end
end
