class AddSpriteToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :sprite_data, :string 
  end
end
