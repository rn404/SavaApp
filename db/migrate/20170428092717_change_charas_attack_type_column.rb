class ChangeCharasAttackTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :charas, :attack_type, :style
  end
end
