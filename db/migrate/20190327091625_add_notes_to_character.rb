class AddNotesToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :notes, :string 
  end
end
