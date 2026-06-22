class Character < ApplicationRecord
  belongs_to :user, optional: true

  extend Generator

  def self.build_full_character(user = nil)
    new_character = Character.new(generate_full_character)
    new_character.user = user
    new_character.save
    new_character
  end
end
