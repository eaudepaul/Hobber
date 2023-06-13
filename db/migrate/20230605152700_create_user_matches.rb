# frozen_string_literal: true

class CreateUserMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_matches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
