class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :secondary_user_id

      t.timestamps
    end
    add_foreign_key :matches, :users, column: :secondary_user_id
  end
end
