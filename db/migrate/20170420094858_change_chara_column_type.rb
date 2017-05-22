class ChangeCharaColumnType < ActiveRecord::Migration[5.0]
  def up
    change_column :charas, :chara_id, :bigint, :limit => 20
  end

  def down
    change_column :charas, :chara_id, :int
  end
end
