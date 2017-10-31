class PrivateMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true


  def receiver
    if conversation.author == conversation.receiver || conversation.receiver == user
      conversation.author
    else
      conversation.receiver
    end
  end

  
end
