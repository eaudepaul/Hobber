class AddReviewerReviewedToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :reviewer, foreign_key: { to_table: :users }
    add_reference :reviews, :reviewed, foreign_key: { to_table: :users }
    remove_column :reviews, :user_id
  end
end
