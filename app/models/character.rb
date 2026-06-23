class Character < ApplicationRecord
  belongs_to :user, optional: true

  extend Generator

  validates :first_name,      length: { maximum: 100 }
  validates :last_name,       length: { maximum: 100 }
  validates :alias,           length: { maximum: 100 }
  validates :species,         length: { maximum: 100 }
  validates :gender,          length: { maximum: 100 }
  validates :alignment,       length: { maximum: 100 }
  validates :status,          length: { maximum: 100 }
  validates :motto,           length: { maximum: 500 }
  validates :traits_positive, length: { maximum: 500 }
  validates :traits_negative, length: { maximum: 500 }
  validates :feats,           length: { maximum: 500 }
  validates :notes,           length: { maximum: 500 }
  validates :bio,             length: { maximum: 2000 }
  validates :sprite_data,     length: { maximum: 5000 }

  def self.build_full_character(user = nil)
    new_character = Character.new(generate_full_character)
    new_character.user = user
    new_character.save
    new_character
  end
end
