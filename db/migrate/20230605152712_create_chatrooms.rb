# frozen_string_literal: true

class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.references :user_match, null: false, foreign_key: true
      t.timestamps
    end
  end
end
