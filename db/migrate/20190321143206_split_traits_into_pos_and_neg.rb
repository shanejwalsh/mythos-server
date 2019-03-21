class SplitTraitsIntoPosAndNeg < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :traits
    add_column :characters, :traits_positive, :string 
    add_column :characters, :traits_negative, :string 
  end
end
