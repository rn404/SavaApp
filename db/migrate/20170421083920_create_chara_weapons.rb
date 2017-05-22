class CreateCharaWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :chara_weapons do |t|
      t.integer :chara_id
      t.integer :weapon_id

      t.timestamps
    end
  end
end
