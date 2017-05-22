class ChangeCharaColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :charas, :chara_type, :attack_type
    rename_column :charas, :chara_attr, :attack_attr
    add_column :charas, :weapon, :integer
  end
end
