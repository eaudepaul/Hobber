# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :user_matches
  has_many :matches, through: :user_matches
  has_many :hostings, class_name: 'Appointment', foreign_key: 'host_id'
  has_many :as_guest, class_name: 'Appointment', foreign_key: 'guest_id'
  has_many :reviews, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :reviewed, class_name: 'Review', foreign_key: 'reviewed_id'
  has_many :user_games
  has_many :games, through: :user_games
  validates :email, uniqueness: true
  # validates :username, uniqueness: true
end
