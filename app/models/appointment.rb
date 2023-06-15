# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :game
  belongs_to :user_match
  has_many :reviews

  validates :game_id, presence: true
  validates :user_match_id, presence: true
  validates :start_time, :end_time, :address, presence: true
  validates :status, inclusion: { in: %w[pending approved denied cancelled] }
  validates :date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
end
