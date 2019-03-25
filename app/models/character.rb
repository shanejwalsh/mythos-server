class Character < ApplicationRecord
  belongs_to :user

  extend Generator

  # Generate an entirely random character
  def self.build_full_character
    new_character = Character.new(generate_full_character)
    new_character.user_id = gen_random_num(2)  #DEV MODE ASSIGN TO DUMMY USER
    new_character.save
  end
end
