# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :user_matches
  has_many :matches, through: :user_matches
  has_many :reviews
  has_many :user_games
  has_many :games, through: :user_games
  validates :email, uniqueness: true
  # validates :username, uniqueness: true
end
