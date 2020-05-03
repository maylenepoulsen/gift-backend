class AddUserToLGiftLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :gift_likes, :user_id, :integer
    add_column :gift_likes, :name, :string
  end
end
