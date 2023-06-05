class Chatroom < ApplicationRecord
  has_many :user_matches
  has_many :users, through: :user_matches
  has_many :matches, through: :user_matches
  has_many :appointments, through: :user_matches
end
