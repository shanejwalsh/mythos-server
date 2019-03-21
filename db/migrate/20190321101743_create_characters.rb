class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.string :alias
      t.string :motto
      t.string :species
      t.string :bio
      t.string :alignment
      t.string :traits
      t.string :home_planet
      t.integer :age
      t.string :status

      t.timestamps
    end
  end
end
