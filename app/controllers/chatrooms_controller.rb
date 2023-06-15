# frozen_string_literal: true

class ChatroomsController < ApplicationController
  def index
  end

  def show
    @appointment = Appointment.new
    # @appointment.user_match = @user_match
    @chatroom = Chatroom.find(params[:id])
    # @appointment_request = @chatroom.user_match.appointments.first
    @user_match = @chatroom.user_match
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create!(user_match_id: params[:chatroom][:user_match_id], name: 'Name')
    redirect_to chatroom_path(@chatroom)
  end

  def destroy; end
end
