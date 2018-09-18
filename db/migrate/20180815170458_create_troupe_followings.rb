class CreateTroupeFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :troupe_followings do |t|
      t.integer :user_id
      t.integer :troupe_id

      t.timestamps
    end
  end
end
