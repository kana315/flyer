class CreateMemberRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :member_relations do |t|
      t.integer :user_id
      t.integer :troupe_id

      t.timestamps
    end
  end
end
