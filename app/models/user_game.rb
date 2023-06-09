class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user_id, uniqueness: { scope: :game_id }
  accepts_nested_attributes_for :user, :game
end
