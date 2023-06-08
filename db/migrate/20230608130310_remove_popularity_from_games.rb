class RemovePopularityFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :popularity, :integer
  end
end
