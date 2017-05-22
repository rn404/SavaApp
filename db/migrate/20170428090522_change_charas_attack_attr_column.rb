class ChangeCharasAttackAttrColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :charas, :attack_attr, :element
  end
end
