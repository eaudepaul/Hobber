class UserMatch < ApplicationRecord
  belongs_to :match
  belongs_to :appointment
  belongs_to :chatroom
  belongs_to :primary_user, class_name: "User"
end
