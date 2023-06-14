# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :appointment
  belongs_to :user
  validates :appointment_id, presence: true
end
