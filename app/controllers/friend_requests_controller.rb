class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    def index
        @friend_requests = current_user.received_friend_requests
    end
  
    def create
      sender = current_user
      recipient = User.find(params[:recipient_id])
      friend_request = FriendRequest.new(sender: sender, recipient: recipient, status: 'pending')
      if friend_request.save
        redirect_to '/users', notice: 'Friend request sent.'
      else
        redirect_to '/users', alert: 'Failed to send friend request.'
      end
    end

    def update
        friend_request = FriendRequest.find(params[:id])
        friend_request.update(status: 'accepted')
        redirect_to '/friend_requests', notice: 'Friend request accepted.'
    end

    def destroy
        friend_request = FriendRequest.find(params[:id])
        friend_request.destroy
        if friend_request.status == 'pending'
          redirect_to '/friend_requests', notice: 'Friend request rejected.'
        else
          redirect_to '/friend_requests', notice: 'No longer a friend.'
        end
    end
  end
  
  