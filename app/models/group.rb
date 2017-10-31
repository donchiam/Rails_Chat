class Group < ApplicationRecord
  belongs_to :chat
  belongs_to :user
end
