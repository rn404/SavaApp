class AddColumnToChara < ActiveRecord::Migration[5.0]
  def change
    add_column :charas, :chara_type, :integer
    add_column :charas, :chara_attr, :integer
  end
end
