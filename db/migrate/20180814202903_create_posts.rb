class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :troupe_id
      t.string :flyer_front
      t.string :flyer_back
      t.text :caption
      t.text :story
      t.text :member
      t.text :ticket
      t.date :start_date
      t.date :end_date
      t.text :details_datetime
      t.integer :address_zipcode
      t.string :address_prefecture_name
      t.string :address_city
      t.string :address_street
      t.string :address_bullding
      t.text :details_access

      t.timestamps
    end
  end
end
