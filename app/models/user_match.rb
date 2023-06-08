class UserMatch < ApplicationRecord
  has_many_attached :photos
  has_many :appointments
  has_many :chatrooms
  belongs_to :match
  belongs_to :user
  belongs_to :match
end
