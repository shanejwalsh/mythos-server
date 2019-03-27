class AddAliveToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :alive, :boolean, :default => true
  end
end
