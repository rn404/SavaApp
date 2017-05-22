class CreateCharas < ActiveRecord::Migration[5.0]
  def change
    create_table :charas do |t|

      t.timestamps
    end
  end
end
