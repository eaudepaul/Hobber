class AppointmentsController < ApplicationController
  def index
    @user_matches = UserMatch.joins(:match).where("user_matches.status = 'approved' AND (user_matches.user_id = :user OR matches.secondary_user_id = :user)", user: current_user.id)
  end

  def new
    @user_match = UserMatch.find(params[:user_match_id])
    @appointment = Appointment.new
  end

  def show
    @game = Appointment.new
  end

  def create
    @user_match = UserMatch.find(params[:user_match_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user_match_id = @user_match.id
    if @appointment.save!
      redirect_to appointments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'appointment successfully deleted.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :date, :start_time, :end_time, :game, :user_match)
  end
end
