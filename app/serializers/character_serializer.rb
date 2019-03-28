class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :alias, :motto, :species, :bio, :alignment, :age, :status, :created_at, :updated_at, :gender, :traits_positive, :traits_negative, :feats, :sprite_data, :sprite_data, :notes, :published, :alive  
  belongs_to :user

  class UserSerializer < ActiveModel::Serializer
    attributes :username
  end 
end
