class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id"
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "recipient_id"

  def friends
    # Fetch friend requests where the status is "accepted" for the current user
    accepted_friend_requests = FriendRequest.where(recipient: self, status: "accepted")
    sended_and_accepted_friend_requests = FriendRequest.where(sender: self, status: "accepted")

    # Extract the senders (i.e., the friends) from the accepted friend requests
    friends = accepted_friend_requests.map { |request| request.sender } + sended_and_accepted_friend_requests.map { |request| request.recipient }
    

    # Return the list of friends
    friends
  end

end
