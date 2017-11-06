class User < ApplicationRecord
  has_many :groups, dependent: :destroy
	has_many :chats, through: :groups,  dependent: :destroy
	has_many :messages, dependent: :destroy
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :private_messages, dependent: :destroy
  validates :password, :presence => true
  validates :password, :length => { :in => 2..200}
  validates :name, :email, :presence => true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :format => { :with => /@/, :message => " is invalid" }
  has_attached_file :image, :styles => { medium: "100x100>", thumb: "200x200>", large: "600x600>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.authenticate(email, test_password)
    user = User.find_by_email(email)
    if user && user.password == test_password
      user
    else
      nil
    end
  end
end

