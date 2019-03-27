class AddPublishedToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :published, :boolean, :default => false
  end
end
