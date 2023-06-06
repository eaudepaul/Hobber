class Appointment < ApplicationRecord
  belongs_to :game
  belongs_to :user_match
  has_many :reviews
end
