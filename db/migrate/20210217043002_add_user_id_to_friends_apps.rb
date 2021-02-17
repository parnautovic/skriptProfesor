class AddUserIdToFriendsApps < ActiveRecord::Migration[6.1]
  def change
    add_column :friends_apps, :user_id, :integer
    add_index :friends_apps, :user_id
  end
end
