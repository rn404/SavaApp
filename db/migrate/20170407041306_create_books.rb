class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_name
      t.date :published_on

      t.timestamps
    end
  end
end
