# frozen_string_literal: true

class AddPopularityToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :popularity, :integer, default: 0
  end
end
