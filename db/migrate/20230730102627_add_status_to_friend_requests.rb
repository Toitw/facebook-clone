class AddStatusToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :status, :string
  end
end
