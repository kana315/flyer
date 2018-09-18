class CreateMemberRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :member_requests do |t|
      t.integer :user_id
      t.integer :troupe_id
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
