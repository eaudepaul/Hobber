# frozen_string_literal: true

class AddNameToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :name, :string
  end
end
