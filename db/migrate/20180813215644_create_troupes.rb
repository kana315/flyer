class CreateTroupes < ActiveRecord::Migration[5.1]
  def change
    create_table :troupes do |t|
      t.string :name
      t.string :caption
      t.string :icon
      t.integer :user_id

      t.timestamps
    end
  end
end
