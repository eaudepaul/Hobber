# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :appointment

  validates :appointment_id, presence: true
end
