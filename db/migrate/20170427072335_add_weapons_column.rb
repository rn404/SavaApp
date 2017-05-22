class AddWeaponsColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :weapons, :name, :string
  end
end
