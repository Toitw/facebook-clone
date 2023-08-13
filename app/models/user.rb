class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id"
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "recipient_id"
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  def friends
    # Fetch friend requests where the status is "accepted" for the current user
    accepted_friend_requests = FriendRequest.where(recipient: self, status: "accepted")
    sended_and_accepted_friend_requests = FriendRequest.where(sender: self, status: "accepted")

    # Extract the senders (i.e., the friends) from the accepted friend requests
    friends = accepted_friend_requests.map { |request| request.sender } + sended_and_accepted_friend_requests.map { |request| request.recipient }
    

    # Return the list of friends
    friends
  end

  def friend_requests
    #fetch all friend requests sent or recieved by the current user
    friend_requests = FriendRequest.where(recipient: self, status: "accepted") + FriendRequest.where(sender: self, status: "accepted")
    friend_requests
  end

  def friends_posts_and_own
    friend_ids = friends.pluck(:id) + [id]
    Post.includes(:user, :likes, :comments).where(user_id: friend_ids).order(created_at: :desc)
  end

  def pending_friend_requests
    pending_friend_requests = FriendRequest.where(recipient: self, status: "pending") + FriendRequest.where(sender: self, status: "pending")
    users = []
    pending_friend_requests.each do |request|
      if request.sender == self
        users << request.recipient
      else
        users << request.sender
      end
    end
    users
  end

end
