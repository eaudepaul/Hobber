class AddUserIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :user_id, :bigint
    add_foreign_key :reviews, :users, column: :user_id
  end
end
