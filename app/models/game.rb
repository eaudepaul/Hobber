class Game < ApplicationRecord
has_many:user_games

  def self.group_by_name_and_count
    group("games.name").order(count: :desc).count
  end

  validates :name, uniqueness: true, presence: true
end
