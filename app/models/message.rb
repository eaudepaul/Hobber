# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :chatroom_id, :user_id, presence: true
  validates :content, presence: true
end
