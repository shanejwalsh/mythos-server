class UserBlueprint < Blueprinter::Base
  fields :id, :username

  # Nested inside a character: expose only the username (matches the old
  # ActiveModel::Serializer behaviour).
  view :name_only do
    excludes :id
  end
end
