class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|

      t.timestamps
    end
  end
end
