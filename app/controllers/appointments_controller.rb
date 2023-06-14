# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_user_match, only: :new
  helper_method :review_exists
  helper_method :find_review

  def index
    @appointments = Appointment.joins(user_match: { match: :secondary_user }).where(
      "user_matches.status = 'approved' AND (user_matches.user_id = :user OR matches.secondary_user_id = :user)", user: current_user
    ).order(date: :asc)
  end

  def new
    @appointment = Appointment.new
  end

  def show
    @game = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.game = Game.find(params[:appointment][:game])
    @appointment.user_match = UserMatch.find(params[:user_match_id])
    if @appointment.save!
      @message = Message.create!(
        content: "New duel request",
        chatroom: @appointment.user_match.chatrooms.first,
        user: current_user,
        message_type: "appointment")
      redirect_to chatroom_path(@appointment.user_match.chatrooms.first)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update!(appointment_params)
      redirect_to appointments_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'appointment successfully deleted.'
  end

  def review_exists(appointment_id)
    Review.exists?(appointment_id:, user_id: current_user.id)
  end

  def find_review(appointment_id)
    Review.find_by(appointment_id:, user_id: current_user.id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :date, :start_time, :end_time, :user_match, :status)
  end

  def set_user_match
    @user_match = UserMatch.find(params[:user_match_id])
  end
end
