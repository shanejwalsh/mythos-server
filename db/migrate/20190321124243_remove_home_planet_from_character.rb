class RemoveHomePlanetFromCharacter < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :home_planet
  end
end
