class CreateUserMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_matches do |t|
      t.integer :primary_user_id
      t.references :match, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
    add_foreign_key :user_matches, :users, column: :primary_user_id
  end

end
