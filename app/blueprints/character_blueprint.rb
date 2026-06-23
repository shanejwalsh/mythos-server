class CharacterBlueprint < Blueprinter::Base
  fields :id,
         :first_name,
         :last_name,
         :alias,
         :motto,
         :species,
         :bio,
         :alignment,
         :age,
         :status,
         :created_at,
         :updated_at,
         :gender,
         :traits_positive,
         :traits_negative,
         :feats,
         :sprite_data,
         :notes,
         :published,
         :alive

  association :user, blueprint: UserBlueprint, view: :name_only
end
