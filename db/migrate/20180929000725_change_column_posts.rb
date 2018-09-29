class ChangeColumnPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :address_zipcode, :string
  end
end
