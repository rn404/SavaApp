class UpdateCharaData < ActiveRecord::Migration[5.0]
  def change
    add_column :charas, :name, :string
    add_column :charas, :chara_id, :integer
    add_column :charas, :type, :integer
    add_column :charas, :attribute, :integer
    add_column :charas, :race, :integer
    add_column :charas, :reality, :integer
  end
end
