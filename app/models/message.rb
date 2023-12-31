class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :conversation

  validates :content, presence: true
end
