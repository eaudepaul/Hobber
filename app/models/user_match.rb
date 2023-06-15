# frozen_string_literal: true

class UserMatch < ApplicationRecord
  has_many_attached :photos
  has_many :appointments
  has_many :chatrooms
  belongs_to :match
  belongs_to :user
  belongs_to :match

  validates :user_id, presence: true
  validates :status, inclusion: { in: %w[pending approved denied] }
end
