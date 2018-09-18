class AddIndexToTroupesName < ActiveRecord::Migration[5.1]
  def change
    add_index :troupes, :name, unique: true
  end
end
