class Match < ApplicationRecord
  belongs_to :secondary_user, class_name: "User"
  has_many :user_matches

  validates :secondary_user_id, presence: true
end
