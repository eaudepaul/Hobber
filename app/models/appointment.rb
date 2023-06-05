class Appointment < ApplicationRecord
  belongs_to :game
  has_many :reviews
end
