class AddUser1AndUser2ToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :user1, foreign_key: { to_table: :users }
    add_reference :chatrooms, :user2, foreign_key: { to_table: :users }
    remove_column :chatrooms, :name
    remove_column :chatrooms, :user_match_id
  end
end
