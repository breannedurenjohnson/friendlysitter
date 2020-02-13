class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :parent_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
