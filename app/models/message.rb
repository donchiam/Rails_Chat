class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :chat_id, presence: true
  validates :body, presence: true
end


