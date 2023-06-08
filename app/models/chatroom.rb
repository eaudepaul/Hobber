class Chatroom < ApplicationRecord
  belongs_to :user_match
  has_many :users, through: :user_matches
  has_many :matches, through: :user_matches
  has_many :appointments, through: :user_matches
  has_many :messages

  validates :user_match_id, uniqueness: true, presence: true
  validates :name, presence: true
end
