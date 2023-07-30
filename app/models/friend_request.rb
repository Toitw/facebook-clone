class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :sender_id, uniqueness: { scope: :recipient_id }

  def send_request(sender, recipient)
    self.sender = sender
    self.recipient = recipient
    self.status = 'pending'
    save
  end
end
