class ChatroomsController < ApplicationController
  def index
    @user_matches = UserMatch.joins(:match).where("user_matches.status = 'approved' AND user_matches.user_id = :user OR matches.secondary_user_id = :user", user: current_user.id)
    # @chatrooms = Chatroom.where(user_match_id: @user_match.id)
    # @chatrooms = Chatroom.all
  end

  def show
    # @user_match = UserMatch.find(params[:user_match_id])
    # @chatrooms = @user_match.chatrooms
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create!(user_match_id: params[:chatroom][:user_match_id], name: "Name")
    redirect_to chatroom_path(@chatroom)
  end

  def destroy
  end
end
