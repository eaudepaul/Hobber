# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :appointment
  belongs_to :reviewed, class_name: 'User'
  belongs_to :reviewer, class_name: 'User'
  validates :appointment_id, presence: true
end
