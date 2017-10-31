class Chat < ApplicationRecord
	has_many :users, through: :groups
	has_many :groups, dependent: :destroy
	has_many :messages, dependent: :destroy
end
