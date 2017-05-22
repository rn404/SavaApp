class RemoveDengerousColumnToChara < ActiveRecord::Migration[5.0]
  def change
    remove_column :charas, :type, :integer
    remove_column :charas, :attribute, :integer
  end
end
