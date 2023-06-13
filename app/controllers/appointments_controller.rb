# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_user_match, only: %i[new]

  def index
    @user_matches = UserMatch.joins(:match).where(
      "user_matches.status = 'approved' AND (user_matches.user_id = :user OR matches.secondary_user_id = :user)", user: current_user.id
    )
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
      redirect_to chatroom_path(@appointment.user_match.chatrooms.first)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user_match.update(appointment_params)
      redirect_to appointments_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'appointment successfully deleted.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :date, :start_time, :end_time, :user_match, :status)
  end

  def set_user_match
    @user_match = UserMatch.find(params[:user_match_id])
  end
end
